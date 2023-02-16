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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text,
    total_stars_estimate_in_billions integer,
    galaxy_type character varying(32)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    is_spherical boolean,
    name character varying(64) NOT NULL,
    age_in_millions_of_years numeric(10,4),
    color character varying(16),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    age_in_millions_of_years numeric(10,4),
    has_life boolean,
    total_moons integer,
    name character varying(64) NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    total_planets integer,
    name character varying(64) NOT NULL,
    galaxy_id integer,
    star_id integer NOT NULL,
    color character varying(16)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_references; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_references (
    star_id integer,
    star_references_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.star_references OWNER TO freecodecamp;

--
-- Name: star_references_reference_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_references_reference_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_references_reference_id_seq OWNER TO freecodecamp;

--
-- Name: star_references_reference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_references_reference_id_seq OWNED BY public.star_references.star_references_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_references star_references_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_references ALTER COLUMN star_references_id SET DEFAULT nextval('public.star_references_reference_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is the galaxy that includes the Solar System, with the name describing the galaxy''s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.', 300, 'Barred spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The Andromeda Galaxy, also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula, is a barred spiral galaxy with the diameter of about 46.56 kiloparsecs (152,000 light-years) approximately 2.5 million light-years (765 kiloparsecs) from Earth and the nearest large galaxy to the Milky Way.', 1000, 'Barred spiral');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The Triangulum Galaxy is a spiral galaxy 2.73 million light-years (ly) from Earth in the constellation Triangulum. It is catalogued as Messier 33 or NGC (New General Catalogue) 598. With the D25 isophotal diameter of 18.74 kiloparsecs (61,100 light-years), the Triangulum Galaxy is the third-largest member of the Local Group of galaxies, behind the Andromeda Galaxy and the Milky Way.', 40, 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Fourth largest member of the group, satellite of Milky Way and only Magellanic Spiral Galaxy in the local group', 20, 'Magellanic Spiral');
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Satellite of Milky Way, 6th largest galaxy in the local group', 3, 'Irregular');
INSERT INTO public.galaxy VALUES (6, 'Messier 32', 'Satellite of the Andromeda Galaxy, shows signs of a supermassive black hole ', NULL, 'Elliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, true, 'Moon', 4600.0000, 'Gray', 3);
INSERT INTO public.moon VALUES (2, false, 'Phobos', 4600.0000, 'Red', 4);
INSERT INTO public.moon VALUES (3, false, 'Deimos', 4600.0000, 'Light Gray', 4);
INSERT INTO public.moon VALUES (4, true, 'Io', 4600.0000, 'Yellow', 5);
INSERT INTO public.moon VALUES (5, true, 'Europa', 4600.0000, 'Marble Brown', 5);
INSERT INTO public.moon VALUES (6, true, 'Ganymede', 4600.0000, 'Gray', 5);
INSERT INTO public.moon VALUES (7, true, 'Callisto', 4600.0000, 'Blue', 5);
INSERT INTO public.moon VALUES (8, true, 'Titan', 4600.0000, 'Yellow', 6);
INSERT INTO public.moon VALUES (9, true, 'Mimas', 4600.0000, 'Gray', 6);
INSERT INTO public.moon VALUES (10, true, 'Enceladus', 4600.0000, 'Gray', 6);
INSERT INTO public.moon VALUES (11, true, 'Tethys', 4600.0000, 'Gray', 6);
INSERT INTO public.moon VALUES (12, false, 'Phoebe', 4600.0000, 'Gray', 6);
INSERT INTO public.moon VALUES (13, false, 'Pan', 4600.0000, 'Gray', 6);
INSERT INTO public.moon VALUES (14, false, 'Atlas', 4600.0000, 'Gray', 6);
INSERT INTO public.moon VALUES (15, false, 'Pandora', 4600.0000, 'Gray', 6);
INSERT INTO public.moon VALUES (16, true, 'Miranda', 4600.0000, 'Gray', 7);
INSERT INTO public.moon VALUES (17, true, 'Ariel', 4600.0000, 'Gray', 7);
INSERT INTO public.moon VALUES (18, true, 'Umbriel', 4600.0000, 'Gray', 7);
INSERT INTO public.moon VALUES (19, true, 'Titania', 4600.0000, 'Gray', 7);
INSERT INTO public.moon VALUES (20, true, 'Oberon', 4600.0000, 'Gray', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 4600.0000, false, 0, 'Mercury', 1);
INSERT INTO public.planet VALUES (2, 4600.0000, false, 0, 'Venus', 1);
INSERT INTO public.planet VALUES (3, 4600.0000, true, 1, 'Earth', 1);
INSERT INTO public.planet VALUES (4, 4600.0000, false, 2, 'Mars', 1);
INSERT INTO public.planet VALUES (5, 4600.0000, false, 4, 'Jupiter', 1);
INSERT INTO public.planet VALUES (6, 4600.0000, false, 83, 'Saturn', 1);
INSERT INTO public.planet VALUES (7, 4600.0000, false, 27, 'Uranus', 1);
INSERT INTO public.planet VALUES (8, 4600.0000, false, 14, 'Neptune', 1);
INSERT INTO public.planet VALUES (9, NULL, false, 0, 'Proxima Centauri B', 2);
INSERT INTO public.planet VALUES (10, NULL, false, 0, 'Proxima Centauri C', 2);
INSERT INTO public.planet VALUES (11, NULL, false, 0, 'Proxima Centauri D', 2);
INSERT INTO public.planet VALUES (12, 7.0000, false, 0, 'Lalande 21185 b', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (8, 'Sol', 1, 1, 'White');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 2, 'White');
INSERT INTO public.star VALUES (0, 'Rigil Kentaurus', 1, 3, 'Yellow');
INSERT INTO public.star VALUES (0, 'Toliman', 1, 4, 'Yellow');
INSERT INTO public.star VALUES (0, 'Sirius', 1, 5, 'White');
INSERT INTO public.star VALUES (0, 'Rigel', 1, 6, 'White');
INSERT INTO public.star VALUES (3, 'Lalande 21185', 1, 7, 'Red');


--
-- Data for Name: star_references; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_references VALUES (1, 1, 'https://en.wikipedia.org/wiki/Sol');
INSERT INTO public.star_references VALUES (2, 2, 'https://en.wikipedia.org/wiki/Proxima_Centauri');
INSERT INTO public.star_references VALUES (3, 3, 'https://www.space.com/23563-rigil-kentaurus.html');
INSERT INTO public.star_references VALUES (4, 4, 'https://www.star-facts.com/toliman/');
INSERT INTO public.star_references VALUES (5, 5, 'https://en.wikipedia.org/wiki/Sirius');
INSERT INTO public.star_references VALUES (6, 6, 'https://en.wikipedia.org/wiki/Rigel');
INSERT INTO public.star_references VALUES (7, 7, 'https://en.wikipedia.org/wiki/Lalande_21185');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_references_reference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_references_reference_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon name_moon_unqiue; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_moon_unqiue UNIQUE (name);


--
-- Name: planet name_planet_unqiue; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_planet_unqiue UNIQUE (name);


--
-- Name: star name_star_unqiue; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_star_unqiue UNIQUE (name);


--
-- Name: galaxy name_unqiue; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name_unqiue UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_references star_references_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_references
    ADD CONSTRAINT star_references_name_key UNIQUE (name);


--
-- Name: star_references star_references_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_references
    ADD CONSTRAINT star_references_pkey PRIMARY KEY (star_references_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star_references star_references_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_references
    ADD CONSTRAINT star_references_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--