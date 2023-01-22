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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    star_id integer,
    name character varying(50) NOT NULL,
    galaxy_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    number_of_planets bigint,
    number_of_stars bigint
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
    name character varying(50) NOT NULL,
    has_water boolean,
    description text NOT NULL,
    approximated_surface_temperature_kelvin integer,
    distance_from_planet_kilometers numeric,
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
    name character varying(50) NOT NULL,
    number_of_moons integer,
    has_water boolean,
    description text NOT NULL,
    approximated_surface_temperature_kelvin integer,
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
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.quadrant_quadrant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quadrant_quadrant_id_seq OWNER TO freecodecamp;

--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.quadrant_quadrant_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    approximated_surface_temperature_kelvin integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.quadrant_quadrant_id_seq'::regclass);


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
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 6, 'Venus supercluster', 1, 1, 1);
INSERT INTO public.cluster VALUES (3, 6, 'Venus supercluster', 1, 2, 5);
INSERT INTO public.cluster VALUES (4, 6, 'Venus supercluster', 1, 2, 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Galaxy where humans reside', 5000000000, 1000000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Will collision with our Milky way galaxy', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Canis major dwarf', 'Closest to our Milky way galaxy', 1000000000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Antennae galaxies', 'Shaped in the form of an insects antennae', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Backward galaxy', 'Seems to be rotating backwards', 1000000000, 50000000000);
INSERT INTO public.galaxy VALUES (7, 'Cartwheel galaxy', 'One of the most complex galaxies in the known universe', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 'Earths natural satellite.', 280, 384000, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 'Mars natural satellite.', 233, 6000, 3);
INSERT INTO public.moon VALUES (4, 'Deimos', false, 'Mars natural satellite.', 233, 23000, 3);
INSERT INTO public.moon VALUES (8, 'Io', false, 'Jupiters natural satellite.', 90, 421000, 2);
INSERT INTO public.moon VALUES (5, 'Europe', true, 'Jupiters natural satellite.', 125, 670900, 2);
INSERT INTO public.moon VALUES (6, 'Ganimedes', false, 'Jupiters natural satellite.', 125, 1070000, 2);
INSERT INTO public.moon VALUES (9, 'Calisto', true, 'Jupiters natural satellite.', 134, 1882000, 2);
INSERT INTO public.moon VALUES (10, 'Cilene', true, 'Jupiters natural satellite.', NULL, 23396000, 2);
INSERT INTO public.moon VALUES (11, 'Titan', NULL, 'Saturns natural satellite.', NULL, 1200000, 4);
INSERT INTO public.moon VALUES (12, 'Luna', NULL, 'Saturns natural satellite.', NULL, NULL, 4);
INSERT INTO public.moon VALUES (13, 'Encelado', NULL, 'Saturns natural satellite.', NULL, NULL, 4);
INSERT INTO public.moon VALUES (14, 'Mimas', NULL, 'Saturns natural satellite.', NULL, NULL, 4);
INSERT INTO public.moon VALUES (15, 'Miranda', NULL, 'Uranus natural satellite.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Titania', NULL, 'Uranus natural satellite.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Oberon', NULL, 'Uranus natural satellite.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Umbirel', NULL, 'Uranus natural satellite.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Ariel', NULL, 'Uranus natural satellite.', NULL, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Triton', NULL, 'Neptunes natural satellite.', NULL, NULL, 8);
INSERT INTO public.moon VALUES (21, 'Talasa', NULL, 'Neptunes natural satellite.', NULL, NULL, 8);
INSERT INTO public.moon VALUES (22, 'Galatea', NULL, 'Neptunes natural satellite.', NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, 'Our home', 288, 6);
INSERT INTO public.planet VALUES (2, 'Jupiter', 80, false, 'Biggest planet on the solar system', 165, 6);
INSERT INTO public.planet VALUES (3, 'Mars', 2, true, 'Earths neighboring planet', 200, 6);
INSERT INTO public.planet VALUES (4, 'Saturn', 83, false, 'Ringed planet', 135, 6);
INSERT INTO public.planet VALUES (5, 'Venus', 0, false, 'Second planet nearest to the sun on our solar system', 698, 6);
INSERT INTO public.planet VALUES (6, 'Mercury', 0, false, 'Smallest planet in our solar system, and nearest to the sun', 700, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, false, 'Coldest planet in our solar system', 76, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, false, 'Most distant planet', 35, 6);
INSERT INTO public.planet VALUES (9, 'Saffar', NULL, NULL, 'Located in Andromeda galaxy. One of the few known exoplanets', NULL, 5);
INSERT INTO public.planet VALUES (10, 'Samh', NULL, NULL, 'Located in Andromeda galaxy. One of the few known exoplanets', NULL, 5);
INSERT INTO public.planet VALUES (11, 'Majriti', NULL, NULL, 'Located in Andromeda galaxy. One of the few known exoplanets', NULL, 5);
INSERT INTO public.planet VALUES (12, 'Titawin e', NULL, NULL, 'Located in Andromeda galaxy. One of the few known exoplanets', NULL, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY scuti', '1700 times bigger than the sun', NULL, 1);
INSERT INTO public.star VALUES (2, 'VY Canis majoris', 'So massive that its light takes 8 hours to travel around its equator', NULL, 1);
INSERT INTO public.star VALUES (3, 'Antares', '883 times bigger than the sun', NULL, 1);
INSERT INTO public.star VALUES (4, 'Mu Cephei', '1260 times bigger than the sun', NULL, 1);
INSERT INTO public.star VALUES (6, 'Sun', 'The main star that sustains life on earth and holds the solar system together', 5778, 1);
INSERT INTO public.star VALUES (5, 'Titawin, Upsilon Andromedae', 'Has four exo planets', NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: quadrant_quadrant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.quadrant_quadrant_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: cluster cluster_cluster_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_cluster_id_key UNIQUE (cluster_id);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: cluster cluster_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: cluster cluster_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: cluster cluster_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: cluster cluster_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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
-- PostgreSQL database dump complete
--

