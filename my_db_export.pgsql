--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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

--
-- Name: geofix; Type: SCHEMA; Schema: -; Owner: yhoezt
--

CREATE SCHEMA geofix;


ALTER SCHEMA geofix OWNER TO yhoezt;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: yhoezt
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO yhoezt;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: yhoezt
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA geofix;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA geofix;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: geofix; Owner: yhoezt
--

CREATE TABLE geofix.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE geofix.alembic_version OWNER TO yhoezt;

--
-- Name: be_python; Type: TABLE; Schema: geofix; Owner: yhoezt
--

CREATE TABLE geofix.be_python (
    id integer NOT NULL,
    name character varying(30),
    latitude double precision,
    longtude double precision,
    geo geofix.geometry(Point,4326)
);


ALTER TABLE geofix.be_python OWNER TO yhoezt;

--
-- Name: be_python_id_seq; Type: SEQUENCE; Schema: geofix; Owner: yhoezt
--

CREATE SEQUENCE geofix.be_python_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geofix.be_python_id_seq OWNER TO yhoezt;

--
-- Name: be_python_id_seq; Type: SEQUENCE OWNED BY; Schema: geofix; Owner: yhoezt
--

ALTER SEQUENCE geofix.be_python_id_seq OWNED BY geofix.be_python.id;


--
-- Name: id_seq; Type: SEQUENCE; Schema: public; Owner: yhoezt
--

CREATE SEQUENCE public.id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq OWNER TO yhoezt;

--
-- Name: be_python id; Type: DEFAULT; Schema: geofix; Owner: yhoezt
--

ALTER TABLE ONLY geofix.be_python ALTER COLUMN id SET DEFAULT nextval('geofix.be_python_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: geofix; Owner: yhoezt
--

COPY geofix.alembic_version (version_num) FROM stdin;
\.


--
-- Data for Name: be_python; Type: TABLE DATA; Schema: geofix; Owner: yhoezt
--

COPY geofix.be_python (id, name, latitude, longtude, geo) FROM stdin;
2	Seattle	47.608013	-122.335167	0101000020E6100000B3EC496073955EC07C45B75ED3CD4740
3	Sacramento	38.575764	-121.478851	0101000020E61000000B2AAA7EA55E5EC0691B7FA2B2494340
4	Oakland	37.804363	-122.271111	0101000020E61000007FA5F3E159915EC0658EE55DF5E64240
5	Los Angeles	34.052235	-118.243683	0101000020E6100000D6E59480988F5DC0715AF0A2AF064140
6	Alameda	37.7652	-122.2416	0101000020E6100000ACADD85F768F5EC01973D712F2E14240
7	jakarta	37.804363	-122.271111	0101000020E61000007FA5F3E159915EC0658EE55DF5E64240
8	jakarta1	36.804363	-121.271111	0101000020E61000007FA5F3E159515EC0658EE55DF5664240
9	jakarta2	35.804363	-121.171111	0101000020E6100000183F8D7BF34A5EC0658EE55DF5E64140
10	jakarta3	35.604363	-121.170111	0101000020E6100000276C3F19E34A5EC0CBF44BC45BCD4140
11	jakarta4	35.504363	-121.160111	0101000020E6100000B62E35423F4A5EC0FE277FF78EC04140
12	jakarta5	34.504363	-122.160111	0101000020E6100000B62E35423F8A5EC0FE277FF78E404140
13	jakarta6	33.504363	-121.160111	0101000020E6100000B62E35423F4A5EC0FE277FF78EC04040
15	jakarta8	32.404363	-121.110211	0101000020E6100000352A70B20D475EC0315BB22AC2334040
16	jakarta9	32.304363	-120.110211	0101000020E6100000352A70B20D075EC0658EE55DF5264040
17	jakarta10	33.304363	-121.110211	0101000020E6100000352A70B20D475EC0658EE55DF5A64040
18	jakarta11	33.324363	-121.111211	0101000020E610000026FDBD141E475EC027840EBA84A94040
19	jakarta12	31.324363	-120.111211	0101000020E610000026FDBD141E075EC04F081D7409533F40
20	jakarta13	31.325363	-120.110211	0101000020E6100000352A70B20D075EC0155454FD4A533F40
21	jakarta14	32.325363	-121.110211	0101000020E6100000352A70B20D475EC00B2AAA7EA5294040
22	jakarta16	37.773872	-122.43119	0101000020E61000002F17F19D989B5EC022A5D93C0EE34240
1	San Francisco	37.773972	-122.42129	0101000020E61000007008556AF69A5EC08602B68311E34240
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: geofix; Owner: yhoezt
--

COPY geofix.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: geofix; Owner: yhoezt
--

COPY geofix.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: geofix; Owner: postgres
--

COPY geofix.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: be_python_id_seq; Type: SEQUENCE SET; Schema: geofix; Owner: yhoezt
--

SELECT pg_catalog.setval('geofix.be_python_id_seq', 22, true);


--
-- Name: id_seq; Type: SEQUENCE SET; Schema: public; Owner: yhoezt
--

SELECT pg_catalog.setval('public.id_seq', 7, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: geofix; Owner: yhoezt
--

ALTER TABLE ONLY geofix.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: be_python be_python_pkey; Type: CONSTRAINT; Schema: geofix; Owner: yhoezt
--

ALTER TABLE ONLY geofix.be_python
    ADD CONSTRAINT be_python_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

