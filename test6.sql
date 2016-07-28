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
1	1	1	2016-07-26 05:17:23.744078	2016-07-26 05:17:23.744078
2	2	1	2016-07-26 05:17:23.77654	2016-07-26 05:17:23.77654
3	3	1	2016-07-26 05:17:23.793784	2016-07-26 05:17:23.793784
4	4	1	2016-07-26 05:17:23.808645	2016-07-26 05:17:23.808645
5	5	1	2016-07-26 05:17:23.823053	2016-07-26 05:17:23.823053
6	6	1	2016-07-26 05:17:23.837223	2016-07-26 05:17:23.837223
7	7	1	2016-07-26 05:17:23.852003	2016-07-26 05:17:23.852003
8	8	1	2016-07-26 05:17:23.867023	2016-07-26 05:17:23.867023
9	9	1	2016-07-26 05:17:23.884165	2016-07-26 05:17:23.884165
10	10	1	2016-07-26 05:17:23.901087	2016-07-26 05:17:23.901087
\.


--
-- Name: ages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('ages_id_seq', 10, true);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY areas (id, name, created_at, updated_at) FROM stdin;
1	鶴舞	2016-07-26 05:17:15.011967	2016-07-26 05:17:15.011967
2	吹上	2016-07-26 05:17:15.031074	2016-07-26 05:17:15.031074
3	御器所	2016-07-26 05:17:15.037649	2016-07-26 05:17:15.037649
4	荒畑	2016-07-26 05:17:15.044901	2016-07-26 05:17:15.044901
5	千種	2016-07-26 05:17:15.052086	2016-07-26 05:17:15.052086
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('areas_id_seq', 5, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY categories (id, name, created_at, updated_at) FROM stdin;
1	ラーメン	2016-07-26 05:17:15.074067	2016-07-26 05:17:15.074067
2	まぜそば	2016-07-26 05:17:15.08152	2016-07-26 05:17:15.08152
3	つけ麺	2016-07-26 05:17:15.087968	2016-07-26 05:17:15.087968
4	チャーハン	2016-07-26 05:17:15.096125	2016-07-26 05:17:15.096125
5	餃子	2016-07-26 05:17:15.117389	2016-07-26 05:17:15.117389
6	そば	2016-07-26 05:17:15.128323	2016-07-26 05:17:15.128323
7	うどん	2016-07-26 05:17:15.135887	2016-07-26 05:17:15.135887
8	中華	2016-07-26 05:17:15.144207	2016-07-26 05:17:15.144207
9	定食	2016-07-26 05:17:15.152633	2016-07-26 05:17:15.152633
10	カレー	2016-07-26 05:17:15.160667	2016-07-26 05:17:15.160667
11	インド料理	2016-07-26 05:17:15.166488	2016-07-26 05:17:15.166488
12	カフェ・喫茶店	2016-07-26 05:17:15.172658	2016-07-26 05:17:15.172658
13	イタリアン	2016-07-26 05:17:15.179076	2016-07-26 05:17:15.179076
14	フレンチ	2016-07-26 05:17:15.184812	2016-07-26 05:17:15.184812
15	ジャンクフード	2016-07-26 05:17:15.19749	2016-07-26 05:17:15.19749
16	ハンバーガー	2016-07-26 05:17:15.205178	2016-07-26 05:17:15.205178
17	焼肉	2016-07-26 05:17:15.212639	2016-07-26 05:17:15.212639
18	どんぶり	2016-07-26 05:17:15.220166	2016-07-26 05:17:15.220166
19	寿司	2016-07-26 05:17:15.227425	2016-07-26 05:17:15.227425
20	コンビニ	2016-07-26 05:17:15.234508	2016-07-26 05:17:15.234508
21	軽食	2016-07-26 05:17:15.24231	2016-07-26 05:17:15.24231
22	ファミレス	2016-07-26 05:17:15.249971	2016-07-26 05:17:15.249971
23	手羽先	2016-07-26 05:17:15.256823	2016-07-26 05:17:15.256823
24	揚げ物	2016-07-26 05:17:15.269961	2016-07-26 05:17:15.269961
25	焼き鳥	2016-07-26 05:17:15.275817	2016-07-26 05:17:15.275817
26	隠れ家	2016-07-26 05:17:15.281804	2016-07-26 05:17:15.281804
27	居酒屋	2016-07-26 05:17:15.287379	2016-07-26 05:17:15.287379
28	鉄板焼	2016-07-26 05:17:15.293563	2016-07-26 05:17:15.293563
29	鳥料理	2016-07-26 05:17:15.301565	2016-07-26 05:17:15.301565
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('categories_id_seq', 29, true);


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
1	test"1"	マイページタイトル	\N	マイページ説明文	\N	\N	1	2016-07-26 05:17:23.431299	2016-07-26 05:17:23.431299
2	test"2"	マイページタイトル	\N	マイページ説明文	\N	\N	2	2016-07-26 05:17:23.438617	2016-07-26 05:17:23.438617
3	test"3"	マイページタイトル	\N	マイページ説明文	\N	\N	3	2016-07-26 05:17:23.444019	2016-07-26 05:17:23.444019
4	test"4"	マイページタイトル	\N	マイページ説明文	\N	\N	4	2016-07-26 05:17:23.449632	2016-07-26 05:17:23.449632
5	test"5"	マイページタイトル	\N	マイページ説明文	\N	\N	5	2016-07-26 05:17:23.461676	2016-07-26 05:17:23.461676
6	test"6"	マイページタイトル	\N	マイページ説明文	\N	\N	6	2016-07-26 05:17:23.46691	2016-07-26 05:17:23.46691
7	test"7"	マイページタイトル	\N	マイページ説明文	\N	\N	7	2016-07-26 05:17:23.472585	2016-07-26 05:17:23.472585
8	test"8"	マイページタイトル	\N	マイページ説明文	\N	\N	8	2016-07-26 05:17:23.489651	2016-07-26 05:17:23.489651
9	test"9"	マイページタイトル	\N	マイページ説明文	\N	\N	9	2016-07-26 05:17:23.504861	2016-07-26 05:17:23.504861
10	test"10"	マイページタイトル	\N	マイページ説明文	\N	\N	10	2016-07-26 05:17:23.511044	2016-07-26 05:17:23.511044
11	test"11"	マイページタイトル	\N	マイページ説明文	\N	\N	11	2016-07-26 05:17:23.517017	2016-07-26 05:17:23.517017
12	test"12"	マイページタイトル	\N	マイページ説明文	\N	\N	12	2016-07-26 05:17:23.52246	2016-07-26 05:17:23.52246
13	test"13"	マイページタイトル	\N	マイページ説明文	\N	\N	13	2016-07-26 05:17:23.527871	2016-07-26 05:17:23.527871
14	test"14"	マイページタイトル	\N	マイページ説明文	\N	\N	14	2016-07-26 05:17:23.533653	2016-07-26 05:17:23.533653
15	test"15"	マイページタイトル	\N	マイページ説明文	\N	\N	15	2016-07-26 05:17:23.538899	2016-07-26 05:17:23.538899
16	test"16"	マイページタイトル	\N	マイページ説明文	\N	\N	16	2016-07-26 05:17:23.544109	2016-07-26 05:17:23.544109
17	test"17"	マイページタイトル	\N	マイページ説明文	\N	\N	17	2016-07-26 05:17:23.550075	2016-07-26 05:17:23.550075
18	test"18"	マイページタイトル	\N	マイページ説明文	\N	\N	18	2016-07-26 05:17:23.555594	2016-07-26 05:17:23.555594
19	test"19"	マイページタイトル	\N	マイページ説明文	\N	\N	19	2016-07-26 05:17:23.560665	2016-07-26 05:17:23.560665
20	test"20"	マイページタイトル	\N	マイページ説明文	\N	\N	20	2016-07-26 05:17:23.566018	2016-07-26 05:17:23.566018
21	test"21"	マイページタイトル	\N	マイページ説明文	\N	\N	21	2016-07-26 05:17:23.571014	2016-07-26 05:17:23.571014
22	test"22"	マイページタイトル	\N	マイページ説明文	\N	\N	22	2016-07-26 05:17:23.57639	2016-07-26 05:17:23.57639
23	test"23"	マイページタイトル	\N	マイページ説明文	\N	\N	23	2016-07-26 05:17:23.582094	2016-07-26 05:17:23.582094
24	test"24"	マイページタイトル	\N	マイページ説明文	\N	\N	24	2016-07-26 05:17:23.588449	2016-07-26 05:17:23.588449
25	test"25"	マイページタイトル	\N	マイページ説明文	\N	\N	25	2016-07-26 05:17:23.593544	2016-07-26 05:17:23.593544
26	test"26"	マイページタイトル	\N	マイページ説明文	\N	\N	26	2016-07-26 05:17:23.598631	2016-07-26 05:17:23.598631
27	test"27"	マイページタイトル	\N	マイページ説明文	\N	\N	27	2016-07-26 05:17:23.603723	2016-07-26 05:17:23.603723
28	test"28"	マイページタイトル	\N	マイページ説明文	\N	\N	28	2016-07-26 05:17:23.609534	2016-07-26 05:17:23.609534
29	test"29"	マイページタイトル	\N	マイページ説明文	\N	\N	29	2016-07-26 05:17:23.615234	2016-07-26 05:17:23.615234
30	test"30"	マイページタイトル	\N	マイページ説明文	\N	\N	30	2016-07-26 05:17:23.620448	2016-07-26 05:17:23.620448
31	test"31"	マイページタイトル	\N	マイページ説明文	\N	\N	31	2016-07-26 05:17:23.625438	2016-07-26 05:17:23.625438
32	test"32"	マイページタイトル	\N	マイページ説明文	\N	\N	32	2016-07-26 05:17:23.630463	2016-07-26 05:17:23.630463
33	test"33"	マイページタイトル	\N	マイページ説明文	\N	\N	33	2016-07-26 05:17:23.635299	2016-07-26 05:17:23.635299
34	test"34"	マイページタイトル	\N	マイページ説明文	\N	\N	34	2016-07-26 05:17:23.639919	2016-07-26 05:17:23.639919
35	test"35"	マイページタイトル	\N	マイページ説明文	\N	\N	35	2016-07-26 05:17:23.64457	2016-07-26 05:17:23.64457
36	test"36"	マイページタイトル	\N	マイページ説明文	\N	\N	36	2016-07-26 05:17:23.64993	2016-07-26 05:17:23.64993
37	test"37"	マイページタイトル	\N	マイページ説明文	\N	\N	37	2016-07-26 05:17:23.654736	2016-07-26 05:17:23.654736
38	test"38"	マイページタイトル	\N	マイページ説明文	\N	\N	38	2016-07-26 05:17:23.659476	2016-07-26 05:17:23.659476
39	test"39"	マイページタイトル	\N	マイページ説明文	\N	\N	39	2016-07-26 05:17:23.66436	2016-07-26 05:17:23.66436
40	test"40"	マイページタイトル	\N	マイページ説明文	\N	\N	40	2016-07-26 05:17:23.669597	2016-07-26 05:17:23.669597
41	test"41"	マイページタイトル	\N	マイページ説明文	\N	\N	41	2016-07-26 05:17:23.674701	2016-07-26 05:17:23.674701
42	test"42"	マイページタイトル	\N	マイページ説明文	\N	\N	42	2016-07-26 05:17:23.679579	2016-07-26 05:17:23.679579
43	test"43"	マイページタイトル	\N	マイページ説明文	\N	\N	43	2016-07-26 05:17:23.684892	2016-07-26 05:17:23.684892
44	test"44"	マイページタイトル	\N	マイページ説明文	\N	\N	44	2016-07-26 05:17:23.691211	2016-07-26 05:17:23.691211
45	test"45"	マイページタイトル	\N	マイページ説明文	\N	\N	45	2016-07-26 05:17:23.696005	2016-07-26 05:17:23.696005
46	test"46"	マイページタイトル	\N	マイページ説明文	\N	\N	46	2016-07-26 05:17:23.700938	2016-07-26 05:17:23.700938
47	test"47"	マイページタイトル	\N	マイページ説明文	\N	\N	47	2016-07-26 05:17:23.705744	2016-07-26 05:17:23.705744
48	test"48"	マイページタイトル	\N	マイページ説明文	\N	\N	48	2016-07-26 05:17:23.710544	2016-07-26 05:17:23.710544
49	test"49"	マイページタイトル	\N	マイページ説明文	\N	\N	49	2016-07-26 05:17:23.715412	2016-07-26 05:17:23.715412
50	test"50"	マイページタイトル	\N	マイページ説明文	\N	\N	50	2016-07-26 05:17:23.721026	2016-07-26 05:17:23.721026
51	test"1"	マイページタイトル	\N	マイページ説明文	\N	\N	1	2016-07-28 06:13:26.621146	2016-07-28 06:13:26.621146
52	test"2"	マイページタイトル	\N	マイページ説明文	\N	\N	2	2016-07-28 06:13:26.632099	2016-07-28 06:13:26.632099
53	test"3"	マイページタイトル	\N	マイページ説明文	\N	\N	3	2016-07-28 06:13:26.639559	2016-07-28 06:13:26.639559
54	test"4"	マイページタイトル	\N	マイページ説明文	\N	\N	4	2016-07-28 06:13:26.647105	2016-07-28 06:13:26.647105
55	test"5"	マイページタイトル	\N	マイページ説明文	\N	\N	5	2016-07-28 06:13:26.653769	2016-07-28 06:13:26.653769
56	test"6"	マイページタイトル	\N	マイページ説明文	\N	\N	6	2016-07-28 06:13:26.660393	2016-07-28 06:13:26.660393
57	test"7"	マイページタイトル	\N	マイページ説明文	\N	\N	7	2016-07-28 06:13:26.667256	2016-07-28 06:13:26.667256
58	test"8"	マイページタイトル	\N	マイページ説明文	\N	\N	8	2016-07-28 06:13:26.675093	2016-07-28 06:13:26.675093
59	test"9"	マイページタイトル	\N	マイページ説明文	\N	\N	9	2016-07-28 06:13:26.682054	2016-07-28 06:13:26.682054
60	test"10"	マイページタイトル	\N	マイページ説明文	\N	\N	10	2016-07-28 06:13:26.688705	2016-07-28 06:13:26.688705
61	test"11"	マイページタイトル	\N	マイページ説明文	\N	\N	11	2016-07-28 06:13:26.696732	2016-07-28 06:13:26.696732
62	test"12"	マイページタイトル	\N	マイページ説明文	\N	\N	12	2016-07-28 06:13:26.704534	2016-07-28 06:13:26.704534
63	test"13"	マイページタイトル	\N	マイページ説明文	\N	\N	13	2016-07-28 06:13:26.712017	2016-07-28 06:13:26.712017
64	test"14"	マイページタイトル	\N	マイページ説明文	\N	\N	14	2016-07-28 06:13:26.720317	2016-07-28 06:13:26.720317
65	test"15"	マイページタイトル	\N	マイページ説明文	\N	\N	15	2016-07-28 06:13:26.727895	2016-07-28 06:13:26.727895
66	test"16"	マイページタイトル	\N	マイページ説明文	\N	\N	16	2016-07-28 06:13:26.735022	2016-07-28 06:13:26.735022
67	test"17"	マイページタイトル	\N	マイページ説明文	\N	\N	17	2016-07-28 06:13:26.742878	2016-07-28 06:13:26.742878
68	test"18"	マイページタイトル	\N	マイページ説明文	\N	\N	18	2016-07-28 06:13:26.749703	2016-07-28 06:13:26.749703
69	test"19"	マイページタイトル	\N	マイページ説明文	\N	\N	19	2016-07-28 06:13:26.755722	2016-07-28 06:13:26.755722
70	test"20"	マイページタイトル	\N	マイページ説明文	\N	\N	20	2016-07-28 06:13:26.762269	2016-07-28 06:13:26.762269
71	test"21"	マイページタイトル	\N	マイページ説明文	\N	\N	21	2016-07-28 06:13:26.768412	2016-07-28 06:13:26.768412
72	test"22"	マイページタイトル	\N	マイページ説明文	\N	\N	22	2016-07-28 06:13:26.77407	2016-07-28 06:13:26.77407
73	test"23"	マイページタイトル	\N	マイページ説明文	\N	\N	23	2016-07-28 06:13:26.7806	2016-07-28 06:13:26.7806
74	test"24"	マイページタイトル	\N	マイページ説明文	\N	\N	24	2016-07-28 06:13:26.786828	2016-07-28 06:13:26.786828
75	test"25"	マイページタイトル	\N	マイページ説明文	\N	\N	25	2016-07-28 06:13:26.792792	2016-07-28 06:13:26.792792
76	test"26"	マイページタイトル	\N	マイページ説明文	\N	\N	26	2016-07-28 06:13:26.798757	2016-07-28 06:13:26.798757
77	test"27"	マイページタイトル	\N	マイページ説明文	\N	\N	27	2016-07-28 06:13:26.804689	2016-07-28 06:13:26.804689
78	test"28"	マイページタイトル	\N	マイページ説明文	\N	\N	28	2016-07-28 06:13:26.809908	2016-07-28 06:13:26.809908
79	test"29"	マイページタイトル	\N	マイページ説明文	\N	\N	29	2016-07-28 06:13:26.815325	2016-07-28 06:13:26.815325
80	test"30"	マイページタイトル	\N	マイページ説明文	\N	\N	30	2016-07-28 06:13:26.820713	2016-07-28 06:13:26.820713
81	test"31"	マイページタイトル	\N	マイページ説明文	\N	\N	31	2016-07-28 06:13:26.827108	2016-07-28 06:13:26.827108
82	test"32"	マイページタイトル	\N	マイページ説明文	\N	\N	32	2016-07-28 06:13:26.834878	2016-07-28 06:13:26.834878
83	test"33"	マイページタイトル	\N	マイページ説明文	\N	\N	33	2016-07-28 06:13:26.8423	2016-07-28 06:13:26.8423
84	test"34"	マイページタイトル	\N	マイページ説明文	\N	\N	34	2016-07-28 06:13:26.848991	2016-07-28 06:13:26.848991
85	test"35"	マイページタイトル	\N	マイページ説明文	\N	\N	35	2016-07-28 06:13:26.855887	2016-07-28 06:13:26.855887
86	test"36"	マイページタイトル	\N	マイページ説明文	\N	\N	36	2016-07-28 06:13:26.864514	2016-07-28 06:13:26.864514
87	test"37"	マイページタイトル	\N	マイページ説明文	\N	\N	37	2016-07-28 06:13:26.870365	2016-07-28 06:13:26.870365
88	test"38"	マイページタイトル	\N	マイページ説明文	\N	\N	38	2016-07-28 06:13:26.875378	2016-07-28 06:13:26.875378
89	test"39"	マイページタイトル	\N	マイページ説明文	\N	\N	39	2016-07-28 06:13:26.880961	2016-07-28 06:13:26.880961
90	test"40"	マイページタイトル	\N	マイページ説明文	\N	\N	40	2016-07-28 06:13:26.886379	2016-07-28 06:13:26.886379
91	test"41"	マイページタイトル	\N	マイページ説明文	\N	\N	41	2016-07-28 06:13:26.892317	2016-07-28 06:13:26.892317
92	test"42"	マイページタイトル	\N	マイページ説明文	\N	\N	42	2016-07-28 06:13:26.898431	2016-07-28 06:13:26.898431
93	test"43"	マイページタイトル	\N	マイページ説明文	\N	\N	43	2016-07-28 06:13:26.904467	2016-07-28 06:13:26.904467
94	test"44"	マイページタイトル	\N	マイページ説明文	\N	\N	44	2016-07-28 06:13:26.910495	2016-07-28 06:13:26.910495
95	test"45"	マイページタイトル	\N	マイページ説明文	\N	\N	45	2016-07-28 06:13:26.915476	2016-07-28 06:13:26.915476
96	test"46"	マイページタイトル	\N	マイページ説明文	\N	\N	46	2016-07-28 06:13:26.922893	2016-07-28 06:13:26.922893
97	test"47"	マイページタイトル	\N	マイページ説明文	\N	\N	47	2016-07-28 06:13:26.928922	2016-07-28 06:13:26.928922
98	test"48"	マイページタイトル	\N	マイページ説明文	\N	\N	48	2016-07-28 06:13:26.935695	2016-07-28 06:13:26.935695
99	test"49"	マイページタイトル	\N	マイページ説明文	\N	\N	49	2016-07-28 06:13:26.943654	2016-07-28 06:13:26.943654
100	test"50"	マイページタイトル	\N	マイページ説明文	\N	\N	50	2016-07-28 06:13:26.949619	2016-07-28 06:13:26.949619
\.


--
-- Name: mypages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('mypages_id_seq', 100, true);


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
1	1	4	2016-07-26 05:17:15.577818	2016-07-26 05:17:15.577818
2	6	1	2016-07-26 05:17:15.652091	2016-07-26 05:17:15.652091
3	7	1	2016-07-26 05:17:15.694083	2016-07-26 05:17:15.694083
4	8	1	2016-07-26 05:17:15.724433	2016-07-26 05:17:15.724433
5	9	1	2016-07-26 05:17:15.764562	2016-07-26 05:17:15.764562
6	10	1	2016-07-26 05:17:15.794556	2016-07-26 05:17:15.794556
7	11	1	2016-07-26 05:17:15.821197	2016-07-26 05:17:15.821197
8	12	1	2016-07-26 05:17:15.834469	2016-07-26 05:17:15.834469
9	13	1	2016-07-26 05:17:15.847911	2016-07-26 05:17:15.847911
10	14	1	2016-07-26 05:17:15.863043	2016-07-26 05:17:15.863043
11	1	4	2016-07-28 06:13:17.495793	2016-07-28 06:13:17.495793
12	6	1	2016-07-28 06:13:17.607927	2016-07-28 06:13:17.607927
13	7	1	2016-07-28 06:13:17.705767	2016-07-28 06:13:17.705767
14	8	1	2016-07-28 06:13:17.763134	2016-07-28 06:13:17.763134
15	9	1	2016-07-28 06:13:17.834267	2016-07-28 06:13:17.834267
16	10	1	2016-07-28 06:13:17.874109	2016-07-28 06:13:17.874109
17	11	1	2016-07-28 06:13:17.918419	2016-07-28 06:13:17.918419
18	12	1	2016-07-28 06:13:17.942007	2016-07-28 06:13:17.942007
19	13	1	2016-07-28 06:13:17.98673	2016-07-28 06:13:17.98673
20	14	1	2016-07-28 06:13:18.014754	2016-07-28 06:13:18.014754
\.


--
-- Name: shop_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shop_areas_id_seq', 20, true);


--
-- Data for Name: shop_categories; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY shop_categories (id, shop_id, category_id, created_at, updated_at) FROM stdin;
1	1	25	2016-07-26 05:17:15.622266	2016-07-26 05:17:15.622266
2	6	17	2016-07-26 05:17:15.661578	2016-07-26 05:17:15.661578
3	6	27	2016-07-26 05:17:15.669806	2016-07-26 05:17:15.669806
4	6	28	2016-07-26 05:17:15.677818	2016-07-26 05:17:15.677818
5	7	10	2016-07-26 05:17:15.702848	2016-07-26 05:17:15.702848
6	7	11	2016-07-26 05:17:15.710785	2016-07-26 05:17:15.710785
7	8	25	2016-07-26 05:17:15.73207	2016-07-26 05:17:15.73207
8	8	29	2016-07-26 05:17:15.740917	2016-07-26 05:17:15.740917
9	8	27	2016-07-26 05:17:15.75018	2016-07-26 05:17:15.75018
10	9	13	2016-07-26 05:17:15.773128	2016-07-26 05:17:15.773128
11	9	14	2016-07-26 05:17:15.780288	2016-07-26 05:17:15.780288
12	10	28	2016-07-26 05:17:15.802053	2016-07-26 05:17:15.802053
13	10	27	2016-07-26 05:17:15.808837	2016-07-26 05:17:15.808837
14	1	25	2016-07-28 06:13:17.576904	2016-07-28 06:13:17.576904
15	6	17	2016-07-28 06:13:17.622672	2016-07-28 06:13:17.622672
16	6	27	2016-07-28 06:13:17.648918	2016-07-28 06:13:17.648918
17	6	28	2016-07-28 06:13:17.667997	2016-07-28 06:13:17.667997
18	7	10	2016-07-28 06:13:17.723432	2016-07-28 06:13:17.723432
19	7	11	2016-07-28 06:13:17.735581	2016-07-28 06:13:17.735581
20	8	25	2016-07-28 06:13:17.783551	2016-07-28 06:13:17.783551
21	8	29	2016-07-28 06:13:17.801846	2016-07-28 06:13:17.801846
22	8	27	2016-07-28 06:13:17.814917	2016-07-28 06:13:17.814917
23	9	13	2016-07-28 06:13:17.844806	2016-07-28 06:13:17.844806
24	9	14	2016-07-28 06:13:17.854803	2016-07-28 06:13:17.854803
25	10	28	2016-07-28 06:13:17.884907	2016-07-28 06:13:17.884907
26	10	27	2016-07-28 06:13:17.896359	2016-07-28 06:13:17.896359
\.


--
-- Name: shop_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shop_categories_id_seq', 26, true);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY shops (id, name, address, latitude, longitude, mainimage, created_at, updated_at) FROM stdin;
1	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-26 05:17:15.34359	2016-07-26 05:17:15.34359
2	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-26 05:17:15.351206	2016-07-26 05:17:15.351206
3	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-26 05:17:15.357868	2016-07-26 05:17:15.357868
4	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-26 05:17:15.365903	2016-07-26 05:17:15.365903
5	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-26 05:17:15.373691	2016-07-26 05:17:15.373691
6	向日葵	愛知県名古屋市中区千代田2-15-18 名古屋通信ビルB1	35.1563719999999975	136.915262000000013	\N	2016-07-26 05:17:15.634851	2016-07-26 05:17:15.634851
7	ムガルパレス ２号店	愛知県 名古屋市中区 千代田 5丁目11-33 クマザキビルビル1F	35.1600219999999979	136.920181000000014	\N	2016-07-26 05:17:15.683266	2016-07-26 05:17:15.683266
8	炭火やきとり 豆鳥	愛知県 名古屋市中区 千代田 5-17-15 田中コーポラス1F	35.1584310000000002	136.91733099999999	\N	2016-07-26 05:17:15.716524	2016-07-26 05:17:15.716524
9	鶴舞Perch	愛知県 名古屋市中区 千代田 3-15-19 メゾン千代田　B1F	35.1541509999999988	136.914681000000002	\N	2016-07-26 05:17:15.756143	2016-07-26 05:17:15.756143
10	広島鉄板居酒屋 来い鯉	愛知県 名古屋市中区 千代田 3-12-5	35.155731000000003	136.91665900000001	\N	2016-07-26 05:17:15.785859	2016-07-26 05:17:15.785859
11	もつ焼き百蔵	愛知県 名古屋市中区 千代田 3-11-12 モモセビル 1F	35.1556670000000011	136.915742999999992	\N	2016-07-26 05:17:15.813837	2016-07-26 05:17:15.813837
12	焼肉市場さくら×さくら	愛知県名古屋市中区新栄２-47-50	35.1617499999999978	136.922447000000005	\N	2016-07-26 05:17:15.826081	2016-07-26 05:17:15.826081
13	鳥貴族 鶴舞店	愛知県 名古屋市中区 千代田 3-11-9 2F	35.155659	136.915314999999993	\N	2016-07-26 05:17:15.839406	2016-07-26 05:17:15.839406
14	笑笑 鶴舞駅前店	愛知県 名古屋市中区 千代田 3-11-9 鶴舞駅前ビル 2F	35.1558500000000009	136.915550999999994	\N	2016-07-26 05:17:15.854221	2016-07-26 05:17:15.854221
15	shop1	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-28 06:13:17.044583	2016-07-28 06:13:17.044583
16	shop2	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-28 06:13:17.055979	2016-07-28 06:13:17.055979
17	shop3	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-28 06:13:17.074826	2016-07-28 06:13:17.074826
18	shop4	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-28 06:13:17.093658	2016-07-28 06:13:17.093658
19	shop5	toriaezu	35.1527163106302964	136.930525302886991	\N	2016-07-28 06:13:17.111286	2016-07-28 06:13:17.111286
20	向日葵	愛知県名古屋市中区千代田2-15-18 名古屋通信ビルB1	35.1563719999999975	136.915262000000013	\N	2016-07-28 06:13:17.59131	2016-07-28 06:13:17.59131
21	ムガルパレス ２号店	愛知県 名古屋市中区 千代田 5丁目11-33 クマザキビルビル1F	35.1600219999999979	136.920181000000014	\N	2016-07-28 06:13:17.687918	2016-07-28 06:13:17.687918
22	炭火やきとり 豆鳥	愛知県 名古屋市中区 千代田 5-17-15 田中コーポラス1F	35.1584310000000002	136.91733099999999	\N	2016-07-28 06:13:17.749571	2016-07-28 06:13:17.749571
23	鶴舞Perch	愛知県 名古屋市中区 千代田 3-15-19 メゾン千代田　B1F	35.1541509999999988	136.914681000000002	\N	2016-07-28 06:13:17.822821	2016-07-28 06:13:17.822821
24	広島鉄板居酒屋 来い鯉	愛知県 名古屋市中区 千代田 3-12-5	35.155731000000003	136.91665900000001	\N	2016-07-28 06:13:17.86166	2016-07-28 06:13:17.86166
25	もつ焼き百蔵	愛知県 名古屋市中区 千代田 3-11-12 モモセビル 1F	35.1556670000000011	136.915742999999992	\N	2016-07-28 06:13:17.904766	2016-07-28 06:13:17.904766
26	焼肉市場さくら×さくら	愛知県名古屋市中区新栄２-47-50	35.1617499999999978	136.922447000000005	\N	2016-07-28 06:13:17.927542	2016-07-28 06:13:17.927542
27	鳥貴族 鶴舞店	愛知県 名古屋市中区 千代田 3-11-9 2F	35.155659	136.915314999999993	\N	2016-07-28 06:13:17.952102	2016-07-28 06:13:17.952102
28	笑笑 鶴舞駅前店	愛知県 名古屋市中区 千代田 3-11-9 鶴舞駅前ビル 2F	35.1558500000000009	136.915550999999994	\N	2016-07-28 06:13:17.996936	2016-07-28 06:13:17.996936
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shops_id_seq', 28, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, provider, uid, token) FROM stdin;
1	test1@test.com	$2a$11$d.q..H0UiIMYgSOzIuOQ6O1RTjgCPhQRJ6ve/1mxASZ.NK15ru8f2	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:16.037205	2016-07-26 05:17:16.037205	\N	\N	\N
2	test2@test.com	$2a$11$ggqjTQKCTHagBUATqWtUOu.DFXervGEbBtMCW.QDGPKvreB4GHAF.	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:16.186021	2016-07-26 05:17:16.186021	\N	\N	\N
3	test3@test.com	$2a$11$Wh/Q0vVnWZwdZWMdVJmhe.JlUXJM5qLh69O5lO5.9nq3EfjgvSMO6	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:16.333766	2016-07-26 05:17:16.333766	\N	\N	\N
4	test4@test.com	$2a$11$.U1x/nMwcc9zaMh3HZh2heLsoZ89AG765vJbM1K3cB0sYVQ.ovYHK	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:16.482746	2016-07-26 05:17:16.482746	\N	\N	\N
5	test5@test.com	$2a$11$0d1ZnSc1Tvkbv2QVSwoAoeGlM7uGp/sah69Wf2./TzId1a.JdFHBa	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:16.640912	2016-07-26 05:17:16.640912	\N	\N	\N
6	test6@test.com	$2a$11$3vLnD1.QMdbMGkW0aU42pumkDbpWNzRmpR9JD2bocG6dAIl2Rq/hi	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:16.795367	2016-07-26 05:17:16.795367	\N	\N	\N
7	test7@test.com	$2a$11$ceFhkCUFSuaEzu9R9EyknO2gbIfVx4ONwbrsSWDoDyROnZ6c88Vem	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:16.948263	2016-07-26 05:17:16.948263	\N	\N	\N
8	test8@test.com	$2a$11$HA.jPJMY/5wb7DdXUK96jO./qA1n53Xv9EGJvrE7REm0DmCg.r4dC	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:17.101942	2016-07-26 05:17:17.101942	\N	\N	\N
9	test9@test.com	$2a$11$GLGebZJDrJtrgimeeKSCFuzNJAcXpHAOIsyHpzsvHDq3LkYC8T2EW	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:17.250934	2016-07-26 05:17:17.250934	\N	\N	\N
10	test10@test.com	$2a$11$U3mTh.Uajv6yyVwHakIT6.AyV7iA3HCnQm4m4P8m11E.cdDQ3ipXe	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:17.400559	2016-07-26 05:17:17.400559	\N	\N	\N
11	test11@test.com	$2a$11$S/Xj5hIHv6axRZ1ng4MuA.KI0wD/PErNTTU5fbE/W3s6AMwn/9rgi	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:17.550102	2016-07-26 05:17:17.550102	\N	\N	\N
12	test12@test.com	$2a$11$jzIibVk/HJM4mAUloN5qAO9wpPm3iIWsam8pH.HotgoH2P8KAecKy	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:17.698859	2016-07-26 05:17:17.698859	\N	\N	\N
13	test13@test.com	$2a$11$eN23clH571hGRlUGvhKqWe80FboA37aFatus1jGEnrMeTqLWmLeQe	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:17.850029	2016-07-26 05:17:17.850029	\N	\N	\N
14	test14@test.com	$2a$11$0.oHM6BJLlcDE3SCdCai7.bcq8nPN7eP.k/Bjt8KXaXsgxs6hXrcm	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:18.014428	2016-07-26 05:17:18.014428	\N	\N	\N
15	test15@test.com	$2a$11$EHWocwWTjb8WnrShMFPSxuNDojfX6t67IBU0xdsDOxKd9tTrHpBx2	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:18.16049	2016-07-26 05:17:18.16049	\N	\N	\N
16	test16@test.com	$2a$11$UkCKShS2yHnac1em2xjxhe5S/VOXgN34m3JxnhnWi9wUpFls9vi4C	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:18.307831	2016-07-26 05:17:18.307831	\N	\N	\N
17	test17@test.com	$2a$11$4nUuGi.M/47m.N.7/KknAOGCNiV2Diz5WI0CZ4XISDq7XyCG5fcFy	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:18.454709	2016-07-26 05:17:18.454709	\N	\N	\N
18	test18@test.com	$2a$11$7RjmpCQGswELVjnFB4Bi4ewolrcYkLSjILy0Kuv4J9g/HLly9Hhsa	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:18.602443	2016-07-26 05:17:18.602443	\N	\N	\N
19	test19@test.com	$2a$11$e3dKXomSdn8s7RxRnMFEqOaROTfzJrZ5BoDmhtYUhqh2p1c0wQJVq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:18.749553	2016-07-26 05:17:18.749553	\N	\N	\N
20	test20@test.com	$2a$11$P2XdCujO1hWKMnSGTsJqB.KDjadU14RkZC0YKUMOmsux2gi1bue3i	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:18.899326	2016-07-26 05:17:18.899326	\N	\N	\N
21	test21@test.com	$2a$11$4xCYfeG1HxMpsTnoihain.8x.NA.cfj.333EaFUi83TvCB.dHlGh6	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:19.051446	2016-07-26 05:17:19.051446	\N	\N	\N
22	test22@test.com	$2a$11$za2wnAQjBEUbvea7tHfwIep1DMDNWacRzTRJaF71EcPIL/sZjr6sq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:19.201599	2016-07-26 05:17:19.201599	\N	\N	\N
23	test23@test.com	$2a$11$D4qqSsUU4X1VZ28JTQ8Zh.tl7Ak6NbzFf/xHNvi1EFmPwxFrxpO3m	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:19.352037	2016-07-26 05:17:19.352037	\N	\N	\N
24	test24@test.com	$2a$11$wJyQxCaD/c6dTBHe5EDLju7hL62G4Ru2C8N5cxvEYOX7fUjhyqZbG	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:19.501192	2016-07-26 05:17:19.501192	\N	\N	\N
25	test25@test.com	$2a$11$TLuTjz/y9Q0rN5jHkwF2m.ijCN29C9BK6AqHF7gt68B7wKgDGKG.e	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:19.64908	2016-07-26 05:17:19.64908	\N	\N	\N
26	test26@test.com	$2a$11$Jm7lxnNAEly0Gfn5p.VMLONCXooWb62ACqatvxr..B30Hs6fPNBTW	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:19.798666	2016-07-26 05:17:19.798666	\N	\N	\N
27	test27@test.com	$2a$11$k7fzKod8lTbXa4VoWE6ehuwprBdtpeBThqx3SUBE7m491Luo8lqtK	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:19.948392	2016-07-26 05:17:19.948392	\N	\N	\N
28	test28@test.com	$2a$11$CxdFMCjl.lXz9Ao1gWzLlu/1iLRCXimWrP7FskKKG60UEMBej8rkW	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:20.10207	2016-07-26 05:17:20.10207	\N	\N	\N
29	test29@test.com	$2a$11$CTDX5t1OLB5eY4COIXmSleRpAACzTZ2A9wBOJ373BlgVM/IV4eFQe	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:20.25318	2016-07-26 05:17:20.25318	\N	\N	\N
30	test30@test.com	$2a$11$lvdKJLoUYP.e.Q/hX8/pwOo9vwH6wdl1fbx1ArW4g/UBngdzSO4Gy	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:20.402549	2016-07-26 05:17:20.402549	\N	\N	\N
31	test31@test.com	$2a$11$auYtZqpReKtjwB.tRfWMCO.gdN.vIsysFEZ2yAEt.ECBDocnHZu2S	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:20.55033	2016-07-26 05:17:20.55033	\N	\N	\N
32	test32@test.com	$2a$11$ufD.5XlGuwKwTSxnUQe/Xu5t2IGz90tckolDqvVwvVyz8FTN4CS0S	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:20.702087	2016-07-26 05:17:20.702087	\N	\N	\N
33	test33@test.com	$2a$11$llxL1az0N9fFey5z0ecGUeF2mwWl1tOu9NhP3oB53vqfYqIESd7gG	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:20.850607	2016-07-26 05:17:20.850607	\N	\N	\N
34	test34@test.com	$2a$11$5qt4jI40gjfXKYROffEt8u66qU6gZM.K2yStdS/gyFUoRyEQo1zxa	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:20.999994	2016-07-26 05:17:20.999994	\N	\N	\N
35	test35@test.com	$2a$11$DVDK2NhbUPKnT0zGU.ryDexVotAlMFqVY5T.KiKovh/oI/WJ33mKy	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:21.148098	2016-07-26 05:17:21.148098	\N	\N	\N
36	test36@test.com	$2a$11$aQS4kXR/whmGp017wrTTWubuD2v3M..lKkR62dz4Mw6Weg0wSz.aa	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:21.298235	2016-07-26 05:17:21.298235	\N	\N	\N
37	test37@test.com	$2a$11$5TUxaRt6vz6OtV84CKz9t./p1UnwgZ1CeLK8WZOckuoVHx9OMGtCu	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:21.446994	2016-07-26 05:17:21.446994	\N	\N	\N
38	test38@test.com	$2a$11$Nml98T4G58OxaBYzZNJBAOHDFBO2oJCDdLWF2gEikYblqB3Fw3DCy	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:21.595186	2016-07-26 05:17:21.595186	\N	\N	\N
39	test39@test.com	$2a$11$jHmKIO26zHrMocLsxTUQEuQRl/uKZKwHCK.yWie.7JFB42E.uAebq	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:21.741335	2016-07-26 05:17:21.741335	\N	\N	\N
40	test40@test.com	$2a$11$8OeUkUvrcHBU8NaJlTFLbOi4JXwmCF7KwGw0Q8Xt7YBQBaH8cx4TS	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:21.892736	2016-07-26 05:17:21.892736	\N	\N	\N
41	test41@test.com	$2a$11$D5ZCdXol5h5d.gKYDN2D6OG0o.A0QTWo9eFUkqDFDX689bQELV3pO	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:22.043195	2016-07-26 05:17:22.043195	\N	\N	\N
42	test42@test.com	$2a$11$EN0RDU6XMqm0MvkWGZsDguTQy1Ed3TAnmkwV03owFvIS7g7WES.5W	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:22.189648	2016-07-26 05:17:22.189648	\N	\N	\N
43	test43@test.com	$2a$11$kdImT0jmU0f54p5suULX6OWpyLS829tHifF.IDQKQCn4alzl6WDzO	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:22.340275	2016-07-26 05:17:22.340275	\N	\N	\N
44	test44@test.com	$2a$11$7Jg7vakBvEm5KVd0MaUYXu6SCEuKVFH3C0JfApTjyhxfgsL9Pw0gy	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:22.49227	2016-07-26 05:17:22.49227	\N	\N	\N
45	test45@test.com	$2a$11$A0TQzRo0nQdOZE2kTzADU.149e7xS3rJjPm1oeEcnypXogZaUbPue	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:22.643027	2016-07-26 05:17:22.643027	\N	\N	\N
46	test46@test.com	$2a$11$iR1DoXmum0FJwAFf/vwyM.srT3g1A0u0FvwoER3Uxl1hONYpVwqkC	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:22.795902	2016-07-26 05:17:22.795902	\N	\N	\N
47	test47@test.com	$2a$11$QApHGklm2fDaewF8EvRBDu5hyGym3jzdiinOPQAJCdKzKC0H3.JsO	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:22.945635	2016-07-26 05:17:22.945635	\N	\N	\N
48	test48@test.com	$2a$11$f9a6j9tC4NVQ6tRrop3S4e6aht7fRiTme1naTzM.duYkrQPWD727q	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:23.105038	2016-07-26 05:17:23.105038	\N	\N	\N
49	test49@test.com	$2a$11$kQPrrMU4PqN4MwPWkGpWPupaSpxGfvFYQ4s2GgQeLevZPh1d8dQ76	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:23.253045	2016-07-26 05:17:23.253045	\N	\N	\N
50	test50@test.com	$2a$11$RGUPVtc0qcYe2bJwZRNCWemCQ22KPN28.Vd431uyP.pKHyiLTHoTi	\N	\N	\N	0	\N	\N	\N	\N	2016-07-26 05:17:23.400179	2016-07-26 05:17:23.400179	\N	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('users_id_seq', 50, true);


--
-- Data for Name: wants; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY wants (id, shop_id, user_id, created_at, updated_at) FROM stdin;
1	1	1	2016-07-26 05:17:23.7659	2016-07-26 05:17:23.7659
2	2	1	2016-07-26 05:17:23.785512	2016-07-26 05:17:23.785512
3	3	1	2016-07-26 05:17:23.801371	2016-07-26 05:17:23.801371
4	4	1	2016-07-26 05:17:23.815925	2016-07-26 05:17:23.815925
5	5	1	2016-07-26 05:17:23.830152	2016-07-26 05:17:23.830152
6	6	1	2016-07-26 05:17:23.844624	2016-07-26 05:17:23.844624
7	7	1	2016-07-26 05:17:23.859453	2016-07-26 05:17:23.859453
8	8	1	2016-07-26 05:17:23.875411	2016-07-26 05:17:23.875411
9	9	1	2016-07-26 05:17:23.893858	2016-07-26 05:17:23.893858
10	10	1	2016-07-26 05:17:23.911166	2016-07-26 05:17:23.911166
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

