--
-- PostgreSQL database dump
--

\restrict GtpigFQpGKDR4ENohKNrY9zLwKUMLMUAdMBa9UwBcSQNfkDCk1aqxPK14ki6AxO

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-10 19:05:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 243 (class 1259 OID 17181)
-- Name: attendance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attendance (
    id integer NOT NULL,
    student_id integer,
    lesson_id integer,
    date date DEFAULT CURRENT_DATE,
    status character varying(20) NOT NULL,
    note text,
    CONSTRAINT attendance_status_check CHECK (((status)::text = ANY ((ARRAY['present'::character varying, 'absent'::character varying, 'late'::character varying, 'excused'::character varying])::text[])))
);


ALTER TABLE public.attendance OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 17180)
-- Name: attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attendance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.attendance_id_seq OWNER TO postgres;

--
-- TOC entry 5168 (class 0 OID 0)
-- Dependencies: 242
-- Name: attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attendance_id_seq OWNED BY public.attendance.id;


--
-- TOC entry 232 (class 1259 OID 17037)
-- Name: classes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classes (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    homeroom_teacher_id integer,
    grade_level integer NOT NULL
);


ALTER TABLE public.classes OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17036)
-- Name: classes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classes_id_seq OWNER TO postgres;

--
-- TOC entry 5169 (class 0 OID 0)
-- Dependencies: 231
-- Name: classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classes_id_seq OWNED BY public.classes.id;


--
-- TOC entry 230 (class 1259 OID 17016)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    id integer NOT NULL,
    user_id integer,
    position_id integer,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    title_before character varying(20),
    email character varying(100),
    hire_date date DEFAULT CURRENT_DATE,
    phone_number character varying(20),
    iban character varying(34),
    gender character(1),
    address text,
    health_issues text,
    personal_email character varying(100),
    birth_date date
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17015)
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_id_seq OWNER TO postgres;

--
-- TOC entry 5170 (class 0 OID 0)
-- Dependencies: 229
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;


--
-- TOC entry 241 (class 1259 OID 17158)
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_id integer,
    test_id integer,
    grade integer NOT NULL,
    comment text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT grades_grade_check CHECK (((grade >= 1) AND (grade <= 5)))
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 17157)
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_id_seq OWNER TO postgres;

--
-- TOC entry 5171 (class 0 OID 0)
-- Dependencies: 240
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- TOC entry 222 (class 1259 OID 16976)
-- Name: job_positions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_positions (
    id integer NOT NULL,
    position_name character varying(50) NOT NULL
);


ALTER TABLE public.job_positions OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16975)
-- Name: job_positions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.job_positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.job_positions_id_seq OWNER TO postgres;

--
-- TOC entry 5172 (class 0 OID 0)
-- Dependencies: 221
-- Name: job_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.job_positions_id_seq OWNED BY public.job_positions.id;


--
-- TOC entry 228 (class 1259 OID 17005)
-- Name: lesson_slots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lesson_slots (
    id integer NOT NULL,
    slot_number integer NOT NULL,
    start_time time without time zone NOT NULL,
    end_time time without time zone NOT NULL
);


ALTER TABLE public.lesson_slots OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17004)
-- Name: lesson_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lesson_slots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lesson_slots_id_seq OWNER TO postgres;

--
-- TOC entry 5173 (class 0 OID 0)
-- Dependencies: 227
-- Name: lesson_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lesson_slots_id_seq OWNED BY public.lesson_slots.id;


--
-- TOC entry 226 (class 1259 OID 16996)
-- Name: rooms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    capacity integer
);


ALTER TABLE public.rooms OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16995)
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_id_seq OWNER TO postgres;

--
-- TOC entry 5174 (class 0 OID 0)
-- Dependencies: 225
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- TOC entry 234 (class 1259 OID 17052)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    user_id integer,
    class_id integer,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    birth_date date,
    address text,
    phone_number character varying(20),
    parent_phone character varying(20),
    parent_email character varying(100),
    isic_card_number character varying(20),
    health_issues text,
    gender character(1),
    parent_first_name character varying(50),
    parent_last_name character varying(50),
    parent_relation character varying(20),
    email character varying(100)
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17051)
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- TOC entry 5175 (class 0 OID 0)
-- Dependencies: 233
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 224 (class 1259 OID 16987)
-- Name: subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    shortcut character varying(10)
);


ALTER TABLE public.subjects OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16986)
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subjects_id_seq OWNER TO postgres;

--
-- TOC entry 5176 (class 0 OID 0)
-- Dependencies: 223
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- TOC entry 235 (class 1259 OID 17073)
-- Name: teacher_subjects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_subjects (
    employee_id integer NOT NULL,
    subject_id integer NOT NULL
);


ALTER TABLE public.teacher_subjects OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17131)
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests (
    id integer NOT NULL,
    subject_id integer,
    teacher_id integer,
    class_id integer,
    title character varying(100) NOT NULL,
    weight integer DEFAULT 1,
    test_date date NOT NULL,
    CONSTRAINT tests_weight_check CHECK ((weight > 0))
);


ALTER TABLE public.tests OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 17130)
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tests_id_seq OWNER TO postgres;

--
-- TOC entry 5177 (class 0 OID 0)
-- Dependencies: 238
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- TOC entry 237 (class 1259 OID 17091)
-- Name: timetable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timetable (
    id integer NOT NULL,
    class_id integer,
    subject_id integer,
    teacher_id integer,
    room_id integer,
    lesson_slot_id integer,
    day_of_week integer,
    CONSTRAINT timetable_day_of_week_check CHECK (((day_of_week >= 1) AND (day_of_week <= 5)))
);


ALTER TABLE public.timetable OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 17090)
-- Name: timetable_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timetable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.timetable_id_seq OWNER TO postgres;

--
-- TOC entry 5178 (class 0 OID 0)
-- Dependencies: 236
-- Name: timetable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.timetable_id_seq OWNED BY public.timetable.id;


--
-- TOC entry 220 (class 1259 OID 16960)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password_hash text NOT NULL,
    role character varying(20) NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['Admin'::character varying, 'Teacher'::character varying, 'Student'::character varying, 'Staff'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16959)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5179 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4929 (class 2604 OID 17184)
-- Name: attendance id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance ALTER COLUMN id SET DEFAULT nextval('public.attendance_id_seq'::regclass);


--
-- TOC entry 4922 (class 2604 OID 17040)
-- Name: classes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes ALTER COLUMN id SET DEFAULT nextval('public.classes_id_seq'::regclass);


--
-- TOC entry 4920 (class 2604 OID 17019)
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 17161)
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- TOC entry 4916 (class 2604 OID 16979)
-- Name: job_positions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions ALTER COLUMN id SET DEFAULT nextval('public.job_positions_id_seq'::regclass);


--
-- TOC entry 4919 (class 2604 OID 17008)
-- Name: lesson_slots id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_slots ALTER COLUMN id SET DEFAULT nextval('public.lesson_slots_id_seq'::regclass);


--
-- TOC entry 4918 (class 2604 OID 16999)
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- TOC entry 4923 (class 2604 OID 17055)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 4917 (class 2604 OID 16990)
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 17134)
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- TOC entry 4924 (class 2604 OID 17094)
-- Name: timetable id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable ALTER COLUMN id SET DEFAULT nextval('public.timetable_id_seq'::regclass);


--
-- TOC entry 4915 (class 2604 OID 16963)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5162 (class 0 OID 17181)
-- Dependencies: 243
-- Data for Name: attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attendance (id, student_id, lesson_id, date, status, note) FROM stdin;
\.


--
-- TOC entry 5151 (class 0 OID 17037)
-- Dependencies: 232
-- Data for Name: classes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classes (id, name, homeroom_teacher_id, grade_level) FROM stdin;
1	1.A	1	1
2	2.A	2	2
3	3.A	3	3
4	4.A	4	4
\.


--
-- TOC entry 5149 (class 0 OID 17016)
-- Dependencies: 230
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (id, user_id, position_id, first_name, last_name, title_before, email, hire_date, phone_number, iban, gender, address, health_issues, personal_email, birth_date) FROM stdin;
1	1	1	Štefan	Nagy	Bc.	štefan.nagy@skola.sk	2011-08-12	+421 945461889	SK0000000000072798233382	M	Ulica Nagy 1	Bez obmedzení	štefan.nagy@gmail.com	2001-03-27
2	2	3	Ľudmila	Krajčírová	PhDr.	ľudmila.krajčírová@skola.sk	2017-02-20	+421 989589211	SK0000000000021080794673	Z	Ulica Krajčírová 2	Bez obmedzení	ľudmila.krajčírová@gmail.com	1969-07-03
3	3	3	Miroslav	Baláž	Mgr.	miroslav.baláž@skola.sk	2016-09-23	+421 947510765	SK0000000000034945827803	M	Ulica Baláž 3	Bez obmedzení	miroslav.baláž@gmail.com	1965-07-06
4	4	2	Ľudmila	Kováčová	PaedDr.	ľudmila.kováčová@skola.sk	2012-02-01	+421 960566923	SK0000000000018528113011	Z	Ulica Kováčová 4	Bez obmedzení	ľudmila.kováčová@gmail.com	2001-09-03
5	5	2	Marián	Szabó	PaedDr.	marián.szabó@skola.sk	2017-05-08	+421 956543146	SK0000000000099846225723	M	Ulica Szabó 5	Bez obmedzení	marián.szabó@gmail.com	1989-08-05
6	6	2	Iveta	Tóthová	Mgr.	iveta.tóthová@skola.sk	2011-03-01	+421 922282659	SK0000000000061695060991	Z	Ulica Tóthová 6	Bez obmedzení	iveta.tóthová@gmail.com	1965-04-06
7	7	2	Milan	Tóth	Ing.	milan.tóth@skola.sk	2015-07-24	+421 916781775	SK0000000000074977787682	M	Ulica Tóth 7	Bez obmedzení	milan.tóth@gmail.com	1978-04-18
8	8	2	Dagmar	Szabóová	PaedDr.	dagmar.szabóová@skola.sk	2020-12-17	+421 944117113	SK0000000000034880195348	Z	Ulica Szabóová 8	Bez obmedzení	dagmar.szabóová@gmail.com	1982-01-24
9	9	2	Ladislav	Sloboda	Ing.	ladislav.sloboda@skola.sk	2024-01-29	+421 987016597	SK0000000000096948324282	M	Ulica Sloboda 9	Bez obmedzení	ladislav.sloboda@gmail.com	1996-03-07
10	10	2	Ľudmila	Tóthová	PaedDr.	ľudmila.tóthová@skola.sk	2017-12-08	+421 917099646	SK0000000000008604552132	Z	Ulica Tóthová 10	Bez obmedzení	ľudmila.tóthová@gmail.com	2004-07-09
11	11	2	Milan	Szabó	Mgr.	milan.szabó@skola.sk	2019-12-25	+421 989982797	SK0000000000021905639786	M	Ulica Szabó 11	Bez obmedzení	milan.szabó@gmail.com	1975-02-22
12	12	2	Dagmar	Horváthová	PaedDr.	dagmar.horváthová@skola.sk	2012-03-23	+421 935841617	SK0000000000034841381811	Z	Ulica Horváthová 12	Bez obmedzení	dagmar.horváthová@gmail.com	1988-08-02
13	13	2	Juraj	Szabó	Mgr.	juraj.szabó@skola.sk	2022-11-29	+421 958981476	SK0000000000011353323791	M	Ulica Szabó 13	Bez obmedzení	juraj.szabó@gmail.com	2004-02-24
14	14	2	Dagmar	Pekárová	PhDr.	dagmar.pekárová@skola.sk	2017-05-03	+421 950296924	SK0000000000058707758599	Z	Ulica Pekárová 14	Bez obmedzení	dagmar.pekárová@gmail.com	1985-08-24
15	15	2	František	Krajčír	Bc.	františek.krajčír@skola.sk	2011-10-29	+421 982134409	SK0000000000061146396674	M	Ulica Krajčír 15	Bez obmedzení	františek.krajčír@gmail.com	2003-02-02
16	16	2	Dagmar	Tóthová	PhDr.	dagmar.tóthová@skola.sk	2015-07-12	+421 958495640	SK0000000000041969492597	Z	Ulica Tóthová 16	Bez obmedzení	dagmar.tóthová@gmail.com	1991-05-29
17	17	2	Róbert	Sloboda	Ing.	róbert.sloboda@skola.sk	2012-06-13	+421 994728989	SK0000000000020124469938	M	Ulica Sloboda 17	Bez obmedzení	róbert.sloboda@gmail.com	1984-12-26
18	18	2	Viera	Múdryová	Ing.	viera.múdryová@skola.sk	2010-09-23	+421 972202417	SK0000000000079018701467	Z	Ulica Múdryová 18	Bez obmedzení	viera.múdryová@gmail.com	1990-12-27
19	19	2	Juraj	Sloboda	PhDr.	juraj.sloboda@skola.sk	2023-02-22	+421 921454188	SK0000000000058568873449	M	Ulica Sloboda 19	Bez obmedzení	juraj.sloboda@gmail.com	1979-06-12
20	20	2	Ľudmila	Vargaová	Bc.	ľudmila.vargaová@skola.sk	2019-02-10	+421 976169823	SK0000000000043109201644	Z	Ulica Vargaová 20	Bez obmedzení	ľudmila.vargaová@gmail.com	1983-06-07
21	21	2	Štefan	Kováč	Bc.	štefan.kováč@skola.sk	2014-05-20	+421 915709200	SK0000000000086533239968	M	Ulica Kováč 21	Bez obmedzení	štefan.kováč@gmail.com	1998-11-25
22	22	2	Božena	Balážová	PaedDr.	božena.balážová@skola.sk	2013-05-19	+421 918777635	SK0000000000065378242015	Z	Ulica Balážová 22	Bez obmedzení	božena.balážová@gmail.com	1991-10-27
23	23	2	Milan	Horváth	Bc.	milan.horváth@skola.sk	2014-07-12	+421 991352630	SK0000000000034509757928	M	Ulica Horváth 23	Bez obmedzení	milan.horváth@gmail.com	1983-12-11
24	24	2	Viera	Szabóová	PaedDr.	viera.szabóová@skola.sk	2017-09-03	+421 920467889	SK0000000000078198933146	Z	Ulica Szabóová 24	Bez obmedzení	viera.szabóová@gmail.com	1989-07-04
25	25	2	Róbert	Múdry	Ing.	róbert.múdry@skola.sk	2022-01-26	+421 913361627	SK0000000000041693760928	M	Ulica Múdry 25	Bez obmedzení	róbert.múdry@gmail.com	1979-06-17
26	26	2	Dagmar	Horváthová	PhDr.	dagmar.horváthová@skola.sk	2011-11-16	+421 963080765	SK0000000000079363256925	Z	Ulica Horváthová 26	Bez obmedzení	dagmar.horváthová@gmail.com	1974-03-01
27	27	2	Ivan	Nagy	PhD.	ivan.nagy@skola.sk	2011-10-01	+421 970855243	SK0000000000099432485275	M	Ulica Nagy 27	Bez obmedzení	ivan.nagy@gmail.com	2001-03-10
28	28	2	Anna	Nagyová	PaedDr.	anna.nagyová@skola.sk	2019-01-26	+421 954623385	SK0000000000001975491220	Z	Ulica Nagyová 28	Bez obmedzení	anna.nagyová@gmail.com	1987-05-05
29	29	2	Ivan	Varga	Bc.	ivan.varga@skola.sk	2021-02-16	+421 933575611	SK0000000000000259349058	M	Ulica Varga 29	Bez obmedzení	ivan.varga@gmail.com	1973-07-18
30	30	2	Dana	Krajčírová	PaedDr.	dana.krajčírová@skola.sk	2010-10-07	+421 986635254	SK0000000000007704579223	Z	Ulica Krajčírová 30	Bez obmedzení	dana.krajčírová@gmail.com	2002-11-10
31	31	2	Ivan	Horváth	PhDr.	ivan.horváth@skola.sk	2010-10-11	+421 947586733	SK0000000000096177332885	M	Ulica Horváth 31	Bez obmedzení	ivan.horváth@gmail.com	2003-11-14
32	32	2	Jozefína	Molnárová	PaedDr.	jozefína.molnárová@skola.sk	2017-06-18	+421 971201860	SK0000000000076456705643	Z	Ulica Molnárová 32	Bez obmedzení	jozefína.molnárová@gmail.com	1998-10-22
33	33	2	František	Horváth	Bc.	františek.horváth@skola.sk	2021-06-25	+421 970869954	SK0000000000077707426868	M	Ulica Horváth 33	Bez obmedzení	františek.horváth@gmail.com	1987-03-03
34	34	2	Dana	Múdryová	Mgr.	dana.múdryová@skola.sk	2022-08-23	+421 953604082	SK0000000000015867185015	Z	Ulica Múdryová 34	Bez obmedzení	dana.múdryová@gmail.com	1995-05-04
35	35	2	Milan	Molnár	PhDr.	milan.molnár@skola.sk	2014-01-30	+421 945213652	SK0000000000068081361985	M	Ulica Molnár 35	Bez obmedzení	milan.molnár@gmail.com	1987-07-11
36	36	2	Viera	Múdryová	Mgr.	viera.múdryová@skola.sk	2012-11-18	+421 950204175	SK0000000000070524800475	Z	Ulica Múdryová 36	Bez obmedzení	viera.múdryová@gmail.com	1974-12-14
37	37	2	Pavol	Sloboda	PhD.	pavol.sloboda@skola.sk	2023-03-06	+421 999326010	SK0000000000087066135016	M	Ulica Sloboda 37	Bez obmedzení	pavol.sloboda@gmail.com	1995-12-28
38	38	2	Ľudmila	Krajčírová	Bc.	ľudmila.krajčírová@skola.sk	2011-02-08	+421 942517276	SK0000000000090580904757	Z	Ulica Krajčírová 38	Bez obmedzení	ľudmila.krajčírová@gmail.com	1975-10-16
39	39	4	Ivan	Tóth	\N	ivan.tóth@skola.sk	2013-09-08	+421 926132685	SK0000000000002142136738	M	Ulica Tóth 39	Bez obmedzení	ivan.tóth@gmail.com	1988-02-20
40	40	4	Mária	Kováčová	\N	mária.kováčová@skola.sk	2024-02-23	+421 945695000	SK0000000000093638375092	Z	Ulica Kováčová 40	Bez obmedzení	mária.kováčová@gmail.com	1982-04-28
41	41	4	Ivan	Múdry	\N	ivan.múdry@skola.sk	2014-03-04	+421 954249557	SK0000000000028053590011	M	Ulica Múdry 41	Bez obmedzení	ivan.múdry@gmail.com	1990-01-29
42	42	4	Božena	Pekárová	\N	božena.pekárová@skola.sk	2021-10-27	+421 981782269	SK0000000000051086446099	Z	Ulica Pekárová 42	Bez obmedzení	božena.pekárová@gmail.com	1992-01-04
43	43	4	Miroslav	Molnár	\N	miroslav.molnár@skola.sk	2014-04-16	+421 999764402	SK0000000000032497016364	M	Ulica Molnár 43	Bez obmedzení	miroslav.molnár@gmail.com	1990-03-06
44	44	4	Dana	Vargaová	\N	dana.vargaová@skola.sk	2024-01-01	+421 993640277	SK0000000000045262897585	Z	Ulica Vargaová 44	Bez obmedzení	dana.vargaová@gmail.com	1965-09-26
45	45	4	Róbert	Múdry	\N	róbert.múdry@skola.sk	2023-10-02	+421 933092897	SK0000000000033046105626	M	Ulica Múdry 45	Bez obmedzení	róbert.múdry@gmail.com	2004-07-06
\.


