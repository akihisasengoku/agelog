--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ages; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE ages (
    id integer NOT NULL,
    shop_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ages OWNER TO agelog;

--
-- Name: ages_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE ages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ages_id_seq OWNER TO agelog;

--
-- Name: ages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE ages_id_seq OWNED BY ages.id;


--
-- Name: areas; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE areas (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.areas OWNER TO agelog;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO agelog;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO agelog;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO agelog;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: microposts; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE microposts (
    id integer NOT NULL,
    user_id integer,
    content text,
    image text,
    microstars_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    shop_id integer
);


ALTER TABLE public.microposts OWNER TO agelog;

--
-- Name: microposts_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE microposts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.microposts_id_seq OWNER TO agelog;

--
-- Name: microposts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE microposts_id_seq OWNED BY microposts.id;


--
-- Name: microstars; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE microstars (
    id integer NOT NULL,
    micropost_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.microstars OWNER TO agelog;

--
-- Name: microstars_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE microstars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.microstars_id_seq OWNER TO agelog;

--
-- Name: microstars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE microstars_id_seq OWNED BY microstars.id;


--
-- Name: mypages; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE mypages (
    id integer NOT NULL,
    name character varying,
    title character varying DEFAULT 'マイページタイトル'::character varying,
    sex character varying,
    description text DEFAULT 'マイページ説明文'::text,
    coverimage text,
    icon text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.mypages OWNER TO agelog;

--
-- Name: mypages_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE mypages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mypages_id_seq OWNER TO agelog;

--
-- Name: mypages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE mypages_id_seq OWNED BY mypages.id;


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE relationships (
    id integer NOT NULL,
    follower_id integer,
    followed_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.relationships OWNER TO agelog;

--
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationships_id_seq OWNER TO agelog;

--
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE relationships_id_seq OWNED BY relationships.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO agelog;

--
-- Name: shop_areas; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE shop_areas (
    id integer NOT NULL,
    shop_id integer,
    area_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shop_areas OWNER TO agelog;

--
-- Name: shop_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE shop_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_areas_id_seq OWNER TO agelog;

--
-- Name: shop_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE shop_areas_id_seq OWNED BY shop_areas.id;


--
-- Name: shop_categories; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE shop_categories (
    id integer NOT NULL,
    shop_id integer,
    category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shop_categories OWNER TO agelog;

--
-- Name: shop_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE shop_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shop_categories_id_seq OWNER TO agelog;

--
-- Name: shop_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE shop_categories_id_seq OWNED BY shop_categories.id;


--
-- Name: shops; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE shops (
    id integer NOT NULL,
    name character varying,
    address character varying,
    latitude double precision,
    longitude double precision,
    mainimage text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.shops OWNER TO agelog;

--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE shops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO agelog;

--
-- Name: shops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE shops_id_seq OWNED BY shops.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying,
    token character varying
);


ALTER TABLE public.users OWNER TO agelog;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO agelog;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: wants; Type: TABLE; Schema: public; Owner: agelog; Tablespace: 
--

CREATE TABLE wants (
    id integer NOT NULL,
    shop_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.wants OWNER TO agelog;

--
-- Name: wants_id_seq; Type: SEQUENCE; Schema: public; Owner: agelog
--

CREATE SEQUENCE wants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wants_id_seq OWNER TO agelog;

--
-- Name: wants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: agelog
--

ALTER SEQUENCE wants_id_seq OWNED BY wants.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY ages ALTER COLUMN id SET DEFAULT nextval('ages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY microposts ALTER COLUMN id SET DEFAULT nextval('microposts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY microstars ALTER COLUMN id SET DEFAULT nextval('microstars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY mypages ALTER COLUMN id SET DEFAULT nextval('mypages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY relationships ALTER COLUMN id SET DEFAULT nextval('relationships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY shop_areas ALTER COLUMN id SET DEFAULT nextval('shop_areas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY shop_categories ALTER COLUMN id SET DEFAULT nextval('shop_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY wants ALTER COLUMN id SET DEFAULT nextval('wants_id_seq'::regclass);


--
-- Data for Name: ages; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY ages (id, shop_id, user_id, created_at, updated_at) FROM stdin;
1	1	1	2016-07-21 22:50:14.373607	2016-07-21 22:50:14.373607
2	2	1	2016-07-21 22:50:14.410358	2016-07-21 22:50:14.410358
3	3	1	2016-07-21 22:50:14.428592	2016-07-21 22:50:14.428592
4	4	1	2016-07-21 22:50:14.444627	2016-07-21 22:50:14.444627
5	5	1	2016-07-21 22:50:14.46028	2016-07-21 22:50:14.46028
6	6	1	2016-07-21 22:50:14.476449	2016-07-21 22:50:14.476449
7	7	1	2016-07-21 22:50:14.491556	2016-07-21 22:50:14.491556
8	8	1	2016-07-21 22:50:14.506577	2016-07-21 22:50:14.506577
9	9	1	2016-07-21 22:50:14.521909	2016-07-21 22:50:14.521909
10	10	1	2016-07-21 22:50:14.538732	2016-07-21 22:50:14.538732
\.


--
-- Name: ages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('ages_id_seq', 10, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY areas (id, name, created_at, updated_at) FROM stdin;
1	鶴舞	2016-07-21 22:49:18.469429	2016-07-21 22:49:18.469429
2	吹上	2016-07-21 22:49:18.489267	2016-07-21 22:49:18.489267
3	御器所	2016-07-21 22:49:18.494851	2016-07-21 22:49:18.494851
4	荒畑	2016-07-21 22:49:18.500204	2016-07-21 22:49:18.500204
5	千種	2016-07-21 22:49:18.505726	2016-07-21 22:49:18.505726
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('areas_id_seq', 5, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY categories (id, name, created_at, updated_at) FROM stdin;
1	ラーメン	2016-07-21 22:49:18.52057	2016-07-21 22:49:18.52057
2	まぜそば	2016-07-21 22:49:18.526704	2016-07-21 22:49:18.526704
3	つけ麺	2016-07-21 22:49:18.532424	2016-07-21 22:49:18.532424
4	チャーハン	2016-07-21 22:49:18.538423	2016-07-21 22:49:18.538423
5	餃子	2016-07-21 22:49:18.544376	2016-07-21 22:49:18.544376
6	そば	2016-07-21 22:49:18.549614	2016-07-21 22:49:18.549614
7	うどん	2016-07-21 22:49:18.554882	2016-07-21 22:49:18.554882
8	中華	2016-07-21 22:49:18.560139	2016-07-21 22:49:18.560139
9	定食	2016-07-21 22:49:18.565369	2016-07-21 22:49:18.565369
10	カレー	2016-07-21 22:49:18.571511	2016-07-21 22:49:18.571511
11	カフェ・喫茶店	2016-07-21 22:49:18.578245	2016-07-21 22:49:18.578245
12	イタリアン	2016-07-21 22:49:18.584012	2016-07-21 22:49:18.584012
13	ジャンクフード	2016-07-21 22:49:18.589773	2016-07-21 22:49:18.589773
14	ハンバーガー	2016-07-21 22:49:18.596496	2016-07-21 22:49:18.596496
15	焼肉	2016-07-21 22:49:18.604073	2016-07-21 22:49:18.604073
16	どんぶり	2016-07-21 22:49:18.611364	2016-07-21 22:49:18.611364
17	寿司	2016-07-21 22:49:18.617874	2016-07-21 22:49:18.617874
18	コンビニ	2016-07-21 22:49:18.624019	2016-07-21 22:49:18.624019
19	軽食	2016-07-21 22:49:18.630633	2016-07-21 22:49:18.630633
20	ファミレス	2016-07-21 22:49:18.636209	2016-07-21 22:49:18.636209
21	手羽先	2016-07-21 22:49:18.641848	2016-07-21 22:49:18.641848
22	揚げ物	2016-07-21 22:49:18.647604	2016-07-21 22:49:18.647604
23	隠れ家	2016-07-21 22:49:18.666083	2016-07-21 22:49:18.666083
24	居酒屋	2016-07-21 22:49:18.672268	2016-07-21 22:49:18.672268
25	焼き鳥	2016-07-21 22:57:25.087449	2016-07-21 22:57:25.087449
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('categories_id_seq', 25, true);


--
-- Data for Name: microposts; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY microposts (id, user_id, content, image, microstars_count, created_at, updated_at, shop_id) FROM stdin;
\.


--
-- Name: microposts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('microposts_id_seq', 1, false);


--
-- Data for Name: microstars; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY microstars (id, micropost_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: microstars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('microstars_id_seq', 1, false);


--
-- Data for Name: mypages; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY mypages (id, name, title, sex, description, coverimage, icon, user_id, created_at, updated_at) FROM stdin;
1	test"1"	マイページタイトル	\N	マイページ説明文	\N	\N	1	2016-07-21 22:50:14.075674	2016-07-21 22:50:14.075674
2	test"2"	マイページタイトル	\N	マイページ説明文	\N	\N	2	2016-07-21 22:50:14.083007	2016-07-21 22:50:14.083007
3	test"3"	マイページタイトル	\N	マイページ説明文	\N	\N	3	2016-07-21 22:50:14.088266	2016-07-21 22:50:14.088266
4	test"4"	マイページタイトル	\N	マイページ説明文	\N	\N	4	2016-07-21 22:50:14.093156	2016-07-21 22:50:14.093156
5	test"5"	マイページタイトル	\N	マイページ説明文	\N	\N	5	2016-07-21 22:50:14.098423	2016-07-21 22:50:14.098423
6	test"6"	マイページタイトル	\N	マイページ説明文	\N	\N	6	2016-07-21 22:50:14.103394	2016-07-21 22:50:14.103394
7	test"7"	マイページタイトル	\N	マイページ説明文	\N	\N	7	2016-07-21 22:50:14.108391	2016-07-21 22:50:14.108391
8	test"8"	マイページタイトル	\N	マイページ説明文	\N	\N	8	2016-07-21 22:50:14.113364	2016-07-21 22:50:14.113364
9	test"9"	マイページタイトル	\N	マイページ説明文	\N	\N	9	2016-07-21 22:50:14.118349	2016-07-21 22:50:14.118349
10	test"10"	マイページタイトル	\N	マイページ説明文	\N	\N	10	2016-07-21 22:50:14.123238	2016-07-21 22:50:14.123238
11	test"11"	マイページタイトル	\N	マイページ説明文	\N	\N	11	2016-07-21 22:50:14.128481	2016-07-21 22:50:14.128481
12	test"12"	マイページタイトル	\N	マイページ説明文	\N	\N	12	2016-07-21 22:50:14.133437	2016-07-21 22:50:14.133437
13	test"13"	マイページタイトル	\N	マイページ説明文	\N	\N	13	2016-07-21 22:50:14.138669	2016-07-21 22:50:14.138669
14	test"14"	マイページタイトル	\N	マイページ説明文	\N	\N	14	2016-07-21 22:50:14.14397	2016-07-21 22:50:14.14397
15	test"15"	マイページタイトル	\N	マイページ説明文	\N	\N	15	2016-07-21 22:50:14.14896	2016-07-21 22:50:14.14896
16	test"16"	マイページタイトル	\N	マイページ説明文	\N	\N	16	2016-07-21 22:50:14.153797	2016-07-21 22:50:14.153797
17	test"17"	マイページタイトル	\N	マイページ説明文	\N	\N	17	2016-07-21 22:50:14.15884	2016-07-21 22:50:14.15884
18	test"18"	マイページタイトル	\N	マイページ説明文	\N	\N	18	2016-07-21 22:50:14.163804	2016-07-21 22:50:14.163804
19	test"19"	マイページタイトル	\N	マイページ説明文	\N	\N	19	2016-07-21 22:50:14.168797	2016-07-21 22:50:14.168797
20	test"20"	マイページタイトル	\N	マイページ説明文	\N	\N	20	2016-07-21 22:50:14.174182	2016-07-21 22:50:14.174182
21	test"21"	マイページタイトル	\N	マイページ説明文	\N	\N	21	2016-07-21 22:50:14.179676	2016-07-21 22:50:14.179676
22	test"22"	マイページタイトル	\N	マイページ説明文	\N	\N	22	2016-07-21 22:50:14.184922	2016-07-21 22:50:14.184922
23	test"23"	マイページタイトル	\N	マイページ説明文	\N	\N	23	2016-07-21 22:50:14.205007	2016-07-21 22:50:14.205007
24	test"24"	マイページタイトル	\N	マイページ説明文	\N	\N	24	2016-07-21 22:50:14.210996	2016-07-21 22:50:14.210996
25	test"25"	マイページタイトル	\N	マイページ説明文	\N	\N	25	2016-07-21 22:50:14.216328	2016-07-21 22:50:14.216328
26	test"26"	マイページタイトル	\N	マイページ説明文	\N	\N	26	2016-07-21 22:50:14.221374	2016-07-21 22:50:14.221374
27	test"27"	マイページタイトル	\N	マイページ説明文	\N	\N	27	2016-07-21 22:50:14.226737	2016-07-21 22:50:14.226737
28	test"28"	マイページタイトル	\N	マイページ説明文	\N	\N	28	2016-07-21 22:50:14.232282	2016-07-21 22:50:14.232282
29	test"29"	マイページタイトル	\N	マイページ説明文	\N	\N	29	2016-07-21 22:50:14.237033	2016-07-21 22:50:14.237033
30	test"30"	マイページタイトル	\N	マイページ説明文	\N	\N	30	2016-07-21 22:50:14.242116	2016-07-21 22:50:14.242116
31	test"31"	マイページタイトル	\N	マイページ説明文	\N	\N	31	2016-07-21 22:50:14.247264	2016-07-21 22:50:14.247264
32	test"32"	マイページタイトル	\N	マイページ説明文	\N	\N	32	2016-07-21 22:50:14.252048	2016-07-21 22:50:14.252048
33	test"33"	マイページタイトル	\N	マイページ説明文	\N	\N	33	2016-07-21 22:50:14.257196	2016-07-21 22:50:14.257196
34	test"34"	マイページタイトル	\N	マイページ説明文	\N	\N	34	2016-07-21 22:50:14.262282	2016-07-21 22:50:14.262282
35	test"35"	マイページタイトル	\N	マイページ説明文	\N	\N	35	2016-07-21 22:50:14.267218	2016-07-21 22:50:14.267218
36	test"36"	マイページタイトル	\N	マイページ説明文	\N	\N	36	2016-07-21 22:50:14.271867	2016-07-21 22:50:14.271867
37	test"37"	マイページタイトル	\N	マイページ説明文	\N	\N	37	2016-07-21 22:50:14.276764	2016-07-21 22:50:14.276764
38	test"38"	マイページタイトル	\N	マイページ説明文	\N	\N	38	2016-07-21 22:50:14.281924	2016-07-21 22:50:14.281924
39	test"39"	マイページタイトル	\N	マイページ説明文	\N	\N	39	2016-07-21 22:50:14.287101	2016-07-21 22:50:14.287101
40	test"40"	マイページタイトル	\N	マイページ説明文	\N	\N	40	2016-07-21 22:50:14.292156	2016-07-21 22:50:14.292156
41	test"41"	マイページタイトル	\N	マイページ説明文	\N	\N	41	2016-07-21 22:50:14.297672	2016-07-21 22:50:14.297672
42	test"42"	マイページタイトル	\N	マイページ説明文	\N	\N	42	2016-07-21 22:50:14.302567	2016-07-21 22:50:14.302567
43	test"43"	マイページタイトル	\N	マイページ説明文	\N	\N	43	2016-07-21 22:50:14.307458	2016-07-21 22:50:14.307458
44	test"44"	マイページタイトル	\N	マイページ説明文	\N	\N	44	2016-07-21 22:50:14.312436	2016-07-21 22:50:14.312436
45	test"45"	マイページタイトル	\N	マイページ説明文	\N	\N	45	2016-07-21 22:50:14.317589	2016-07-21 22:50:14.317589
46	test"46"	マイページタイトル	\N	マイページ説明文	\N	\N	46	2016-07-21 22:50:14.323517	2016-07-21 22:50:14.323517
47	test"47"	マイページタイトル	\N	マイページ説明文	\N	\N	47	2016-07-21 22:50:14.328787	2016-07-21 22:50:14.328787
48	test"48"	マイページタイトル	\N	マイページ説明文	\N	\N	48	2016-07-21 22:50:14.334457	2016-07-21 22:50:14.334457
49	test"49"	マイページタイトル	\N	マイページ説明文	\N	\N	49	2016-07-21 22:50:14.340442	2016-07-21 22:50:14.340442
50	test"50"	マイページタイトル	\N	マイページ説明文	\N	\N	50	2016-07-21 22:50:14.350752	2016-07-21 22:50:14.350752
51	test"1"	マイページタイトル	\N	マイページ説明文	\N	\N	1	2016-07-21 22:54:16.64014	2016-07-21 22:54:16.64014
52	test"2"	マイページタイトル	\N	マイページ説明文	\N	\N	2	2016-07-21 22:54:16.649553	2016-07-21 22:54:16.649553
53	test"3"	マイページタイトル	\N	マイページ説明文	\N	\N	3	2016-07-21 22:54:16.655752	2016-07-21 22:54:16.655752
54	test"4"	マイページタイトル	\N	マイページ説明文	\N	\N	4	2016-07-21 22:54:16.661093	2016-07-21 22:54:16.661093
55	test"5"	マイページタイトル	\N	マイページ説明文	\N	\N	5	2016-07-21 22:54:16.666376	2016-07-21 22:54:16.666376
56	test"6"	マイページタイトル	\N	マイページ説明文	\N	\N	6	2016-07-21 22:54:16.671733	2016-07-21 22:54:16.671733
57	test"7"	マイページタイトル	\N	マイページ説明文	\N	\N	7	2016-07-21 22:54:16.677342	2016-07-21 22:54:16.677342
58	test"8"	マイページタイトル	\N	マイページ説明文	\N	\N	8	2016-07-21 22:54:16.682729	2016-07-21 22:54:16.682729
59	test"9"	マイページタイトル	\N	マイページ説明文	\N	\N	9	2016-07-21 22:54:16.68862	2016-07-21 22:54:16.68862
60	test"10"	マイページタイトル	\N	マイページ説明文	\N	\N	10	2016-07-21 22:54:16.694316	2016-07-21 22:54:16.694316
61	test"11"	マイページタイトル	\N	マイページ説明文	\N	\N	11	2016-07-21 22:54:16.700002	2016-07-21 22:54:16.700002
62	test"12"	マイページタイトル	\N	マイページ説明文	\N	\N	12	2016-07-21 22:54:16.705137	2016-07-21 22:54:16.705137
63	test"13"	マイページタイトル	\N	マイページ説明文	\N	\N	13	2016-07-21 22:54:16.710903	2016-07-21 22:54:16.710903
64	test"14"	マイページタイトル	\N	マイページ説明文	\N	\N	14	2016-07-21 22:54:16.716424	2016-07-21 22:54:16.716424
65	test"15"	マイページタイトル	\N	マイページ説明文	\N	\N	15	2016-07-21 22:54:16.722582	2016-07-21 22:54:16.722582
66	test"16"	マイページタイトル	\N	マイページ説明文	\N	\N	16	2016-07-21 22:54:16.728302	2016-07-21 22:54:16.728302
67	test"17"	マイページタイトル	\N	マイページ説明文	\N	\N	17	2016-07-21 22:54:16.734284	2016-07-21 22:54:16.734284
68	test"18"	マイページタイトル	\N	マイページ説明文	\N	\N	18	2016-07-21 22:54:16.739777	2016-07-21 22:54:16.739777
69	test"19"	マイページタイトル	\N	マイページ説明文	\N	\N	19	2016-07-21 22:54:16.744797	2016-07-21 22:54:16.744797
70	test"20"	マイページタイトル	\N	マイページ説明文	\N	\N	20	2016-07-21 22:54:16.75024	2016-07-21 22:54:16.75024
71	test"21"	マイページタイトル	\N	マイページ説明文	\N	\N	21	2016-07-21 22:54:16.755899	2016-07-21 22:54:16.755899
72	test"22"	マイページタイトル	\N	マイページ説明文	\N	\N	22	2016-07-21 22:54:16.761913	2016-07-21 22:54:16.761913
73	test"23"	マイページタイトル	\N	マイページ説明文	\N	\N	23	2016-07-21 22:54:16.767681	2016-07-21 22:54:16.767681
74	test"24"	マイページタイトル	\N	マイページ説明文	\N	\N	24	2016-07-21 22:54:16.775047	2016-07-21 22:54:16.775047
75	test"25"	マイページタイトル	\N	マイページ説明文	\N	\N	25	2016-07-21 22:54:16.780617	2016-07-21 22:54:16.780617
76	test"26"	マイページタイトル	\N	マイページ説明文	\N	\N	26	2016-07-21 22:54:16.786243	2016-07-21 22:54:16.786243
77	test"27"	マイページタイトル	\N	マイページ説明文	\N	\N	27	2016-07-21 22:54:16.791464	2016-07-21 22:54:16.791464
78	test"28"	マイページタイトル	\N	マイページ説明文	\N	\N	28	2016-07-21 22:54:16.797549	2016-07-21 22:54:16.797549
79	test"29"	マイページタイトル	\N	マイページ説明文	\N	\N	29	2016-07-21 22:54:16.803082	2016-07-21 22:54:16.803082
80	test"30"	マイページタイトル	\N	マイページ説明文	\N	\N	30	2016-07-21 22:54:16.808055	2016-07-21 22:54:16.808055
81	test"31"	マイページタイトル	\N	マイページ説明文	\N	\N	31	2016-07-21 22:54:16.812866	2016-07-21 22:54:16.812866
82	test"32"	マイページタイトル	\N	マイページ説明文	\N	\N	32	2016-07-21 22:54:16.818202	2016-07-21 22:54:16.818202
83	test"33"	マイページタイトル	\N	マイページ説明文	\N	\N	33	2016-07-21 22:54:16.824025	2016-07-21 22:54:16.824025
84	test"34"	マイページタイトル	\N	マイページ説明文	\N	\N	34	2016-07-21 22:54:16.829206	2016-07-21 22:54:16.829206
85	test"35"	マイページタイトル	\N	マイページ説明文	\N	\N	35	2016-07-21 22:54:16.834438	2016-07-21 22:54:16.834438
86	test"36"	マイページタイトル	\N	マイページ説明文	\N	\N	36	2016-07-21 22:54:16.840246	2016-07-21 22:54:16.840246
87	test"37"	マイページタイトル	\N	マイページ説明文	\N	\N	37	2016-07-21 22:54:16.845317	2016-07-21 22:54:16.845317
88	test"38"	マイページタイトル	\N	マイページ説明文	\N	\N	38	2016-07-21 22:54:16.850595	2016-07-21 22:54:16.850595
89	test"39"	マイページタイトル	\N	マイページ説明文	\N	\N	39	2016-07-21 22:54:16.856257	2016-07-21 22:54:16.856257
90	test"40"	マイページタイトル	\N	マイページ説明文	\N	\N	40	2016-07-21 22:54:16.861937	2016-07-21 22:54:16.861937
91	test"41"	マイページタイトル	\N	マイページ説明文	\N	\N	41	2016-07-21 22:54:16.867451	2016-07-21 22:54:16.867451
92	test"42"	マイページタイトル	\N	マイページ説明文	\N	\N	42	2016-07-21 22:54:16.872459	2016-07-21 22:54:16.872459
93	test"43"	マイページタイトル	\N	マイページ説明文	\N	\N	43	2016-07-21 22:54:16.877685	2016-07-21 22:54:16.877685
94	test"44"	マイページタイトル	\N	マイページ説明文	\N	\N	44	2016-07-21 22:54:16.882853	2016-07-21 22:54:16.882853
95	test"45"	マイページタイトル	\N	マイページ説明文	\N	\N	45	2016-07-21 22:54:16.888099	2016-07-21 22:54:16.888099
96	test"46"	マイページタイトル	\N	マイページ説明文	\N	\N	46	2016-07-21 22:54:16.893254	2016-07-21 22:54:16.893254
97	test"47"	マイページタイトル	\N	マイページ説明文	\N	\N	47	2016-07-21 22:54:16.899234	2016-07-21 22:54:16.899234
98	test"48"	マイページタイトル	\N	マイページ説明文	\N	\N	48	2016-07-21 22:54:16.905017	2016-07-21 22:54:16.905017
99	test"49"	マイページタイトル	\N	マイページ説明文	\N	\N	49	2016-07-21 22:54:16.910824	2016-07-21 22:54:16.910824
100	test"50"	マイページタイトル	\N	マイページ説明文	\N	\N	50	2016-07-21 22:54:16.916207	2016-07-21 22:54:16.916207
101	test"1"	マイページタイトル	\N	マイページ説明文	\N	\N	1	2016-07-21 23:11:39.909518	2016-07-21 23:11:39.909518
102	test"2"	マイページタイトル	\N	マイページ説明文	\N	\N	2	2016-07-21 23:11:39.916127	2016-07-21 23:11:39.916127
103	test"3"	マイページタイトル	\N	マイページ説明文	\N	\N	3	2016-07-21 23:11:39.921003	2016-07-21 23:11:39.921003
104	test"4"	マイページタイトル	\N	マイページ説明文	\N	\N	4	2016-07-21 23:11:39.926281	2016-07-21 23:11:39.926281
105	test"5"	マイページタイトル	\N	マイページ説明文	\N	\N	5	2016-07-21 23:11:39.931169	2016-07-21 23:11:39.931169
106	test"6"	マイページタイトル	\N	マイページ説明文	\N	\N	6	2016-07-21 23:11:39.936559	2016-07-21 23:11:39.936559
107	test"7"	マイページタイトル	\N	マイページ説明文	\N	\N	7	2016-07-21 23:11:39.941632	2016-07-21 23:11:39.941632
108	test"8"	マイページタイトル	\N	マイページ説明文	\N	\N	8	2016-07-21 23:11:39.946624	2016-07-21 23:11:39.946624
109	test"9"	マイページタイトル	\N	マイページ説明文	\N	\N	9	2016-07-21 23:11:39.951871	2016-07-21 23:11:39.951871
110	test"10"	マイページタイトル	\N	マイページ説明文	\N	\N	10	2016-07-21 23:11:39.956674	2016-07-21 23:11:39.956674
111	test"11"	マイページタイトル	\N	マイページ説明文	\N	\N	11	2016-07-21 23:11:39.961664	2016-07-21 23:11:39.961664
112	test"12"	マイページタイトル	\N	マイページ説明文	\N	\N	12	2016-07-21 23:11:39.967395	2016-07-21 23:11:39.967395
113	test"13"	マイページタイトル	\N	マイページ説明文	\N	\N	13	2016-07-21 23:11:39.972596	2016-07-21 23:11:39.972596
114	test"14"	マイページタイトル	\N	マイページ説明文	\N	\N	14	2016-07-21 23:11:39.978086	2016-07-21 23:11:39.978086
115	test"15"	マイページタイトル	\N	マイページ説明文	\N	\N	15	2016-07-21 23:11:39.983575	2016-07-21 23:11:39.983575
116	test"16"	マイページタイトル	\N	マイページ説明文	\N	\N	16	2016-07-21 23:11:39.988749	2016-07-21 23:11:39.988749
117	test"17"	マイページタイトル	\N	マイページ説明文	\N	\N	17	2016-07-21 23:11:39.994052	2016-07-21 23:11:39.994052
118	test"18"	マイページタイトル	\N	マイページ説明文	\N	\N	18	2016-07-21 23:11:39.999053	2016-07-21 23:11:39.999053
119	test"19"	マイページタイトル	\N	マイページ説明文	\N	\N	19	2016-07-21 23:11:40.004141	2016-07-21 23:11:40.004141
120	test"20"	マイページタイトル	\N	マイページ説明文	\N	\N	20	2016-07-21 23:11:40.009261	2016-07-21 23:11:40.009261
121	test"21"	マイページタイトル	\N	マイページ説明文	\N	\N	21	2016-07-21 23:11:40.014118	2016-07-21 23:11:40.014118
122	test"22"	マイページタイトル	\N	マイページ説明文	\N	\N	22	2016-07-21 23:11:40.019083	2016-07-21 23:11:40.019083
123	test"23"	マイページタイトル	\N	マイページ説明文	\N	\N	23	2016-07-21 23:11:40.024209	2016-07-21 23:11:40.024209
124	test"24"	マイページタイトル	\N	マイページ説明文	\N	\N	24	2016-07-21 23:11:40.029139	2016-07-21 23:11:40.029139
125	test"25"	マイページタイトル	\N	マイページ説明文	\N	\N	25	2016-07-21 23:11:40.034398	2016-07-21 23:11:40.034398
126	test"26"	マイページタイトル	\N	マイページ説明文	\N	\N	26	2016-07-21 23:11:40.039094	2016-07-21 23:11:40.039094
127	test"27"	マイページタイトル	\N	マイページ説明文	\N	\N	27	2016-07-21 23:11:40.044338	2016-07-21 23:11:40.044338
128	test"28"	マイページタイトル	\N	マイページ説明文	\N	\N	28	2016-07-21 23:11:40.049249	2016-07-21 23:11:40.049249
129	test"29"	マイページタイトル	\N	マイページ説明文	\N	\N	29	2016-07-21 23:11:40.054376	2016-07-21 23:11:40.054376
130	test"30"	マイページタイトル	\N	マイページ説明文	\N	\N	30	2016-07-21 23:11:40.059229	2016-07-21 23:11:40.059229
131	test"31"	マイページタイトル	\N	マイページ説明文	\N	\N	31	2016-07-21 23:11:40.064336	2016-07-21 23:11:40.064336
132	test"32"	マイページタイトル	\N	マイページ説明文	\N	\N	32	2016-07-21 23:11:40.070407	2016-07-21 23:11:40.070407
133	test"33"	マイページタイトル	\N	マイページ説明文	\N	\N	33	2016-07-21 23:11:40.075641	2016-07-21 23:11:40.075641
134	test"34"	マイページタイトル	\N	マイページ説明文	\N	\N	34	2016-07-21 23:11:40.080634	2016-07-21 23:11:40.080634
135	test"35"	マイページタイトル	\N	マイページ説明文	\N	\N	35	2016-07-21 23:11:40.085504	2016-07-21 23:11:40.085504
136	test"36"	マイページタイトル	\N	マイページ説明文	\N	\N	36	2016-07-21 23:11:40.090316	2016-07-21 23:11:40.090316
137	test"37"	マイページタイトル	\N	マイページ説明文	\N	\N	37	2016-07-21 23:11:40.095373	2016-07-21 23:11:40.095373
138	test"38"	マイページタイトル	\N	マイページ説明文	\N	\N	38	2016-07-21 23:11:40.100329	2016-07-21 23:11:40.100329
139	test"39"	マイページタイトル	\N	マイページ説明文	\N	\N	39	2016-07-21 23:11:40.105281	2016-07-21 23:11:40.105281
140	test"40"	マイページタイトル	\N	マイページ説明文	\N	\N	40	2016-07-21 23:11:40.111795	2016-07-21 23:11:40.111795
141	test"41"	マイページタイトル	\N	マイページ説明文	\N	\N	41	2016-07-21 23:11:40.116884	2016-07-21 23:11:40.116884
142	test"42"	マイページタイトル	\N	マイページ説明文	\N	\N	42	2016-07-21 23:11:40.122034	2016-07-21 23:11:40.122034
143	test"43"	マイページタイトル	\N	マイページ説明文	\N	\N	43	2016-07-21 23:11:40.127347	2016-07-21 23:11:40.127347
144	test"44"	マイページタイトル	\N	マイページ説明文	\N	\N	44	2016-07-21 23:11:40.132312	2016-07-21 23:11:40.132312
145	test"45"	マイページタイトル	\N	マイページ説明文	\N	\N	45	2016-07-21 23:11:40.137518	2016-07-21 23:11:40.137518
146	test"46"	マイページタイトル	\N	マイページ説明文	\N	\N	46	2016-07-21 23:11:40.1426	2016-07-21 23:11:40.1426
147	test"47"	マイページタイトル	\N	マイページ説明文	\N	\N	47	2016-07-21 23:11:40.147663	2016-07-21 23:11:40.147663
148	test"48"	マイページタイトル	\N	マイページ説明文	\N	\N	48	2016-07-21 23:11:40.154221	2016-07-21 23:11:40.154221
149	test"49"	マイページタイトル	\N	マイページ説明文	\N	\N	49	2016-07-21 23:11:40.159113	2016-07-21 23:11:40.159113
150	test"50"	マイページタイトル	\N	マイページ説明文	\N	\N	50	2016-07-21 23:11:40.164154	2016-07-21 23:11:40.164154
151	test"1"	マイページタイトル	\N	マイページ説明文	\N	\N	1	2016-07-21 23:19:15.300874	2016-07-21 23:19:15.300874
152	test"2"	マイページタイトル	\N	マイページ説明文	\N	\N	2	2016-07-21 23:19:15.308782	2016-07-21 23:19:15.308782
153	test"3"	マイページタイトル	\N	マイページ説明文	\N	\N	3	2016-07-21 23:19:15.314391	2016-07-21 23:19:15.314391
154	test"4"	マイページタイトル	\N	マイページ説明文	\N	\N	4	2016-07-21 23:19:15.319434	2016-07-21 23:19:15.319434
155	test"5"	マイページタイトル	\N	マイページ説明文	\N	\N	5	2016-07-21 23:19:15.324593	2016-07-21 23:19:15.324593
156	test"6"	マイページタイトル	\N	マイページ説明文	\N	\N	6	2016-07-21 23:19:15.329749	2016-07-21 23:19:15.329749
157	test"7"	マイページタイトル	\N	マイページ説明文	\N	\N	7	2016-07-21 23:19:15.334693	2016-07-21 23:19:15.334693
158	test"8"	マイページタイトル	\N	マイページ説明文	\N	\N	8	2016-07-21 23:19:15.339662	2016-07-21 23:19:15.339662
159	test"9"	マイページタイトル	\N	マイページ説明文	\N	\N	9	2016-07-21 23:19:15.344739	2016-07-21 23:19:15.344739
160	test"10"	マイページタイトル	\N	マイページ説明文	\N	\N	10	2016-07-21 23:19:15.349731	2016-07-21 23:19:15.349731
161	test"11"	マイページタイトル	\N	マイページ説明文	\N	\N	11	2016-07-21 23:19:15.355183	2016-07-21 23:19:15.355183
162	test"12"	マイページタイトル	\N	マイページ説明文	\N	\N	12	2016-07-21 23:19:15.360179	2016-07-21 23:19:15.360179
163	test"13"	マイページタイトル	\N	マイページ説明文	\N	\N	13	2016-07-21 23:19:15.365164	2016-07-21 23:19:15.365164
164	test"14"	マイページタイトル	\N	マイページ説明文	\N	\N	14	2016-07-21 23:19:15.369995	2016-07-21 23:19:15.369995
165	test"15"	マイページタイトル	\N	マイページ説明文	\N	\N	15	2016-07-21 23:19:15.375138	2016-07-21 23:19:15.375138
166	test"16"	マイページタイトル	\N	マイページ説明文	\N	\N	16	2016-07-21 23:19:15.380119	2016-07-21 23:19:15.380119
167	test"17"	マイページタイトル	\N	マイページ説明文	\N	\N	17	2016-07-21 23:19:15.384873	2016-07-21 23:19:15.384873
168	test"18"	マイページタイトル	\N	マイページ説明文	\N	\N	18	2016-07-21 23:19:15.38989	2016-07-21 23:19:15.38989
169	test"19"	マイページタイトル	\N	マイページ説明文	\N	\N	19	2016-07-21 23:19:15.395153	2016-07-21 23:19:15.395153
170	test"20"	マイページタイトル	\N	マイページ説明文	\N	\N	20	2016-07-21 23:19:15.400109	2016-07-21 23:19:15.400109
171	test"21"	マイページタイトル	\N	マイページ説明文	\N	\N	21	2016-07-21 23:19:15.4054	2016-07-21 23:19:15.4054
172	test"22"	マイページタイトル	\N	マイページ説明文	\N	\N	22	2016-07-21 23:19:15.410489	2016-07-21 23:19:15.410489
173	test"23"	マイページタイトル	\N	マイページ説明文	\N	\N	23	2016-07-21 23:19:15.415392	2016-07-21 23:19:15.415392
174	test"24"	マイページタイトル	\N	マイページ説明文	\N	\N	24	2016-07-21 23:19:15.420784	2016-07-21 23:19:15.420784
175	test"25"	マイページタイトル	\N	マイページ説明文	\N	\N	25	2016-07-21 23:19:15.426245	2016-07-21 23:19:15.426245
176	test"26"	マイページタイトル	\N	マイページ説明文	\N	\N	26	2016-07-21 23:19:15.431194	2016-07-21 23:19:15.431194
177	test"27"	マイページタイトル	\N	マイページ説明文	\N	\N	27	2016-07-21 23:19:15.436093	2016-07-21 23:19:15.436093
178	test"28"	マイページタイトル	\N	マイページ説明文	\N	\N	28	2016-07-21 23:19:15.441923	2016-07-21 23:19:15.441923
179	test"29"	マイページタイトル	\N	マイページ説明文	\N	\N	29	2016-07-21 23:19:15.446938	2016-07-21 23:19:15.446938
180	test"30"	マイページタイトル	\N	マイページ説明文	\N	\N	30	2016-07-21 23:19:15.452082	2016-07-21 23:19:15.452082
181	test"31"	マイページタイトル	\N	マイページ説明文	\N	\N	31	2016-07-21 23:19:15.457236	2016-07-21 23:19:15.457236
182	test"32"	マイページタイトル	\N	マイページ説明文	\N	\N	32	2016-07-21 23:19:15.462715	2016-07-21 23:19:15.462715
183	test"33"	マイページタイトル	\N	マイページ説明文	\N	\N	33	2016-07-21 23:19:15.469428	2016-07-21 23:19:15.469428
184	test"34"	マイページタイトル	\N	マイページ説明文	\N	\N	34	2016-07-21 23:19:15.475078	2016-07-21 23:19:15.475078
185	test"35"	マイページタイトル	\N	マイページ説明文	\N	\N	35	2016-07-21 23:19:15.479845	2016-07-21 23:19:15.479845
186	test"36"	マイページタイトル	\N	マイページ説明文	\N	\N	36	2016-07-21 23:19:15.484931	2016-07-21 23:19:15.484931
187	test"37"	マイページタイトル	\N	マイページ説明文	\N	\N	37	2016-07-21 23:19:15.490728	2016-07-21 23:19:15.490728
188	test"38"	マイページタイトル	\N	マイページ説明文	\N	\N	38	2016-07-21 23:19:15.495733	2016-07-21 23:19:15.495733
189	test"39"	マイページタイトル	\N	マイページ説明文	\N	\N	39	2016-07-21 23:19:15.500435	2016-07-21 23:19:15.500435
190	test"40"	マイページタイトル	\N	マイページ説明文	\N	\N	40	2016-07-21 23:19:15.50584	2016-07-21 23:19:15.50584
191	test"41"	マイページタイトル	\N	マイページ説明文	\N	\N	41	2016-07-21 23:19:15.510637	2016-07-21 23:19:15.510637
192	test"42"	マイページタイトル	\N	マイページ説明文	\N	\N	42	2016-07-21 23:19:15.515289	2016-07-21 23:19:15.515289
193	test"43"	マイページタイトル	\N	マイページ説明文	\N	\N	43	2016-07-21 23:19:15.520053	2016-07-21 23:19:15.520053
194	test"44"	マイページタイトル	\N	マイページ説明文	\N	\N	44	2016-07-21 23:19:15.525037	2016-07-21 23:19:15.525037
195	test"45"	マイページタイトル	\N	マイページ説明文	\N	\N	45	2016-07-21 23:19:15.530093	2016-07-21 23:19:15.530093
196	test"46"	マイページタイトル	\N	マイページ説明文	\N	\N	46	2016-07-21 23:19:15.535336	2016-07-21 23:19:15.535336
197	test"47"	マイページタイトル	\N	マイページ説明文	\N	\N	47	2016-07-21 23:19:15.540419	2016-07-21 23:19:15.540419
198	test"48"	マイページタイトル	\N	マイページ説明文	\N	\N	48	2016-07-21 23:19:15.54592	2016-07-21 23:19:15.54592
199	test"49"	マイページタイトル	\N	マイページ説明文	\N	\N	49	2016-07-21 23:19:15.550862	2016-07-21 23:19:15.550862
200	test"50"	マイページタイトル	\N	マイページ説明文	\N	\N	50	2016-07-21 23:19:15.555921	2016-07-21 23:19:15.555921
\.


--
-- Name: mypages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('mypages_id_seq', 200, true);


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY relationships (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('relationships_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY schema_migrations (version) FROM stdin;
20160610052820
20160610064220
20160611072834
20160612074947
20160615125305
20160616113451
20160619091332
20160620002002
20160622015041
20160622030656
20160623233328
20160630093702
20160630220047
20160703214920
\.


--
-- Data for Name: shop_areas; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY shop_areas (id, shop_id, area_id, created_at, updated_at) FROM stdin;
1	1	1	2016-07-21 22:50:06.624811	2016-07-21 22:50:06.624811
2	1	4	2016-07-21 22:54:09.402558	2016-07-21 22:54:09.402558
3	7	1	2016-07-21 22:54:09.421184	2016-07-21 22:54:09.421184
4	8	1	2016-07-21 22:54:09.433257	2016-07-21 22:54:09.433257
5	9	1	2016-07-21 22:54:09.445235	2016-07-21 22:54:09.445235
6	10	1	2016-07-21 22:54:09.45793	2016-07-21 22:54:09.45793
7	11	1	2016-07-21 22:54:09.470357	2016-07-21 22:54:09.470357
8	12	1	2016-07-21 22:54:09.482969	2016-07-21 22:54:09.482969
9	13	1	2016-07-21 22:54:09.496457	2016-07-21 22:54:09.496457
10	14	1	2016-07-21 22:54:09.509423	2016-07-21 22:54:09.509423
11	15	1	2016-07-21 22:54:09.521912	2016-07-21 22:54:09.521912
12	1	4	2016-07-21 22:57:25.263375	2016-07-21 22:57:25.263375
13	1	4	2016-07-21 23:08:49.923765	2016-07-21 23:08:49.923765
14	1	4	2016-07-21 23:10:14.541854	2016-07-21 23:10:14.541854
15	1	4	2016-07-21 23:11:32.682772	2016-07-21 23:11:32.682772
16	7	1	2016-07-21 23:11:32.699962	2016-07-21 23:11:32.699962
17	8	1	2016-07-21 23:11:32.714261	2016-07-21 23:11:32.714261
18	9	1	2016-07-21 23:11:32.728305	2016-07-21 23:11:32.728305
19	10	1	2016-07-21 23:11:32.741712	2016-07-21 23:11:32.741712
20	11	1	2016-07-21 23:11:32.754854	2016-07-21 23:11:32.754854
21	12	1	2016-07-21 23:11:32.767427	2016-07-21 23:11:32.767427
22	13	1	2016-07-21 23:11:32.780176	2016-07-21 23:11:32.780176
23	14	1	2016-07-21 23:11:32.793988	2016-07-21 23:11:32.793988
24	15	1	2016-07-21 23:11:32.806673	2016-07-21 23:11:32.806673
25	1	4	2016-07-21 23:18:06.861818	2016-07-21 23:18:06.861818
26	1	4	2016-07-21 23:19:07.936262	2016-07-21 23:19:07.936262
27	7	1	2016-07-21 23:19:07.999488	2016-07-21 23:19:07.999488
28	8	1	2016-07-21 23:19:08.01661	2016-07-21 23:19:08.01661
29	9	1	2016-07-21 23:19:08.029999	2016-07-21 23:19:08.029999
30	10	1	2016-07-21 23:19:08.044035	2016-07-21 23:19:08.044035
31	11	1	2016-07-21 23:19:08.0574	2016-07-21 23:19:08.0574
32	12	1	2016-07-21 23:19:08.072651	2016-07-21 23:19:08.072651
33	13	1	2016-07-21 23:19:08.085361	2016-07-21 23:19:08.085361
34	14	1	2016-07-21 23:19:08.097922	2016-07-21 23:19:08.097922
35	15	1	2016-07-21 23:19:08.111971	2016-07-21 23:19:08.111971
\.


--
-- Name: shop_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shop_areas_id_seq', 35, true);


--
-- Data for Name: shop_categories; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY shop_categories (id, shop_id, category_id, created_at, updated_at) FROM stdin;
1	1	25	2016-07-21 23:19:07.979305	2016-07-21 23:19:07.979305
\.


--
-- Name: shop_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shop_categories_id_seq', 1, true);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY shops (id, name, address, latitude, longitude, mainimage, created_at, updated_at) FROM stdin;
1	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:49:18.69617	2016-07-21 22:49:18.69617
2	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:50:06.48942	2016-07-21 22:50:06.48942
3	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:50:06.635161	2016-07-21 22:50:06.635161
4	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:50:06.64287	2016-07-21 22:50:06.64287
5	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:50:06.648213	2016-07-21 22:50:06.648213
6	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:50:06.653914	2016-07-21 22:50:06.653914
7	向日葵	愛知県名古屋市中区千代田2-15-18 名古屋通信ビルB1	35.1563719999999975	136.915262000000013	\N	2016-07-21 22:50:06.659507	2016-07-21 22:50:06.659507
8	ムガルパレス ２号店	愛知県 名古屋市中区 千代田 5丁目11-33 クマザキビルビル1F	35.1600219999999979	136.920181000000014	\N	2016-07-21 22:50:06.664814	2016-07-21 22:50:06.664814
9	炭火やきとり 豆鳥	愛知県 名古屋市中区 千代田 5-17-15 田中コーポラス1F	35.1584310000000002	136.91733099999999	\N	2016-07-21 22:50:06.67001	2016-07-21 22:50:06.67001
10	鶴舞Perch	愛知県 名古屋市中区 千代田 3-15-19 メゾン千代田　B1F	35.1541509999999988	136.914681000000002	\N	2016-07-21 22:50:06.675016	2016-07-21 22:50:06.675016
11	広島鉄板居酒屋 来い鯉	愛知県 名古屋市中区 千代田 3-12-5	35.155731000000003	136.91665900000001	\N	2016-07-21 22:50:06.679723	2016-07-21 22:50:06.679723
12	もつ焼き百蔵	愛知県 名古屋市中区 千代田 3-11-12 モモセビル 1F	35.1556670000000011	136.915742999999992	\N	2016-07-21 22:50:06.684819	2016-07-21 22:50:06.684819
13	焼肉市場さくら×さくら	愛知県名古屋市中区新栄２-47-50	35.1617499999999978	136.922447000000005	\N	2016-07-21 22:50:06.690076	2016-07-21 22:50:06.690076
14	鳥貴族 鶴舞店	愛知県 名古屋市中区 千代田 3-11-9 2F	35.155659	136.915314999999993	\N	2016-07-21 22:50:06.695078	2016-07-21 22:50:06.695078
15	笑笑 鶴舞駅前店	愛知県 名古屋市中区 千代田 3-11-9 鶴舞駅前ビル 2F	35.1558500000000009	136.915550999999994	\N	2016-07-21 22:50:06.699904	2016-07-21 22:50:06.699904
16	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:54:09.24859	2016-07-21 22:54:09.24859
17	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:54:09.256431	2016-07-21 22:54:09.256431
18	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:54:09.261604	2016-07-21 22:54:09.261604
19	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:54:09.266902	2016-07-21 22:54:09.266902
20	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:54:09.272112	2016-07-21 22:54:09.272112
21	向日葵	愛知県名古屋市中区千代田2-15-18 名古屋通信ビルB1	35.1563719999999975	136.915262000000013	\N	2016-07-21 22:54:09.408892	2016-07-21 22:54:09.408892
22	ムガルパレス ２号店	愛知県 名古屋市中区 千代田 5丁目11-33 クマザキビルビル1F	35.1600219999999979	136.920181000000014	\N	2016-07-21 22:54:09.426249	2016-07-21 22:54:09.426249
23	炭火やきとり 豆鳥	愛知県 名古屋市中区 千代田 5-17-15 田中コーポラス1F	35.1584310000000002	136.91733099999999	\N	2016-07-21 22:54:09.438105	2016-07-21 22:54:09.438105
24	鶴舞Perch	愛知県 名古屋市中区 千代田 3-15-19 メゾン千代田　B1F	35.1541509999999988	136.914681000000002	\N	2016-07-21 22:54:09.450244	2016-07-21 22:54:09.450244
25	広島鉄板居酒屋 来い鯉	愛知県 名古屋市中区 千代田 3-12-5	35.155731000000003	136.91665900000001	\N	2016-07-21 22:54:09.462864	2016-07-21 22:54:09.462864
26	もつ焼き百蔵	愛知県 名古屋市中区 千代田 3-11-12 モモセビル 1F	35.1556670000000011	136.915742999999992	\N	2016-07-21 22:54:09.475449	2016-07-21 22:54:09.475449
27	焼肉市場さくら×さくら	愛知県名古屋市中区新栄２-47-50	35.1617499999999978	136.922447000000005	\N	2016-07-21 22:54:09.488077	2016-07-21 22:54:09.488077
28	鳥貴族 鶴舞店	愛知県 名古屋市中区 千代田 3-11-9 2F	35.155659	136.915314999999993	\N	2016-07-21 22:54:09.501854	2016-07-21 22:54:09.501854
29	笑笑 鶴舞駅前店	愛知県 名古屋市中区 千代田 3-11-9 鶴舞駅前ビル 2F	35.1558500000000009	136.915550999999994	\N	2016-07-21 22:54:09.514595	2016-07-21 22:54:09.514595
30	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:57:25.118647	2016-07-21 22:57:25.118647
31	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:57:25.124482	2016-07-21 22:57:25.124482
32	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:57:25.130072	2016-07-21 22:57:25.130072
33	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:57:25.135673	2016-07-21 22:57:25.135673
34	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 22:57:25.140676	2016-07-21 22:57:25.140676
35	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:08:49.725812	2016-07-21 23:08:49.725812
36	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:08:49.733646	2016-07-21 23:08:49.733646
37	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:08:49.739505	2016-07-21 23:08:49.739505
38	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:08:49.744628	2016-07-21 23:08:49.744628
39	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:08:49.749849	2016-07-21 23:08:49.749849
40	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:10:14.364553	2016-07-21 23:10:14.364553
41	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:10:14.373988	2016-07-21 23:10:14.373988
42	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:10:14.379779	2016-07-21 23:10:14.379779
43	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:10:14.385788	2016-07-21 23:10:14.385788
44	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:10:14.391641	2016-07-21 23:10:14.391641
45	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:11:32.525328	2016-07-21 23:11:32.525328
46	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:11:32.533512	2016-07-21 23:11:32.533512
47	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:11:32.538936	2016-07-21 23:11:32.538936
48	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:11:32.544147	2016-07-21 23:11:32.544147
49	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:11:32.549236	2016-07-21 23:11:32.549236
50	向日葵	愛知県名古屋市中区千代田2-15-18 名古屋通信ビルB1	35.1563719999999975	136.915262000000013	\N	2016-07-21 23:11:32.69024	2016-07-21 23:11:32.69024
51	ムガルパレス ２号店	愛知県 名古屋市中区 千代田 5丁目11-33 クマザキビルビル1F	35.1600219999999979	136.920181000000014	\N	2016-07-21 23:11:32.705659	2016-07-21 23:11:32.705659
52	炭火やきとり 豆鳥	愛知県 名古屋市中区 千代田 5-17-15 田中コーポラス1F	35.1584310000000002	136.91733099999999	\N	2016-07-21 23:11:32.720105	2016-07-21 23:11:32.720105
53	鶴舞Perch	愛知県 名古屋市中区 千代田 3-15-19 メゾン千代田　B1F	35.1541509999999988	136.914681000000002	\N	2016-07-21 23:11:32.733823	2016-07-21 23:11:32.733823
54	広島鉄板居酒屋 来い鯉	愛知県 名古屋市中区 千代田 3-12-5	35.155731000000003	136.91665900000001	\N	2016-07-21 23:11:32.747081	2016-07-21 23:11:32.747081
55	もつ焼き百蔵	愛知県 名古屋市中区 千代田 3-11-12 モモセビル 1F	35.1556670000000011	136.915742999999992	\N	2016-07-21 23:11:32.759926	2016-07-21 23:11:32.759926
56	焼肉市場さくら×さくら	愛知県名古屋市中区新栄２-47-50	35.1617499999999978	136.922447000000005	\N	2016-07-21 23:11:32.772371	2016-07-21 23:11:32.772371
57	鳥貴族 鶴舞店	愛知県 名古屋市中区 千代田 3-11-9 2F	35.155659	136.915314999999993	\N	2016-07-21 23:11:32.785614	2016-07-21 23:11:32.785614
58	笑笑 鶴舞駅前店	愛知県 名古屋市中区 千代田 3-11-9 鶴舞駅前ビル 2F	35.1558500000000009	136.915550999999994	\N	2016-07-21 23:11:32.799292	2016-07-21 23:11:32.799292
59	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:18:06.721618	2016-07-21 23:18:06.721618
60	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:18:06.729151	2016-07-21 23:18:06.729151
61	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:18:06.735566	2016-07-21 23:18:06.735566
62	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:18:06.742078	2016-07-21 23:18:06.742078
63	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:18:06.748469	2016-07-21 23:18:06.748469
64	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:19:07.73659	2016-07-21 23:19:07.73659
65	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:19:07.746811	2016-07-21 23:19:07.746811
66	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:19:07.753015	2016-07-21 23:19:07.753015
67	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:19:07.759113	2016-07-21 23:19:07.759113
68	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-21 23:19:07.764429	2016-07-21 23:19:07.764429
69	向日葵	愛知県名古屋市中区千代田2-15-18 名古屋通信ビルB1	35.1563719999999975	136.915262000000013	\N	2016-07-21 23:19:07.9888	2016-07-21 23:19:07.9888
70	ムガルパレス ２号店	愛知県 名古屋市中区 千代田 5丁目11-33 クマザキビルビル1F	35.1600219999999979	136.920181000000014	\N	2016-07-21 23:19:08.006376	2016-07-21 23:19:08.006376
71	炭火やきとり 豆鳥	愛知県 名古屋市中区 千代田 5-17-15 田中コーポラス1F	35.1584310000000002	136.91733099999999	\N	2016-07-21 23:19:08.022187	2016-07-21 23:19:08.022187
72	鶴舞Perch	愛知県 名古屋市中区 千代田 3-15-19 メゾン千代田　B1F	35.1541509999999988	136.914681000000002	\N	2016-07-21 23:19:08.035264	2016-07-21 23:19:08.035264
73	広島鉄板居酒屋 来い鯉	愛知県 名古屋市中区 千代田 3-12-5	35.155731000000003	136.91665900000001	\N	2016-07-21 23:19:08.049077	2016-07-21 23:19:08.049077
74	もつ焼き百蔵	愛知県 名古屋市中区 千代田 3-11-12 モモセビル 1F	35.1556670000000011	136.915742999999992	\N	2016-07-21 23:19:08.063625	2016-07-21 23:19:08.063625
75	焼肉市場さくら×さくら	愛知県名古屋市中区新栄２-47-50	35.1617499999999978	136.922447000000005	\N	2016-07-21 23:19:08.078134	2016-07-21 23:19:08.078134
76	鳥貴族 鶴舞店	愛知県 名古屋市中区 千代田 3-11-9 2F	35.155659	136.915314999999993	\N	2016-07-21 23:19:08.09047	2016-07-21 23:19:08.09047
77	笑笑 鶴舞駅前店	愛知県 名古屋市中区 千代田 3-11-9 鶴舞駅前ビル 2F	35.1558500000000009	136.915550999999994	\N	2016-07-21 23:19:08.102922	2016-07-21 23:19:08.102922
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shops_id_seq', 77, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, provider, uid, token) FROM stdin;
1	test1@test.com	$2a$11$XbO2ux/nQouIjiUpl98b.uDzEv4jY8wEmU03j8d4sdo7tbqcXhIpq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:06.861564	2016-07-21 22:50:06.861564	\N	\N	\N
2	test2@test.com	$2a$11$iGbKclQMk1PZi0R2rheLEOAbtKi/SflS9lCb4a0qRT6N1r9yUti8K	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:07.005976	2016-07-21 22:50:07.005976	\N	\N	\N
3	test3@test.com	$2a$11$G/hopZTBRfUiOwHkMvHmxe0ib.s2PSVLR006S8b2hZFC6Oc2Vqu.i	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:07.151093	2016-07-21 22:50:07.151093	\N	\N	\N
4	test4@test.com	$2a$11$NwHWeqhpMd/sRuuaHwWl9ekGrTiPhMXeNxHhZQjv3hM58EkyzdBn.	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:07.294525	2016-07-21 22:50:07.294525	\N	\N	\N
5	test5@test.com	$2a$11$ENmqJJdeyDUh.GEfyK6AnOqNuUlxZVIf8BEylE8FotwfrJf4f1kr6	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:07.441803	2016-07-21 22:50:07.441803	\N	\N	\N
6	test6@test.com	$2a$11$Fql0lMuEhdUToC1Mdw8.5.5RZGMkCdYUIFlheUB8BQ6pkhHzr.LgC	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:07.587264	2016-07-21 22:50:07.587264	\N	\N	\N
7	test7@test.com	$2a$11$iLt/yV7rtUfPu5sQkkqn3.6Lk.2fjtzHduny3CjFmjgyUXK/HjoFi	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:07.733297	2016-07-21 22:50:07.733297	\N	\N	\N
8	test8@test.com	$2a$11$aW/Cxy/yQZhSksmpYPmIDuvRWjbbn5w.2y0315te8D3UD3n.cNVsa	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:07.875924	2016-07-21 22:50:07.875924	\N	\N	\N
9	test9@test.com	$2a$11$kilFAikpHL4gKF0pDgBj5eW4zawmOGpgrCSaFrw99tpqGSi1wxc3S	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:08.018404	2016-07-21 22:50:08.018404	\N	\N	\N
10	test10@test.com	$2a$11$NhlezbEQhJBlFpMS8XZ.rebd635eKFEKvTh6o5zEIfGpBHzTKhHuq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:08.162496	2016-07-21 22:50:08.162496	\N	\N	\N
11	test11@test.com	$2a$11$bAF2oPh.Dzkydy8xgvFHA.I1T0UCbSGjHNP0dtzvkRQdTeiqQPTdm	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:08.30694	2016-07-21 22:50:08.30694	\N	\N	\N
12	test12@test.com	$2a$11$fYzcezVojjGN1xD3h9mw0Or/kpIAzCnnFVqxq4Xpiiz02dod3YCfW	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:08.450183	2016-07-21 22:50:08.450183	\N	\N	\N
13	test13@test.com	$2a$11$uDNKcU98gxKEZvhQV06JMOfM6gDlChA5ZUVIkcvWo3BhedvY97KGe	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:08.596365	2016-07-21 22:50:08.596365	\N	\N	\N
14	test14@test.com	$2a$11$1tlveb.AEY8MIbOK8I1Ye.PWoHgKcAm1ANo0omssaekLyXbStvOc.	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:08.742485	2016-07-21 22:50:08.742485	\N	\N	\N
15	test15@test.com	$2a$11$9WBSByy8WhMB/nfJoUHEcu5dxIrE/vkWCu7WUhVd/1apc14pUGuIK	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:08.891049	2016-07-21 22:50:08.891049	\N	\N	\N
16	test16@test.com	$2a$11$lqCJ2Zd/yD.lwNR8HuHbw.gMJrABZZypF/6.d4ISOku2gxIMl3wYC	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:09.036902	2016-07-21 22:50:09.036902	\N	\N	\N
17	test17@test.com	$2a$11$KQktzaEC6fWkenujrNVlx.psqGoTY5LpvqUoqs9pZ46QTNn7E6aE2	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:09.183687	2016-07-21 22:50:09.183687	\N	\N	\N
18	test18@test.com	$2a$11$rO6GMp.ZUV49wLIfUbUSCurkOctFEL4AQ3RCcXoOZj0vtSPFhND3W	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:09.331453	2016-07-21 22:50:09.331453	\N	\N	\N
19	test19@test.com	$2a$11$6h12sm2C9zU0vAneFiRdfem9iywKNpDiSBUM1T32Td./axksnehrq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:09.477815	2016-07-21 22:50:09.477815	\N	\N	\N
20	test20@test.com	$2a$11$Y1BPjQRIiyig/bS7KF/wLuZsLdDCJcY7Ng0d0c0uFjQ4OT/1YG1U6	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:09.629815	2016-07-21 22:50:09.629815	\N	\N	\N
21	test21@test.com	$2a$11$xiiefKCCEMHQX/.rNIhZFe.hgUHoY8Va42hv3oSrz4nMpjLecxFeu	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:09.77446	2016-07-21 22:50:09.77446	\N	\N	\N
22	test22@test.com	$2a$11$AVnSeuMvVIdOwNIWQ12xeOSkw8QmlzB0VdLd74aR5odxfW4RQQjMW	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:09.925878	2016-07-21 22:50:09.925878	\N	\N	\N
23	test23@test.com	$2a$11$lXYX/Sr76TR0S2Z2Gk3/6ueZwD8zacUpp1AP9G2VrQlZeKvtNpDrK	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:10.071915	2016-07-21 22:50:10.071915	\N	\N	\N
24	test24@test.com	$2a$11$gw2qQBNZbzPJvAgI9xIH..GJMsmxLN4QEhQqf0FSw2JINWIKv1lCi	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:10.22052	2016-07-21 22:50:10.22052	\N	\N	\N
25	test25@test.com	$2a$11$btO.HFzPWrRl0Xs.htSep.mr2h02GkxOWs0gEjleI1ZcmuwFDS6Z6	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:10.370236	2016-07-21 22:50:10.370236	\N	\N	\N
26	test26@test.com	$2a$11$PmStm76hS0Yc26OI75nqIeKSo65kvTXpiSGdYMgU8oVTbmWcmdk2y	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:10.516978	2016-07-21 22:50:10.516978	\N	\N	\N
27	test27@test.com	$2a$11$Gjnry2gYEDFKsR47q01FK.khdb9MV9B.uC4CKtRIIzTgYwgnSxhWq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:10.660234	2016-07-21 22:50:10.660234	\N	\N	\N
28	test28@test.com	$2a$11$e62aD3q1Z7b1SO2VXzXGd.Gc6xwycz2SxhwPIY39mrArNJMBd336e	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:10.806592	2016-07-21 22:50:10.806592	\N	\N	\N
29	test29@test.com	$2a$11$dobUfeZRlcKXIlkBOHhEfOPz4ihPN/rJJlXaVcVQa5IO5dl4xvJMO	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:10.953823	2016-07-21 22:50:10.953823	\N	\N	\N
30	test30@test.com	$2a$11$AguOCfsIgeahJUr.0zx7oOIv61D.97MqwS.hTpthEx8HSnenfJ5dq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:11.10036	2016-07-21 22:50:11.10036	\N	\N	\N
31	test31@test.com	$2a$11$pLzX7w/IacDRi3n61xUh6eMUH/op5JbfZ4OIen3MpmdUizbD8sToq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:11.249955	2016-07-21 22:50:11.249955	\N	\N	\N
32	test32@test.com	$2a$11$ZCf564ZXqDbZQViqwClsKO6TLaPDnGxppSTUmNtTEO1SrMwz0KlQa	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:11.397775	2016-07-21 22:50:11.397775	\N	\N	\N
33	test33@test.com	$2a$11$JXFgZN3YZxmEWzWQj.UCSu2osOI6N0Axgig0DsyJCjET9UjT5tR4y	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:11.548844	2016-07-21 22:50:11.548844	\N	\N	\N
34	test34@test.com	$2a$11$3r7H2Bs2LDlXebx0Sa8ZHuAk9NLM4fNKi05aEKTgHKp6Gb0saLNsm	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:11.700514	2016-07-21 22:50:11.700514	\N	\N	\N
35	test35@test.com	$2a$11$GqqvzXeyvquPZ0gT/u.wVOm3TXri7p86eiwLD7AOVN7KANQiLHxGu	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:11.887089	2016-07-21 22:50:11.887089	\N	\N	\N
36	test36@test.com	$2a$11$O..mu1V.zKXkaVr37SHBZuZv20SSiKuC.jz8J4//zj2feSYCRZfPq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:12.035044	2016-07-21 22:50:12.035044	\N	\N	\N
37	test37@test.com	$2a$11$p.xgxc0wl6wWeYSTW4Yi3.of.IIqB3jugET55RQiMY5ZdLSvMS5vq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:12.182773	2016-07-21 22:50:12.182773	\N	\N	\N
38	test38@test.com	$2a$11$R5t4S/DlvuxEnnhjgxVtze0ryZh0FLar9IyffwPSmupxb9iyP2IVG	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:12.334674	2016-07-21 22:50:12.334674	\N	\N	\N
39	test39@test.com	$2a$11$rrfVzzDTii3hzkX/2JtyQeoJRWmUZdN9AOvKB5K0MAydFF4kayJcu	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:12.477494	2016-07-21 22:50:12.477494	\N	\N	\N
40	test40@test.com	$2a$11$h9MwQDyJ6jCtu.RxlVoinuKptWzhUOq6pLLtafn6SFr71YyCiG5H2	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:12.619363	2016-07-21 22:50:12.619363	\N	\N	\N
41	test41@test.com	$2a$11$at5c/nM1xCl/Z8oDESO.NujO1eugQU20kPKr8yHApabhuL6CkOntS	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:12.761869	2016-07-21 22:50:12.761869	\N	\N	\N
42	test42@test.com	$2a$11$P96SyA9riDAIgEdgYYeCfe.J/xN9x1gruAOyb1buTAupl1lrGetJa	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:12.904674	2016-07-21 22:50:12.904674	\N	\N	\N
43	test43@test.com	$2a$11$GWQPBKTvomddQG6FtNlXhu04.H4uZPFxhddhqwlOCjMg2lxvGsw5K	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:13.046915	2016-07-21 22:50:13.046915	\N	\N	\N
44	test44@test.com	$2a$11$6a/Ftgtbewb4RA4I43kk8.15mm2JQ2FaC7Lk3bFTlDYDjx8cZ/rdS	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:13.189524	2016-07-21 22:50:13.189524	\N	\N	\N
45	test45@test.com	$2a$11$i5T0gD.3mACfA4MckvTIL.iUaCaDOvR2Re5cSJtoUP5AO3iIFGAfq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:13.332765	2016-07-21 22:50:13.332765	\N	\N	\N
46	test46@test.com	$2a$11$Hlaeyfw3HSoaQyuVg.NJiu7jmxoLgMmEysDHF7.yq4d/t7TOMVRsi	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:13.476203	2016-07-21 22:50:13.476203	\N	\N	\N
47	test47@test.com	$2a$11$xLM3WIOZ/6HdxuohFExuu.2JbnCwSYQ5wbc2nWnXX.GjwyCYTnOKG	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:13.618551	2016-07-21 22:50:13.618551	\N	\N	\N
48	test48@test.com	$2a$11$7IxC4sInEov8wf.5cpV3NOmI/GonMdGn.z.XYiN90hsEdBQ1BYZAy	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:13.760885	2016-07-21 22:50:13.760885	\N	\N	\N
49	test49@test.com	$2a$11$vAIdfaaDOscqrdOOmXqMd.EYqEFd3fBQ.dzoTBLRJpK5bDZzyusve	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:13.903288	2016-07-21 22:50:13.903288	\N	\N	\N
50	test50@test.com	$2a$11$E8jxxVd4zmJeQ1ZFpuYMP.nq3QCS6f9w1yL4mRsqqYszp2PzeW4UO	\N	\N	\N	0	\N	\N	\N	\N	2016-07-21 22:50:14.045778	2016-07-21 22:50:14.045778	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('users_id_seq', 50, true);


--
-- Data for Name: wants; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY wants (id, shop_id, user_id, created_at, updated_at) FROM stdin;
1	1	1	2016-07-21 22:50:14.399749	2016-07-21 22:50:14.399749
2	2	1	2016-07-21 22:50:14.419945	2016-07-21 22:50:14.419945
3	3	1	2016-07-21 22:50:14.436869	2016-07-21 22:50:14.436869
4	4	1	2016-07-21 22:50:14.452738	2016-07-21 22:50:14.452738
5	5	1	2016-07-21 22:50:14.468186	2016-07-21 22:50:14.468186
6	6	1	2016-07-21 22:50:14.484343	2016-07-21 22:50:14.484343
7	7	1	2016-07-21 22:50:14.499058	2016-07-21 22:50:14.499058
8	8	1	2016-07-21 22:50:14.514025	2016-07-21 22:50:14.514025
9	9	1	2016-07-21 22:50:14.530228	2016-07-21 22:50:14.530228
10	10	1	2016-07-21 22:50:14.546999	2016-07-21 22:50:14.546999
\.


--
-- Name: wants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('wants_id_seq', 10, true);


--
-- Name: ages_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY ages
    ADD CONSTRAINT ages_pkey PRIMARY KEY (id);


--
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: microposts_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY microposts
    ADD CONSTRAINT microposts_pkey PRIMARY KEY (id);


--
-- Name: microstars_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY microstars
    ADD CONSTRAINT microstars_pkey PRIMARY KEY (id);


--
-- Name: mypages_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY mypages
    ADD CONSTRAINT mypages_pkey PRIMARY KEY (id);


--
-- Name: relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- Name: shop_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY shop_areas
    ADD CONSTRAINT shop_areas_pkey PRIMARY KEY (id);


--
-- Name: shop_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY shop_categories
    ADD CONSTRAINT shop_categories_pkey PRIMARY KEY (id);


--
-- Name: shops_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wants_pkey; Type: CONSTRAINT; Schema: public; Owner: agelog; Tablespace: 
--

ALTER TABLE ONLY wants
    ADD CONSTRAINT wants_pkey PRIMARY KEY (id);


--
-- Name: index_ages_on_shop_id_and_user_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_ages_on_shop_id_and_user_id ON ages USING btree (shop_id, user_id);


--
-- Name: index_microposts_on_shop_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE INDEX index_microposts_on_shop_id ON microposts USING btree (shop_id);


--
-- Name: index_microposts_on_user_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE INDEX index_microposts_on_user_id ON microposts USING btree (user_id);


--
-- Name: index_microposts_on_user_id_and_created_at; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE INDEX index_microposts_on_user_id_and_created_at ON microposts USING btree (user_id, created_at);


--
-- Name: index_microstars_on_micropost_id_and_user_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_microstars_on_micropost_id_and_user_id ON microstars USING btree (micropost_id, user_id);


--
-- Name: index_relationships_on_followed_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE INDEX index_relationships_on_followed_id ON relationships USING btree (followed_id);


--
-- Name: index_relationships_on_follower_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE INDEX index_relationships_on_follower_id ON relationships USING btree (follower_id);


--
-- Name: index_relationships_on_follower_id_and_followed_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_relationships_on_follower_id_and_followed_id ON relationships USING btree (follower_id, followed_id);


--
-- Name: index_shop_areas_on_shop_id_and_area_id_and_created_at; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_shop_areas_on_shop_id_and_area_id_and_created_at ON shop_areas USING btree (shop_id, area_id, created_at);


--
-- Name: index_shop_categories_on_shop_id_and_category_id_and_created_at; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_shop_categories_on_shop_id_and_category_id_and_created_at ON shop_categories USING btree (shop_id, category_id, created_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_wants_on_shop_id_and_user_id; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX index_wants_on_shop_id_and_user_id ON wants USING btree (shop_id, user_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: agelog; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_558c81314b; Type: FK CONSTRAINT; Schema: public; Owner: agelog
--

ALTER TABLE ONLY microposts
    ADD CONSTRAINT fk_rails_558c81314b FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

