--
-- PostgreSQL database dump
--

\restrict 05EKiMAAlTsEqfc1ziXANFszMoOStRX6nUtqxyYB7XQxtjT1Wwvcc2lWz6JOlqU

-- Dumped from database version 15.14 (Debian 15.14-1.pgdg13+1)
-- Dumped by pg_dump version 15.14 (Debian 15.14-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO "user";

--
-- Name: incidents; Type: TABLE; Schema: public; Owner: user
--

CREATE TABLE public.incidents (
    id integer NOT NULL,
    "desc" character varying(500) NOT NULL,
    status character varying(20) NOT NULL,
    source character varying(20) NOT NULL,
    reported_at timestamp with time zone NOT NULL
);


ALTER TABLE public.incidents OWNER TO "user";

--
-- Name: incidents_id_seq; Type: SEQUENCE; Schema: public; Owner: user
--

CREATE SEQUENCE public.incidents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incidents_id_seq OWNER TO "user";

--
-- Name: incidents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: user
--

ALTER SEQUENCE public.incidents_id_seq OWNED BY public.incidents.id;


--
-- Name: incidents id; Type: DEFAULT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.incidents ALTER COLUMN id SET DEFAULT nextval('public.incidents_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.alembic_version (version_num) FROM stdin;
bcef00eb6c45
\.


--
-- Data for Name: incidents; Type: TABLE DATA; Schema: public; Owner: user
--

COPY public.incidents (id, "desc", status, source, reported_at) FROM stdin;
1	string	OPENED	OPERATOR	2025-11-07 17:27:24.882+00
2	Ошибка при входе в систему	OPENED	USER	2025-11-07 17:27:24.882+00
3	Сбой сервера базы данных	IN_PROGRESS	MONITORING	2025-11-07 17:27:24.882+00
4	Не работает уведомление на почту	OPENED	OPERATOR	2025-11-07 17:27:24.882+00
5	Партнерская интеграция падает	RESOLVED	PARTNER	2025-11-07 17:27:24.882+00
6	Неверные данные в отчете	CLOSED	USER	2025-11-07 17:27:24.882+00
7	Система мониторинга подняла тревогу	IN_PROGRESS	MONITORING	2025-11-07 17:27:24.882+00
8	Запрос клиента не обработан	OPENED	OPERATOR	2025-11-07 17:27:24.882+00
9	Ошибка в мобильном приложении	RESOLVED	USER	2025-11-07 17:27:24.882+00
10	Ввод данных администратором	CLOSED	MANUAL	2025-11-07 17:27:24.882+00
11	Задержка в обработке платежей	IN_PROGRESS	PARTNER	2025-11-07 17:27:24.882+00
12	Сбой API стороннего сервиса	OPENED	PARTNER	2025-11-07 17:27:24.882+00
13	Проблема с загрузкой файлов	RESOLVED	USER	2025-11-07 17:27:24.882+00
14	Ошибка авторизации оператора	OPENED	OPERATOR	2025-11-07 17:27:24.882+00
15	Мониторинг выявил аномалию	IN_PROGRESS	MONITORING	2025-11-07 17:27:24.882+00
16	Некорректное отображение отчета	RESOLVED	USER	2025-11-07 17:27:24.882+00
17	Ввод тестовых данных админом	CLOSED	MANUAL	2025-11-07 17:27:24.882+00
18	Отказ в обработке платежа	OPENED	PARTNER	2025-11-07 17:27:24.882+00
19	Сбой уведомлений в системе	IN_PROGRESS	OPERATOR	2025-11-07 17:27:24.882+00
20	Ошибка в логике расчета	RESOLVED	USER	2025-11-07 17:27:24.882+00
21	Проблемы с подключением к серверу	CLOSED	MONITORING	2025-11-07 17:27:24.882+00
\.


--
-- Name: incidents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: user
--

SELECT pg_catalog.setval('public.incidents_id_seq', 21, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: incidents incidents_pkey; Type: CONSTRAINT; Schema: public; Owner: user
--

ALTER TABLE ONLY public.incidents
    ADD CONSTRAINT incidents_pkey PRIMARY KEY (id);


--
-- Name: ix_incidents_id; Type: INDEX; Schema: public; Owner: user
--

CREATE INDEX ix_incidents_id ON public.incidents USING btree (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 05EKiMAAlTsEqfc1ziXANFszMoOStRX6nUtqxyYB7XQxtjT1Wwvcc2lWz6JOlqU