--
-- TOC entry 5160 (class 0 OID 17158)
-- Dependencies: 241
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grades (id, student_id, test_id, grade, comment, created_at) FROM stdin;
1501	2	20	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1502	2	19	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1503	2	18	2	Výborný výkon!	2026-01-05 00:00:00
1504	2	17	1	Výborný výkon!	2026-01-07 00:00:00
1505	2	16	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1506	2	15	2	Výborný výkon!	2026-01-12 00:00:00
1507	2	14	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1508	2	13	2	Výborný výkon!	2026-02-01 00:00:00
1509	2	12	2	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
1510	2	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
1511	3	30	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1512	3	29	1	Výborný výkon!	2026-01-15 00:00:00
1513	3	28	2	Výborný výkon!	2026-01-09 00:00:00
1514	3	27	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
1515	3	26	1	Nevyhnutný opravný termín po doučení.	2026-01-13 00:00:00
1516	3	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1517	3	24	2	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
1518	3	23	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1519	3	22	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1520	3	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1521	4	40	1	Výborný výkon!	2026-01-21 00:00:00
1522	4	39	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1523	4	38	4	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
1524	4	37	3	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1525	4	36	5	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
1526	4	35	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1527	4	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1528	4	33	2	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
1529	4	32	2	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1530	4	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1531	5	10	2	Výborný výkon!	2026-01-31 00:00:00
1532	5	9	1	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
1533	5	8	1	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1534	5	7	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
1535	5	6	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1536	5	5	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1537	5	4	5	Výborný výkon!	2026-01-10 00:00:00
1538	5	3	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
1539	5	2	1	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1540	5	1	2	Výborný výkon!	2026-01-11 00:00:00
1541	6	20	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1542	6	19	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
1543	6	18	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1544	6	17	5	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1545	6	16	2	Výborný výkon!	2026-01-06 00:00:00
1546	6	15	4	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
1547	6	14	4	Výborný výkon!	2026-01-10 00:00:00
1548	6	13	1	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
1549	6	12	2	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
1550	6	11	4	Výborný výkon!	2026-01-05 00:00:00
1551	7	30	2	Výborný výkon!	2026-01-18 00:00:00
1552	7	29	4	Výborný výkon!	2026-01-15 00:00:00
1553	7	28	5	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1554	7	27	4	Výborný výkon!	2026-01-21 00:00:00
1555	7	26	3	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
1556	7	25	5	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
1557	7	24	1	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
1558	7	23	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
1559	7	22	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1560	7	21	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1561	8	40	5	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
1562	8	39	4	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1563	8	38	5	Výborný výkon!	2026-01-23 00:00:00
1564	8	37	5	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1565	8	36	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1566	8	35	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1567	8	34	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1568	8	33	5	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
1569	8	32	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1570	8	31	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
1571	9	10	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1572	9	9	3	Výborný výkon!	2026-01-18 00:00:00
1573	9	8	3	Výborný výkon!	2026-01-15 00:00:00
1574	9	7	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
1575	9	6	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1576	9	5	2	Výborný výkon!	2026-01-06 00:00:00
1577	9	4	5	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
1578	9	3	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1579	9	2	3	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1580	9	1	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1581	10	20	4	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
1582	10	19	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1583	10	18	2	Výborný výkon!	2026-01-05 00:00:00
1584	10	17	4	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1585	10	16	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1586	10	15	4	Výborný výkon!	2026-01-12 00:00:00
3001	137	13	1	Skúška	2026-02-10 18:11:53.586215
1587	10	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1588	10	13	3	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
1589	10	12	5	Výborný výkon!	2026-01-04 00:00:00
1590	10	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
1591	11	30	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1592	11	29	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1593	11	28	5	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
1594	11	27	3	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1595	11	26	3	Výborný výkon!	2026-01-13 00:00:00
1596	11	25	1	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
1597	11	24	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1598	11	23	2	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1599	11	22	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1600	11	21	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1601	12	40	1	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1602	12	39	2	Nevyhnutný opravný termín po doučení.	2026-01-08 00:00:00
1603	12	38	5	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
1604	12	37	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1605	12	36	1	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1606	12	35	5	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
1607	12	34	1	Výborný výkon!	2026-01-11 00:00:00
1608	12	33	2	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
1609	12	32	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1610	12	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1611	13	10	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1612	13	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1613	13	8	5	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1614	13	7	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
1615	13	6	2	Výborný výkon!	2026-01-08 00:00:00
1616	13	5	5	Výborný výkon!	2026-01-06 00:00:00
1617	13	4	4	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1618	13	3	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
1619	13	2	1	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1620	13	1	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1621	14	20	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1622	14	19	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1623	14	18	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1624	14	17	1	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
1625	14	16	2	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
1626	14	15	3	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
1627	14	14	4	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1628	14	13	5	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
1629	14	12	1	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
1630	14	11	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1631	15	30	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1632	15	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1633	15	28	5	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1634	15	27	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
1635	15	26	1	Nevyhnutný opravný termín po doučení.	2026-01-13 00:00:00
1636	15	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1637	15	24	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1638	15	23	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
1639	15	22	3	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1640	15	21	5	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1641	16	40	2	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1642	16	39	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1643	16	38	2	Výborný výkon!	2026-01-23 00:00:00
1644	16	37	3	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1645	16	36	3	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
1646	16	35	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1647	16	34	4	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
1648	16	33	4	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
1649	16	32	3	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1650	16	31	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
1651	17	10	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1652	17	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1653	17	8	3	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1654	17	7	4	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1655	17	6	4	Výborný výkon!	2026-01-08 00:00:00
1656	17	5	4	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
1657	17	4	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1658	17	3	5	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
1659	17	2	5	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1660	17	1	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
1661	18	20	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1662	18	19	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
1663	18	18	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1664	18	17	3	Výborný výkon!	2026-01-07 00:00:00
1665	18	16	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1666	18	15	2	Výborný výkon!	2026-01-12 00:00:00
1667	18	14	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1668	18	13	3	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
1669	18	12	4	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
1670	18	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
1671	19	30	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1672	19	29	5	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1673	19	28	3	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1674	19	27	1	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1675	19	26	2	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
1676	19	25	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1677	19	24	3	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
1678	19	23	1	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1679	19	22	1	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1680	19	21	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1681	20	40	1	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
1682	20	39	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
1683	20	38	2	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
1684	20	37	1	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1685	20	36	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1686	20	35	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1687	20	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1688	20	33	1	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
1689	20	32	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1690	20	31	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
1691	21	10	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1692	21	9	2	Výborný výkon!	2026-01-18 00:00:00
1693	21	8	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1694	21	7	3	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1695	21	6	4	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1696	21	5	3	Výborný výkon!	2026-01-06 00:00:00
1697	21	4	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1698	21	3	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1699	21	2	1	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1700	21	1	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1701	22	20	1	Výborný výkon!	2026-01-31 00:00:00
1702	22	19	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
1703	22	18	1	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
1704	22	17	4	Výborný výkon!	2026-01-07 00:00:00
1705	22	16	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1706	22	15	3	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
1707	22	14	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1708	22	13	1	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
1709	22	12	4	Výborný výkon!	2026-01-04 00:00:00
1710	22	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
1711	23	30	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1712	23	29	1	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1713	23	28	4	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1714	23	27	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
1715	23	26	2	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
1716	23	25	4	Výborný výkon!	2026-01-27 00:00:00
1717	23	24	1	Výborný výkon!	2026-01-05 00:00:00
1718	23	23	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1719	23	22	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1720	23	21	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1721	24	40	3	Výborný výkon!	2026-01-21 00:00:00
1722	24	39	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
1723	24	38	2	Výborný výkon!	2026-01-23 00:00:00
1724	24	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1725	24	36	2	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
1726	24	35	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1727	24	34	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
1728	24	33	2	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
1729	24	32	2	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1730	24	31	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
1731	25	10	2	Výborný výkon!	2026-01-31 00:00:00
1732	25	9	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1733	25	8	5	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1734	25	7	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
1735	25	6	3	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1736	25	5	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1737	25	4	2	Výborný výkon!	2026-01-10 00:00:00
1738	25	3	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1739	25	2	4	Výborný výkon!	2026-01-22 00:00:00
1740	25	1	2	Výborný výkon!	2026-01-11 00:00:00
1741	26	20	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1742	26	19	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1743	26	18	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1744	26	17	4	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1745	26	16	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1746	26	15	2	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
1747	26	14	4	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
1748	26	13	2	Nevyhnutný opravný termín po doučení.	2026-02-01 00:00:00
1749	26	12	2	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
1750	26	11	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1751	27	30	2	Výborný výkon!	2026-01-18 00:00:00
1752	27	29	1	Nevyhnutný opravný termín po doučení.	2026-01-15 00:00:00
1753	27	28	1	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1754	27	27	5	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
1755	27	26	5	Výborný výkon!	2026-01-13 00:00:00
1756	27	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1757	27	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1758	27	23	1	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1759	27	22	3	Výborný výkon!	2026-01-20 00:00:00
1760	27	21	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1761	28	40	2	Výborný výkon!	2026-01-21 00:00:00
1762	28	39	2	Nevyhnutný opravný termín po doučení.	2026-01-08 00:00:00
1763	28	38	3	Nevyhnutný opravný termín po doučení.	2026-01-23 00:00:00
1764	28	37	3	Výborný výkon!	2026-01-20 00:00:00
1765	28	36	5	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
1766	28	35	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1767	28	34	1	Výborný výkon!	2026-01-11 00:00:00
1768	28	33	4	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
1769	28	32	1	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1770	28	31	3	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1771	29	10	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1772	29	9	3	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
1773	29	8	1	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1774	29	7	2	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1775	29	6	4	Výborný výkon!	2026-01-08 00:00:00
1776	29	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1777	29	4	4	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1778	29	3	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1779	29	2	1	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1780	29	1	4	Výborný výkon!	2026-01-11 00:00:00
1781	30	20	5	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
1782	30	19	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
1783	30	18	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1784	30	17	4	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
1785	30	16	2	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1786	30	15	1	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
1787	30	14	3	Výborný výkon!	2026-01-10 00:00:00
1788	30	13	2	Výborný výkon!	2026-02-01 00:00:00
1789	30	12	3	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
1790	30	11	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1791	31	30	1	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1792	31	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1793	31	28	3	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
1794	31	27	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
1795	31	26	1	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
1796	31	25	4	Výborný výkon!	2026-01-27 00:00:00
1797	31	24	1	Výborný výkon!	2026-01-05 00:00:00
1798	31	23	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1799	31	22	4	Výborný výkon!	2026-01-20 00:00:00
1800	31	21	3	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1801	32	40	5	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
1802	32	39	1	Výborný výkon!	2026-01-08 00:00:00
1803	32	38	2	Nevyhnutný opravný termín po doučení.	2026-01-23 00:00:00
1804	32	37	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1805	32	36	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1806	32	35	4	Výborný výkon!	2026-01-06 00:00:00
1807	32	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1808	32	33	5	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
1809	32	32	4	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
1810	32	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1811	33	10	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1812	33	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1813	33	8	3	Nevyhnutný opravný termín po doučení.	2026-01-15 00:00:00
1814	33	7	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1815	33	6	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1816	33	5	4	Výborný výkon!	2026-01-06 00:00:00
1817	33	4	4	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1818	33	3	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1819	33	2	3	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1820	33	1	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1821	34	20	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1822	34	19	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1823	34	18	2	Výborný výkon!	2026-01-05 00:00:00
1824	34	17	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1825	34	16	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1826	34	15	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
1827	34	14	3	Výborný výkon!	2026-01-10 00:00:00
1828	34	13	3	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
1829	34	12	4	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
1830	34	11	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1831	35	30	4	Výborný výkon!	2026-01-18 00:00:00
1832	35	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1833	35	28	4	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1834	35	27	4	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1835	35	26	5	Výborný výkon!	2026-01-13 00:00:00
1836	35	25	3	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1837	35	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1838	35	23	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1839	35	22	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1840	35	21	3	Výborný výkon!	2026-01-20 00:00:00
1841	36	40	2	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
1842	36	39	1	Nevyhnutný opravný termín po doučení.	2026-01-08 00:00:00
1843	36	38	5	Výborný výkon!	2026-01-23 00:00:00
1844	36	37	4	Výborný výkon!	2026-01-20 00:00:00
1845	36	36	2	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
1846	36	35	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1847	36	34	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1848	36	33	3	Výborný výkon!	2026-01-28 00:00:00
1849	36	32	4	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
1850	36	31	1	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1851	37	10	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1852	37	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1853	37	8	4	Nevyhnutný opravný termín po doučení.	2026-01-15 00:00:00
1854	37	7	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
1855	37	6	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1856	37	5	1	Výborný výkon!	2026-01-06 00:00:00
1857	37	4	3	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1858	37	3	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
1859	37	2	2	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1860	37	1	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1861	38	20	3	Výborný výkon!	2026-01-31 00:00:00
1862	38	19	1	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
1863	38	18	2	Výborný výkon!	2026-01-05 00:00:00
1864	38	17	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1865	38	16	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1866	38	15	4	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
1867	38	14	4	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1868	38	13	4	Nevyhnutný opravný termín po doučení.	2026-02-01 00:00:00
1869	38	12	1	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
1870	38	11	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1871	39	30	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1872	39	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1873	39	28	5	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1874	39	27	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
1875	39	26	4	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
1876	39	25	4	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1877	39	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1878	39	23	5	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1879	39	22	2	Výborný výkon!	2026-01-20 00:00:00
1880	39	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1881	40	40	3	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1882	40	39	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
1883	40	38	1	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
1884	40	37	1	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1885	40	36	1	Výborný výkon!	2026-01-26 00:00:00
1886	40	35	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1887	40	34	5	Výborný výkon!	2026-01-11 00:00:00
1888	40	33	1	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
1889	40	32	2	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1890	40	31	5	Výborný výkon!	2026-01-27 00:00:00
1891	41	10	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1892	41	9	3	Výborný výkon!	2026-01-18 00:00:00
1893	41	8	1	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1894	41	7	2	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1895	41	6	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1896	41	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1897	41	4	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1898	41	3	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
1899	41	2	2	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1900	41	1	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1901	42	20	5	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
1902	42	19	2	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
1903	42	18	1	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1904	42	17	2	Výborný výkon!	2026-01-07 00:00:00
1905	42	16	1	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
1906	42	15	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
1907	42	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1908	42	13	2	Výborný výkon!	2026-02-01 00:00:00
1909	42	12	5	Výborný výkon!	2026-01-04 00:00:00
1910	42	11	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
1911	43	30	1	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1912	43	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1913	43	28	1	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1914	43	27	4	Výborný výkon!	2026-01-21 00:00:00
1915	43	26	1	Nevyhnutný opravný termín po doučení.	2026-01-13 00:00:00
1916	43	25	3	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1917	43	24	1	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
1918	43	23	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
1919	43	22	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1920	43	21	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1921	44	40	4	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1922	44	39	3	Nevyhnutný opravný termín po doučení.	2026-01-08 00:00:00
1923	44	38	4	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
1924	44	37	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1925	44	36	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
1926	44	35	2	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1927	44	34	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1928	44	33	5	Výborný výkon!	2026-01-28 00:00:00
1929	44	32	4	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
1930	44	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1931	45	10	4	Výborný výkon!	2026-01-31 00:00:00
1932	45	9	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1933	45	8	3	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1934	45	7	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1935	45	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
1936	45	5	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1937	45	4	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1938	45	3	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
1939	45	2	5	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
1940	45	1	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1941	46	20	4	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
1942	46	19	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
1943	46	18	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1944	46	17	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
1945	46	16	2	Výborný výkon!	2026-01-06 00:00:00
1946	46	15	1	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
1947	46	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1948	46	13	3	Nevyhnutný opravný termín po doučení.	2026-02-01 00:00:00
1949	46	12	3	Výborný výkon!	2026-01-04 00:00:00
1950	46	11	4	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
1951	47	30	5	Výborný výkon!	2026-01-18 00:00:00
1952	47	29	5	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
1953	47	28	2	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
1954	47	27	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
1955	47	26	1	Výborný výkon!	2026-01-13 00:00:00
1956	47	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1957	47	24	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1958	47	23	4	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
1959	47	22	5	Výborný výkon!	2026-01-20 00:00:00
1960	47	21	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
1961	48	40	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1962	48	39	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
1963	48	38	2	Nevyhnutný opravný termín po doučení.	2026-01-23 00:00:00
1964	48	37	4	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
1965	48	36	4	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
1966	48	35	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
1967	48	34	2	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
1968	48	33	1	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
1969	48	32	4	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
1970	48	31	3	Výborný výkon!	2026-01-27 00:00:00
1971	49	10	5	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
1972	49	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1973	49	8	3	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
1974	49	7	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
1975	49	6	5	Výborný výkon!	2026-01-08 00:00:00
1976	49	5	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
1977	49	4	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1978	49	3	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
1979	49	2	2	Výborný výkon!	2026-01-22 00:00:00
1980	49	1	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
1981	50	20	1	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
1982	50	19	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
1983	50	18	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1984	50	17	5	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
1985	50	16	4	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
1986	50	15	4	Výborný výkon!	2026-01-12 00:00:00
1987	50	14	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
1988	50	13	1	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
1989	50	12	4	Výborný výkon!	2026-01-04 00:00:00
1990	50	11	1	Výborný výkon!	2026-01-05 00:00:00
1991	51	30	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
1992	51	29	2	Výborný výkon!	2026-01-15 00:00:00
1993	51	28	4	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
1994	51	27	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
1995	51	26	5	Výborný výkon!	2026-01-13 00:00:00
1996	51	25	4	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
1997	51	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
1998	51	23	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
1999	51	22	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2000	51	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2001	52	40	4	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2002	52	39	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2003	52	38	2	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2004	52	37	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2005	52	36	2	Výborný výkon!	2026-01-26 00:00:00
2006	52	35	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2007	52	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2008	52	33	2	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
2009	52	32	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2010	52	31	3	Výborný výkon!	2026-01-27 00:00:00
2011	53	10	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2012	53	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2013	53	8	5	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2014	53	7	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
2015	53	6	3	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2016	53	5	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2017	53	4	4	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2018	53	3	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
2019	53	2	3	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2020	53	1	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2021	54	20	1	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2022	54	19	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2023	54	18	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2024	54	17	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2025	54	16	1	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2026	54	15	2	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2027	54	14	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2028	54	13	2	Výborný výkon!	2026-02-01 00:00:00
2029	54	12	4	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2030	54	11	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2031	55	30	3	Výborný výkon!	2026-01-18 00:00:00
2032	55	29	5	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2033	55	28	4	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2034	55	27	2	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
2035	55	26	3	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2036	55	25	2	Výborný výkon!	2026-01-27 00:00:00
2037	55	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2038	55	23	5	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2039	55	22	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2040	55	21	5	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2041	56	40	4	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2042	56	39	3	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2043	56	38	2	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2044	56	37	2	Výborný výkon!	2026-01-20 00:00:00
2045	56	36	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2046	56	35	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2047	56	34	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2048	56	33	1	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2049	56	32	4	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2050	56	31	1	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2051	57	10	4	Výborný výkon!	2026-01-31 00:00:00
2052	57	9	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2053	57	8	1	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2054	57	7	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2055	57	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2056	57	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2057	57	4	4	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2058	57	3	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2059	57	2	2	Výborný výkon!	2026-01-22 00:00:00
2060	57	1	1	Výborný výkon!	2026-01-11 00:00:00
2061	58	20	4	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2062	58	19	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2063	58	18	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2064	58	17	4	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2065	58	16	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2066	58	15	3	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2067	58	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2068	58	13	2	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2069	58	12	2	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2070	58	11	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2071	59	30	2	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
2072	59	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2073	59	28	5	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2074	59	27	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2075	59	26	2	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2076	59	25	1	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2077	59	24	1	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2078	59	23	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2079	59	22	4	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2080	59	21	5	Výborný výkon!	2026-01-20 00:00:00
2081	60	40	1	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2082	60	39	1	Nevyhnutný opravný termín po doučení.	2026-01-08 00:00:00
2083	60	38	1	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2084	60	37	2	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2085	60	36	1	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2086	60	35	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2087	60	34	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2088	60	33	4	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2089	60	32	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2090	60	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2091	61	10	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2092	61	9	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2093	61	8	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2094	61	7	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2095	61	6	3	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2096	61	5	2	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2097	61	4	2	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2098	61	3	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2099	61	2	4	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2100	61	1	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2101	62	20	5	Výborný výkon!	2026-01-31 00:00:00
2102	62	19	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2103	62	18	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2104	62	17	4	Výborný výkon!	2026-01-07 00:00:00
2105	62	16	5	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2106	62	15	2	Výborný výkon!	2026-01-12 00:00:00
2107	62	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2108	62	13	5	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2109	62	12	5	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
2110	62	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2111	63	30	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2112	63	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2113	63	28	4	Výborný výkon!	2026-01-09 00:00:00
2114	63	27	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2115	63	26	3	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2116	63	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2117	63	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2118	63	23	5	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2119	63	22	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2120	63	21	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2121	64	40	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2122	64	39	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2123	64	38	5	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2124	64	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2125	64	36	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2126	64	35	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2127	64	34	1	Výborný výkon!	2026-01-11 00:00:00
2128	64	33	5	Výborný výkon!	2026-01-28 00:00:00
2129	64	32	4	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2130	64	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2131	65	10	2	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
2132	65	9	2	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
2133	65	8	3	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2134	65	7	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
2135	65	6	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2136	65	5	2	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2137	65	4	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2138	65	3	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2139	65	2	2	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2140	65	1	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2141	66	20	1	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
2142	66	19	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2143	66	18	2	Výborný výkon!	2026-01-05 00:00:00
2144	66	17	1	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2145	66	16	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2146	66	15	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2147	66	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2148	66	13	3	Výborný výkon!	2026-02-01 00:00:00
2149	66	12	1	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2150	66	11	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2151	67	30	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2152	67	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2153	67	28	4	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2154	67	27	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2155	67	26	5	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2156	67	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2157	67	24	3	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2158	67	23	2	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2159	67	22	1	Výborný výkon!	2026-01-20 00:00:00
2160	67	21	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2161	68	40	4	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2162	68	39	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2163	68	38	4	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2164	68	37	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2165	68	36	2	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2166	68	35	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2167	68	34	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2168	68	33	2	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2169	68	32	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2170	68	31	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2171	69	10	3	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
2172	69	9	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2173	69	8	2	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2174	69	7	5	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2175	69	6	3	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2176	69	5	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2177	69	4	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2178	69	3	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2179	69	2	4	Výborný výkon!	2026-01-22 00:00:00
2180	69	1	5	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2181	70	20	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2182	70	19	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2183	70	18	4	Výborný výkon!	2026-01-05 00:00:00
2184	70	17	5	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2185	70	16	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2186	70	15	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2187	70	14	3	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2188	70	13	1	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2189	70	12	3	Výborný výkon!	2026-01-04 00:00:00
2190	70	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2191	71	30	3	Výborný výkon!	2026-01-18 00:00:00
2192	71	29	1	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2193	71	28	5	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2194	71	27	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2195	71	26	4	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2196	71	25	5	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2197	71	24	5	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2198	71	23	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2199	71	22	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2200	71	21	4	Výborný výkon!	2026-01-20 00:00:00
2201	72	40	3	Výborný výkon!	2026-01-21 00:00:00
2202	72	39	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2203	72	38	4	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2204	72	37	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2205	72	36	4	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2206	72	35	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2207	72	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2208	72	33	4	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2209	72	32	1	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2210	72	31	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2211	73	10	2	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
2212	73	9	1	Výborný výkon!	2026-01-18 00:00:00
2213	73	8	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2214	73	7	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
2215	73	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2216	73	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2217	73	4	5	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2218	73	3	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2219	73	2	5	Výborný výkon!	2026-01-22 00:00:00
2220	73	1	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2221	74	20	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2222	74	19	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2223	74	18	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2224	74	17	5	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2225	74	16	4	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2226	74	15	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2227	74	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2228	74	13	2	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2229	74	12	1	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2230	74	11	3	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2231	75	30	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2232	75	29	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2233	75	28	5	Nevyhnutný opravný termín po doučení.	2026-01-09 00:00:00
2234	75	27	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2235	75	26	1	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2236	75	25	2	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2237	75	24	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2238	75	23	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2239	75	22	2	Výborný výkon!	2026-01-20 00:00:00
2240	75	21	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2241	76	40	4	Výborný výkon!	2026-01-21 00:00:00
2242	76	39	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2243	76	38	1	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2244	76	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2245	76	36	2	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2246	76	35	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2247	76	34	2	Výborný výkon!	2026-01-11 00:00:00
2248	76	33	1	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2249	76	32	4	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2250	76	31	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2251	77	10	2	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
2252	77	9	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2253	77	8	4	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2254	77	7	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
2255	77	6	5	Výborný výkon!	2026-01-08 00:00:00
2256	77	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2257	77	4	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2258	77	3	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
2259	77	2	4	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2260	77	1	4	Výborný výkon!	2026-01-11 00:00:00
3003	91	13	1	Skúška	2026-02-10 18:34:28.365735
2261	78	20	1	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2262	78	19	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2263	78	18	1	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2264	78	17	1	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2265	78	16	5	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2266	78	15	3	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2267	78	14	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2268	78	13	5	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2269	78	12	2	Nevyhnutný opravný termín po doučení.	2026-01-04 00:00:00
2270	78	11	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2271	79	30	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2272	79	29	2	Výborný výkon!	2026-01-15 00:00:00
2273	79	28	4	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2274	79	27	4	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
2275	79	26	2	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2276	79	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2277	79	24	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2278	79	23	1	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2279	79	22	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2280	79	21	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2281	80	40	2	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
2282	80	39	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2283	80	38	4	Výborný výkon!	2026-01-23 00:00:00
2284	80	37	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2285	80	36	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2286	80	35	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2287	80	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2288	80	33	5	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2289	80	32	5	Výborný výkon!	2026-01-10 00:00:00
2290	80	31	3	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2291	81	10	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2292	81	9	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2293	81	8	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2294	81	7	2	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2295	81	6	1	Výborný výkon!	2026-01-08 00:00:00
2296	81	5	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2297	81	4	5	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2298	81	3	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2299	81	2	4	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2300	81	1	4	Výborný výkon!	2026-01-11 00:00:00
2301	82	20	1	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2302	82	19	1	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2303	82	18	5	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2304	82	17	5	Výborný výkon!	2026-01-07 00:00:00
2305	82	16	1	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2306	82	15	2	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2307	82	14	2	Výborný výkon!	2026-01-10 00:00:00
2308	82	13	2	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2309	82	12	1	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
2310	82	11	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2311	83	30	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2312	83	29	5	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2313	83	28	1	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2314	83	27	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2315	83	26	4	Výborný výkon!	2026-01-13 00:00:00
2316	83	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2317	83	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2318	83	23	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2319	83	22	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2320	83	21	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2321	84	40	5	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2322	84	39	1	Výborný výkon!	2026-01-08 00:00:00
2323	84	38	1	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2324	84	37	3	Výborný výkon!	2026-01-20 00:00:00
2325	84	36	5	Výborný výkon!	2026-01-26 00:00:00
2326	84	35	3	Výborný výkon!	2026-01-06 00:00:00
2327	84	34	5	Výborný výkon!	2026-01-11 00:00:00
2328	84	33	4	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2329	84	32	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2330	84	31	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2331	85	10	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2332	85	9	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2333	85	8	4	Nevyhnutný opravný termín po doučení.	2026-01-15 00:00:00
2334	85	7	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
2335	85	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2336	85	5	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2337	85	4	4	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2338	85	3	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
2339	85	2	3	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2340	85	1	2	Výborný výkon!	2026-01-11 00:00:00
2341	86	20	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2342	86	19	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2343	86	18	4	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2344	86	17	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2345	86	16	1	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2346	86	15	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2347	86	14	5	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2348	86	13	4	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2349	86	12	5	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
2350	86	11	1	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2351	87	30	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2352	87	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2353	87	28	4	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2354	87	27	3	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2355	87	26	5	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2356	87	25	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2357	87	24	3	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2358	87	23	2	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2359	87	22	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2360	87	21	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2361	88	40	2	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2362	88	39	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2363	88	38	4	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2364	88	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2365	88	36	4	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2366	88	35	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2367	88	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2368	88	33	5	Výborný výkon!	2026-01-28 00:00:00
2369	88	32	5	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2370	88	31	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2371	89	10	4	Výborný výkon!	2026-01-31 00:00:00
2372	89	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2373	89	8	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2374	89	7	2	Výborný výkon!	2026-01-07 00:00:00
2375	89	6	3	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2376	89	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2377	89	4	3	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2378	89	3	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
2379	89	2	4	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2380	89	1	5	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2381	90	20	4	Výborný výkon!	2026-01-31 00:00:00
2382	90	19	2	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2383	90	18	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2384	90	17	2	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2385	90	16	1	Výborný výkon!	2026-01-06 00:00:00
2386	90	15	4	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2387	90	14	3	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2388	90	13	4	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2389	90	12	5	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
2390	90	11	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2391	91	30	3	Výborný výkon!	2026-01-18 00:00:00
2392	91	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2393	91	28	3	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2394	91	27	1	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2395	91	26	4	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2396	91	25	3	Výborný výkon!	2026-01-27 00:00:00
2397	91	24	1	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2398	91	23	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2399	91	22	5	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2400	91	21	4	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2401	92	40	4	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2402	92	39	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2403	92	38	4	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2404	92	37	3	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2405	92	36	4	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2406	92	35	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2407	92	34	4	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2408	92	33	1	Výborný výkon!	2026-01-28 00:00:00
2409	92	32	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2410	92	31	3	Výborný výkon!	2026-01-27 00:00:00
2411	93	10	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2412	93	9	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2413	93	8	1	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2414	93	7	2	Výborný výkon!	2026-01-07 00:00:00
2415	93	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2416	93	5	3	Výborný výkon!	2026-01-06 00:00:00
2417	93	4	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2418	93	3	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2419	93	2	1	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2420	93	1	2	Výborný výkon!	2026-01-11 00:00:00
2421	94	20	2	Výborný výkon!	2026-01-31 00:00:00
2422	94	19	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2423	94	18	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2424	94	17	3	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2425	94	16	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2426	94	15	1	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2427	94	14	4	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2428	94	13	3	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2429	94	12	1	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2430	94	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2431	95	30	3	Výborný výkon!	2026-01-18 00:00:00
2432	95	29	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2433	95	28	3	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2434	95	27	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2435	95	26	2	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2436	95	25	2	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2437	95	24	5	Výborný výkon!	2026-01-05 00:00:00
2438	95	23	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2439	95	22	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2440	95	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2441	96	40	1	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2442	96	39	4	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2443	96	38	5	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2444	96	37	2	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2445	96	36	4	Výborný výkon!	2026-01-26 00:00:00
2446	96	35	5	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2447	96	34	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2448	96	33	4	Výborný výkon!	2026-01-28 00:00:00
2449	96	32	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2450	96	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2451	97	10	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2452	97	9	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2453	97	8	3	Výborný výkon!	2026-01-15 00:00:00
2454	97	7	1	Výborný výkon!	2026-01-07 00:00:00
2455	97	6	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2456	97	5	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2457	97	4	3	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2458	97	3	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2459	97	2	3	Výborný výkon!	2026-01-22 00:00:00
2460	97	1	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2461	98	20	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2462	98	19	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2463	98	18	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2464	98	17	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2465	98	16	5	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2466	98	15	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2467	98	14	2	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2468	98	13	2	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2469	98	12	5	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
2470	98	11	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2471	99	30	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2472	99	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2473	99	28	1	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2474	99	27	2	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2475	99	26	2	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2476	99	25	1	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2477	99	24	5	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2478	99	23	5	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2479	99	22	3	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2480	99	21	4	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2481	100	40	5	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2482	100	39	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2483	100	38	3	Výborný výkon!	2026-01-23 00:00:00
2484	100	37	2	Výborný výkon!	2026-01-20 00:00:00
2485	100	36	5	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2486	100	35	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2487	100	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2488	100	33	5	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
2489	100	32	5	Výborný výkon!	2026-01-10 00:00:00
2490	100	31	4	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2491	101	10	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2492	101	9	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2493	101	8	2	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2494	101	7	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-07 00:00:00
2495	101	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2496	101	5	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2497	101	4	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2498	101	3	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2499	101	2	4	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2500	101	1	1	Výborný výkon!	2026-01-11 00:00:00
2501	102	20	1	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2502	102	19	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2503	102	18	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2504	102	17	5	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2505	102	16	3	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2506	102	15	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2507	102	14	1	Výborný výkon!	2026-01-10 00:00:00
2508	102	13	1	Nevyhnutný opravný termín po doučení.	2026-02-01 00:00:00
2509	102	12	4	Výborný výkon!	2026-01-04 00:00:00
2510	102	11	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2511	103	30	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2512	103	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2513	103	28	1	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2514	103	27	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2515	103	26	3	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2516	103	25	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2517	103	24	1	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2518	103	23	1	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2519	103	22	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2520	103	21	4	Výborný výkon!	2026-01-20 00:00:00
2521	104	40	3	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2522	104	39	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2523	104	38	4	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2524	104	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2525	104	36	2	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2526	104	35	2	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2527	104	34	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2528	104	33	5	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2529	104	32	2	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2530	104	31	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2531	105	10	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2532	105	9	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2533	105	8	1	Nevyhnutný opravný termín po doučení.	2026-01-15 00:00:00
2534	105	7	5	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2535	105	6	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2536	105	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2537	105	4	2	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2538	105	3	2	Výborný výkon!	2026-01-31 00:00:00
2539	105	2	1	Nevyhnutný opravný termín po doučení.	2026-01-22 00:00:00
2540	105	1	2	Výborný výkon!	2026-01-11 00:00:00
2541	106	20	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2542	106	19	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2543	106	18	3	Výborný výkon!	2026-01-05 00:00:00
2544	106	17	5	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2545	106	16	4	Výborný výkon!	2026-01-06 00:00:00
2546	106	15	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2547	106	14	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2548	106	13	3	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2549	106	12	2	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2550	106	11	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2551	107	30	5	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
2552	107	29	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2553	107	28	1	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2554	107	27	5	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
2555	107	26	4	Nevyhnutný opravný termín po doučení.	2026-01-13 00:00:00
2556	107	25	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2557	107	24	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2558	107	23	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2559	107	22	3	Výborný výkon!	2026-01-20 00:00:00
2560	107	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2561	108	40	2	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2562	108	39	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2563	108	38	1	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2564	108	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2565	108	36	2	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2566	108	35	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2567	108	34	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2568	108	33	2	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
2569	108	32	2	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2570	108	31	1	Výborný výkon!	2026-01-27 00:00:00
2571	109	10	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2572	109	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2573	109	8	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2574	109	7	5	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2575	109	6	4	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2576	109	5	3	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2577	109	4	1	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2578	109	3	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2579	109	2	2	Nevyhnutný opravný termín po doučení.	2026-01-22 00:00:00
2580	109	1	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2581	110	20	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2582	110	19	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2583	110	18	4	Výborný výkon!	2026-01-05 00:00:00
2584	110	17	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2585	110	16	5	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2586	110	15	3	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2587	110	14	5	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2588	110	13	2	Výborný výkon!	2026-02-01 00:00:00
2589	110	12	2	Nevyhnutný opravný termín po doučení.	2026-01-04 00:00:00
2590	110	11	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2591	111	30	5	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2592	111	29	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2593	111	28	1	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2594	111	27	1	Výborný výkon!	2026-01-21 00:00:00
2595	111	26	3	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2596	111	25	2	Výborný výkon!	2026-01-27 00:00:00
2597	111	24	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2598	111	23	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2599	111	22	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2600	111	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2601	112	40	4	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
2602	112	39	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2603	112	38	2	Nevyhnutný opravný termín po doučení.	2026-01-23 00:00:00
2604	112	37	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2605	112	36	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2606	112	35	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2607	112	34	4	Výborný výkon!	2026-01-11 00:00:00
2608	112	33	5	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
2609	112	32	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2610	112	31	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2611	113	10	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2612	113	9	3	Výborný výkon!	2026-01-18 00:00:00
2613	113	8	1	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2614	113	7	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2615	113	6	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2616	113	5	2	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2617	113	4	1	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2618	113	3	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2619	113	2	3	Nevyhnutný opravný termín po doučení.	2026-01-22 00:00:00
2620	113	1	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2621	114	20	4	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2622	114	19	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2623	114	18	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2624	114	17	3	Výborný výkon!	2026-01-07 00:00:00
2625	114	16	5	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2626	114	15	4	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2627	114	14	4	Výborný výkon!	2026-01-10 00:00:00
2628	114	13	2	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2629	114	12	5	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
2630	114	11	4	Výborný výkon!	2026-01-05 00:00:00
2631	115	30	3	Výborný výkon!	2026-01-18 00:00:00
2632	115	29	1	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2633	115	28	5	Nevyhnutný opravný termín po doučení.	2026-01-09 00:00:00
2634	115	27	4	Výborný výkon!	2026-01-21 00:00:00
2635	115	26	5	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2636	115	25	2	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2637	115	24	2	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2638	115	23	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2639	115	22	5	Výborný výkon!	2026-01-20 00:00:00
2640	115	21	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2641	116	40	3	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2642	116	39	1	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2643	116	38	4	Výborný výkon!	2026-01-23 00:00:00
2644	116	37	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2645	116	36	5	Výborný výkon!	2026-01-26 00:00:00
2646	116	35	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2647	116	34	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2648	116	33	4	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2649	116	32	2	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2650	116	31	5	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2651	117	10	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2652	117	9	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2653	117	8	1	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2654	117	7	3	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2655	117	6	3	Výborný výkon!	2026-01-08 00:00:00
2656	117	5	2	Výborný výkon!	2026-01-06 00:00:00
2657	117	4	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2658	117	3	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2659	117	2	2	Výborný výkon!	2026-01-22 00:00:00
2660	117	1	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2661	118	20	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2662	118	19	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2663	118	18	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2664	118	17	3	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2665	118	16	3	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2666	118	15	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2667	118	14	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2668	118	13	2	Výborný výkon!	2026-02-01 00:00:00
2669	118	12	2	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2670	118	11	1	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2671	119	30	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2672	119	29	5	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2673	119	28	5	Výborný výkon!	2026-01-09 00:00:00
2674	119	27	4	Nevyhnutný opravný termín po doučení.	2026-01-21 00:00:00
2675	119	26	3	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2676	119	25	5	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2677	119	24	3	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2678	119	23	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2679	119	22	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2680	119	21	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2681	120	40	4	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2682	120	39	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2683	120	38	5	Nevyhnutný opravný termín po doučení.	2026-01-23 00:00:00
2684	120	37	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2685	120	36	5	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2686	120	35	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2687	120	34	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2688	120	33	3	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2689	120	32	2	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2690	120	31	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2691	121	10	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2692	121	9	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2693	121	8	4	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2694	121	7	4	Výborný výkon!	2026-01-07 00:00:00
2695	121	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2696	121	5	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2697	121	4	4	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2698	121	3	4	Výborný výkon!	2026-01-31 00:00:00
2699	121	2	4	Výborný výkon!	2026-01-22 00:00:00
2700	121	1	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2701	122	20	5	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2702	122	19	3	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2703	122	18	3	Výborný výkon!	2026-01-05 00:00:00
2704	122	17	3	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2705	122	16	3	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2706	122	15	1	Výborný výkon!	2026-01-12 00:00:00
2707	122	14	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2708	122	13	2	Výborný výkon!	2026-02-01 00:00:00
2709	122	12	1	Vynikajúce zvládnutie náročného učiva.	2026-01-04 00:00:00
2710	122	11	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2711	123	30	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2712	123	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2713	123	28	1	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2714	123	27	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2715	123	26	3	Výborný výkon!	2026-01-13 00:00:00
2716	123	25	2	Výborný výkon!	2026-01-27 00:00:00
2717	123	24	1	Výborný výkon!	2026-01-05 00:00:00
2718	123	23	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2719	123	22	3	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2720	123	21	4	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2721	124	40	2	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2722	124	39	3	Nevyhnutný opravný termín po doučení.	2026-01-08 00:00:00
2723	124	38	3	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2724	124	37	4	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2725	124	36	5	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2726	124	35	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2727	124	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2728	124	33	3	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2729	124	32	2	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2730	124	31	1	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2731	125	10	3	Výborný výkon!	2026-01-31 00:00:00
2732	125	9	1	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
2733	125	8	2	Výborný výkon!	2026-01-15 00:00:00
2734	125	7	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2735	125	6	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2736	125	5	5	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2737	125	4	4	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2738	125	3	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2739	125	2	5	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2740	125	1	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2741	126	20	5	Výborný výkon!	2026-01-31 00:00:00
2742	126	19	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2743	126	18	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2744	126	17	1	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2745	126	16	3	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2746	126	15	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2747	126	14	2	Výborný výkon!	2026-01-10 00:00:00
2748	126	13	5	Výborný výkon!	2026-02-01 00:00:00
2749	126	12	2	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2750	126	11	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2751	127	30	1	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
2752	127	29	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2753	127	28	5	Nevyhnutný opravný termín po doučení.	2026-01-09 00:00:00
2754	127	27	1	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2755	127	26	4	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2756	127	25	3	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2757	127	24	2	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2758	127	23	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2759	127	22	5	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2760	127	21	1	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2761	128	40	1	Výborný výkon!	2026-01-21 00:00:00
2762	128	39	4	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2763	128	38	2	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2764	128	37	3	Výborný výkon!	2026-01-20 00:00:00
2765	128	36	5	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2766	128	35	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2767	128	34	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2768	128	33	1	Nevyhnutný opravný termín po doučení.	2026-01-28 00:00:00
2769	128	32	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2770	128	31	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2771	129	10	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2772	129	9	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2773	129	8	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2774	129	7	5	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2775	129	6	3	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2776	129	5	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2777	129	4	1	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2778	129	3	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
2779	129	2	2	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2780	129	1	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2781	130	20	2	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2782	130	19	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2783	130	18	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2784	130	17	5	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2785	130	16	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2786	130	15	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2787	130	14	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2788	130	13	3	Nevyhnutný opravný termín po doučení.	2026-02-01 00:00:00
2789	130	12	5	Nevyhnutný opravný termín po doučení.	2026-01-04 00:00:00
2790	130	11	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2791	131	30	3	Výborný výkon!	2026-01-18 00:00:00
2792	131	29	2	Výborný výkon!	2026-01-15 00:00:00
2793	131	28	5	Štandardný výsledok z daného typu testu.	2026-01-09 00:00:00
2794	131	27	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2795	131	26	4	Výborný výkon!	2026-01-13 00:00:00
2796	131	25	4	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2797	131	24	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2798	131	23	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2799	131	22	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2800	131	21	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2801	132	40	2	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2802	132	39	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2803	132	38	1	Výborný výkon!	2026-01-23 00:00:00
2804	132	37	2	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2805	132	36	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2806	132	35	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2807	132	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2808	132	33	1	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2809	132	32	2	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2810	132	31	4	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2811	133	10	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2812	133	9	1	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2813	133	8	1	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2814	133	7	2	Výborný výkon!	2026-01-07 00:00:00
2815	133	6	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2816	133	5	1	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2817	133	4	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2818	133	3	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2819	133	2	3	Výborný výkon!	2026-01-22 00:00:00
2820	133	1	5	Výborný výkon!	2026-01-11 00:00:00
2821	134	20	2	Vynikajúce zvládnutie náročného učiva.	2026-01-31 00:00:00
2822	134	19	1	Výborný výkon!	2026-01-11 00:00:00
2823	134	18	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2824	134	17	3	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2825	134	16	3	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2826	134	15	3	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2827	134	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2828	134	13	5	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2829	134	12	4	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2830	134	11	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2831	135	30	1	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2832	135	29	3	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2833	135	28	4	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2834	135	27	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2835	135	26	1	Nevyhnutný opravný termín po doučení.	2026-01-13 00:00:00
2836	135	25	2	Výborný výkon!	2026-01-27 00:00:00
2837	135	24	5	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2838	135	23	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2839	135	22	3	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2840	135	21	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2841	136	40	2	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2842	136	39	5	Nevyhnutný opravný termín po doučení.	2026-01-08 00:00:00
2843	136	38	1	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2844	136	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2845	136	36	4	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2846	136	35	1	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2847	136	34	2	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2848	136	33	2	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2849	136	32	5	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2850	136	31	3	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2851	137	10	1	Výborný výkon!	2026-01-31 00:00:00
2852	137	9	4	Výborný výkon!	2026-01-18 00:00:00
2853	137	8	2	Výborný výkon!	2026-01-15 00:00:00
2854	137	7	3	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2855	137	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2856	137	5	4	Výborný výkon!	2026-01-06 00:00:00
2857	137	4	2	Výborný výkon!	2026-01-10 00:00:00
2858	137	3	4	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
2859	137	2	5	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2860	137	1	4	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2861	138	20	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2862	138	19	1	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2863	138	18	3	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2864	138	17	4	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2865	138	16	3	Výborný výkon!	2026-01-06 00:00:00
2866	138	15	4	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2867	138	14	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2868	138	13	4	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2869	138	12	1	Nevyhnutný opravný termín po doučení.	2026-01-04 00:00:00
2870	138	11	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2871	139	30	2	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2872	139	29	5	Nevyhnutný opravný termín po doučení.	2026-01-15 00:00:00
2873	139	28	4	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2874	139	27	5	Štandardný výsledok z daného typu testu.	2026-01-21 00:00:00
2875	139	26	4	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2876	139	25	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2877	139	24	4	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2878	139	23	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2879	139	22	2	Výborný výkon!	2026-01-20 00:00:00
2880	139	21	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2881	140	40	1	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2882	140	39	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2883	140	38	2	Nevyhnutný opravný termín po doučení.	2026-01-23 00:00:00
2884	140	37	2	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
2885	140	36	3	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2886	140	35	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2887	140	34	3	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2888	140	33	1	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2889	140	32	1	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2890	140	31	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2891	141	10	4	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2892	141	9	4	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2893	141	8	2	Vynikajúce zvládnutie náročného učiva.	2026-01-15 00:00:00
2894	141	7	2	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2895	141	6	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2896	141	5	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2897	141	4	5	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2898	141	3	5	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2899	141	2	3	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2900	141	1	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2901	142	20	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2902	142	19	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2903	142	18	2	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2904	142	17	1	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2905	142	16	5	Nevyhnutný opravný termín po doučení.	2026-01-06 00:00:00
2906	142	15	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-12 00:00:00
2907	142	14	2	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2908	142	13	4	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2909	142	12	1	Výborný výkon!	2026-01-04 00:00:00
2910	142	11	4	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2911	143	30	3	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2912	143	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2913	143	28	5	Výborný výkon!	2026-01-09 00:00:00
2914	143	27	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2915	143	26	1	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2916	143	25	2	Nevyhnutný opravný termín po doučení.	2026-01-27 00:00:00
2917	143	24	3	Vynikajúce zvládnutie náročného učiva.	2026-01-05 00:00:00
2918	143	23	4	Treba si lepšie zopakovať poslednú hodinu.	2026-01-26 00:00:00
2919	143	22	2	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2920	143	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2921	144	40	1	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2922	144	39	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2923	144	38	4	Nevyhnutný opravný termín po doučení.	2026-01-23 00:00:00
2924	144	37	5	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2925	144	36	3	Nevyhnutný opravný termín po doučení.	2026-01-26 00:00:00
2926	144	35	2	Treba si lepšie zopakovať poslednú hodinu.	2026-01-06 00:00:00
2927	144	34	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2928	144	33	1	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2929	144	32	3	Štandardný výsledok z daného typu testu.	2026-01-10 00:00:00
2930	144	31	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2931	145	10	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2932	145	9	2	Nevyhnutný opravný termín po doučení.	2026-01-18 00:00:00
2933	145	8	4	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2934	145	7	1	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2935	145	6	5	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2936	145	5	3	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2937	145	4	1	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2938	145	3	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-31 00:00:00
2939	145	2	2	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2940	145	1	1	Nevyhnutný opravný termín po doučení.	2026-01-11 00:00:00
2941	146	20	1	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2942	146	19	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-11 00:00:00
2943	146	18	5	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2944	146	17	2	Výborný výkon!	2026-01-07 00:00:00
2945	146	16	1	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2946	146	15	1	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2947	146	14	1	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2948	146	13	3	Výborný výkon!	2026-02-01 00:00:00
2949	146	12	5	Nevyhnutný opravný termín po doučení.	2026-01-04 00:00:00
2950	146	11	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2951	147	30	2	Výborný výkon!	2026-01-18 00:00:00
2952	147	29	2	Štandardný výsledok z daného typu testu.	2026-01-15 00:00:00
2953	147	28	1	Vynikajúce zvládnutie náročného učiva.	2026-01-09 00:00:00
2954	147	27	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2955	147	26	2	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2956	147	25	5	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2957	147	24	4	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2958	147	23	4	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2959	147	22	3	Výborný výkon!	2026-01-20 00:00:00
2960	147	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2961	148	40	1	Vynikajúce zvládnutie náročného učiva.	2026-01-21 00:00:00
2962	148	39	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-08 00:00:00
2963	148	38	2	Štandardný výsledok z daného typu testu.	2026-01-23 00:00:00
2964	148	37	1	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
2965	148	36	1	Vynikajúce zvládnutie náročného učiva.	2026-01-26 00:00:00
2966	148	35	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2967	148	34	3	Výborný výkon!	2026-01-11 00:00:00
2968	148	33	2	Štandardný výsledok z daného typu testu.	2026-01-28 00:00:00
2969	148	32	2	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2970	148	31	1	Treba si lepšie zopakovať poslednú hodinu.	2026-01-27 00:00:00
2971	149	10	3	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2972	149	9	1	Štandardný výsledok z daného typu testu.	2026-01-18 00:00:00
2973	149	8	3	Nevyhnutný opravný termín po doučení.	2026-01-15 00:00:00
2974	149	7	5	Nevyhnutný opravný termín po doučení.	2026-01-07 00:00:00
2975	149	6	2	Štandardný výsledok z daného typu testu.	2026-01-08 00:00:00
2976	149	5	4	Štandardný výsledok z daného typu testu.	2026-01-06 00:00:00
2977	149	4	3	Vynikajúce zvládnutie náročného učiva.	2026-01-10 00:00:00
2978	149	3	2	Štandardný výsledok z daného typu testu.	2026-01-31 00:00:00
2979	149	2	1	Štandardný výsledok z daného typu testu.	2026-01-22 00:00:00
2980	149	1	5	Štandardný výsledok z daného typu testu.	2026-01-11 00:00:00
2981	150	20	2	Nevyhnutný opravný termín po doučení.	2026-01-31 00:00:00
2982	150	19	3	Výborný výkon!	2026-01-11 00:00:00
2983	150	18	4	Nevyhnutný opravný termín po doučení.	2026-01-05 00:00:00
2984	150	17	2	Štandardný výsledok z daného typu testu.	2026-01-07 00:00:00
2985	150	16	4	Vynikajúce zvládnutie náročného učiva.	2026-01-06 00:00:00
2986	150	15	4	Štandardný výsledok z daného typu testu.	2026-01-12 00:00:00
2987	150	14	2	Nevyhnutný opravný termín po doučení.	2026-01-10 00:00:00
2988	150	13	2	Štandardný výsledok z daného typu testu.	2026-02-01 00:00:00
2989	150	12	5	Štandardný výsledok z daného typu testu.	2026-01-04 00:00:00
2990	150	11	3	Treba si lepšie zopakovať poslednú hodinu.	2026-01-05 00:00:00
2991	151	30	4	Výborný výkon!	2026-01-18 00:00:00
2992	151	29	5	Výborný výkon!	2026-01-15 00:00:00
2993	151	28	2	Nevyhnutný opravný termín po doučení.	2026-01-09 00:00:00
2994	151	27	5	Treba si lepšie zopakovať poslednú hodinu.	2026-01-21 00:00:00
2995	151	26	3	Štandardný výsledok z daného typu testu.	2026-01-13 00:00:00
2996	151	25	3	Štandardný výsledok z daného typu testu.	2026-01-27 00:00:00
2997	151	24	1	Štandardný výsledok z daného typu testu.	2026-01-05 00:00:00
2998	151	23	3	Štandardný výsledok z daného typu testu.	2026-01-26 00:00:00
2999	151	22	4	Nevyhnutný opravný termín po doučení.	2026-01-20 00:00:00
3000	151	21	4	Štandardný výsledok z daného typu testu.	2026-01-20 00:00:00
\.


