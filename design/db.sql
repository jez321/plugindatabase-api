--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4 (Ubuntu 11.4-0ubuntu0.19.04.1)
-- Dumped by pg_dump version 11.3

-- Started on 2019-07-08 21:14:06

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

DROP DATABASE plugin_database;
--
-- TOC entry 2984 (class 1262 OID 16462)
-- Name: plugin_database; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE plugin_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE plugin_database OWNER TO postgres;

\connect plugin_database

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

SET default_with_oids = false;

--
-- TOC entry 202 (class 1259 OID 16489)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id_category integer NOT NULL,
    name text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16487)
-- Name: category_id_category_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_category_seq OWNER TO postgres;

--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 201
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_category_seq OWNED BY public.category.id_category;


--
-- TOC entry 207 (class 1259 OID 16516)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id_company integer NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16514)
-- Name: company_id_company_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_id_company_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.company_id_company_seq OWNER TO postgres;

--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 206
-- Name: company_id_company_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_company_seq OWNED BY public.company.id_company;


--
-- TOC entry 205 (class 1259 OID 16505)
-- Name: deal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deal (
    id_deal integer NOT NULL,
    id_link integer NOT NULL,
    description text NOT NULL,
    price numeric(8,2) NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    id_plugin integer
);


ALTER TABLE public.deal OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16503)
-- Name: deal_id_deal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deal_id_deal_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deal_id_deal_seq OWNER TO postgres;

--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 204
-- Name: deal_id_deal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_id_deal_seq OWNED BY public.deal.id_deal;


--
-- TOC entry 209 (class 1259 OID 16536)
-- Name: deal_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deal_tag (
    id_tag integer NOT NULL,
    id_deal integer NOT NULL
);


ALTER TABLE public.deal_tag OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 16465)
-- Name: link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.link (
    id_link integer NOT NULL,
    title text NOT NULL,
    url text NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.link OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16463)
-- Name: link_id_link_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.link_id_link_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.link_id_link_seq OWNER TO postgres;

--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 196
-- Name: link_id_link_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.link_id_link_seq OWNED BY public.link.id_link;


--
-- TOC entry 199 (class 1259 OID 16476)
-- Name: plugin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plugin (
    id_plugin integer NOT NULL,
    id_company integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.plugin OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16498)
-- Name: plugin_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plugin_category (
    id_plugin integer NOT NULL,
    id_category integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.plugin_category OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16474)
-- Name: plugin_id_plugin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.plugin_id_plugin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plugin_id_plugin_seq OWNER TO postgres;

--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 198
-- Name: plugin_id_plugin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plugin_id_plugin_seq OWNED BY public.plugin.id_plugin;


--
-- TOC entry 200 (class 1259 OID 16482)
-- Name: plugin_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.plugin_link (
    id_plugin integer NOT NULL,
    id_link integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.plugin_link OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16528)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    id_tag integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 2823 (class 2604 OID 16492)
-- Name: category id_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id_category SET DEFAULT nextval('public.category_id_category_seq'::regclass);


--
-- TOC entry 2825 (class 2604 OID 16519)
-- Name: company id_company; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id_company SET DEFAULT nextval('public.company_id_company_seq'::regclass);


--
-- TOC entry 2824 (class 2604 OID 16508)
-- Name: deal id_deal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN id_deal SET DEFAULT nextval('public.deal_id_deal_seq'::regclass);


--
-- TOC entry 2821 (class 2604 OID 16468)
-- Name: link id_link; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link ALTER COLUMN id_link SET DEFAULT nextval('public.link_id_link_seq'::regclass);


--
-- TOC entry 2822 (class 2604 OID 16479)
-- Name: plugin id_plugin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin ALTER COLUMN id_plugin SET DEFAULT nextval('public.plugin_id_plugin_seq'::regclass);


--
-- TOC entry 2971 (class 0 OID 16489)
-- Dependencies: 202
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id_category, name, created, updated) FROM stdin;
1	EQ	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
2	Compressor	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
4	Reverb	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
8	Delay	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
16	Distortion	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
32	Monitoring	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
64	Channel strip	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
128	Synth	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
256	Pitch	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
512	Amp simulation	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
1024	Drums	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
2048	Strings	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
4096	Keys	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
8192	Bass	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
16384	Guitar	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
32768	Ethnic	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
65536	Other	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
\.


