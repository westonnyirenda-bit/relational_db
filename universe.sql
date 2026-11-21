--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    galaxy_types character varying(100) NOT NULL,
    description text,
    age_in_million_of_years integer,
    number_of_stars integer,
    is_active boolean
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
    planet_id integer,
    name character varying(100) NOT NULL,
    moon_type character varying(100) NOT NULL,
    description text,
    distance_from_planet integer,
    mass integer,
    radius numeric(5,3),
    has_artmosphere boolean
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
    star_id integer,
    name character varying(100) NOT NULL,
    planet_type character varying(100) NOT NULL,
    description text,
    distance_from_star integer,
    number_of_moons integer,
    temperature numeric(5,3),
    rotation_period numeric(9,2),
    has_artmosphere boolean
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
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    star_id integer,
    name character varying(100) NOT NULL,
    description character varying(100) NOT NULL,
    number_of_planets integer,
    discovery_data date
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying(100) NOT NULL,
    star_type character varying(100) NOT NULL,
    description text,
    distance_from_earth integer,
    number_of_stars integer,
    temperature numeric(5,3),
    is_visible_to_naked_eye boolean
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
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'The galaxy containing our Solar System and billions of stars.', 13600, 200000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The nearest major galaxy to the Milky Way.', 10000, 1000000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'A spiral galaxy located in the Local Group.', 12000, 40000, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 'Spiral', 'A grand design spiral galaxy with prominent spiral arms.', 13000, 100000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Lenticular', 'A galaxy famous for its bright central bulge and dust lane.', 13000, 800000, true);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Irregular', 'A satellite galaxy of the Milky Way with active star formation.', 13000, 30000, true);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elliptical', 'A giant elliptical galaxy containing a supermassive black hole.', 13000, 1000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 'Natural Satellite', 'Earths only natural satellite, responsible for ocean tides and stabilizing Earths axial tilt.', 384400, 2100000000, 1.737, false);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 'Natural Satellite', 'The larger and closer of the two moons of Mars, with an irregular shape.', 9376, 1065000000, 0.011, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Natural Satellite', 'The smaller and more distant moon of Mars, with a smooth appearance.', 23463, 1476000000, 0.006, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Volcanic Moon', 'A highly volcanic moon of Jupiter with hundreds of active volcanoes.', 421700, 1893200000, 1.822, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Icy Moon', 'An icy moon believed to contain a vast subsurface ocean beneath its frozen crust.', 671100, 1480000000, 1.561, false);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'Natural Satellite', 'The largest moon in the Solar System and the only known moon with its own magnetic field.', 1070400, 1482000000, 2.634, true);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 'Icy Moon', 'A heavily cratered moon of Jupiter with an ancient surface.', 1882700, 1076000000, 2.410, false);
INSERT INTO public.moon VALUES (8, 6, 'Titan', 'Atmospheric Moon', 'Saturns largest moon, featuring lakes of liquid methane and a thick nitrogen atmosphere.', 1221870, 1345000000, 2.575, true);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 'Icy Moon', 'An icy moon known for its water-rich plumes and possible subsurface ocean.', 238000, 1080000000, 0.252, false);
INSERT INTO public.moon VALUES (10, 6, 'Rhea', 'Natural Satellite', 'The second-largest moon of Saturn, with a heavily cratered icy surface.', 527000, 1306000000, 0.764, false);
INSERT INTO public.moon VALUES (11, 6, 'Iapetus', 'Natural Satellite', 'A moon of Saturn known for its contrasting bright and dark hemispheres.', 3560800, 1806000000, 0.735, false);
INSERT INTO public.moon VALUES (12, 6, 'Mimas', 'Natural Satellite', 'A small icy moon of Saturn recognized by its large Herschel impact crater.', 185520, 1374900000, 0.198, false);
INSERT INTO public.moon VALUES (13, 7, 'Titania', 'Natural Satellite', 'The largest moon of Uranus, featuring large canyons and ancient impact craters.', 435910, 1352700000, 0.789, false);
INSERT INTO public.moon VALUES (14, 7, 'Oberon', 'Natural Satellite', 'A heavily cratered outer moon of Uranus with a dark icy surface.', 583520, 1301400000, 0.761, false);
INSERT INTO public.moon VALUES (15, 7, 'Ariel', 'Natural Satellite', 'An icy moon of Uranus with valleys, canyons and relatively young surface features.', 190900, 1353000000, 0.579, false);
INSERT INTO public.moon VALUES (16, 7, 'Umbriel', 'Natural Satellite', 'A dark icy moon of Uranus with a heavily cratered surface.', 266000, 1172000000, 0.585, false);
INSERT INTO public.moon VALUES (17, 8, 'Triton', 'Captured Moon', 'Neptunes largest moon, believed to be a captured Kuiper Belt object with nitrogen geysers.', 354800, 1140000000, 1.353, true);
INSERT INTO public.moon VALUES (18, 8, 'Nereid', 'Natural Satellite', 'An irregular moon of Neptune with an unusually eccentric orbit.', 5513400, 1310000000, 0.170, false);
INSERT INTO public.moon VALUES (19, 8, 'Proteus', 'Natural Satellite', 'The second-largest known moon of Neptune, with an irregular shape and heavily cratered surface.', 117647, 1440000000, 0.210, false);
INSERT INTO public.moon VALUES (20, 8, 'Larissa', 'Natural Satellite', 'A small irregular inner moon of Neptune discovered through stellar occultation observations.', 73548, 1420000000, 0.097, false);
INSERT INTO public.moon VALUES (21, 8, 'Hippocamp', 'Natural Satellite', 'A small inner moon of Neptune discovered in images from the Hubble Space Telescope.', 105283, 1500000000, 0.017, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 'The smallest planet in the Solar System and the closest planet to the Sun.', 58, 0, 0.167, 1407.60, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 'A rocky planet with a dense carbon dioxide atmosphere and extremely high surface temperatures.', 108, 0, 0.464, 5832.50, true);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 'The only known planet to support life, with liquid water and a protective atmosphere.', 150, 1, 0.288, 23.93, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 'Known as the Red Planet, Mars has a thin atmosphere and evidence of ancient water.', 228, 2, 0.210, 24.62, true);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', 'The largest planet in the Solar System, famous for its Great Red Spot.', 778, 95, 0.165, 9.93, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', 'A gas giant known for its spectacular system of rings.', 1430, 146, 0.134, 10.70, true);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', 'An ice giant that rotates on its side and has a pale blue appearance.', 2870, 28, 0.076, 17.24, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', 'A distant blue ice giant known for its strong winds and cold atmosphere.', 4500, 16, 0.072, 16.11, true);
INSERT INTO public.planet VALUES (9, 6, 'HD 219134 b', 'Super-Earth', 'A rocky exoplanet orbiting the nearby star HD 219134.', 6, 0, 0.700, 8.00, false);
INSERT INTO public.planet VALUES (10, 6, 'HD 219134 c', 'Super-Earth', 'A super-Earth exoplanet orbiting the star HD 219134.', 7, 0, 0.500, 6.80, false);
INSERT INTO public.planet VALUES (11, 7, 'Proxima Centauri b', 'Super-Earth', 'An exoplanet orbiting Proxima Centauri within its habitable zone.', 7, 0, 0.234, 11.19, true);
INSERT INTO public.planet VALUES (12, 8, 'Kepler-22b', 'Super-Earth', 'An exoplanet discovered orbiting a Sun-like star in the habitable zone.', 1270000, 0, 0.295, 290.00, true);
INSERT INTO public.planet VALUES (13, 2, 'HD 40307 g', 'Super-Earth', 'A candidate super-Earth exoplanet orbiting the star HD 40307.', 42, 0, 0.280, 197.80, true);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 1, 'Solar System', 'Our planetary system containing the Sun and eight planets.', 8, '1543-02-24');
INSERT INTO public.solar_system VALUES (2, 6, 'HD 219134 System', 'A planetary system containing multiple confirmed exoplanets.', 5, '2015-07-30');
INSERT INTO public.solar_system VALUES (3, 7, 'Proxima Centauri System', 'A nearby planetary system containing planets orbiting Proxima Centauri.', 2, '2016-08-24');
INSERT INTO public.solar_system VALUES (4, 8, 'Kepler-22 System', 'A planetary system known for the potentially habitable exoplanet Kepler-22b.', 1, '2011-12-05');
INSERT INTO public.solar_system VALUES (5, 2, 'Sirius System', 'A binary star system consisting of Sirius A and Sirius B.', 0, '1718-01-01');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G-Type Main Sequence', 'The central star of our Solar System and the primary source of energy for Earth.', 0, 1, 5.778, true);
INSERT INTO public.star VALUES (2, 2, 'Alpheratz', 'B-Type Main Sequence', 'A bright star associated with the Andromeda constellation.', 97, 2, 13.800, true);
INSERT INTO public.star VALUES (3, 3, 'M33-1', 'Blue Giant', 'A sample blue giant star located in the Triangulum Galaxy.', 2730000, 1, 12.000, false);
INSERT INTO public.star VALUES (4, 4, 'M51-1', 'Blue Supergiant', 'A sample blue supergiant star in the Whirlpool Galaxy.', 23000000, 1, 20.000, false);
INSERT INTO public.star VALUES (5, 5, 'Sombrero-1', 'Red Giant', 'A sample red giant star located in the Sombrero Galaxy.', 29000000, 1, 4.500, false);
INSERT INTO public.star VALUES (6, 6, 'LMC-1', 'Blue Supergiant', 'A bright blue supergiant star in the Large Magellanic Cloud.', 163000, 1, 15.000, false);
INSERT INTO public.star VALUES (7, 7, 'M87-1', 'Main Sequence', 'A sample star located in the giant elliptical galaxy Messier 87.', 53000000, 1, 6.000, false);
INSERT INTO public.star VALUES (8, 1, 'Alpha Centauri A', 'G-Type Main Sequence', 'A Sun-like star in the Alpha Centauri star system.', 4, 1, 5.790, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 5, true);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy uq_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_name UNIQUE (name);


--
-- Name: moon uq_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_name UNIQUE (name);


--
-- Name: planet uq_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_name UNIQUE (name);


--
-- Name: solar_system uq_solar_system_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT uq_solar_system_name UNIQUE (name);


--
-- Name: star uq_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_name UNIQUE (name);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_stat_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_stat_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

