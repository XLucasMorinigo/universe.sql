--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30),
    age_in_millionsyears integer,
    distance_from_earth numeric,
    description text NOT NULL,
    has_life boolean
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
    name character varying(30),
    planet_id integer NOT NULL,
    weight text,
    diameter numeric,
    velocity numeric NOT NULL
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
    name character varying(30),
    age_in_millionsyears integer,
    distance_from_earth integer,
    description text,
    has_life boolean,
    star_id integer NOT NULL
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    velocity numeric
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    age_in_millionsyears integer,
    distance_from_earth numeric,
    description text,
    has_life boolean,
    galaxy_id integer NOT NULL
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 13600, 0, 'Nuestra galaxia, una espiral barrada con un diámetro de aproximadamente 100,000 años luz. Contiene entre 100,000 y 400,000 millones de estrellas y muchos sistemas planetarios. Se sabe que contiene vida en la Tierra.', true);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 10000, 2.537, 'La galaxia espiral más cercana a la Vía Láctea y la galaxia más grande del Grupo Local. Se espera que colisione con la Vía Láctea en unos 4,500 millones de años.', NULL);
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 13700, 2.73, 'La tercera galaxia más grande del Grupo Local. Es una galaxia espiral que también se encuentra relativamente cerca de la Vía Láctea y Andrómeda.', NULL);
INSERT INTO public.galaxy VALUES (4, 'Galaxia del Sombrero', 13000, 28, 'Una galaxia espiral que se distingue por su bulbo central brillante y un prominente anillo de polvo, que le da la apariencia de un sombrero. Se encuentra en la constelación de Virgo.', NULL);
INSERT INTO public.galaxy VALUES (5, 'Galaxia del Remolino', 500, 23, 'Una galaxia espiral ubicada en la constelación de Canes Venatici. Es conocida por su estructura espiral bien definida y por estar en interacción con una galaxia compañera más pequeña, NGC 5195.', NULL);
INSERT INTO public.galaxy VALUES (6, 'Galaxia de Bode', 13200, 12, 'Una galaxia espiral situada en la constelación de la Osa Mayor. Es una de las galaxias más brillantes visibles desde la Tierra y forma un famoso par con la galaxia del Cigarro (M82).', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, '7.35 × 10^22 kg', 3.474, 1.022);
INSERT INTO public.moon VALUES (2, 'Fobos', 2, '1.06 × 10^16 kg', 22.4, 2.138);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, '1.48 × 10^15 kg', 12.4, 1.351);
INSERT INTO public.moon VALUES (4, 'AndrosI-a', 3, '5 × 10^22 kg', 2200, 1.1);
INSERT INTO public.moon VALUES (5, 'Andros I-b', 3, '3 × 10^22 kg', 1800, 0.9);
INSERT INTO public.moon VALUES (6, 'Andros II-a', 4, '6 × 10^23 kg', 3000, 1.3);
INSERT INTO public.moon VALUES (7, 'Andros II-B', 4, '4 × 10^23 kg', 2500, 1.2);
INSERT INTO public.moon VALUES (8, 'Triangulum b-a', 5, '2 × 10^22 kg', 1500, 1.5);
INSERT INTO public.moon VALUES (9, 'Triangulum b-b', 5, '1.5 × 10^22 kg', 1200, 1.4);
INSERT INTO public.moon VALUES (10, 'Triangulum c-a', 6, '4 × 10^22 kg', 2000, 1.2);
INSERT INTO public.moon VALUES (11, 'Triangulum c-b', 6, '3 × 10^22 kg', 1800, 1.1);
INSERT INTO public.moon VALUES (12, 'Sombrero I-a', 11, '6 × 10^22 kg', 2500, 1.3);
INSERT INTO public.moon VALUES (13, 'Sombrero I-b', 11, '4.5 × 10^22 kg', 2200, 1.2);
INSERT INTO public.moon VALUES (14, 'Sombrero II-a', 12, '8 × 10^22 kg', 3000, 1.4);
INSERT INTO public.moon VALUES (15, 'Sombrero II-b', 12, '5.5 × 10^22 kg', 2700, 1.3);
INSERT INTO public.moon VALUES (16, 'Remolino a-a', 9, '3 × 10^22 kg', 1800, 1.6);
INSERT INTO public.moon VALUES (17, 'Remolino a-b', 9, '2.5 × 10^22 kg', 1600, 1.5);
INSERT INTO public.moon VALUES (18, 'Bode Alpha-a', 7, '2 × 10^22 kg', 1500, 1.2);
INSERT INTO public.moon VALUES (19, 'Bode Alpha-b', 7, '1.8 × 10^22 kg', 1400, 1.1);
INSERT INTO public.moon VALUES (20, 'Bode Beta-a', 8, '4 × 10^22 kg', 2000, 1.5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Tierra', 4543, NULL, 'Tercer planeta del sistema solar y el único conocido hasta ahora que alberga vida. Tiene agua en estado líquido y una atmósfera que protege y sustenta la vida.', true, 1);
INSERT INTO public.planet VALUES (2, 'Marte', 4603, 55, 'Cuarto planeta del sistema solar, conocido como el "Planeta Rojo" debido a su color característico. Tiene la mayor montaña y el mayor cañón del sistema solar.', NULL, 1);
INSERT INTO public.planet VALUES (3, 'Andros I', 4100, 3, 'Un planeta rocoso similar a la Tierra, con una atmósfera delgada y signos de erosión por agua en el pasado.', NULL, 2);
INSERT INTO public.planet VALUES (4, 'Andros II', 4100, 3, 'Un gigante gaseoso con múltiples lunas, algunas de las cuales podrían tener océanos subterráneos bajo una capa de hielo.', NULL, 2);
INSERT INTO public.planet VALUES (5, 'Triangulum b', 2000, 3, 'Un planeta cubierto de océanos con una atmósfera densa rica en vapor de agua.', NULL, 3);
INSERT INTO public.planet VALUES (6, 'Triangulum c', 3800, 3, 'Un planeta rocoso con volcanes activos y una atmósfera compuesta principalmente de dióxido de carbono.', NULL, 3);
INSERT INTO public.planet VALUES (7, 'Bode Alpha', 4000, 12, 'Un planeta con una atmósfera espesa de nitrógeno y oxígeno, con grandes masas de agua líquida en la superficie.', NULL, 6);
INSERT INTO public.planet VALUES (8, 'Bode Beta', 5000, 12, 'Un planeta terrestre con montañas altas y valles profundos, con una atmósfera fina.', NULL, 6);
INSERT INTO public.planet VALUES (9, 'Remolino a', 1000, 23, 'Un planeta recién formado con una atmósfera de hidrógeno y helio, sin signos de vida actualmente.', NULL, 5);
INSERT INTO public.planet VALUES (10, 'Remolino b', 2500, 23, 'Un planeta gigante con anillos prominentes y varias lunas que podrían tener condiciones adecuadas para la vida.', true, 5);
INSERT INTO public.planet VALUES (11, 'Sombrero I', 5500, 28, 'Un planeta con una atmósfera rica en metano y lagos de hidrocarburos líquidos.', NULL, 4);
INSERT INTO public.planet VALUES (12, 'Sombrero II', 6200, 28, 'Un planeta helado con un núcleo caliente, lo que podría permitir océanos subterráneos.', NULL, 4);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Ortodox', 1.5);
INSERT INTO public.satellite VALUES (2, 'Tesla', 1.5);
INSERT INTO public.satellite VALUES (3, 'Mywipp', 1.5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4600, NULL, 'Una estrella de tipo espectral G2V, una enana amarilla, y la estrella más importante para nosotros ya que es la fuente principal de energía para la vida en la Tierra.', true, 1);
INSERT INTO public.star VALUES (2, 'Variable de Hubble', NULL, 2.537, 'Una estrella variable cefeida, V1, cuya observación ayudó a Edwin Hubble a demostrar que Andrómeda es una galaxia fuera de la Vía Láctea, cambiando la percepción del universo.', NULL, 2);
INSERT INTO public.star VALUES (3, 'M33-1', NULL, 2.73, 'Una de las estrellas más brillantes en la galaxia del Triángulo. M33-1 es una estrella supergigante azul, muy luminosa y masiva, utilizada para estudios de la estructura y composición de M33.', NULL, 3);
INSERT INTO public.star VALUES (4, 'SN 2005cs', NULL, 23, 'Una supernova de tipo II descubierta en 2005. Las supernovas proporcionan información valiosa sobre la muerte de estrellas masivas y la formación de elementos pesados.', NULL, 5);
INSERT INTO public.star VALUES (5, 'V1 (supergigante azul)', NULL, 12, 'Una supergigante azul y una de las estrellas más brillantes de M81. Estas estrellas masivas son cruciales para estudiar la formación estelar y la evolución galáctica.', NULL, 6);
INSERT INTO public.star VALUES (6, 'Variable RRLyr', NULL, 28, 'Una estrella variable tipo RR Lyrae, utilizada para medir distancias galácticas debido a su luminosidad intrínseca bien definida.', NULL, 4);


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
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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