--
-- TOC entry 5141 (class 0 OID 16976)
-- Dependencies: 222
-- Data for Name: job_positions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_positions (id, position_name) FROM stdin;
1	Riaditeľ
2	Učiteľ
3	Školník
4	Upratovačka
5	Kuchárka
6	Administratíva
\.


--
-- TOC entry 5147 (class 0 OID 17005)
-- Dependencies: 228
-- Data for Name: lesson_slots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lesson_slots (id, slot_number, start_time, end_time) FROM stdin;
1	1	08:00:00	08:45:00
2	2	08:55:00	09:40:00
3	3	10:00:00	10:45:00
4	4	10:55:00	11:40:00
5	5	11:50:00	12:35:00
6	6	12:45:00	13:30:00
7	7	13:40:00	14:25:00
8	8	14:30:00	15:15:00
\.


--
-- TOC entry 5145 (class 0 OID 16996)
-- Dependencies: 226
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rooms (id, name, capacity) FROM stdin;
1	Ucebna 101	30
2	Ucebna 102	30
3	Ucebna 103	30
4	Ucebna 201	30
5	Ucebna 202	30
6	Ucebna 203	30
7	Ucebna 301	30
8	Ucebna 302	30
9	Lab. Chemie	25
10	Lab. Fyziky	25
11	Lab. Biologie	25
12	PC Ucebna 1	25
13	PC Ucebna 2	25
14	Telocvicna Velka	60
15	Telocvicna Mala	25
16	Improv. Učebňa	100
17	Ucebna INF	15
\.