--
-- TOC entry 2976 (class 0 OID 16516)
-- Dependencies: 207
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company (id_company, name, url, created, updated) FROM stdin;
1	Steinberg	https://www.steinberg.net/	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
2	Scuffham	https://www.scuffhamamps.com/	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
\.


--
-- TOC entry 2974 (class 0 OID 16505)
-- Dependencies: 205
-- Data for Name: deal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deal (id_deal, id_link, description, price, start_date, end_date, created, updated, id_plugin) FROM stdin;
1	1	30% off	319.99	2019-07-01 00:00:01+00	2019-07-31 23:59:59+00	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00	1
2	2	30% off	69.99	2019-07-01 00:00:01+00	2019-07-31 23:59:59+00	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00	2
4	3	$30 off S-Gear	99.00	2019-07-07 00:00:01+00	\N	2019-07-07 05:12:42+00	2019-07-07 05:12:42+00	3
\.


--
-- TOC entry 2978 (class 0 OID 16536)
-- Dependencies: 209
-- Data for Name: deal_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.deal_tag (id_tag, id_deal) FROM stdin;
1	1
1	2
512	3
\.


--
-- TOC entry 2966 (class 0 OID 16465)
-- Dependencies: 197
-- Data for Name: link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.link (id_link, title, url, created, updated) FROM stdin;
1	Steinberg - WaveLab 9.5 Pro	https://www.steinberg.net/en/promotion/wavelab_offer.html	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
2	Steinberg - WaveLab 9.5 Elements	https://www.steinberg.net/en/promotion/wavelab_offer.html	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00
3	Scuffham - S-Gear	https://www.scuffhamamps.com/product/s-gear	2019-07-07 05:12:42+00	2019-07-07 05:12:42+00
\.


--
-- TOC entry 2968 (class 0 OID 16476)
-- Dependencies: 199
-- Data for Name: plugin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plugin (id_plugin, id_company, created, updated, name) FROM stdin;
1	1	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00	WaveLab Pro 9.5
2	1	2019-07-06 05:12:42+00	2019-07-06 05:12:42+00	WaveLab Elements 9.5
3	2	2019-07-07 05:12:42+00	2019-07-07 05:12:42+00	S-Gear
\.


--
-- TOC entry 2972 (class 0 OID 16498)
-- Dependencies: 203
-- Data for Name: plugin_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plugin_category (id_plugin, id_category, created, updated) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 16482)
-- Dependencies: 200
-- Data for Name: plugin_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.plugin_link (id_plugin, id_link, created, updated) FROM stdin;
\.


--
-- TOC entry 2977 (class 0 OID 16528)
-- Dependencies: 208
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag (id_tag, name) FROM stdin;
1	Upgrades included
\.


--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 201
-- Name: category_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_category_seq', 1, true);


--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 206
-- Name: company_id_company_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_id_company_seq', 1, true);


--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 204
-- Name: deal_id_deal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deal_id_deal_seq', 4, true);


--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 196
-- Name: link_id_link_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.link_id_link_seq', 2, true);


--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 198
-- Name: plugin_id_plugin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.plugin_id_plugin_seq', 2, true);


--
-- TOC entry 2833 (class 2606 OID 16497)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);


--
-- TOC entry 2839 (class 2606 OID 16524)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id_company);


--
-- TOC entry 2837 (class 2606 OID 16513)
-- Name: deal deal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_pkey PRIMARY KEY (id_deal);


--
-- TOC entry 2843 (class 2606 OID 16540)
-- Name: deal_tag deal_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal_tag
    ADD CONSTRAINT deal_tag_pkey PRIMARY KEY (id_tag, id_deal);


--
-- TOC entry 2827 (class 2606 OID 16473)
-- Name: link link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id_link);


--
-- TOC entry 2835 (class 2606 OID 16502)
-- Name: plugin_category plugin_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_category
    ADD CONSTRAINT plugin_category_pkey PRIMARY KEY (id_plugin, id_category);


--
-- TOC entry 2831 (class 2606 OID 16486)
-- Name: plugin_link plugin_link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_link
    ADD CONSTRAINT plugin_link_pkey PRIMARY KEY (id_plugin, id_link);


--
-- TOC entry 2829 (class 2606 OID 16481)
-- Name: plugin plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin
    ADD CONSTRAINT plugin_pkey PRIMARY KEY (id_plugin);


--
-- TOC entry 2841 (class 2606 OID 16535)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id_tag);


-- Completed on 2019-07-08 21:14:07

--
-- PostgreSQL database dump complete
--

