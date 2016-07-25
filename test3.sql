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
\.


--
-- Name: ages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('ages_id_seq', 1, false);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY areas (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('areas_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


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
\.


--
-- Name: mypages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('mypages_id_seq', 1, false);


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
\.


--
-- Name: shop_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shop_areas_id_seq', 1, false);


--
-- Data for Name: shop_categories; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY shop_categories (id, shop_id, category_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: shop_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shop_categories_id_seq', 1, false);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY shops (id, name, address, latitude, longitude, mainimage, created_at, updated_at) FROM stdin;
\.


--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('shops_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, provider, uid, token) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: wants; Type: TABLE DATA; Schema: public; Owner: agelog
--

COPY wants (id, shop_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: wants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: agelog
--

SELECT pg_catalog.setval('wants_id_seq', 1, false);


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

