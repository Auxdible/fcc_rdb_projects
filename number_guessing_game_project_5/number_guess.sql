--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22),
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (65, 'user_1677199039334', 2, 28);
INSERT INTO public.users VALUES (64, 'user_1677199039335', 5, 63);
INSERT INTO public.users VALUES (81, 'user_1677203603005', 2, 195);
INSERT INTO public.users VALUES (97, 'user_1677204089460', 2, 135);
INSERT INTO public.users VALUES (80, 'user_1677203603007', 5, 131);
INSERT INTO public.users VALUES (67, 'user_1677201512096', 2, 319);
INSERT INTO public.users VALUES (66, 'user_1677201512097', 5, 254);
INSERT INTO public.users VALUES (96, 'user_1677204089461', 5, 96);
INSERT INTO public.users VALUES (69, 'user_1677203080450', 2, 407);
INSERT INTO public.users VALUES (83, 'user_1677203746268', 2, 509);
INSERT INTO public.users VALUES (68, 'user_1677203080451', 5, 264);
INSERT INTO public.users VALUES (82, 'user_1677203746269', 5, 81);
INSERT INTO public.users VALUES (71, 'user_1677203094724', 2, 569);
INSERT INTO public.users VALUES (99, 'user_1677204120758', 2, 508);
INSERT INTO public.users VALUES (70, 'user_1677203094725', 5, 92);
INSERT INTO public.users VALUES (85, 'user_1677203928693', 2, 3);
INSERT INTO public.users VALUES (98, 'user_1677204120759', 5, 326);
INSERT INTO public.users VALUES (84, 'user_1677203928694', 5, 40);
INSERT INTO public.users VALUES (73, 'user_1677203219978', 2, 163);
INSERT INTO public.users VALUES (72, 'user_1677203219979', 5, 105);
INSERT INTO public.users VALUES (87, 'user_1677203993012', 2, 26);
INSERT INTO public.users VALUES (75, 'user_1677203520647', 2, 974);
INSERT INTO public.users VALUES (101, 'user_1677204129142', 2, 209);
INSERT INTO public.users VALUES (86, 'user_1677203993013', 5, 100);
INSERT INTO public.users VALUES (74, 'user_1677203520648', 5, 254);
INSERT INTO public.users VALUES (100, 'user_1677204129143', 5, 17);
INSERT INTO public.users VALUES (77, 'user_1677203529817', 2, 76);
INSERT INTO public.users VALUES (89, 'user_1677204045296', 2, 626);
INSERT INTO public.users VALUES (76, 'user_1677203529818', 5, 474);
INSERT INTO public.users VALUES (88, 'user_1677204045297', 5, 306);
INSERT INTO public.users VALUES (103, 'user_1677204221630', 2, 242);
INSERT INTO public.users VALUES (79, 'user_1677203560605', 2, 41);
INSERT INTO public.users VALUES (78, 'user_1677203560606', 5, 59);
INSERT INTO public.users VALUES (91, 'user_1677204056455', 2, 100);
INSERT INTO public.users VALUES (102, 'user_1677204221631', 5, 471);
INSERT INTO public.users VALUES (90, 'user_1677204056456', 5, 145);
INSERT INTO public.users VALUES (93, 'user_1677204076127', 2, 10);
INSERT INTO public.users VALUES (92, 'user_1677204076128', 5, 94);
INSERT INTO public.users VALUES (95, 'user_1677204081114', 2, 755);
INSERT INTO public.users VALUES (94, 'user_1677204081115', 5, 254);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 103, true);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