--
-- TOC entry 5153 (class 0 OID 17052)
-- Dependencies: 234
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, user_id, class_id, first_name, last_name, birth_date, address, phone_number, parent_phone, parent_email, isic_card_number, health_issues, gender, parent_first_name, parent_last_name, parent_relation, email) FROM stdin;
2	47	2	Andrej	Krajčír	2006-05-22	Ulica Krajčír 1	+421 998917762	+421 994969222	tomáš.baláž@gmail.com	ISIC900001	Bez obmedzení	M	Tomáš	Baláž	Otec	andrej.krajčír1@student.skola.sk
3	48	3	Lucia	Saboová	2006-06-05	Ulica Saboová 2	+421 977531670	+421 911591754	andrej.hruška@gmail.com	ISIC900002	Bez obmedzení	Z	Andrej	Hruška	Otec	lucia.saboová2@student.skola.sk
4	49	4	Martin	Varga	2008-10-29	Ulica Varga 3	+421 913138297	+421 948721870	andrej.šťastný@gmail.com	ISIC900003	Bez obmedzení	M	Andrej	Šťastný	Otec	martin.varga3@student.skola.sk
5	50	1	Peter	Múdry	2009-08-21	Ulica Múdry 4	+421 967655359	+421 941181331	matej.múdry@gmail.com	ISIC900004	Bez obmedzení	M	Matej	Múdry	Otec	peter.múdry4@student.skola.sk
6	51	2	Filip	Molnár	2008-09-04	Ulica Molnár 5	+421 995510997	+421 921222433	marek.hruška@gmail.com	ISIC900005	Bez obmedzení	M	Marek	Hruška	Otec	filip.molnár5@student.skola.sk
7	52	3	Alena	Múdryová	2009-11-14	Ulica Múdryová 6	+421 936913471	+421 928010050	matej.baláž@gmail.com	ISIC900006	Bez obmedzení	Z	Matej	Baláž	Otec	alena.múdryová6@student.skola.sk
8	53	4	Andrej	Baláž	2009-04-30	Ulica Baláž 7	+421 968131732	+421 914650920	adam.múdry@gmail.com	ISIC900007	Bez obmedzení	M	Adam	Múdry	Otec	andrej.baláž7@student.skola.sk
9	54	1	Lucia	Kováčová	2008-09-03	Ulica Kováčová 8	+421 964549525	+421 957975911	peter.krajčír@gmail.com	ISIC900008	Bez obmedzení	Z	Peter	Krajčír	Otec	lucia.kováčová8@student.skola.sk
10	55	2	Mária	Molnárová	2009-04-03	Ulica Molnárová 9	+421 912080445	+421 983949292	simona.horváthová@gmail.com	ISIC900009	Bez obmedzení	Z	Simona	Horváthová	Matka	mária.molnárová9@student.skola.sk
11	56	3	Jana	Múdryová	2007-06-06	Ulica Múdryová 10	+421 977945119	+421 929327500	matej.nagy@gmail.com	ISIC900010	Bez obmedzení	Z	Matej	Nagy	Otec	jana.múdryová10@student.skola.sk
12	57	4	Barbora	Saboová	2006-01-01	Ulica Saboová 11	+421 985472843	+421 920942882	katarína.šťastnýová@gmail.com	ISIC900011	Bez obmedzení	Z	Katarína	Šťastnýová	Matka	barbora.saboová11@student.skola.sk
13	58	1	Filip	Horváth	2006-09-26	Ulica Horváth 12	+421 925951462	+421 978005739	michal.krajčír@gmail.com	ISIC900012	Bez obmedzení	M	Michal	Krajčír	Otec	filip.horváth12@student.skola.sk
14	59	2	Zuzana	Kováčová	2008-01-30	Ulica Kováčová 13	+421 973515317	+421 929736508	alena.balážová@gmail.com	ISIC900013	Bez obmedzení	Z	Alena	Balážová	Matka	zuzana.kováčová13@student.skola.sk
15	60	3	Lukáš	Molnár	2007-01-26	Ulica Molnár 14	+421 976545989	+421 935639152	lenka.horváthová@gmail.com	ISIC900014	Bez obmedzení	M	Lenka	Horváthová	Matka	lukáš.molnár14@student.skola.sk
16	61	4	Lenka	Múdryová	2008-11-22	Ulica Múdryová 15	+421 990009832	+421 922498838	ema.kováčová@gmail.com	ISIC900015	Bez obmedzení	Z	Ema	Kováčová	Matka	lenka.múdryová15@student.skola.sk
17	62	1	Ema	Krajčírová	2006-07-02	Ulica Krajčírová 16	+421 921135452	+421 932240079	michal.krajčír@gmail.com	ISIC900016	Bez obmedzení	Z	Michal	Krajčír	Otec	ema.krajčírová16@student.skola.sk
18	63	2	Patrik	Kováč	2008-12-20	Ulica Kováč 17	+421 967653580	+421 918416636	katarína.molnárová@gmail.com	ISIC900017	Bez obmedzení	M	Katarína	Molnárová	Matka	patrik.kováč17@student.skola.sk
19	64	3	Zuzana	Horváthová	2008-03-13	Ulica Horváthová 18	+421 980558204	+421 920174504	lukáš.sabo@gmail.com	ISIC900018	Bez obmedzení	Z	Lukáš	Sabo	Otec	zuzana.horváthová18@student.skola.sk
20	65	4	Alena	Saboová	2006-04-06	Ulica Saboová 19	+421 933479747	+421 933848495	katarína.saboová@gmail.com	ISIC900019	Bez obmedzení	Z	Katarína	Saboová	Matka	alena.saboová19@student.skola.sk
21	66	1	Adam	Kováč	2007-08-01	Ulica Kováč 20	+421 962726914	+421 967919453	ema.šťastnýová@gmail.com	ISIC900020	Alergia na orechy	M	Ema	Šťastnýová	Matka	adam.kováč20@student.skola.sk
22	67	2	Lukáš	Molnár	2006-08-23	Ulica Molnár 21	+421 975902905	+421 915993139	simona.nagyová@gmail.com	ISIC900021	Bez obmedzení	M	Simona	Nagyová	Matka	lukáš.molnár21@student.skola.sk
23	68	3	Zuzana	Nagyová	2009-08-10	Ulica Nagyová 22	+421 923609084	+421 958529328	simona.kováčová@gmail.com	ISIC900022	Bez obmedzení	Z	Simona	Kováčová	Matka	zuzana.nagyová22@student.skola.sk
24	69	4	Simona	Múdryová	2006-09-21	Ulica Múdryová 23	+421 932319895	+421 983695375	jakub.varga@gmail.com	ISIC900023	Bez obmedzení	Z	Jakub	Varga	Otec	simona.múdryová23@student.skola.sk
25	70	1	Ema	Múdryová	2008-11-22	Ulica Múdryová 24	+421 982981669	+421 974283902	martin.múdry@gmail.com	ISIC900024	Bez obmedzení	Z	Martin	Múdry	Otec	ema.múdryová24@student.skola.sk
26	71	2	Peter	Baláž	2006-06-29	Ulica Baláž 25	+421 997679970	+421 985549605	lucia.molnárová@gmail.com	ISIC900025	Bez obmedzení	M	Lucia	Molnárová	Matka	peter.baláž25@student.skola.sk
27	72	3	Filip	Múdry	2009-11-09	Ulica Múdry 26	+421 928418752	+421 927047813	filip.horváth@gmail.com	ISIC900026	Bez obmedzení	M	Filip	Horváth	Otec	filip.múdry26@student.skola.sk
28	73	4	Andrej	Tóth	2006-03-23	Ulica Tóth 27	+421 953656251	+421 979350338	barbora.nagyová@gmail.com	ISIC900027	Bez obmedzení	M	Barbora	Nagyová	Matka	andrej.tóth27@student.skola.sk
29	74	1	Mária	Horváthová	2008-02-01	Ulica Horváthová 28	+421 948161942	+421 995610924	katarína.molnárová@gmail.com	ISIC900028	Bez obmedzení	Z	Katarína	Molnárová	Matka	mária.horváthová28@student.skola.sk
30	75	2	Matej	Kováč	2006-09-09	Ulica Kováč 29	+421 992341480	+421 952315928	marek.kováč@gmail.com	ISIC900029	Bez obmedzení	M	Marek	Kováč	Otec	matej.kováč29@student.skola.sk
31	76	3	Simona	Šťastnýová	2008-11-24	Ulica Šťastnýová 30	+421 937482161	+421 941005414	jakub.krajčír@gmail.com	ISIC900030	Bez obmedzení	Z	Jakub	Krajčír	Otec	simona.šťastnýová30@student.skola.sk
32	77	4	Sofia	Molnárová	2008-10-19	Ulica Molnárová 31	+421 987634276	+421 963461325	adam.sabo@gmail.com	ISIC900031	Bez obmedzení	Z	Adam	Sabo	Otec	sofia.molnárová31@student.skola.sk
33	78	1	Patrik	Šťastný	2009-07-14	Ulica Šťastný 32	+421 925870077	+421 919612435	lucia.horváthová@gmail.com	ISIC900032	Bez obmedzení	M	Lucia	Horváthová	Matka	patrik.šťastný32@student.skola.sk
34	79	2	Sofia	Saboová	2007-02-07	Ulica Saboová 33	+421 915689777	+421 923432859	jakub.baláž@gmail.com	ISIC900033	Bez obmedzení	Z	Jakub	Baláž	Otec	sofia.saboová33@student.skola.sk
35	80	3	Filip	Sabo	2009-10-11	Ulica Sabo 34	+421 991522357	+421 925634685	peter.šťastný@gmail.com	ISIC900034	Bez obmedzení	M	Peter	Šťastný	Otec	filip.sabo34@student.skola.sk
36	81	4	Filip	Nagy	2008-06-23	Ulica Nagy 35	+421 943757723	+421 971009444	michal.hruška@gmail.com	ISIC900035	Bez obmedzení	M	Michal	Hruška	Otec	filip.nagy35@student.skola.sk
37	82	1	Mária	Nagyová	2006-09-18	Ulica Nagyová 36	+421 966833833	+421 987277653	tomáš.molnár@gmail.com	ISIC900036	Bez obmedzení	Z	Tomáš	Molnár	Otec	mária.nagyová36@student.skola.sk
38	83	2	Matej	Kováč	2009-11-12	Ulica Kováč 37	+421 920787699	+421 981306986	adam.krajčír@gmail.com	ISIC900037	Bez obmedzení	M	Adam	Krajčír	Otec	matej.kováč37@student.skola.sk
39	84	3	Lenka	Kováčová	2009-03-28	Ulica Kováčová 38	+421 960082608	+421 968613461	zuzana.múdryová@gmail.com	ISIC900038	Bez obmedzení	Z	Zuzana	Múdryová	Matka	lenka.kováčová38@student.skola.sk
40	85	4	Katarína	Nagyová	2008-11-18	Ulica Nagyová 39	+421 922054654	+421 949228282	lucia.saboová@gmail.com	ISIC900039	Bez obmedzení	Z	Lucia	Saboová	Matka	katarína.nagyová39@student.skola.sk
41	86	1	Ema	Kováčová	2006-09-03	Ulica Kováčová 40	+421 970257325	+421 968329637	barbora.kováčová@gmail.com	ISIC900040	Alergia na orechy	Z	Barbora	Kováčová	Matka	ema.kováčová40@student.skola.sk
42	87	2	Peter	Baláž	2008-05-02	Ulica Baláž 41	+421 980766997	+421 928906764	jakub.baláž@gmail.com	ISIC900041	Bez obmedzení	M	Jakub	Baláž	Otec	peter.baláž41@student.skola.sk
43	88	3	Adam	Nagy	2009-01-29	Ulica Nagy 42	+421 917627744	+421 942552701	monika.balážová@gmail.com	ISIC900042	Bez obmedzení	M	Monika	Balážová	Matka	adam.nagy42@student.skola.sk
44	89	4	Mária	Saboová	2007-08-17	Ulica Saboová 43	+421 949923436	+421 988553066	barbora.hruškaová@gmail.com	ISIC900043	Bez obmedzení	Z	Barbora	Hruškaová	Matka	mária.saboová43@student.skola.sk
45	90	1	Lucia	Saboová	2008-01-02	Ulica Saboová 44	+421 944353412	+421 998942100	zuzana.nagyová@gmail.com	ISIC900044	Bez obmedzení	Z	Zuzana	Nagyová	Matka	lucia.saboová44@student.skola.sk
46	91	2	Marek	Hruška	2009-03-21	Ulica Hruška 45	+421 990331717	+421 929440029	lenka.balážová@gmail.com	ISIC900045	Bez obmedzení	M	Lenka	Balážová	Matka	marek.hruška45@student.skola.sk
47	92	3	Andrej	Šťastný	2006-08-08	Ulica Šťastný 46	+421 962253889	+421 978981615	peter.baláž@gmail.com	ISIC900046	Bez obmedzení	M	Peter	Baláž	Otec	andrej.šťastný46@student.skola.sk
48	93	4	Lucia	Múdryová	2009-06-18	Ulica Múdryová 47	+421 954504259	+421 921564769	jakub.múdry@gmail.com	ISIC900047	Bez obmedzení	Z	Jakub	Múdry	Otec	lucia.múdryová47@student.skola.sk
49	94	1	Barbora	Molnárová	2007-02-18	Ulica Molnárová 48	+421 948459104	+421 979840440	alena.balážová@gmail.com	ISIC900048	Bez obmedzení	Z	Alena	Balážová	Matka	barbora.molnárová48@student.skola.sk
50	95	2	Tomáš	Molnár	2006-11-27	Ulica Molnár 49	+421 912553254	+421 993907322	alena.molnárová@gmail.com	ISIC900049	Bez obmedzení	M	Alena	Molnárová	Matka	tomáš.molnár49@student.skola.sk
51	96	3	Tomáš	Sabo	2006-04-26	Ulica Sabo 50	+421 974896531	+421 961990631	monika.balážová@gmail.com	ISIC900050	Bez obmedzení	M	Monika	Balážová	Matka	tomáš.sabo50@student.skola.sk
52	97	4	Peter	Kováč	2009-11-21	Ulica Kováč 51	+421 994774798	+421 917566419	michal.krajčír@gmail.com	ISIC900051	Bez obmedzení	M	Michal	Krajčír	Otec	peter.kováč51@student.skola.sk
53	98	1	Zuzana	Nagyová	2006-03-22	Ulica Nagyová 52	+421 919464691	+421 994738635	jakub.nagy@gmail.com	ISIC900052	Bez obmedzení	Z	Jakub	Nagy	Otec	zuzana.nagyová52@student.skola.sk
54	99	2	Barbora	Nagyová	2009-10-03	Ulica Nagyová 53	+421 993300445	+421 937403685	simona.krajčírová@gmail.com	ISIC900053	Bez obmedzení	Z	Simona	Krajčírová	Matka	barbora.nagyová53@student.skola.sk
55	100	3	Patrik	Nagy	2006-08-05	Ulica Nagy 54	+421 929315422	+421 996453495	zuzana.krajčírová@gmail.com	ISIC900054	Bez obmedzení	M	Zuzana	Krajčírová	Matka	patrik.nagy54@student.skola.sk
56	101	4	Tomáš	Nagy	2008-04-25	Ulica Nagy 55	+421 960394111	+421 965277156	tomáš.múdry@gmail.com	ISIC900055	Bez obmedzení	M	Tomáš	Múdry	Otec	tomáš.nagy55@student.skola.sk
57	102	1	Alena	Balážová	2007-05-06	Ulica Balážová 56	+421 964187855	+421 968471029	barbora.múdryová@gmail.com	ISIC900056	Bez obmedzení	Z	Barbora	Múdryová	Matka	alena.balážová56@student.skola.sk
58	103	2	Patrik	Šťastný	2009-12-26	Ulica Šťastný 57	+421 938800415	+421 936255028	sofia.tóthová@gmail.com	ISIC900057	Bez obmedzení	M	Sofia	Tóthová	Matka	patrik.šťastný57@student.skola.sk
59	104	3	Monika	Nagyová	2006-04-10	Ulica Nagyová 58	+421 992933750	+421 967733393	mária.šťastnýová@gmail.com	ISIC900058	Bez obmedzení	Z	Mária	Šťastnýová	Matka	monika.nagyová58@student.skola.sk
60	105	4	Patrik	Horváth	2006-10-19	Ulica Horváth 59	+421 929628647	+421 976581309	jana.krajčírová@gmail.com	ISIC900059	Bez obmedzení	M	Jana	Krajčírová	Matka	patrik.horváth59@student.skola.sk
61	106	1	Jakub	Nagy	2007-06-23	Ulica Nagy 60	+421 978732433	+421 969393191	monika.krajčírová@gmail.com	ISIC900060	Alergia na orechy	M	Monika	Krajčírová	Matka	jakub.nagy60@student.skola.sk
62	107	2	Tomáš	Krajčír	2007-03-22	Ulica Krajčír 61	+421 991241296	+421 950292347	marek.kováč@gmail.com	ISIC900061	Bez obmedzení	M	Marek	Kováč	Otec	tomáš.krajčír61@student.skola.sk
63	108	3	Matej	Šťastný	2006-09-27	Ulica Šťastný 62	+421 976763741	+421 937346167	matej.múdry@gmail.com	ISIC900062	Bez obmedzení	M	Matej	Múdry	Otec	matej.šťastný62@student.skola.sk
64	109	4	Ema	Vargaová	2007-08-28	Ulica Vargaová 63	+421 917592568	+421 913492956	sofia.kováčová@gmail.com	ISIC900063	Bez obmedzení	Z	Sofia	Kováčová	Matka	ema.vargaová63@student.skola.sk
65	110	1	Martin	Tóth	2006-08-30	Ulica Tóth 64	+421 978400127	+421 931213481	lenka.nagyová@gmail.com	ISIC900064	Bez obmedzení	M	Lenka	Nagyová	Matka	martin.tóth64@student.skola.sk
66	111	2	Adam	Múdry	2006-02-04	Ulica Múdry 65	+421 938446760	+421 999282590	katarína.hruškaová@gmail.com	ISIC900065	Bez obmedzení	M	Katarína	Hruškaová	Matka	adam.múdry65@student.skola.sk
67	112	3	Matej	Šťastný	2009-08-10	Ulica Šťastný 66	+421 926921483	+421 937866627	jana.tóthová@gmail.com	ISIC900066	Bez obmedzení	M	Jana	Tóthová	Matka	matej.šťastný66@student.skola.sk
68	113	4	Jakub	Molnár	2007-05-29	Ulica Molnár 67	+421 948380018	+421 960233384	lukáš.múdry@gmail.com	ISIC900067	Bez obmedzení	M	Lukáš	Múdry	Otec	jakub.molnár67@student.skola.sk
69	114	1	Katarína	Nagyová	2006-11-27	Ulica Nagyová 68	+421 992221709	+421 995179628	martin.nagy@gmail.com	ISIC900068	Bez obmedzení	Z	Martin	Nagy	Otec	katarína.nagyová68@student.skola.sk
70	115	2	Barbora	Šťastnýová	2006-12-23	Ulica Šťastnýová 69	+421 975241962	+421 988138263	barbora.šťastnýová@gmail.com	ISIC900069	Bez obmedzení	Z	Barbora	Šťastnýová	Matka	barbora.šťastnýová69@student.skola.sk
71	116	3	Michal	Varga	2006-10-12	Ulica Varga 70	+421 910310661	+421 947054386	zuzana.šťastnýová@gmail.com	ISIC900070	Bez obmedzení	M	Zuzana	Šťastnýová	Matka	michal.varga70@student.skola.sk
72	117	4	Martin	Šťastný	2008-02-15	Ulica Šťastný 71	+421 922431177	+421 917943535	lenka.molnárová@gmail.com	ISIC900071	Bez obmedzení	M	Lenka	Molnárová	Matka	martin.šťastný71@student.skola.sk
73	118	1	Matej	Molnár	2008-07-30	Ulica Molnár 72	+421 913009726	+421 997691840	andrej.kováč@gmail.com	ISIC900072	Bez obmedzení	M	Andrej	Kováč	Otec	matej.molnár72@student.skola.sk
74	119	2	Sofia	Saboová	2007-10-03	Ulica Saboová 73	+421 993587432	+421 991826399	lenka.saboová@gmail.com	ISIC900073	Bez obmedzení	Z	Lenka	Saboová	Matka	sofia.saboová73@student.skola.sk
75	120	3	Martin	Múdry	2009-09-22	Ulica Múdry 74	+421 939524881	+421 985946991	monika.šťastnýová@gmail.com	ISIC900074	Bez obmedzení	M	Monika	Šťastnýová	Matka	martin.múdry74@student.skola.sk
76	121	4	Andrej	Varga	2006-10-10	Ulica Varga 75	+421 991919346	+421 985748120	barbora.saboová@gmail.com	ISIC900075	Bez obmedzení	M	Barbora	Saboová	Matka	andrej.varga75@student.skola.sk
77	122	1	Peter	Tóth	2007-11-08	Ulica Tóth 76	+421 952426803	+421 937741763	simona.šťastnýová@gmail.com	ISIC900076	Bez obmedzení	M	Simona	Šťastnýová	Matka	peter.tóth76@student.skola.sk
78	123	2	Monika	Vargaová	2006-01-05	Ulica Vargaová 77	+421 943556699	+421 997221650	tomáš.krajčír@gmail.com	ISIC900077	Bez obmedzení	Z	Tomáš	Krajčír	Otec	monika.vargaová77@student.skola.sk
79	124	3	Zuzana	Šťastnýová	2009-09-07	Ulica Šťastnýová 78	+421 957672066	+421 973569318	ema.kováčová@gmail.com	ISIC900078	Bez obmedzení	Z	Ema	Kováčová	Matka	zuzana.šťastnýová78@student.skola.sk
80	125	4	Lucia	Nagyová	2008-10-01	Ulica Nagyová 79	+421 933645945	+421 991679847	jana.balážová@gmail.com	ISIC900079	Bez obmedzení	Z	Jana	Balážová	Matka	lucia.nagyová79@student.skola.sk
81	126	1	Zuzana	Šťastnýová	2008-02-12	Ulica Šťastnýová 80	+421 993802885	+421 991820611	jakub.hruška@gmail.com	ISIC900080	Alergia na orechy	Z	Jakub	Hruška	Otec	zuzana.šťastnýová80@student.skola.sk
82	127	2	Sofia	Saboová	2009-02-20	Ulica Saboová 81	+421 990513125	+421 998652554	marek.hruška@gmail.com	ISIC900081	Bez obmedzení	Z	Marek	Hruška	Otec	sofia.saboová81@student.skola.sk
83	128	3	Alena	Hruškaová	2009-07-30	Ulica Hruškaová 82	+421 914657138	+421 994028890	simona.balážová@gmail.com	ISIC900082	Bez obmedzení	Z	Simona	Balážová	Matka	alena.hruškaová82@student.skola.sk
84	129	4	Martin	Múdry	2006-11-18	Ulica Múdry 83	+421 974864334	+421 957956420	mária.šťastnýová@gmail.com	ISIC900083	Bez obmedzení	M	Mária	Šťastnýová	Matka	martin.múdry83@student.skola.sk
85	130	1	Matej	Hruška	2008-07-21	Ulica Hruška 84	+421 924333790	+421 919903716	lukáš.šťastný@gmail.com	ISIC900084	Bez obmedzení	M	Lukáš	Šťastný	Otec	matej.hruška84@student.skola.sk
86	131	2	Lukáš	Molnár	2008-11-03	Ulica Molnár 85	+421 996310417	+421 979483661	lucia.balážová@gmail.com	ISIC900085	Bez obmedzení	M	Lucia	Balážová	Matka	lukáš.molnár85@student.skola.sk
87	132	3	Marek	Horváth	2007-04-09	Ulica Horváth 86	+421 962569792	+421 927705082	simona.krajčírová@gmail.com	ISIC900086	Bez obmedzení	M	Simona	Krajčírová	Matka	marek.horváth86@student.skola.sk
88	133	4	Ema	Tóthová	2007-06-08	Ulica Tóthová 87	+421 996140454	+421 985103468	ema.nagyová@gmail.com	ISIC900087	Bez obmedzení	Z	Ema	Nagyová	Matka	ema.tóthová87@student.skola.sk
89	134	1	Martin	Molnár	2009-12-11	Ulica Molnár 88	+421 921416338	+421 919399549	alena.horváthová@gmail.com	ISIC900088	Bez obmedzení	M	Alena	Horváthová	Matka	martin.molnár88@student.skola.sk
90	135	2	Alena	Balážová	2006-01-03	Ulica Balážová 89	+421 954239668	+421 940630599	filip.sabo@gmail.com	ISIC900089	Bez obmedzení	Z	Filip	Sabo	Otec	alena.balážová89@student.skola.sk
91	136	3	Matej	Krajčír	2006-12-05	Ulica Krajčír 90	+421 968221320	+421 985777077	jakub.šťastný@gmail.com	ISIC900090	Bez obmedzení	M	Jakub	Šťastný	Otec	matej.krajčír90@student.skola.sk
92	137	4	Lucia	Nagyová	2008-05-26	Ulica Nagyová 91	+421 946223363	+421 937078173	barbora.tóthová@gmail.com	ISIC900091	Bez obmedzení	Z	Barbora	Tóthová	Matka	lucia.nagyová91@student.skola.sk
93	138	1	Lenka	Molnárová	2008-12-13	Ulica Molnárová 92	+421 964885349	+421 998025347	zuzana.vargaová@gmail.com	ISIC900092	Bez obmedzení	Z	Zuzana	Vargaová	Matka	lenka.molnárová92@student.skola.sk
94	139	2	Andrej	Horváth	2006-04-01	Ulica Horváth 93	+421 946888656	+421 920893141	mária.tóthová@gmail.com	ISIC900093	Bez obmedzení	M	Mária	Tóthová	Matka	andrej.horváth93@student.skola.sk
95	140	3	Alena	Krajčírová	2009-02-06	Ulica Krajčírová 94	+421 917445711	+421 916698200	marek.krajčír@gmail.com	ISIC900094	Bez obmedzení	Z	Marek	Krajčír	Otec	alena.krajčírová94@student.skola.sk
96	141	4	Mária	Vargaová	2008-10-08	Ulica Vargaová 95	+421 974222561	+421 949930834	tomáš.horváth@gmail.com	ISIC900095	Bez obmedzení	Z	Tomáš	Horváth	Otec	mária.vargaová95@student.skola.sk
97	142	1	Sofia	Múdryová	2007-01-23	Ulica Múdryová 96	+421 937824330	+421 924781997	barbora.vargaová@gmail.com	ISIC900096	Bez obmedzení	Z	Barbora	Vargaová	Matka	sofia.múdryová96@student.skola.sk
98	143	2	Michal	Hruška	2008-02-03	Ulica Hruška 97	+421 994756687	+421 945376832	zuzana.šťastnýová@gmail.com	ISIC900097	Bez obmedzení	M	Zuzana	Šťastnýová	Matka	michal.hruška97@student.skola.sk
99	144	3	Adam	Molnár	2007-06-26	Ulica Molnár 98	+421 918992919	+421 922547556	peter.hruška@gmail.com	ISIC900098	Bez obmedzení	M	Peter	Hruška	Otec	adam.molnár98@student.skola.sk
100	145	4	Tomáš	Šťastný	2008-11-15	Ulica Šťastný 99	+421 975893177	+421 940833880	andrej.kováč@gmail.com	ISIC900099	Bez obmedzení	M	Andrej	Kováč	Otec	tomáš.šťastný99@student.skola.sk
101	146	1	Monika	Saboová	2009-09-19	Ulica Saboová 100	+421 934513344	+421 988037250	patrik.krajčír@gmail.com	ISIC900100	Alergia na orechy	Z	Patrik	Krajčír	Otec	monika.saboová100@student.skola.sk
102	147	2	Sofia	Saboová	2006-10-18	Ulica Saboová 101	+421 935991658	+421 937232599	patrik.múdry@gmail.com	ISIC900101	Bez obmedzení	Z	Patrik	Múdry	Otec	sofia.saboová101@student.skola.sk
103	148	3	Katarína	Tóthová	2008-08-01	Ulica Tóthová 102	+421 927661315	+421 942831301	barbora.tóthová@gmail.com	ISIC900102	Bez obmedzení	Z	Barbora	Tóthová	Matka	katarína.tóthová102@student.skola.sk
104	149	4	Lucia	Kováčová	2009-05-23	Ulica Kováčová 103	+421 960809301	+421 988589196	zuzana.tóthová@gmail.com	ISIC900103	Bez obmedzení	Z	Zuzana	Tóthová	Matka	lucia.kováčová103@student.skola.sk
105	150	1	Sofia	Saboová	2009-08-22	Ulica Saboová 104	+421 917272932	+421 968377702	barbora.saboová@gmail.com	ISIC900104	Bez obmedzení	Z	Barbora	Saboová	Matka	sofia.saboová104@student.skola.sk
106	151	2	Michal	Nagy	2007-01-12	Ulica Nagy 105	+421 915411135	+421 953327395	ema.horváthová@gmail.com	ISIC900105	Bez obmedzení	M	Ema	Horváthová	Matka	michal.nagy105@student.skola.sk
107	152	3	Simona	Balážová	2009-04-19	Ulica Balážová 106	+421 949604128	+421 983308753	adam.horváth@gmail.com	ISIC900106	Bez obmedzení	Z	Adam	Horváth	Otec	simona.balážová106@student.skola.sk
108	153	4	Adam	Múdry	2009-02-14	Ulica Múdry 107	+421 920092073	+421 920177276	simona.balážová@gmail.com	ISIC900107	Bez obmedzení	M	Simona	Balážová	Matka	adam.múdry107@student.skola.sk
109	154	1	Filip	Nagy	2007-02-10	Ulica Nagy 108	+421 977451361	+421 982293738	lucia.nagyová@gmail.com	ISIC900108	Bez obmedzení	M	Lucia	Nagyová	Matka	filip.nagy108@student.skola.sk
110	155	2	Monika	Šťastnýová	2006-11-17	Ulica Šťastnýová 109	+421 928290948	+421 917095995	lenka.kováčová@gmail.com	ISIC900109	Bez obmedzení	Z	Lenka	Kováčová	Matka	monika.šťastnýová109@student.skola.sk
111	156	3	Alena	Tóthová	2006-03-10	Ulica Tóthová 110	+421 998189654	+421 976673299	peter.baláž@gmail.com	ISIC900110	Bez obmedzení	Z	Peter	Baláž	Otec	alena.tóthová110@student.skola.sk
112	157	4	Katarína	Molnárová	2008-03-04	Ulica Molnárová 111	+421 981456731	+421 961933071	filip.kováč@gmail.com	ISIC900111	Bez obmedzení	Z	Filip	Kováč	Otec	katarína.molnárová111@student.skola.sk
113	158	1	Marek	Nagy	2007-08-08	Ulica Nagy 112	+421 961331430	+421 938504845	adam.baláž@gmail.com	ISIC900112	Bez obmedzení	M	Adam	Baláž	Otec	marek.nagy112@student.skola.sk
114	159	2	Marek	Sabo	2006-11-10	Ulica Sabo 113	+421 936257398	+421 922685678	lenka.kováčová@gmail.com	ISIC900113	Bez obmedzení	M	Lenka	Kováčová	Matka	marek.sabo113@student.skola.sk
115	160	3	Mária	Šťastnýová	2009-11-01	Ulica Šťastnýová 114	+421 938475693	+421 971610444	simona.krajčírová@gmail.com	ISIC900114	Bez obmedzení	Z	Simona	Krajčírová	Matka	mária.šťastnýová114@student.skola.sk
116	161	4	Monika	Múdryová	2009-02-27	Ulica Múdryová 115	+421 969290489	+421 997790249	barbora.saboová@gmail.com	ISIC900115	Bez obmedzení	Z	Barbora	Saboová	Matka	monika.múdryová115@student.skola.sk
117	162	1	Ema	Hruškaová	2008-10-27	Ulica Hruškaová 116	+421 942546993	+421 920677747	lukáš.kováč@gmail.com	ISIC900116	Bez obmedzení	Z	Lukáš	Kováč	Otec	ema.hruškaová116@student.skola.sk
118	163	2	Katarína	Vargaová	2006-02-01	Ulica Vargaová 117	+421 980060866	+421 943378924	adam.horváth@gmail.com	ISIC900117	Bez obmedzení	Z	Adam	Horváth	Otec	katarína.vargaová117@student.skola.sk
119	164	3	Peter	Horváth	2007-03-25	Ulica Horváth 118	+421 970402436	+421 916125538	matej.horváth@gmail.com	ISIC900118	Bez obmedzení	M	Matej	Horváth	Otec	peter.horváth118@student.skola.sk
120	165	4	Lukáš	Horváth	2007-04-08	Ulica Horváth 119	+421 983055323	+421 967133182	zuzana.nagyová@gmail.com	ISIC900119	Bez obmedzení	M	Zuzana	Nagyová	Matka	lukáš.horváth119@student.skola.sk
121	166	1	Lenka	Saboová	2009-03-12	Ulica Saboová 120	+421 967287379	+421 984680908	filip.múdry@gmail.com	ISIC900120	Alergia na orechy	Z	Filip	Múdry	Otec	lenka.saboová120@student.skola.sk
122	167	2	Mária	Múdryová	2009-09-28	Ulica Múdryová 121	+421 998181085	+421 986985735	sofia.vargaová@gmail.com	ISIC900121	Bez obmedzení	Z	Sofia	Vargaová	Matka	mária.múdryová121@student.skola.sk
123	168	3	Simona	Horváthová	2007-03-23	Ulica Horváthová 122	+421 920537884	+421 918267807	lucia.nagyová@gmail.com	ISIC900122	Bez obmedzení	Z	Lucia	Nagyová	Matka	simona.horváthová122@student.skola.sk
124	169	4	Michal	Baláž	2006-01-04	Ulica Baláž 123	+421 977396005	+421 990750176	marek.šťastný@gmail.com	ISIC900123	Bez obmedzení	M	Marek	Šťastný	Otec	michal.baláž123@student.skola.sk
125	170	1	Andrej	Tóth	2007-11-25	Ulica Tóth 124	+421 926107629	+421 999649544	mária.vargaová@gmail.com	ISIC900124	Bez obmedzení	M	Mária	Vargaová	Matka	andrej.tóth124@student.skola.sk
126	171	2	Alena	Vargaová	2007-01-28	Ulica Vargaová 125	+421 937964943	+421 963374612	alena.balážová@gmail.com	ISIC900125	Bez obmedzení	Z	Alena	Balážová	Matka	alena.vargaová125@student.skola.sk
127	172	3	Matej	Múdry	2008-03-17	Ulica Múdry 126	+421 933717303	+421 962402885	mária.nagyová@gmail.com	ISIC900126	Bez obmedzení	M	Mária	Nagyová	Matka	matej.múdry126@student.skola.sk
128	173	4	Tomáš	Kováč	2006-10-23	Ulica Kováč 127	+421 994837052	+421 912125424	filip.baláž@gmail.com	ISIC900127	Bez obmedzení	M	Filip	Baláž	Otec	tomáš.kováč127@student.skola.sk
129	174	1	Adam	Varga	2006-09-19	Ulica Varga 128	+421 996554171	+421 994570920	matej.horváth@gmail.com	ISIC900128	Bez obmedzení	M	Matej	Horváth	Otec	adam.varga128@student.skola.sk
130	175	2	Martin	Kováč	2009-01-28	Ulica Kováč 129	+421 930441830	+421 956086598	lukáš.baláž@gmail.com	ISIC900129	Bez obmedzení	M	Lukáš	Baláž	Otec	martin.kováč129@student.skola.sk
131	176	3	Sofia	Hruškaová	2009-10-04	Ulica Hruškaová 130	+421 983263137	+421 934765666	martin.varga@gmail.com	ISIC900130	Bez obmedzení	Z	Martin	Varga	Otec	sofia.hruškaová130@student.skola.sk
132	177	4	Filip	Hruška	2007-10-21	Ulica Hruška 131	+421 951128995	+421 957923767	jakub.tóth@gmail.com	ISIC900131	Bez obmedzení	M	Jakub	Tóth	Otec	filip.hruška131@student.skola.sk
133	178	1	Mária	Tóthová	2008-12-25	Ulica Tóthová 132	+421 950599674	+421 977700459	lenka.šťastnýová@gmail.com	ISIC900132	Bez obmedzení	Z	Lenka	Šťastnýová	Matka	mária.tóthová132@student.skola.sk
134	179	2	Mária	Kováčová	2007-08-20	Ulica Kováčová 133	+421 929582721	+421 929677445	sofia.vargaová@gmail.com	ISIC900133	Bez obmedzení	Z	Sofia	Vargaová	Matka	mária.kováčová133@student.skola.sk
135	180	3	Alena	Šťastnýová	2008-05-02	Ulica Šťastnýová 134	+421 910641542	+421 981718523	matej.varga@gmail.com	ISIC900134	Bez obmedzení	Z	Matej	Varga	Otec	alena.šťastnýová134@student.skola.sk
136	181	4	Marek	Šťastný	2009-09-24	Ulica Šťastný 135	+421 917180866	+421 936584220	jakub.horváth@gmail.com	ISIC900135	Bez obmedzení	M	Jakub	Horváth	Otec	marek.šťastný135@student.skola.sk
137	182	1	Michal	Baláž	2007-11-02	Ulica Baláž 136	+421 910538133	+421 979624679	zuzana.kováčová@gmail.com	ISIC900136	Bez obmedzení	M	Zuzana	Kováčová	Matka	michal.baláž136@student.skola.sk
138	183	2	Sofia	Múdryová	2007-01-02	Ulica Múdryová 137	+421 983032183	+421 966486132	katarína.tóthová@gmail.com	ISIC900137	Bez obmedzení	Z	Katarína	Tóthová	Matka	sofia.múdryová137@student.skola.sk
139	184	3	Adam	Sabo	2006-04-10	Ulica Sabo 138	+421 911145348	+421 912258603	matej.nagy@gmail.com	ISIC900138	Bez obmedzení	M	Matej	Nagy	Otec	adam.sabo138@student.skola.sk
140	185	4	Filip	Horváth	2006-11-30	Ulica Horváth 139	+421 911209875	+421 984065126	peter.tóth@gmail.com	ISIC900139	Bez obmedzení	M	Peter	Tóth	Otec	filip.horváth139@student.skola.sk
141	186	1	Andrej	Nagy	2009-08-19	Ulica Nagy 140	+421 953528591	+421 992269262	zuzana.vargaová@gmail.com	ISIC900140	Alergia na orechy	M	Zuzana	Vargaová	Matka	andrej.nagy140@student.skola.sk
142	187	2	Martin	Tóth	2009-02-12	Ulica Tóth 141	+421 964302140	+421 918932121	ema.múdryová@gmail.com	ISIC900141	Bez obmedzení	M	Ema	Múdryová	Matka	martin.tóth141@student.skola.sk
143	188	3	Peter	Molnár	2008-11-25	Ulica Molnár 142	+421 954844234	+421 936385189	adam.tóth@gmail.com	ISIC900142	Bez obmedzení	M	Adam	Tóth	Otec	peter.molnár142@student.skola.sk
144	189	4	Ema	Saboová	2007-02-01	Ulica Saboová 143	+421 966673283	+421 963355700	jakub.hruška@gmail.com	ISIC900143	Bez obmedzení	Z	Jakub	Hruška	Otec	ema.saboová143@student.skola.sk
145	190	1	Tomáš	Krajčír	2007-09-04	Ulica Krajčír 144	+421 937834944	+421 998178652	jakub.múdry@gmail.com	ISIC900144	Bez obmedzení	M	Jakub	Múdry	Otec	tomáš.krajčír144@student.skola.sk
146	191	2	Alena	Šťastnýová	2009-12-09	Ulica Šťastnýová 145	+421 994742894	+421 924736617	jana.vargaová@gmail.com	ISIC900145	Bez obmedzení	Z	Jana	Vargaová	Matka	alena.šťastnýová145@student.skola.sk
147	192	3	Patrik	Baláž	2009-11-11	Ulica Baláž 146	+421 951654333	+421 991629635	katarína.balážová@gmail.com	ISIC900146	Bez obmedzení	M	Katarína	Balážová	Matka	patrik.baláž146@student.skola.sk
148	193	4	Matej	Molnár	2007-05-22	Ulica Molnár 147	+421 958690460	+421 922979863	tomáš.baláž@gmail.com	ISIC900147	Bez obmedzení	M	Tomáš	Baláž	Otec	matej.molnár147@student.skola.sk
149	194	1	Patrik	Nagy	2009-04-06	Ulica Nagy 148	+421 927628866	+421 965531354	lenka.tóthová@gmail.com	ISIC900148	Bez obmedzení	M	Lenka	Tóthová	Matka	patrik.nagy148@student.skola.sk
150	195	2	Marek	Baláž	2006-09-12	Ulica Baláž 149	+421 956803999	+421 941712154	adam.molnár@gmail.com	ISIC900149	Bez obmedzení	M	Adam	Molnár	Otec	marek.baláž149@student.skola.sk
151	196	3	Peter	Baláž	2007-12-03	Ulica Baláž 150	+421 955478354	+421 956565740	andrej.molnár@gmail.com	ISIC900150	Bez obmedzení	M	Andrej	Molnár	Otec	peter.baláž150@student.skola.sk
\.


