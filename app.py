
from flask import Flask, render_template, request, redirect, url_for, session
import psycopg2
from psycopg2 import Error

app = Flask(__name__)
app.secret_key = 'edupage_tajomstvo'


# Funkcia na pripojenie k databáze
def get_db_connection():
    return psycopg2.connect(
        user="postgres",
        password="trust",
        host="127.0.0.1",
        port="5432",
        database="edupage"
    )


@app.route('/')
def home():
    return render_template('login.html')


@app.route('/login', methods=['POST'])
def login():
    username = request.form['username']
    password = request.form['password']

    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT id, username, role FROM users WHERE username = %s AND password_hash = %s", (username, password))
    user = cur.fetchone()
    cur.close()
    conn.close()

    if user:
        session['user_id'] = user[0]
        session['username'] = user[1]
        session['role'] = user[2]
        return redirect(url_for('dashboard'))
    return "Nesprávne meno alebo heslo! <a href='/'>Skúsiť znova</a>"


@app.route('/dashboard')
def dashboard():
    if 'username' not in session:
        return redirect(url_for('home'))

    conn = get_db_connection()
    cur = conn.cursor()

    if session['role'] == 'Student':
        # 1. NAJDÔLEŽITEJŠÍ KROK: Musíme zistiť student_id, ktoré patrí k prihlásenému user_id
        cur.execute("""
                SELECT s.id, c.name, s.class_id 
                FROM students s 
                JOIN classes c ON s.class_id = c.id 
                WHERE s.user_id = %s""", (session['user_id'],))
        student_data = cur.fetchone()

        if student_data:
            real_student_id = student_data[0]  # Toto je to ID, ktoré je v tabuľke grades
            class_name = student_data[1]
            class_id = student_data[2]

            # 2. Teraz hľadáme známky podľa real_student_id
            cur.execute("""
                    SELECT s.name, g.grade, g.created_at, g.comment 
                    FROM grades g 
                    JOIN subjects s ON g.test_id = s.id 
                    WHERE g.student_id = %s 
                    ORDER BY g.created_at DESC""", (real_student_id,))
            znamky = cur.fetchall()

            # 3. Načítame rozvrh pre danú triedu
            cur.execute("""
                    SELECT t.day_of_week, t.lesson_slot_id, s.name, 
                           e.title_before, e.first_name, e.last_name, c.name
                    FROM timetable t
                    JOIN subjects s ON t.subject_id = s.id
                    JOIN employees e ON t.teacher_id = e.id
                    JOIN classes c ON t.class_id = c.id
                    WHERE t.class_id = %s
                    ORDER BY t.day_of_week, t.lesson_slot_id""", (class_id,))
            rozvrh_studenta = cur.fetchall()
        else:
            znamky = []
            rozvrh_studenta = []
            class_name = "Neznáma trieda"

        cur.close()
        conn.close()
        return render_template('student.html',
                               user=session['username'],
                               class_name=class_name,
                               grades=znamky,
                               schedule=rozvrh_studenta)

    elif session['role'] == 'Teacher':
        cur.execute("SELECT id, title_before, first_name, last_name FROM employees WHERE user_id = %s",
                    (session['user_id'],))
        emp_data = cur.fetchone()

        full_name = session['username']
        moje_predmety = []
        rozvrh_data = []
        moje_znamky = []

        if emp_data:
            emp_id = emp_data[0]
            titul = emp_data[1] if emp_data[1] else ""
            full_name = f"{titul} {emp_data[2]} {emp_data[3]}".strip()

            # 1. UPRAVENÉ: Načítame predmety aj s informáciou o triede (class_id a meno triedy)
            # Toto prepojíme s rozvrhom (timetable), aby sme vedeli, koho v tom predmete učíš
            cur.execute("""
                SELECT DISTINCT s.id, s.name, t.class_id, c.name
                FROM subjects s
                JOIN timetable t ON s.id = t.subject_id
                JOIN classes c ON t.class_id = c.id
                WHERE t.teacher_id = %s
                ORDER BY s.name;
            """, (emp_id,))
            moje_predmety = cur.fetchall()

            # 2. Načítame rozvrh
            cur.execute("""
                SELECT t.day_of_week, t.lesson_slot_id, s.name, c.name
                FROM timetable t
                JOIN subjects s ON t.subject_id = s.id
                JOIN classes c ON t.class_id = c.id
                WHERE t.teacher_id = %s
                ORDER BY t.day_of_week, t.lesson_slot_id;
            """, (emp_id,))
            rozvrh_data = cur.fetchall()

            # 3. Načítame históriu známok
            cur.execute("""
                SELECT g.created_at, s.first_name, s.last_name, subj.name, g.grade, g.comment, g.id
                FROM grades g
                JOIN students s ON g.student_id = s.id
                JOIN subjects subj ON g.test_id = subj.id
                JOIN teacher_subjects ts ON subj.id = ts.subject_id
                WHERE ts.employee_id = %s
                ORDER BY g.created_at DESC
                LIMIT 15;
            """, (emp_id,))
            moje_znamky = cur.fetchall()

        # 4. UPRAVENÉ: Načítame študentov aj s ich class_id (posledný stĺpec s[5])
        cur.execute("""
            SELECT s.id, s.first_name, s.last_name, c.name, s.email, s.class_id 
            FROM students s 
            JOIN classes c ON s.class_id = c.id 
            ORDER BY c.name, s.last_name;
        """)
        studenti = cur.fetchall()

        cur.close()
        conn.close()
        return render_template('teacher.html',
                               full_name=full_name,
                               students=studenti,
                               subjects=moje_predmety,
                               schedule=rozvrh_data,
                               recent_grades=moje_znamky)


@app.route('/add_grade', methods=['POST'])
def add_grade():
    student_id = request.form.get('student_id')
    test_id = request.form.get('subject_id')
    grade = request.form.get('grade')
    comment = request.form.get('comment')

    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("""
            INSERT INTO grades (student_id, test_id, grade, comment, created_at) 
            VALUES (%s, %s, %s, %s, NOW())
        """, (student_id, test_id, grade, comment))
        conn.commit()
        cur.close()
        conn.close()
    except Exception as e:
        print(f"Chyba pri zápise: {e}")
        return f"Chyba databázy: {e}", 500

    return redirect(url_for('dashboard'))


@app.route('/edit_grade/<int:grade_id>', methods=['POST'])
def edit_grade(grade_id):
    new_grade = request.form.get('new_grade')
    new_comment = request.form.get('new_comment')

    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("""
            UPDATE grades 
            SET grade = %s, comment = %s, created_at = NOW() 
            WHERE id = %s
        """, (new_grade, new_comment, grade_id))
        conn.commit()
        cur.close()
        conn.close()
    except Exception as e:
        print(f"Chyba pri úprave: {e}")
        return f"Chyba databázy: {e}", 500

    return redirect(url_for('dashboard'))


@app.route('/delete_grade/<int:grade_id>', methods=['POST'])
def delete_grade(grade_id):
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("DELETE FROM grades WHERE id = %s", (grade_id,))
        conn.commit()
        cur.close()
        conn.close()
    except Exception as e:
        print(f"Chyba pri mazaní: {e}")
        return f"Chyba databázy: {e}", 500

    return redirect(url_for('dashboard'))


@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('home'))


if __name__ == '__main__':
    app.run(debug=True)