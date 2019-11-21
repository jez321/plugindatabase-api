--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 11.3

-- Started on 2019-11-21 23:34:22

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
-- TOC entry 196 (class 1259 OID 16385)
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
-- TOC entry 197 (class 1259 OID 16391)
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
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 197
-- Name: category_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_category_seq OWNED BY public.category.id_category;


--
-- TOC entry 198 (class 1259 OID 16393)
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
-- TOC entry 199 (class 1259 OID 16399)
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
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 199
-- Name: company_id_company_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_id_company_seq OWNED BY public.company.id_company;


--
-- TOC entry 200 (class 1259 OID 16401)
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
-- TOC entry 201 (class 1259 OID 16407)
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
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 201
-- Name: deal_id_deal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deal_id_deal_seq OWNED BY public.deal.id_deal;


--
-- TOC entry 202 (class 1259 OID 16409)
-- Name: deal_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deal_tag (
    id_tag integer NOT NULL,
    id_deal integer NOT NULL
);


ALTER TABLE public.deal_tag OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16412)
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
-- TOC entry 204 (class 1259 OID 16418)
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
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 204
-- Name: link_id_link_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.link_id_link_seq OWNED BY public.link.id_link;


--
-- TOC entry 210 (class 1259 OID 16463)
-- Name: lowest_prices; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.lowest_prices AS
 SELECT d.id_plugin,
    d.price
   FROM ( SELECT deal.id_plugin,
            min(deal.price) AS price
           FROM public.deal
          GROUP BY deal.id_plugin) d;


ALTER TABLE public.lowest_prices OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16420)
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
-- TOC entry 206 (class 1259 OID 16426)
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
-- TOC entry 207 (class 1259 OID 16429)
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
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 207
-- Name: plugin_id_plugin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.plugin_id_plugin_seq OWNED BY public.plugin.id_plugin;


--
-- TOC entry 208 (class 1259 OID 16431)
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
-- TOC entry 209 (class 1259 OID 16434)
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    id_tag integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- TOC entry 2836 (class 2604 OID 16440)
-- Name: category id_category; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id_category SET DEFAULT nextval('public.category_id_category_seq'::regclass);


--
-- TOC entry 2837 (class 2604 OID 16441)
-- Name: company id_company; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company ALTER COLUMN id_company SET DEFAULT nextval('public.company_id_company_seq'::regclass);


--
-- TOC entry 2838 (class 2604 OID 16442)
-- Name: deal id_deal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal ALTER COLUMN id_deal SET DEFAULT nextval('public.deal_id_deal_seq'::regclass);


--
-- TOC entry 2839 (class 2604 OID 16443)
-- Name: link id_link; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link ALTER COLUMN id_link SET DEFAULT nextval('public.link_id_link_seq'::regclass);


--
-- TOC entry 2840 (class 2604 OID 16444)
-- Name: plugin id_plugin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin ALTER COLUMN id_plugin SET DEFAULT nextval('public.plugin_id_plugin_seq'::regclass);


--
-- TOC entry 2842 (class 2606 OID 16446)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id_category);


--
-- TOC entry 2844 (class 2606 OID 16448)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id_company);


--
-- TOC entry 2846 (class 2606 OID 16450)
-- Name: deal deal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal
    ADD CONSTRAINT deal_pkey PRIMARY KEY (id_deal);


--
-- TOC entry 2848 (class 2606 OID 16452)
-- Name: deal_tag deal_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deal_tag
    ADD CONSTRAINT deal_tag_pkey PRIMARY KEY (id_tag, id_deal);


--
-- TOC entry 2850 (class 2606 OID 16454)
-- Name: link link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.link
    ADD CONSTRAINT link_pkey PRIMARY KEY (id_link);


--
-- TOC entry 2854 (class 2606 OID 16456)
-- Name: plugin_category plugin_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_category
    ADD CONSTRAINT plugin_category_pkey PRIMARY KEY (id_plugin, id_category);


--
-- TOC entry 2856 (class 2606 OID 16458)
-- Name: plugin_link plugin_link_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin_link
    ADD CONSTRAINT plugin_link_pkey PRIMARY KEY (id_plugin, id_link);


--
-- TOC entry 2852 (class 2606 OID 16460)
-- Name: plugin plugin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.plugin
    ADD CONSTRAINT plugin_pkey PRIMARY KEY (id_plugin);


--
-- TOC entry 2858 (class 2606 OID 16462)
-- Name: tag tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id_tag);


-- Completed on 2019-11-21 23:34:24

--
-- PostgreSQL database dump complete
--