--
-- TOC entry 5143 (class 0 OID 16987)
-- Dependencies: 224
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subjects (id, name, shortcut) FROM stdin;
1	Slovenský jazyk a literatúra	SJL
2	Anglický jazyk	ANJ
3	Nemecký jazyk	NEJ
4	Matematika	MAT
5	Informatika	INF
6	Fyzika	FYZ
7	Chémia	CHE
8	Biológia	BIO
9	Dejepis	DEJ
10	Geografia	GEG
11	Občianska náuka	OBN
12	Telesná a športová výchova	TSV
13	Umenie a kultúra	UMK
14	Ekonomika	EKO
\.


--
-- TOC entry 5154 (class 0 OID 17073)
-- Dependencies: 235
-- Data for Name: teacher_subjects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_subjects (employee_id, subject_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
8	8
9	9
10	10
11	11
12	12
13	13
14	14
15	1
16	2
17	3
18	4
19	5
20	6
21	7
22	8
23	9
24	10
25	11
26	12
27	13
28	14
29	1
30	2
31	3
32	4
33	5
34	6
35	7
36	8
37	9
38	10
2	3
4	5
6	7
8	9
10	11
12	13
14	1
16	3
18	5
20	7
22	9
24	11
26	13
28	1
30	3
32	5
34	7
36	9
38	11
\.


--
-- TOC entry 5158 (class 0 OID 17131)
-- Dependencies: 239
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests (id, subject_id, teacher_id, class_id, title, weight, test_date) FROM stdin;
1	1	1	1	Polrocny test	3	2026-01-10
2	2	1	1	Maly test	2	2026-01-21
3	3	1	1	Bleskovka	1	2026-01-30
4	4	1	1	Velka pisomka	3	2026-01-09
5	5	1	1	Polrocny test	3	2026-01-05
6	6	1	1	Maly test	2	2026-01-07
7	7	1	1	Bleskovka	1	2026-01-06
8	8	1	1	Velka pisomka	3	2026-01-14
9	9	1	1	Polrocny test	3	2026-01-17
10	10	1	1	Maly test	2	2026-01-30
11	1	2	2	Bleskovka	1	2026-01-04
12	2	2	2	Velka pisomka	3	2026-01-03
13	3	2	2	Polrocny test	3	2026-01-31
14	4	2	2	Maly test	2	2026-01-09
15	5	2	2	Bleskovka	1	2026-01-11
16	6	2	2	Velka pisomka	3	2026-01-05
17	7	2	2	Polrocny test	3	2026-01-06
18	8	2	2	Maly test	2	2026-01-04
19	9	2	2	Bleskovka	1	2026-01-10
20	10	2	2	Velka pisomka	3	2026-01-30
21	1	3	3	Polrocny test	3	2026-01-19
22	2	3	3	Maly test	2	2026-01-19
23	3	3	3	Bleskovka	1	2026-01-25
24	4	3	3	Velka pisomka	3	2026-01-04
25	5	3	3	Polrocny test	3	2026-01-26
26	6	3	3	Maly test	2	2026-01-12
27	7	3	3	Bleskovka	1	2026-01-20
28	8	3	3	Velka pisomka	3	2026-01-08
29	9	3	3	Polrocny test	3	2026-01-14
30	10	3	3	Maly test	2	2026-01-17
31	1	4	4	Bleskovka	1	2026-01-26
32	2	4	4	Velka pisomka	3	2026-01-09
33	3	4	4	Polrocny test	3	2026-01-27
34	4	4	4	Maly test	2	2026-01-10
35	5	4	4	Bleskovka	1	2026-01-05
36	6	4	4	Velka pisomka	3	2026-01-25
37	7	4	4	Polrocny test	3	2026-01-19
38	8	4	4	Maly test	2	2026-01-22
39	9	4	4	Bleskovka	1	2026-01-07
40	10	4	4	Velka pisomka	3	2026-01-20
\.


--
-- TOC entry 5156 (class 0 OID 17091)
-- Dependencies: 237
-- Data for Name: timetable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timetable (id, class_id, subject_id, teacher_id, room_id, lesson_slot_id, day_of_week) FROM stdin;
1	1	1	1	1	1	1
2	2	5	5	12	1	1
3	3	10	10	5	1	1
4	4	1	14	8	1	1
5	1	2	2	2	2	1
6	2	6	6	10	2	1
7	3	11	11	6	2	1
8	4	1	29	1	2	1
9	1	3	3	3	3	1
10	2	7	7	9	3	1
11	3	8	8	11	3	1
12	4	2	16	2	3	1
13	1	4	4	4	4	1
14	2	9	9	16	4	1
15	3	12	12	14	4	1
16	4	7	21	13	4	1
17	1	4	18	4	1	2
18	2	14	28	8	1	2
19	3	1	15	1	1	2
20	4	5	19	12	1	2
21	1	6	20	10	2	2
22	2	1	1	1	2	2
23	3	7	21	9	2	2
24	4	8	22	11	2	2
25	1	9	23	5	3	2
26	2	10	24	6	3	2
27	3	11	25	7	3	2
28	4	12	26	14	3	2
29	1	13	27	13	4	2
30	2	2	30	2	4	2
31	3	9	31	16	4	2
32	4	4	32	4	4	2
33	1	5	33	12	1	3
34	2	6	34	10	1	3
35	3	7	35	9	1	3
36	4	8	36	11	1	3
37	1	9	37	5	2	3
38	2	10	38	6	2	3
39	3	2	2	2	2	3
40	4	5	5	13	2	3
41	1	1	29	1	3	3
42	2	3	3	3	3	3
43	3	6	6	10	3	3
44	4	7	7	9	3	3
45	1	8	8	11	4	3
46	2	9	9	16	4	3
47	3	4	4	4	4	3
48	4	1	1	1	4	3
49	1	11	11	7	1	4
50	2	12	12	14	1	4
51	3	13	13	13	1	4
52	4	14	14	8	1	4
53	1	1	15	1	2	4
54	2	2	16	2	2	4
55	3	3	17	3	2	4
56	4	4	18	4	2	4
57	1	5	19	12	3	4
58	2	6	20	10	3	4
59	3	7	21	9	3	4
60	4	8	22	11	3	4
61	1	9	23	5	4	4
62	2	10	24	6	4	4
63	3	11	25	7	4	4
64	4	12	26	15	4	4
65	1	2	30	2	1	5
66	2	9	31	5	1	5
67	3	4	32	4	1	5
68	4	5	33	12	1	5
69	1	6	34	10	2	5
70	2	7	35	9	2	5
71	3	8	36	11	2	5
72	4	9	37	6	2	5
73	1	10	38	7	3	5
74	2	1	1	1	3	5
75	3	2	2	2	3	5
76	4	3	3	3	3	5
77	1	4	4	4	4	5
78	2	5	5	13	4	5
79	3	6	6	10	4	5
80	4	7	7	9	4	5
\.


--
-- TOC entry 5139 (class 0 OID 16960)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password_hash, role) FROM stdin;
1	štefan.1	heslo123	Admin
2	ľudmila.2	heslo123	Teacher
3	miroslav.3	heslo123	Teacher
4	ľudmila.4	heslo123	Teacher
5	marián.5	heslo123	Teacher
6	iveta.6	heslo123	Teacher
7	milan.7	heslo123	Teacher
8	dagmar.8	heslo123	Teacher
9	ladislav.9	heslo123	Teacher
10	ľudmila.10	heslo123	Teacher
11	milan.11	heslo123	Teacher
12	dagmar.12	heslo123	Teacher
13	juraj.13	heslo123	Teacher
14	dagmar.14	heslo123	Teacher
15	františek.15	heslo123	Teacher
16	dagmar.16	heslo123	Teacher
17	róbert.17	heslo123	Teacher
18	viera.18	heslo123	Teacher
19	juraj.19	heslo123	Teacher
20	ľudmila.20	heslo123	Teacher
21	štefan.21	heslo123	Teacher
22	božena.22	heslo123	Teacher
23	milan.23	heslo123	Teacher
24	viera.24	heslo123	Teacher
25	róbert.25	heslo123	Teacher
26	dagmar.26	heslo123	Teacher
27	ivan.27	heslo123	Teacher
28	anna.28	heslo123	Teacher
29	ivan.29	heslo123	Teacher
30	dana.30	heslo123	Teacher
31	ivan.31	heslo123	Teacher
32	jozefína.32	heslo123	Teacher
33	františek.33	heslo123	Teacher
34	dana.34	heslo123	Teacher
35	milan.35	heslo123	Teacher
36	viera.36	heslo123	Teacher
37	pavol.37	heslo123	Teacher
38	ľudmila.38	heslo123	Teacher
39	ivan.39	heslo123	Teacher
40	mária.40	heslo123	Teacher
41	ivan.41	heslo123	Teacher
42	božena.42	heslo123	Teacher
43	miroslav.43	heslo123	Teacher
44	dana.44	heslo123	Teacher
45	róbert.45	heslo123	Teacher
47	andrej.krajčír1	stud123	Student
48	lucia.saboová2	stud123	Student
49	martin.varga3	stud123	Student
50	peter.múdry4	stud123	Student
51	filip.molnár5	stud123	Student
52	alena.múdryová6	stud123	Student
53	andrej.baláž7	stud123	Student
54	lucia.kováčová8	stud123	Student
55	mária.molnárová9	stud123	Student
56	jana.múdryová10	stud123	Student
57	barbora.saboová11	stud123	Student
58	filip.horváth12	stud123	Student
59	zuzana.kováčová13	stud123	Student
60	lukáš.molnár14	stud123	Student
61	lenka.múdryová15	stud123	Student
62	ema.krajčírová16	stud123	Student
63	patrik.kováč17	stud123	Student
64	zuzana.horváthová18	stud123	Student
65	alena.saboová19	stud123	Student
66	adam.kováč20	stud123	Student
67	lukáš.molnár21	stud123	Student
68	zuzana.nagyová22	stud123	Student
69	simona.múdryová23	stud123	Student
70	ema.múdryová24	stud123	Student
71	peter.baláž25	stud123	Student
72	filip.múdry26	stud123	Student
73	andrej.tóth27	stud123	Student
74	mária.horváthová28	stud123	Student
75	matej.kováč29	stud123	Student
76	simona.šťastnýová30	stud123	Student
77	sofia.molnárová31	stud123	Student
78	patrik.šťastný32	stud123	Student
79	sofia.saboová33	stud123	Student
80	filip.sabo34	stud123	Student
81	filip.nagy35	stud123	Student
82	mária.nagyová36	stud123	Student
83	matej.kováč37	stud123	Student
84	lenka.kováčová38	stud123	Student
85	katarína.nagyová39	stud123	Student
86	ema.kováčová40	stud123	Student
87	peter.baláž41	stud123	Student
88	adam.nagy42	stud123	Student
89	mária.saboová43	stud123	Student
90	lucia.saboová44	stud123	Student
91	marek.hruška45	stud123	Student
92	andrej.šťastný46	stud123	Student
93	lucia.múdryová47	stud123	Student
94	barbora.molnárová48	stud123	Student
95	tomáš.molnár49	stud123	Student
96	tomáš.sabo50	stud123	Student
97	peter.kováč51	stud123	Student
98	zuzana.nagyová52	stud123	Student
99	barbora.nagyová53	stud123	Student
100	patrik.nagy54	stud123	Student
101	tomáš.nagy55	stud123	Student
102	alena.balážová56	stud123	Student
103	patrik.šťastný57	stud123	Student
104	monika.nagyová58	stud123	Student
105	patrik.horváth59	stud123	Student
106	jakub.nagy60	stud123	Student
107	tomáš.krajčír61	stud123	Student
108	matej.šťastný62	stud123	Student
109	ema.vargaová63	stud123	Student
110	martin.tóth64	stud123	Student
111	adam.múdry65	stud123	Student
112	matej.šťastný66	stud123	Student
113	jakub.molnár67	stud123	Student
114	katarína.nagyová68	stud123	Student
115	barbora.šťastnýová69	stud123	Student
116	michal.varga70	stud123	Student
117	martin.šťastný71	stud123	Student
118	matej.molnár72	stud123	Student
119	sofia.saboová73	stud123	Student
120	martin.múdry74	stud123	Student
121	andrej.varga75	stud123	Student
122	peter.tóth76	stud123	Student
123	monika.vargaová77	stud123	Student
124	zuzana.šťastnýová78	stud123	Student
125	lucia.nagyová79	stud123	Student
126	zuzana.šťastnýová80	stud123	Student
127	sofia.saboová81	stud123	Student
128	alena.hruškaová82	stud123	Student
129	martin.múdry83	stud123	Student
130	matej.hruška84	stud123	Student
131	lukáš.molnár85	stud123	Student
132	marek.horváth86	stud123	Student
133	ema.tóthová87	stud123	Student
134	martin.molnár88	stud123	Student
135	alena.balážová89	stud123	Student
136	matej.krajčír90	stud123	Student
137	lucia.nagyová91	stud123	Student
138	lenka.molnárová92	stud123	Student
139	andrej.horváth93	stud123	Student
140	alena.krajčírová94	stud123	Student
141	mária.vargaová95	stud123	Student
142	sofia.múdryová96	stud123	Student
143	michal.hruška97	stud123	Student
144	adam.molnár98	stud123	Student
145	tomáš.šťastný99	stud123	Student
146	monika.saboová100	stud123	Student
147	sofia.saboová101	stud123	Student
148	katarína.tóthová102	stud123	Student
149	lucia.kováčová103	stud123	Student
150	sofia.saboová104	stud123	Student
151	michal.nagy105	stud123	Student
152	simona.balážová106	stud123	Student
153	adam.múdry107	stud123	Student
154	filip.nagy108	stud123	Student
155	monika.šťastnýová109	stud123	Student
156	alena.tóthová110	stud123	Student
157	katarína.molnárová111	stud123	Student
158	marek.nagy112	stud123	Student
159	marek.sabo113	stud123	Student
160	mária.šťastnýová114	stud123	Student
161	monika.múdryová115	stud123	Student
162	ema.hruškaová116	stud123	Student
163	katarína.vargaová117	stud123	Student
164	peter.horváth118	stud123	Student
165	lukáš.horváth119	stud123	Student
166	lenka.saboová120	stud123	Student
167	mária.múdryová121	stud123	Student
168	simona.horváthová122	stud123	Student
169	michal.baláž123	stud123	Student
170	andrej.tóth124	stud123	Student
171	alena.vargaová125	stud123	Student
172	matej.múdry126	stud123	Student
173	tomáš.kováč127	stud123	Student
174	adam.varga128	stud123	Student
175	martin.kováč129	stud123	Student
176	sofia.hruškaová130	stud123	Student
177	filip.hruška131	stud123	Student
178	mária.tóthová132	stud123	Student
179	mária.kováčová133	stud123	Student
180	alena.šťastnýová134	stud123	Student
181	marek.šťastný135	stud123	Student
182	michal.baláž136	stud123	Student
183	sofia.múdryová137	stud123	Student
184	adam.sabo138	stud123	Student
185	filip.horváth139	stud123	Student
186	andrej.nagy140	stud123	Student
187	martin.tóth141	stud123	Student
188	peter.molnár142	stud123	Student
189	ema.saboová143	stud123	Student
190	tomáš.krajčír144	stud123	Student
191	alena.šťastnýová145	stud123	Student
192	patrik.baláž146	stud123	Student
193	matej.molnár147	stud123	Student
194	patrik.nagy148	stud123	Student
195	marek.baláž149	stud123	Student
196	peter.baláž150	stud123	Student
\.


