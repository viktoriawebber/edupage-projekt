import psycopg2
from psycopg2.extras import RealDictCursor

def get_connection():
    return psycopg2.connect(
        host="localhost",
        database="edupage", # Názov tvojej DB v pgAdmine
        user="postgres",
        password="trust",
        port="5432"
    )

def fetch_all(query, params=None):
    conn = get_connection()
    # RealDictCursor nám vráti dáta rovno ako JSON (kľúč: hodnota)
    cur = conn.cursor(cursor_factory=RealDictCursor)
    cur.execute(query, params)
    result = cur.fetchall()
    cur.close()
    conn.close()
    return result