--
-- TOC entry 5180 (class 0 OID 0)
-- Dependencies: 242
-- Name: attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attendance_id_seq', 1, false);


--
-- TOC entry 5181 (class 0 OID 0)
-- Dependencies: 231
-- Name: classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classes_id_seq', 1, false);


--
-- TOC entry 5182 (class 0 OID 0)
-- Dependencies: 229
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_id_seq', 45, true);


--
-- TOC entry 5183 (class 0 OID 0)
-- Dependencies: 240
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grades_id_seq', 3003, true);


--
-- TOC entry 5184 (class 0 OID 0)
-- Dependencies: 221
-- Name: job_positions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.job_positions_id_seq', 6, true);


--
-- TOC entry 5185 (class 0 OID 0)
-- Dependencies: 227
-- Name: lesson_slots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lesson_slots_id_seq', 12, true);


--
-- TOC entry 5186 (class 0 OID 0)
-- Dependencies: 225
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rooms_id_seq', 17, true);


--
-- TOC entry 5187 (class 0 OID 0)
-- Dependencies: 233
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 151, true);


--
-- TOC entry 5188 (class 0 OID 0)
-- Dependencies: 223
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subjects_id_seq', 14, true);


--
-- TOC entry 5189 (class 0 OID 0)
-- Dependencies: 238
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_id_seq', 40, true);


--
-- TOC entry 5190 (class 0 OID 0)
-- Dependencies: 236
-- Name: timetable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timetable_id_seq', 80, true);


--
-- TOC entry 5191 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 196, true);


--
-- TOC entry 4971 (class 2606 OID 17192)
-- Name: attendance attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_pkey PRIMARY KEY (id);


--
-- TOC entry 4953 (class 2606 OID 17045)
-- Name: classes classes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_pkey PRIMARY KEY (id);


--
-- TOC entry 4951 (class 2606 OID 17025)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- TOC entry 4969 (class 2606 OID 17169)
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- TOC entry 4941 (class 2606 OID 16983)
-- Name: job_positions job_positions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT job_positions_pkey PRIMARY KEY (id);


--
-- TOC entry 4943 (class 2606 OID 16985)
-- Name: job_positions job_positions_position_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_positions
    ADD CONSTRAINT job_positions_position_name_key UNIQUE (position_name);


--
-- TOC entry 4949 (class 2606 OID 17014)
-- Name: lesson_slots lesson_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lesson_slots
    ADD CONSTRAINT lesson_slots_pkey PRIMARY KEY (id);


--
-- TOC entry 4947 (class 2606 OID 17003)
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- TOC entry 4955 (class 2606 OID 17062)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 4945 (class 2606 OID 16994)
-- Name: subjects subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- TOC entry 4957 (class 2606 OID 17079)
-- Name: teacher_subjects teacher_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_subjects
    ADD CONSTRAINT teacher_subjects_pkey PRIMARY KEY (employee_id, subject_id);


--
-- TOC entry 4967 (class 2606 OID 17141)
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- TOC entry 4959 (class 2606 OID 17098)
-- Name: timetable timetable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_pkey PRIMARY KEY (id);


--
-- TOC entry 4961 (class 2606 OID 17104)
-- Name: timetable unique_class_time; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT unique_class_time UNIQUE (class_id, lesson_slot_id, day_of_week);


--
-- TOC entry 4963 (class 2606 OID 17102)
-- Name: timetable unique_room_time; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT unique_room_time UNIQUE (room_id, lesson_slot_id, day_of_week);


--
-- TOC entry 4965 (class 2606 OID 17100)
-- Name: timetable unique_teacher_time; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT unique_teacher_time UNIQUE (teacher_id, lesson_slot_id, day_of_week);


--
-- TOC entry 4937 (class 2606 OID 16972)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4939 (class 2606 OID 16974)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4989 (class 2606 OID 17198)
-- Name: attendance attendance_lesson_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_lesson_id_fkey FOREIGN KEY (lesson_id) REFERENCES public.timetable(id);


--
-- TOC entry 4990 (class 2606 OID 17193)
-- Name: attendance attendance_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attendance
    ADD CONSTRAINT attendance_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4974 (class 2606 OID 17046)
-- Name: classes classes_homeroom_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classes
    ADD CONSTRAINT classes_homeroom_teacher_id_fkey FOREIGN KEY (homeroom_teacher_id) REFERENCES public.employees(id);


--
-- TOC entry 4972 (class 2606 OID 17031)
-- Name: employees employees_position_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_position_id_fkey FOREIGN KEY (position_id) REFERENCES public.job_positions(id);


--
-- TOC entry 4973 (class 2606 OID 17026)
-- Name: employees employees_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4987 (class 2606 OID 17170)
-- Name: grades grades_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;


--
-- TOC entry 4988 (class 2606 OID 17175)
-- Name: grades grades_test_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_test_id_fkey FOREIGN KEY (test_id) REFERENCES public.tests(id) ON DELETE CASCADE;


--
-- TOC entry 4975 (class 2606 OID 17068)
-- Name: students students_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.classes(id);


--
-- TOC entry 4976 (class 2606 OID 17063)
-- Name: students students_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 4977 (class 2606 OID 17080)
-- Name: teacher_subjects teacher_subjects_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_subjects
    ADD CONSTRAINT teacher_subjects_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employees(id) ON DELETE CASCADE;


--
-- TOC entry 4978 (class 2606 OID 17085)
-- Name: teacher_subjects teacher_subjects_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher_subjects
    ADD CONSTRAINT teacher_subjects_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id) ON DELETE CASCADE;


--
-- TOC entry 4984 (class 2606 OID 17152)
-- Name: tests tests_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.classes(id);


--
-- TOC entry 4985 (class 2606 OID 17142)
-- Name: tests tests_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 4986 (class 2606 OID 17147)
-- Name: tests tests_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.employees(id);


--
-- TOC entry 4979 (class 2606 OID 17105)
-- Name: timetable timetable_class_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_class_id_fkey FOREIGN KEY (class_id) REFERENCES public.classes(id) ON DELETE CASCADE;


--
-- TOC entry 4980 (class 2606 OID 17125)
-- Name: timetable timetable_lesson_slot_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_lesson_slot_id_fkey FOREIGN KEY (lesson_slot_id) REFERENCES public.lesson_slots(id);


--
-- TOC entry 4981 (class 2606 OID 17120)
-- Name: timetable timetable_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.rooms(id);


--
-- TOC entry 4982 (class 2606 OID 17110)
-- Name: timetable timetable_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subjects(id);


--
-- TOC entry 4983 (class 2606 OID 17115)
-- Name: timetable timetable_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timetable
    ADD CONSTRAINT timetable_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.employees(id);


-- Completed on 2026-02-10 19:05:02

--
-- PostgreSQL database dump complete
--

\unrestrict GtpigFQpGKDR4ENohKNrY9zLwKUMLMUAdMBa9UwBcSQNfkDCk1aqxPK14ki6AxO

