--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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
-- Name: favorites; Type: TABLE; Schema: public; Owner: nguarino
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    user_id integer,
    pokemon_id integer
);


ALTER TABLE public.favorites OWNER TO nguarino;

--
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: nguarino
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorites_id_seq OWNER TO nguarino;

--
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nguarino
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- Name: pokemon; Type: TABLE; Schema: public; Owner: nguarino
--

CREATE TABLE public.pokemon (
    pid integer NOT NULL,
    name text NOT NULL,
    image_url text NOT NULL,
    type1 text NOT NULL,
    type2 text
);


ALTER TABLE public.pokemon OWNER TO nguarino;

--
-- Name: pokemon_pid_seq; Type: SEQUENCE; Schema: public; Owner: nguarino
--

CREATE SEQUENCE public.pokemon_pid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_pid_seq OWNER TO nguarino;

--
-- Name: pokemon_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nguarino
--

ALTER SEQUENCE public.pokemon_pid_seq OWNED BY public.pokemon.pid;


--
-- Name: pokemon_team_members; Type: TABLE; Schema: public; Owner: nguarino
--

CREATE TABLE public.pokemon_team_members (
    id integer NOT NULL,
    pokemon_id integer,
    pokemon_team_id integer
);


ALTER TABLE public.pokemon_team_members OWNER TO nguarino;

--
-- Name: pokemon_team_members_id_seq; Type: SEQUENCE; Schema: public; Owner: nguarino
--

CREATE SEQUENCE public.pokemon_team_members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_team_members_id_seq OWNER TO nguarino;

--
-- Name: pokemon_team_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nguarino
--

ALTER SEQUENCE public.pokemon_team_members_id_seq OWNED BY public.pokemon_team_members.id;


--
-- Name: pokemon_teams; Type: TABLE; Schema: public; Owner: nguarino
--

CREATE TABLE public.pokemon_teams (
    id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.pokemon_teams OWNER TO nguarino;

--
-- Name: pokemon_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: nguarino
--

CREATE SEQUENCE public.pokemon_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokemon_teams_id_seq OWNER TO nguarino;

--
-- Name: pokemon_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nguarino
--

ALTER SEQUENCE public.pokemon_teams_id_seq OWNED BY public.pokemon_teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nguarino
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    profile_img_url text
);


ALTER TABLE public.users OWNER TO nguarino;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: nguarino
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO nguarino;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nguarino
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- Name: pokemon pid; Type: DEFAULT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon ALTER COLUMN pid SET DEFAULT nextval('public.pokemon_pid_seq'::regclass);


--
-- Name: pokemon_team_members id; Type: DEFAULT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon_team_members ALTER COLUMN id SET DEFAULT nextval('public.pokemon_team_members_id_seq'::regclass);


--
-- Name: pokemon_teams id; Type: DEFAULT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon_teams ALTER COLUMN id SET DEFAULT nextval('public.pokemon_teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: nguarino
--

COPY public.favorites (id, user_id, pokemon_id) FROM stdin;
\.


--
-- Data for Name: pokemon; Type: TABLE DATA; Schema: public; Owner: nguarino
--

COPY public.pokemon (pid, name, image_url, type1, type2) FROM stdin;
1	bulbasaur	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png	grass	poison
2	ivysaur	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png	grass	poison
3	venusaur	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png	grass	poison
4	charmander	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png	fire	\N
5	charmeleon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png	fire	\N
6	charizard	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png	fire	flying
7	squirtle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png	water	\N
8	wartortle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png	water	\N
9	blastoise	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png	water	\N
10	caterpie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png	bug	\N
11	metapod	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png	bug	\N
12	butterfree	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png	bug	flying
13	weedle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png	bug	poison
14	kakuna	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png	bug	poison
15	beedrill	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png	bug	poison
16	pidgey	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png	normal	flying
17	pidgeotto	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png	normal	flying
18	pidgeot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png	normal	flying
19	rattata	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png	normal	\N
20	raticate	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png	normal	\N
21	spearow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png	normal	flying
22	fearow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png	normal	flying
23	ekans	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/23.png	poison	\N
24	arbok	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/24.png	poison	\N
25	pikachu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png	electric	\N
26	raichu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png	electric	\N
27	sandshrew	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png	ground	\N
28	sandslash	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/28.png	ground	\N
29	nidoran-f	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/29.png	poison	\N
30	nidorina	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png	poison	\N
31	nidoqueen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/31.png	poison	ground
32	nidoran-m	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/32.png	poison	\N
33	nidorino	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/33.png	poison	\N
34	nidoking	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/34.png	poison	ground
35	clefairy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png	fairy	\N
36	clefable	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/36.png	fairy	\N
37	vulpix	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/37.png	fire	\N
38	ninetales	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/38.png	fire	\N
39	jigglypuff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png	normal	fairy
40	wigglytuff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/40.png	normal	fairy
41	zubat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/41.png	poison	flying
42	golbat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/42.png	poison	flying
43	oddish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/43.png	grass	poison
44	gloom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/44.png	grass	poison
45	vileplume	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/45.png	grass	poison
46	paras	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/46.png	bug	grass
47	parasect	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/47.png	bug	grass
48	venonat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/48.png	bug	poison
49	venomoth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/49.png	bug	poison
50	diglett	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/50.png	ground	\N
51	dugtrio	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/51.png	ground	\N
52	meowth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png	normal	\N
53	persian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/53.png	normal	\N
54	psyduck	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png	water	\N
55	golduck	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/55.png	water	\N
56	mankey	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/56.png	fighting	\N
57	primeape	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/57.png	fighting	\N
58	growlithe	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/58.png	fire	\N
59	arcanine	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/59.png	fire	\N
60	poliwag	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/60.png	water	\N
61	poliwhirl	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/61.png	water	\N
62	poliwrath	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/62.png	water	fighting
63	abra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/63.png	psychic	\N
64	kadabra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/64.png	psychic	\N
65	alakazam	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/65.png	psychic	\N
66	machop	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/66.png	fighting	\N
67	machoke	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/67.png	fighting	\N
68	machamp	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/68.png	fighting	\N
69	bellsprout	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/69.png	grass	poison
70	weepinbell	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/70.png	grass	poison
71	victreebel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/71.png	grass	poison
72	tentacool	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/72.png	water	poison
73	tentacruel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/73.png	water	poison
74	geodude	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/74.png	rock	ground
75	graveler	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/75.png	rock	ground
76	golem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/76.png	rock	ground
77	ponyta	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/77.png	fire	\N
78	rapidash	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/78.png	fire	\N
79	slowpoke	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/79.png	water	psychic
80	slowbro	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/80.png	water	psychic
81	magnemite	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/81.png	electric	steel
82	magneton	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/82.png	electric	steel
83	farfetchd	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/83.png	normal	flying
84	doduo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/84.png	normal	flying
85	dodrio	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/85.png	normal	flying
86	seel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/86.png	water	\N
87	dewgong	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/87.png	water	ice
88	grimer	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/88.png	poison	\N
89	muk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/89.png	poison	\N
90	shellder	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/90.png	water	\N
91	cloyster	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/91.png	water	ice
92	gastly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/92.png	ghost	poison
93	haunter	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/93.png	ghost	poison
94	gengar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png	ghost	poison
95	onix	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/95.png	rock	ground
96	drowzee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/96.png	psychic	\N
97	hypno	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/97.png	psychic	\N
98	krabby	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/98.png	water	\N
99	kingler	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/99.png	water	\N
100	voltorb	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/100.png	electric	\N
101	electrode	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/101.png	electric	\N
102	exeggcute	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/102.png	grass	psychic
103	exeggutor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/103.png	grass	psychic
104	cubone	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png	ground	\N
105	marowak	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/105.png	ground	\N
106	hitmonlee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/106.png	fighting	\N
107	hitmonchan	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/107.png	fighting	\N
108	lickitung	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/108.png	normal	\N
109	koffing	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/109.png	poison	\N
110	weezing	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/110.png	poison	\N
111	rhyhorn	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/111.png	ground	rock
112	rhydon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/112.png	ground	rock
113	chansey	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/113.png	normal	\N
114	tangela	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/114.png	grass	\N
115	kangaskhan	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/115.png	normal	\N
116	horsea	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/116.png	water	\N
117	seadra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/117.png	water	\N
118	goldeen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/118.png	water	\N
119	seaking	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/119.png	water	\N
120	staryu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/120.png	water	\N
121	starmie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/121.png	water	psychic
122	mr-mime	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/122.png	psychic	fairy
123	scyther	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png	bug	flying
124	jynx	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/124.png	ice	psychic
125	electabuzz	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/125.png	electric	\N
126	magmar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/126.png	fire	\N
127	pinsir	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/127.png	bug	\N
128	tauros	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/128.png	normal	\N
129	magikarp	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/129.png	water	\N
130	gyarados	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/130.png	water	flying
131	lapras	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/131.png	water	ice
132	ditto	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png	normal	\N
133	eevee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png	normal	\N
134	vaporeon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/134.png	water	\N
135	jolteon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/135.png	electric	\N
136	flareon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/136.png	fire	\N
137	porygon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/137.png	normal	\N
138	omanyte	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png	rock	water
139	omastar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/139.png	rock	water
140	kabuto	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/140.png	rock	water
141	kabutops	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/141.png	rock	water
142	aerodactyl	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/142.png	rock	flying
143	snorlax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png	normal	\N
144	articuno	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png	ice	flying
145	zapdos	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/145.png	electric	flying
146	moltres	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/146.png	fire	flying
147	dratini	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/147.png	dragon	\N
148	dragonair	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/148.png	dragon	\N
149	dragonite	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/149.png	dragon	flying
150	mewtwo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png	psychic	\N
151	mew	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png	psychic	\N
152	chikorita	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/152.png	grass	\N
153	bayleef	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/153.png	grass	\N
154	meganium	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/154.png	grass	\N
155	cyndaquil	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/155.png	fire	\N
156	quilava	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/156.png	fire	\N
157	typhlosion	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/157.png	fire	\N
158	totodile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/158.png	water	\N
159	croconaw	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/159.png	water	\N
160	feraligatr	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/160.png	water	\N
161	sentret	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/161.png	normal	\N
162	furret	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/162.png	normal	\N
163	hoothoot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/163.png	normal	flying
164	noctowl	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/164.png	normal	flying
165	ledyba	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/165.png	bug	flying
166	ledian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/166.png	bug	flying
167	spinarak	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/167.png	bug	poison
168	ariados	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/168.png	bug	poison
169	crobat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/169.png	poison	flying
170	chinchou	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/170.png	water	electric
171	lanturn	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/171.png	water	electric
172	pichu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/172.png	electric	\N
173	cleffa	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/173.png	fairy	\N
174	igglybuff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/174.png	normal	fairy
175	togepi	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/175.png	fairy	\N
176	togetic	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/176.png	fairy	flying
177	natu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/177.png	psychic	flying
178	xatu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/178.png	psychic	flying
179	mareep	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/179.png	electric	\N
180	flaaffy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/180.png	electric	\N
181	ampharos	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/181.png	electric	\N
182	bellossom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/182.png	grass	\N
183	marill	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/183.png	water	fairy
184	azumarill	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/184.png	water	fairy
185	sudowoodo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/185.png	rock	\N
186	politoed	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/186.png	water	\N
187	hoppip	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/187.png	grass	flying
188	skiploom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/188.png	grass	flying
189	jumpluff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/189.png	grass	flying
190	aipom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/190.png	normal	\N
191	sunkern	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/191.png	grass	\N
192	sunflora	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/192.png	grass	\N
193	yanma	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/193.png	bug	flying
194	wooper	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/194.png	water	ground
195	quagsire	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/195.png	water	ground
196	espeon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/196.png	psychic	\N
197	umbreon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/197.png	dark	\N
198	murkrow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/198.png	dark	flying
199	slowking	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/199.png	water	psychic
200	misdreavus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/200.png	ghost	\N
201	unown	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/201.png	psychic	\N
202	wobbuffet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/202.png	psychic	\N
203	girafarig	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/203.png	normal	psychic
204	pineco	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/204.png	bug	\N
205	forretress	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/205.png	bug	steel
206	dunsparce	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/206.png	normal	\N
207	gligar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/207.png	ground	flying
208	steelix	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/208.png	steel	ground
209	snubbull	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/209.png	fairy	\N
210	granbull	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/210.png	fairy	\N
211	qwilfish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/211.png	water	poison
212	scizor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/212.png	bug	steel
213	shuckle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/213.png	bug	rock
214	heracross	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/214.png	bug	fighting
215	sneasel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/215.png	dark	ice
216	teddiursa	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/216.png	normal	\N
217	ursaring	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/217.png	normal	\N
218	slugma	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/218.png	fire	\N
219	magcargo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/219.png	fire	rock
220	swinub	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/220.png	ice	ground
221	piloswine	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/221.png	ice	ground
222	corsola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/222.png	water	rock
223	remoraid	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/223.png	water	\N
224	octillery	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/224.png	water	\N
225	delibird	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/225.png	ice	flying
226	mantine	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/226.png	water	flying
227	skarmory	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/227.png	steel	flying
228	houndour	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/228.png	dark	fire
229	houndoom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/229.png	dark	fire
230	kingdra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/230.png	water	dragon
231	phanpy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/231.png	ground	\N
232	donphan	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/232.png	ground	\N
233	porygon2	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/233.png	normal	\N
234	stantler	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/234.png	normal	\N
235	smeargle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/235.png	normal	\N
236	tyrogue	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/236.png	fighting	\N
237	hitmontop	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/237.png	fighting	\N
238	smoochum	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/238.png	ice	psychic
239	elekid	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/239.png	electric	\N
240	magby	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/240.png	fire	\N
241	miltank	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/241.png	normal	\N
242	blissey	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/242.png	normal	\N
243	raikou	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/243.png	electric	\N
244	entei	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/244.png	fire	\N
245	suicune	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/245.png	water	\N
246	larvitar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/246.png	rock	ground
247	pupitar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/247.png	rock	ground
248	tyranitar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/248.png	rock	dark
249	lugia	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/249.png	psychic	flying
250	ho-oh	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/250.png	fire	flying
251	celebi	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/251.png	psychic	grass
252	treecko	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/252.png	grass	\N
253	grovyle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/253.png	grass	\N
254	sceptile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/254.png	grass	\N
255	torchic	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/255.png	fire	\N
256	combusken	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/256.png	fire	fighting
257	blaziken	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/257.png	fire	fighting
258	mudkip	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/258.png	water	\N
259	marshtomp	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/259.png	water	ground
260	swampert	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/260.png	water	ground
261	poochyena	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/261.png	dark	\N
262	mightyena	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/262.png	dark	\N
263	zigzagoon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/263.png	normal	\N
264	linoone	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/264.png	normal	\N
265	wurmple	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/265.png	bug	\N
266	silcoon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/266.png	bug	\N
267	beautifly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/267.png	bug	flying
268	cascoon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/268.png	bug	\N
269	dustox	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/269.png	bug	poison
270	lotad	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/270.png	water	grass
271	lombre	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/271.png	water	grass
272	ludicolo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/272.png	water	grass
273	seedot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/273.png	grass	\N
274	nuzleaf	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/274.png	grass	dark
275	shiftry	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/275.png	grass	dark
276	taillow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/276.png	normal	flying
277	swellow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/277.png	normal	flying
278	wingull	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/278.png	water	flying
279	pelipper	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/279.png	water	flying
280	ralts	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/280.png	psychic	fairy
281	kirlia	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/281.png	psychic	fairy
282	gardevoir	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/282.png	psychic	fairy
283	surskit	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/283.png	bug	water
284	masquerain	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/284.png	bug	flying
285	shroomish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/285.png	grass	\N
286	breloom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/286.png	grass	fighting
287	slakoth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/287.png	normal	\N
288	vigoroth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/288.png	normal	\N
289	slaking	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/289.png	normal	\N
290	nincada	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/290.png	bug	ground
291	ninjask	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/291.png	bug	flying
292	shedinja	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/292.png	bug	ghost
293	whismur	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/293.png	normal	\N
294	loudred	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/294.png	normal	\N
295	exploud	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/295.png	normal	\N
296	makuhita	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/296.png	fighting	\N
297	hariyama	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/297.png	fighting	\N
298	azurill	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/298.png	normal	fairy
299	nosepass	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/299.png	rock	\N
300	skitty	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/300.png	normal	\N
301	delcatty	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/301.png	normal	\N
302	sableye	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/302.png	dark	ghost
303	mawile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/303.png	steel	fairy
304	aron	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/304.png	steel	rock
305	lairon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/305.png	steel	rock
306	aggron	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/306.png	steel	rock
307	meditite	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/307.png	fighting	psychic
308	medicham	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/308.png	fighting	psychic
309	electrike	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/309.png	electric	\N
310	manectric	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/310.png	electric	\N
311	plusle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/311.png	electric	\N
312	minun	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/312.png	electric	\N
313	volbeat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/313.png	bug	\N
314	illumise	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/314.png	bug	\N
315	roselia	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/315.png	grass	poison
316	gulpin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/316.png	poison	\N
317	swalot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/317.png	poison	\N
318	carvanha	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/318.png	water	dark
319	sharpedo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/319.png	water	dark
320	wailmer	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/320.png	water	\N
321	wailord	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/321.png	water	\N
322	numel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/322.png	fire	ground
323	camerupt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/323.png	fire	ground
324	torkoal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/324.png	fire	\N
325	spoink	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/325.png	psychic	\N
326	grumpig	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/326.png	psychic	\N
327	spinda	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/327.png	normal	\N
328	trapinch	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/328.png	ground	\N
329	vibrava	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/329.png	ground	dragon
330	flygon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/330.png	ground	dragon
331	cacnea	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/331.png	grass	\N
332	cacturne	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/332.png	grass	dark
333	swablu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/333.png	normal	flying
334	altaria	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/334.png	dragon	flying
335	zangoose	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/335.png	normal	\N
336	seviper	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/336.png	poison	\N
337	lunatone	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/337.png	rock	psychic
338	solrock	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/338.png	rock	psychic
339	barboach	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/339.png	water	ground
340	whiscash	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/340.png	water	ground
341	corphish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/341.png	water	\N
342	crawdaunt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/342.png	water	dark
343	baltoy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/343.png	ground	psychic
344	claydol	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/344.png	ground	psychic
345	lileep	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/345.png	rock	grass
346	cradily	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/346.png	rock	grass
347	anorith	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/347.png	rock	bug
348	armaldo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/348.png	rock	bug
349	feebas	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/349.png	water	\N
350	milotic	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/350.png	water	\N
351	castform	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/351.png	normal	\N
352	kecleon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/352.png	normal	\N
353	shuppet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/353.png	ghost	\N
354	banette	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/354.png	ghost	\N
355	duskull	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/355.png	ghost	\N
356	dusclops	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/356.png	ghost	\N
357	tropius	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/357.png	grass	flying
358	chimecho	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/358.png	psychic	\N
359	absol	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/359.png	dark	\N
360	wynaut	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/360.png	psychic	\N
361	snorunt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/361.png	ice	\N
362	glalie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/362.png	ice	\N
363	spheal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/363.png	ice	water
364	sealeo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/364.png	ice	water
365	walrein	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/365.png	ice	water
366	clamperl	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/366.png	water	\N
367	huntail	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/367.png	water	\N
368	gorebyss	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/368.png	water	\N
369	relicanth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/369.png	water	rock
370	luvdisc	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/370.png	water	\N
371	bagon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/371.png	dragon	\N
372	shelgon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/372.png	dragon	\N
373	salamence	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/373.png	dragon	flying
374	beldum	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/374.png	steel	psychic
375	metang	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/375.png	steel	psychic
376	metagross	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/376.png	steel	psychic
377	regirock	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/377.png	rock	\N
378	regice	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/378.png	ice	\N
379	registeel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/379.png	steel	\N
380	latias	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/380.png	dragon	psychic
381	latios	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/381.png	dragon	psychic
382	kyogre	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/382.png	water	\N
383	groudon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/383.png	ground	\N
384	rayquaza	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/384.png	dragon	flying
385	jirachi	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/385.png	steel	psychic
386	deoxys-normal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/386.png	psychic	\N
387	turtwig	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/387.png	grass	\N
388	grotle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/388.png	grass	\N
389	torterra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/389.png	grass	ground
390	chimchar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/390.png	fire	\N
391	monferno	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/391.png	fire	fighting
392	infernape	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/392.png	fire	fighting
393	piplup	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/393.png	water	\N
394	prinplup	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/394.png	water	\N
395	empoleon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/395.png	water	steel
396	starly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/396.png	normal	flying
397	staravia	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/397.png	normal	flying
398	staraptor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/398.png	normal	flying
399	bidoof	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/399.png	normal	\N
400	bibarel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/400.png	normal	water
401	kricketot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/401.png	bug	\N
402	kricketune	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/402.png	bug	\N
403	shinx	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/403.png	electric	\N
404	luxio	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/404.png	electric	\N
405	luxray	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/405.png	electric	\N
406	budew	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/406.png	grass	poison
407	roserade	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/407.png	grass	poison
408	cranidos	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/408.png	rock	\N
409	rampardos	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/409.png	rock	\N
410	shieldon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/410.png	rock	steel
411	bastiodon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/411.png	rock	steel
412	burmy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/412.png	bug	\N
413	wormadam-plant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/413.png	bug	grass
414	mothim	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/414.png	bug	flying
415	combee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/415.png	bug	flying
416	vespiquen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/416.png	bug	flying
417	pachirisu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/417.png	electric	\N
418	buizel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/418.png	water	\N
419	floatzel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/419.png	water	\N
420	cherubi	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/420.png	grass	\N
421	cherrim	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/421.png	grass	\N
422	shellos	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/422.png	water	\N
423	gastrodon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/423.png	water	ground
424	ambipom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/424.png	normal	\N
425	drifloon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/425.png	ghost	flying
426	drifblim	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/426.png	ghost	flying
427	buneary	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/427.png	normal	\N
428	lopunny	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/428.png	normal	\N
429	mismagius	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/429.png	ghost	\N
430	honchkrow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/430.png	dark	flying
431	glameow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/431.png	normal	\N
432	purugly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/432.png	normal	\N
433	chingling	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/433.png	psychic	\N
434	stunky	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/434.png	poison	dark
435	skuntank	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/435.png	poison	dark
436	bronzor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/436.png	steel	psychic
437	bronzong	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/437.png	steel	psychic
438	bonsly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/438.png	rock	\N
439	mime-jr	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/439.png	psychic	fairy
440	happiny	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/440.png	normal	\N
441	chatot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/441.png	normal	flying
442	spiritomb	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/442.png	ghost	dark
443	gible	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/443.png	dragon	ground
444	gabite	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/444.png	dragon	ground
445	garchomp	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/445.png	dragon	ground
446	munchlax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/446.png	normal	\N
447	riolu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/447.png	fighting	\N
448	lucario	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/448.png	fighting	steel
449	hippopotas	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/449.png	ground	\N
450	hippowdon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/450.png	ground	\N
451	skorupi	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/451.png	poison	bug
452	drapion	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/452.png	poison	dark
453	croagunk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/453.png	poison	fighting
454	toxicroak	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/454.png	poison	fighting
455	carnivine	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/455.png	grass	\N
456	finneon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/456.png	water	\N
457	lumineon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/457.png	water	\N
458	mantyke	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/458.png	water	flying
459	snover	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/459.png	grass	ice
460	abomasnow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/460.png	grass	ice
461	weavile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/461.png	dark	ice
462	magnezone	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/462.png	electric	steel
463	lickilicky	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/463.png	normal	\N
464	rhyperior	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/464.png	ground	rock
465	tangrowth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/465.png	grass	\N
466	electivire	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/466.png	electric	\N
467	magmortar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/467.png	fire	\N
468	togekiss	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/468.png	fairy	flying
469	yanmega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/469.png	bug	flying
470	leafeon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/470.png	grass	\N
471	glaceon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/471.png	ice	\N
472	gliscor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/472.png	ground	flying
473	mamoswine	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/473.png	ice	ground
474	porygon-z	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/474.png	normal	\N
475	gallade	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/475.png	psychic	fighting
476	probopass	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/476.png	rock	steel
477	dusknoir	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/477.png	ghost	\N
478	froslass	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/478.png	ice	ghost
479	rotom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/479.png	electric	ghost
480	uxie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/480.png	psychic	\N
481	mesprit	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/481.png	psychic	\N
482	azelf	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/482.png	psychic	\N
483	dialga	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/483.png	steel	dragon
484	palkia	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/484.png	water	dragon
485	heatran	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/485.png	fire	steel
486	regigigas	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/486.png	normal	\N
487	giratina-altered	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/487.png	ghost	dragon
488	cresselia	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/488.png	psychic	\N
489	phione	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/489.png	water	\N
490	manaphy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/490.png	water	\N
491	darkrai	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/491.png	dark	\N
492	shaymin-land	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/492.png	grass	\N
493	arceus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/493.png	normal	\N
494	victini	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/494.png	psychic	fire
495	snivy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/495.png	grass	\N
496	servine	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/496.png	grass	\N
497	serperior	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/497.png	grass	\N
498	tepig	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/498.png	fire	\N
499	pignite	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/499.png	fire	fighting
500	emboar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/500.png	fire	fighting
501	oshawott	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/501.png	water	\N
502	dewott	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/502.png	water	\N
503	samurott	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/503.png	water	\N
504	patrat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/504.png	normal	\N
505	watchog	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/505.png	normal	\N
506	lillipup	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/506.png	normal	\N
507	herdier	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/507.png	normal	\N
508	stoutland	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/508.png	normal	\N
509	purrloin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/509.png	dark	\N
510	liepard	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/510.png	dark	\N
511	pansage	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/511.png	grass	\N
512	simisage	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/512.png	grass	\N
513	pansear	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/513.png	fire	\N
514	simisear	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/514.png	fire	\N
515	panpour	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/515.png	water	\N
516	simipour	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/516.png	water	\N
517	munna	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/517.png	psychic	\N
518	musharna	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/518.png	psychic	\N
519	pidove	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/519.png	normal	flying
520	tranquill	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/520.png	normal	flying
521	unfezant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/521.png	normal	flying
522	blitzle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/522.png	electric	\N
523	zebstrika	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/523.png	electric	\N
524	roggenrola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/524.png	rock	\N
525	boldore	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/525.png	rock	\N
526	gigalith	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/526.png	rock	\N
527	woobat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/527.png	psychic	flying
528	swoobat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/528.png	psychic	flying
529	drilbur	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/529.png	ground	\N
530	excadrill	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/530.png	ground	steel
531	audino	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/531.png	normal	\N
532	timburr	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/532.png	fighting	\N
533	gurdurr	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/533.png	fighting	\N
534	conkeldurr	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/534.png	fighting	\N
535	tympole	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/535.png	water	\N
536	palpitoad	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/536.png	water	ground
537	seismitoad	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/537.png	water	ground
538	throh	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/538.png	fighting	\N
539	sawk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/539.png	fighting	\N
540	sewaddle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/540.png	bug	grass
541	swadloon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/541.png	bug	grass
542	leavanny	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/542.png	bug	grass
543	venipede	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/543.png	bug	poison
544	whirlipede	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/544.png	bug	poison
545	scolipede	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/545.png	bug	poison
546	cottonee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/546.png	grass	fairy
547	whimsicott	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/547.png	grass	fairy
548	petilil	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/548.png	grass	\N
549	lilligant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/549.png	grass	\N
550	basculin-red-striped	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/550.png	water	\N
551	sandile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/551.png	ground	dark
552	krokorok	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/552.png	ground	dark
553	krookodile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/553.png	ground	dark
554	darumaka	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/554.png	fire	\N
555	darmanitan-standard	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/555.png	fire	\N
556	maractus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/556.png	grass	\N
557	dwebble	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/557.png	bug	rock
558	crustle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/558.png	bug	rock
559	scraggy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/559.png	dark	fighting
560	scrafty	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/560.png	dark	fighting
561	sigilyph	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/561.png	psychic	flying
562	yamask	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/562.png	ghost	\N
563	cofagrigus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/563.png	ghost	\N
564	tirtouga	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/564.png	water	rock
565	carracosta	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/565.png	water	rock
566	archen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/566.png	rock	flying
567	archeops	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/567.png	rock	flying
568	trubbish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/568.png	poison	\N
569	garbodor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/569.png	poison	\N
570	zorua	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/570.png	dark	\N
571	zoroark	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/571.png	dark	\N
572	minccino	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/572.png	normal	\N
573	cinccino	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/573.png	normal	\N
574	gothita	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/574.png	psychic	\N
575	gothorita	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/575.png	psychic	\N
576	gothitelle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/576.png	psychic	\N
577	solosis	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/577.png	psychic	\N
578	duosion	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/578.png	psychic	\N
579	reuniclus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/579.png	psychic	\N
580	ducklett	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/580.png	water	flying
581	swanna	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/581.png	water	flying
582	vanillite	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/582.png	ice	\N
583	vanillish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/583.png	ice	\N
584	vanilluxe	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/584.png	ice	\N
585	deerling	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/585.png	normal	grass
586	sawsbuck	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/586.png	normal	grass
587	emolga	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/587.png	electric	flying
588	karrablast	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/588.png	bug	\N
589	escavalier	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/589.png	bug	steel
590	foongus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/590.png	grass	poison
591	amoonguss	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/591.png	grass	poison
592	frillish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/592.png	water	ghost
593	jellicent	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/593.png	water	ghost
594	alomomola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/594.png	water	\N
595	joltik	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/595.png	bug	electric
596	galvantula	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/596.png	bug	electric
597	ferroseed	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/597.png	grass	steel
598	ferrothorn	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/598.png	grass	steel
599	klink	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/599.png	steel	\N
600	klang	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/600.png	steel	\N
601	klinklang	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/601.png	steel	\N
602	tynamo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/602.png	electric	\N
603	eelektrik	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/603.png	electric	\N
604	eelektross	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/604.png	electric	\N
605	elgyem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/605.png	psychic	\N
606	beheeyem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/606.png	psychic	\N
607	litwick	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/607.png	ghost	fire
608	lampent	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/608.png	ghost	fire
609	chandelure	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/609.png	ghost	fire
610	axew	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/610.png	dragon	\N
611	fraxure	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/611.png	dragon	\N
612	haxorus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/612.png	dragon	\N
613	cubchoo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/613.png	ice	\N
614	beartic	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/614.png	ice	\N
615	cryogonal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/615.png	ice	\N
616	shelmet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/616.png	bug	\N
617	accelgor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/617.png	bug	\N
618	stunfisk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/618.png	ground	electric
619	mienfoo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/619.png	fighting	\N
620	mienshao	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/620.png	fighting	\N
621	druddigon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/621.png	dragon	\N
622	golett	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/622.png	ground	ghost
623	golurk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/623.png	ground	ghost
624	pawniard	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/624.png	dark	steel
625	bisharp	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/625.png	dark	steel
626	bouffalant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/626.png	normal	\N
627	rufflet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/627.png	normal	flying
628	braviary	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/628.png	normal	flying
629	vullaby	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/629.png	dark	flying
630	mandibuzz	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/630.png	dark	flying
631	heatmor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/631.png	fire	\N
632	durant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/632.png	bug	steel
633	deino	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/633.png	dark	dragon
634	zweilous	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/634.png	dark	dragon
635	hydreigon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/635.png	dark	dragon
636	larvesta	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/636.png	bug	fire
637	volcarona	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/637.png	bug	fire
638	cobalion	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/638.png	steel	fighting
639	terrakion	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/639.png	rock	fighting
640	virizion	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/640.png	grass	fighting
641	tornadus-incarnate	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/641.png	flying	\N
642	thundurus-incarnate	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/642.png	electric	flying
643	reshiram	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/643.png	dragon	fire
644	zekrom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/644.png	dragon	electric
645	landorus-incarnate	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/645.png	ground	flying
646	kyurem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/646.png	dragon	ice
647	keldeo-ordinary	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/647.png	water	fighting
648	meloetta-aria	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/648.png	normal	psychic
649	genesect	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/649.png	bug	steel
650	chespin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/650.png	grass	\N
651	quilladin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/651.png	grass	\N
652	chesnaught	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/652.png	grass	fighting
653	fennekin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/653.png	fire	\N
654	braixen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/654.png	fire	\N
655	delphox	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/655.png	fire	psychic
656	froakie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/656.png	water	\N
657	frogadier	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/657.png	water	\N
658	greninja	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/658.png	water	dark
659	bunnelby	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/659.png	normal	\N
660	diggersby	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/660.png	normal	ground
661	fletchling	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/661.png	normal	flying
662	fletchinder	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/662.png	fire	flying
663	talonflame	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/663.png	fire	flying
664	scatterbug	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/664.png	bug	\N
665	spewpa	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/665.png	bug	\N
666	vivillon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/666.png	bug	flying
667	litleo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/667.png	fire	normal
668	pyroar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/668.png	fire	normal
669	flabebe	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/669.png	fairy	\N
670	floette	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/670.png	fairy	\N
671	florges	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/671.png	fairy	\N
672	skiddo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/672.png	grass	\N
673	gogoat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/673.png	grass	\N
674	pancham	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/674.png	fighting	\N
675	pangoro	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/675.png	fighting	dark
676	furfrou	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/676.png	normal	\N
677	espurr	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/677.png	psychic	\N
678	meowstic-male	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/678.png	psychic	\N
679	honedge	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/679.png	steel	ghost
680	doublade	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/680.png	steel	ghost
681	aegislash-shield	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/681.png	steel	ghost
682	spritzee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/682.png	fairy	\N
683	aromatisse	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/683.png	fairy	\N
684	swirlix	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/684.png	fairy	\N
685	slurpuff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/685.png	fairy	\N
686	inkay	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/686.png	dark	psychic
687	malamar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/687.png	dark	psychic
688	binacle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/688.png	rock	water
689	barbaracle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/689.png	rock	water
690	skrelp	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/690.png	poison	water
691	dragalge	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/691.png	poison	dragon
692	clauncher	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/692.png	water	\N
693	clawitzer	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/693.png	water	\N
694	helioptile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/694.png	electric	normal
695	heliolisk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/695.png	electric	normal
696	tyrunt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/696.png	rock	dragon
697	tyrantrum	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/697.png	rock	dragon
698	amaura	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/698.png	rock	ice
699	aurorus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/699.png	rock	ice
700	sylveon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/700.png	fairy	\N
701	hawlucha	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/701.png	fighting	flying
702	dedenne	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/702.png	electric	fairy
703	carbink	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/703.png	rock	fairy
704	goomy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/704.png	dragon	\N
705	sliggoo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/705.png	dragon	\N
706	goodra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/706.png	dragon	\N
707	klefki	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/707.png	steel	fairy
708	phantump	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/708.png	ghost	grass
709	trevenant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/709.png	ghost	grass
710	pumpkaboo-average	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/710.png	ghost	grass
711	gourgeist-average	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/711.png	ghost	grass
712	bergmite	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/712.png	ice	\N
713	avalugg	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/713.png	ice	\N
714	noibat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/714.png	flying	dragon
715	noivern	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/715.png	flying	dragon
716	xerneas	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/716.png	fairy	\N
717	yveltal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/717.png	dark	flying
718	zygarde-50	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/718.png	dragon	ground
719	diancie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/719.png	rock	fairy
720	hoopa	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/720.png	psychic	ghost
721	volcanion	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/721.png	fire	water
722	rowlet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/722.png	grass	flying
723	dartrix	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/723.png	grass	flying
724	decidueye	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/724.png	grass	ghost
725	litten	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/725.png	fire	\N
726	torracat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/726.png	fire	\N
727	incineroar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/727.png	fire	dark
728	popplio	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/728.png	water	\N
729	brionne	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/729.png	water	\N
730	primarina	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/730.png	water	fairy
731	pikipek	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/731.png	normal	flying
732	trumbeak	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/732.png	normal	flying
733	toucannon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/733.png	normal	flying
734	yungoos	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/734.png	normal	\N
735	gumshoos	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/735.png	normal	\N
736	grubbin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/736.png	bug	\N
737	charjabug	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/737.png	bug	electric
738	vikavolt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/738.png	bug	electric
739	crabrawler	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/739.png	fighting	\N
740	crabominable	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/740.png	fighting	ice
741	oricorio-baile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/741.png	fire	flying
742	cutiefly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/742.png	bug	fairy
743	ribombee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/743.png	bug	fairy
744	rockruff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/744.png	rock	\N
745	lycanroc-midday	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/745.png	rock	\N
746	wishiwashi-solo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/746.png	water	\N
747	mareanie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/747.png	poison	water
748	toxapex	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/748.png	poison	water
749	mudbray	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/749.png	ground	\N
750	mudsdale	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/750.png	ground	\N
751	dewpider	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/751.png	water	bug
752	araquanid	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/752.png	water	bug
753	fomantis	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/753.png	grass	\N
754	lurantis	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/754.png	grass	\N
755	morelull	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/755.png	grass	fairy
756	shiinotic	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/756.png	grass	fairy
757	salandit	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/757.png	poison	fire
758	salazzle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/758.png	poison	fire
759	stufful	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/759.png	normal	fighting
760	bewear	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/760.png	normal	fighting
761	bounsweet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/761.png	grass	\N
762	steenee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/762.png	grass	\N
763	tsareena	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/763.png	grass	\N
764	comfey	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/764.png	fairy	\N
765	oranguru	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/765.png	normal	psychic
766	passimian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/766.png	fighting	\N
767	wimpod	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/767.png	bug	water
768	golisopod	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/768.png	bug	water
769	sandygast	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/769.png	ghost	ground
770	palossand	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/770.png	ghost	ground
771	pyukumuku	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/771.png	water	\N
772	type-null	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/772.png	normal	\N
773	silvally	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/773.png	normal	\N
774	minior-red-meteor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/774.png	rock	flying
775	komala	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/775.png	normal	\N
776	turtonator	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/776.png	fire	dragon
777	togedemaru	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/777.png	electric	steel
778	mimikyu-disguised	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/778.png	ghost	fairy
779	bruxish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/779.png	water	psychic
780	drampa	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/780.png	normal	dragon
781	dhelmise	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/781.png	ghost	grass
782	jangmo-o	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/782.png	dragon	\N
783	hakamo-o	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/783.png	dragon	fighting
784	kommo-o	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/784.png	dragon	fighting
785	tapu-koko	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/785.png	electric	fairy
786	tapu-lele	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/786.png	psychic	fairy
787	tapu-bulu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/787.png	grass	fairy
788	tapu-fini	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/788.png	water	fairy
789	cosmog	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/789.png	psychic	\N
790	cosmoem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/790.png	psychic	\N
791	solgaleo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/791.png	psychic	steel
792	lunala	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/792.png	psychic	ghost
793	nihilego	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/793.png	rock	poison
794	buzzwole	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/794.png	bug	fighting
795	pheromosa	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/795.png	bug	fighting
796	xurkitree	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/796.png	electric	\N
797	celesteela	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/797.png	steel	flying
798	kartana	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/798.png	grass	steel
799	guzzlord	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/799.png	dark	dragon
800	necrozma	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/800.png	psychic	\N
801	magearna	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/801.png	steel	fairy
802	marshadow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/802.png	fighting	ghost
803	poipole	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/803.png	poison	\N
804	naganadel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/804.png	poison	dragon
805	stakataka	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/805.png	rock	steel
806	blacephalon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/806.png	fire	ghost
807	zeraora	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/807.png	electric	\N
808	meltan	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/808.png	steel	\N
809	melmetal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/809.png	steel	\N
810	grookey	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/810.png	grass	\N
811	thwackey	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/811.png	grass	\N
812	rillaboom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/812.png	grass	\N
813	scorbunny	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/813.png	fire	\N
814	raboot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/814.png	fire	\N
815	cinderace	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/815.png	fire	\N
816	sobble	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/816.png	water	\N
817	drizzile	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/817.png	water	\N
818	inteleon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/818.png	water	\N
819	skwovet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/819.png	normal	\N
820	greedent	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/820.png	normal	\N
821	rookidee	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/821.png	flying	\N
822	corvisquire	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/822.png	flying	\N
823	corviknight	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/823.png	flying	steel
824	blipbug	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/824.png	bug	\N
825	dottler	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/825.png	bug	psychic
826	orbeetle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/826.png	bug	psychic
827	nickit	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/827.png	dark	\N
828	thievul	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/828.png	dark	\N
829	gossifleur	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/829.png	grass	\N
830	eldegoss	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/830.png	grass	\N
831	wooloo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/831.png	normal	\N
832	dubwool	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/832.png	normal	\N
833	chewtle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/833.png	water	\N
834	drednaw	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/834.png	water	rock
835	yamper	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/835.png	electric	\N
836	boltund	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/836.png	electric	\N
837	rolycoly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/837.png	rock	\N
838	carkol	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/838.png	rock	fire
839	coalossal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/839.png	rock	fire
840	applin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/840.png	grass	dragon
841	flapple	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/841.png	grass	dragon
842	appletun	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/842.png	grass	dragon
843	silicobra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/843.png	ground	\N
844	sandaconda	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/844.png	ground	\N
845	cramorant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/845.png	flying	water
846	arrokuda	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/846.png	water	\N
847	barraskewda	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/847.png	water	\N
848	toxel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/848.png	electric	poison
849	toxtricity-amped	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/849.png	electric	poison
850	sizzlipede	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/850.png	fire	bug
851	centiskorch	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/851.png	fire	bug
852	clobbopus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/852.png	fighting	\N
853	grapploct	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/853.png	fighting	\N
854	sinistea	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/854.png	ghost	\N
855	polteageist	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/855.png	ghost	\N
856	hatenna	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/856.png	psychic	\N
857	hattrem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/857.png	psychic	\N
858	hatterene	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/858.png	psychic	fairy
859	impidimp	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/859.png	dark	fairy
860	morgrem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/860.png	dark	fairy
861	grimmsnarl	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/861.png	dark	fairy
862	obstagoon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/862.png	dark	normal
863	perrserker	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/863.png	steel	\N
864	cursola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/864.png	ghost	\N
865	sirfetchd	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/865.png	fighting	\N
866	mr-rime	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/866.png	ice	psychic
867	runerigus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/867.png	ground	ghost
868	milcery	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/868.png	fairy	\N
869	alcremie	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/869.png	fairy	\N
870	falinks	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/870.png	fighting	\N
871	pincurchin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/871.png	electric	\N
872	snom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/872.png	ice	bug
873	frosmoth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/873.png	ice	bug
874	stonjourner	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/874.png	rock	\N
875	eiscue-ice	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/875.png	ice	\N
876	indeedee-male	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/876.png	psychic	normal
877	morpeko-full-belly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/877.png	electric	dark
878	cufant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/878.png	steel	\N
879	copperajah	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/879.png	steel	\N
880	dracozolt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/880.png	electric	dragon
881	arctozolt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/881.png	electric	ice
882	dracovish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/882.png	water	dragon
883	arctovish	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/883.png	water	ice
884	duraludon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/884.png	steel	dragon
885	dreepy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/885.png	dragon	ghost
886	drakloak	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/886.png	dragon	ghost
887	dragapult	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/887.png	dragon	ghost
888	zacian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/888.png	fairy	\N
889	zamazenta	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/889.png	fighting	\N
890	eternatus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/890.png	poison	dragon
891	kubfu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/891.png	fighting	\N
892	urshifu-single-strike	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/892.png	fighting	dark
893	zarude	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/893.png	dark	grass
894	regieleki	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/894.png	electric	\N
895	regidrago	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/895.png	dragon	\N
896	glastrier	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/896.png	ice	\N
897	spectrier	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/897.png	ghost	\N
898	calyrex	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/898.png	psychic	grass
899	wyrdeer	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/899.png	normal	psychic
900	kleavor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/900.png	bug	rock
901	ursaluna	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/901.png	ground	normal
902	basculegion-male	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/902.png	water	ghost
903	sneasler	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/903.png	fighting	poison
904	overqwil	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/904.png	dark	poison
905	enamorus-incarnate	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/905.png	fairy	flying
906	sprigatito	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/906.png	grass	\N
907	floragato	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/907.png	grass	\N
908	meowscarada	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/908.png	grass	dark
909	fuecoco	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/909.png	fire	\N
910	crocalor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/910.png	fire	\N
911	skeledirge	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/911.png	fire	ghost
912	quaxly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/912.png	water	\N
913	quaxwell	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/913.png	water	\N
914	quaquaval	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/914.png	water	fighting
915	lechonk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/915.png	normal	\N
916	oinkologne	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/916.png	normal	\N
917	tarountula	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/917.png	bug	\N
918	spidops	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/918.png	bug	\N
919	nymble	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/919.png	bug	\N
920	lokix	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/920.png	bug	dark
921	pawmi	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/921.png	electric	\N
922	pawmo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/922.png	electric	fighting
923	pawmot	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/923.png	electric	fighting
924	tandemaus	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/924.png	normal	\N
925	maushold	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/925.png	normal	\N
926	fidough	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/926.png	fairy	\N
927	dachsbun	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/927.png	fairy	\N
928	smoliv	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/928.png	grass	normal
929	dolliv	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/929.png	grass	normal
930	arboliva	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/930.png	grass	normal
931	squawkabilly	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/931.png	normal	flying
932	nacli	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/932.png	rock	\N
933	naclstack	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/933.png	rock	\N
934	garganacl	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/934.png	rock	\N
935	charcadet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/935.png	fire	\N
936	armarouge	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/936.png	fire	psychic
937	ceruledge	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/937.png	fire	ghost
938	tadbulb	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/938.png	electric	\N
939	bellibolt	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/939.png	electric	\N
940	wattrel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/940.png	electric	flying
941	kilowattrel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/941.png	electric	flying
942	maschiff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/942.png	dark	\N
943	mabosstiff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/943.png	dark	\N
944	shroodle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/944.png	poison	normal
945	grafaiai	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/945.png	poison	normal
946	bramblin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/946.png	grass	ghost
947	brambleghast	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/947.png	grass	ghost
948	toedscool	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/948.png	ground	grass
949	toedscruel	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/949.png	ground	grass
950	klawf	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/950.png	rock	\N
951	capsakid	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/951.png	grass	\N
952	scovillain	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/952.png	grass	fire
953	rellor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/953.png	bug	\N
954	rabsca	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/954.png	bug	psychic
955	flittle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/955.png	psychic	\N
956	espathra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/956.png	psychic	\N
957	tinkatink	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/957.png	fairy	steel
958	tinkatuff	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/958.png	fairy	steel
959	tinkaton	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/959.png	fairy	steel
960	wiglett	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/960.png	water	\N
961	wugtrio	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/961.png	water	\N
962	bombirdier	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/962.png	flying	dark
963	finizen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/963.png	water	\N
964	palafin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/964.png	water	\N
965	varoom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/965.png	steel	poison
966	revavroom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/966.png	steel	poison
967	cyclizar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/967.png	dragon	normal
968	orthworm	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/968.png	steel	\N
969	glimmet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/969.png	rock	poison
970	glimmora	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/970.png	rock	poison
971	greavard	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/971.png	ghost	\N
972	houndstone	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/972.png	ghost	\N
973	flamigo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/973.png	flying	fighting
974	cetoddle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/974.png	ice	\N
975	cetitan	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/975.png	ice	\N
976	veluza	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/976.png	water	psychic
977	dondozo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/977.png	water	\N
978	tatsugiri	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/978.png	dragon	water
979	annihilape	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/979.png	fighting	ghost
980	clodsire	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/980.png	poison	ground
981	farigiraf	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/981.png	normal	psychic
982	dudunsparce	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/982.png	normal	\N
983	kingambit	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/983.png	dark	steel
984	great-tusk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/984.png	ground	fighting
985	scream-tail	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/985.png	fairy	psychic
986	brute-bonnet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/986.png	grass	dark
987	flutter-mane	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/987.png	ghost	fairy
988	slither-wing	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/988.png	bug	fighting
989	sandy-shocks	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/989.png	electric	ground
990	iron-treads	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/990.png	ground	steel
991	iron-bundle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/991.png	ice	water
992	iron-hands	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/992.png	fighting	electric
993	iron-jugulis	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/993.png	dark	flying
994	iron-moth	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/994.png	fire	poison
995	iron-thorns	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/995.png	rock	electric
996	frigibax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/996.png	dragon	ice
997	arctibax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/997.png	dragon	ice
998	baxcalibur	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/998.png	dragon	ice
999	gimmighoul	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/999.png	ghost	\N
1000	gholdengo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1000.png	steel	ghost
1001	wo-chien	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1001.png	dark	grass
1002	chien-pao	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1002.png	dark	ice
1003	ting-lu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1003.png	dark	ground
1004	chi-yu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1004.png	dark	fire
1005	roaring-moon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1005.png	dragon	dark
1006	iron-valiant	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1006.png	fairy	fighting
1007	koraidon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1007.png	fighting	dragon
1008	miraidon	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1008.png	electric	dragon
10001	deoxys-attack	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10001.png	psychic	\N
10002	deoxys-defense	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10002.png	psychic	\N
10003	deoxys-speed	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10003.png	psychic	\N
10004	wormadam-sandy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10004.png	bug	ground
10005	wormadam-trash	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10005.png	bug	steel
10006	shaymin-sky	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10006.png	grass	flying
10007	giratina-origin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10007.png	ghost	dragon
10008	rotom-heat	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10008.png	electric	fire
10009	rotom-wash	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10009.png	electric	water
10010	rotom-frost	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10010.png	electric	ice
10011	rotom-fan	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10011.png	electric	flying
10012	rotom-mow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10012.png	electric	grass
10013	castform-sunny	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10013.png	fire	\N
10014	castform-rainy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10014.png	water	\N
10015	castform-snowy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10015.png	ice	\N
10016	basculin-blue-striped	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10016.png	water	\N
10017	darmanitan-zen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10017.png	fire	psychic
10018	meloetta-pirouette	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10018.png	normal	fighting
10019	tornadus-therian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10019.png	flying	\N
10020	thundurus-therian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10020.png	electric	flying
10021	landorus-therian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10021.png	ground	flying
10022	kyurem-black	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10022.png	dragon	ice
10023	kyurem-white	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10023.png	dragon	ice
10024	keldeo-resolute	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10024.png	water	fighting
10025	meowstic-female	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10025.png	psychic	\N
10026	aegislash-blade	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10026.png	steel	ghost
10027	pumpkaboo-small	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10027.png	ghost	grass
10028	pumpkaboo-large	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10028.png	ghost	grass
10029	pumpkaboo-super	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10029.png	ghost	grass
10030	gourgeist-small	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10030.png	ghost	grass
10031	gourgeist-large	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10031.png	ghost	grass
10032	gourgeist-super	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10032.png	ghost	grass
10033	venusaur-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10033.png	grass	poison
10034	charizard-mega-x	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10034.png	fire	dragon
10035	charizard-mega-y	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10035.png	fire	flying
10036	blastoise-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10036.png	water	\N
10037	alakazam-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10037.png	psychic	\N
10038	gengar-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10038.png	ghost	poison
10039	kangaskhan-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10039.png	normal	\N
10040	pinsir-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10040.png	bug	flying
10041	gyarados-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10041.png	water	dark
10042	aerodactyl-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10042.png	rock	flying
10043	mewtwo-mega-x	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10043.png	psychic	fighting
10044	mewtwo-mega-y	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10044.png	psychic	\N
10045	ampharos-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10045.png	electric	dragon
10046	scizor-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10046.png	bug	steel
10047	heracross-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10047.png	bug	fighting
10048	houndoom-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10048.png	dark	fire
10049	tyranitar-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10049.png	rock	dark
10050	blaziken-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10050.png	fire	fighting
10051	gardevoir-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10051.png	psychic	fairy
10052	mawile-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10052.png	steel	fairy
10053	aggron-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10053.png	steel	\N
10054	medicham-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10054.png	fighting	psychic
10055	manectric-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10055.png	electric	\N
10056	banette-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10056.png	ghost	\N
10057	absol-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10057.png	dark	\N
10058	garchomp-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10058.png	dragon	ground
10059	lucario-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10059.png	fighting	steel
10060	abomasnow-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10060.png	grass	ice
10061	floette-eternal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10061.png	fairy	\N
10062	latias-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10062.png	dragon	psychic
10063	latios-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10063.png	dragon	psychic
10064	swampert-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10064.png	water	ground
10065	sceptile-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10065.png	grass	dragon
10066	sableye-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10066.png	dark	ghost
10067	altaria-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10067.png	dragon	fairy
10068	gallade-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10068.png	psychic	fighting
10069	audino-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10069.png	normal	fairy
10070	sharpedo-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10070.png	water	dark
10071	slowbro-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10071.png	water	psychic
10072	steelix-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10072.png	steel	ground
10073	pidgeot-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10073.png	normal	flying
10074	glalie-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10074.png	ice	\N
10075	diancie-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10075.png	rock	fairy
10076	metagross-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10076.png	steel	psychic
10077	kyogre-primal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10077.png	water	\N
10078	groudon-primal	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10078.png	ground	fire
10079	rayquaza-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10079.png	dragon	flying
10080	pikachu-rock-star	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10080.png	electric	\N
10081	pikachu-belle	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10081.png	electric	\N
10082	pikachu-pop-star	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10082.png	electric	\N
10083	pikachu-phd	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10083.png	electric	\N
10084	pikachu-libre	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10084.png	electric	\N
10085	pikachu-cosplay	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10085.png	electric	\N
10086	hoopa-unbound	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10086.png	psychic	dark
10087	camerupt-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10087.png	fire	ground
10088	lopunny-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10088.png	normal	fighting
10089	salamence-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10089.png	dragon	flying
10090	beedrill-mega	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10090.png	bug	poison
10091	rattata-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10091.png	dark	normal
10092	raticate-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10092.png	dark	normal
10093	raticate-totem-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10093.png	dark	normal
10094	pikachu-original-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10094.png	electric	\N
10095	pikachu-hoenn-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10095.png	electric	\N
10096	pikachu-sinnoh-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10096.png	electric	\N
10097	pikachu-unova-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10097.png	electric	\N
10098	pikachu-kalos-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10098.png	electric	\N
10099	pikachu-alola-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10099.png	electric	\N
10100	raichu-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10100.png	electric	psychic
10101	sandshrew-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10101.png	ice	steel
10102	sandslash-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10102.png	ice	steel
10103	vulpix-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10103.png	ice	\N
10104	ninetales-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10104.png	ice	fairy
10105	diglett-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10105.png	ground	steel
10106	dugtrio-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10106.png	ground	steel
10107	meowth-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10107.png	dark	\N
10108	persian-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10108.png	dark	\N
10109	geodude-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10109.png	rock	electric
10110	graveler-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10110.png	rock	electric
10111	golem-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10111.png	rock	electric
10112	grimer-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10112.png	poison	dark
10113	muk-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10113.png	poison	dark
10114	exeggutor-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10114.png	grass	dragon
10115	marowak-alola	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10115.png	fire	ghost
10116	greninja-battle-bond	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10116.png	water	dark
10117	greninja-ash	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10117.png	water	dark
10118	zygarde-10-power-construct	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10118.png	dragon	ground
10119	zygarde-50-power-construct	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10119.png	dragon	ground
10120	zygarde-complete	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10120.png	dragon	ground
10121	gumshoos-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10121.png	normal	\N
10122	vikavolt-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10122.png	bug	electric
10123	oricorio-pom-pom	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10123.png	electric	flying
10124	oricorio-pau	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10124.png	psychic	flying
10125	oricorio-sensu	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10125.png	ghost	flying
10126	lycanroc-midnight	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10126.png	rock	\N
10127	wishiwashi-school	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10127.png	water	\N
10128	lurantis-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10128.png	grass	\N
10129	salazzle-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10129.png	poison	fire
10130	minior-orange-meteor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10130.png	rock	flying
10131	minior-yellow-meteor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10131.png	rock	flying
10132	minior-green-meteor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10132.png	rock	flying
10133	minior-blue-meteor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10133.png	rock	flying
10134	minior-indigo-meteor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10134.png	rock	flying
10135	minior-violet-meteor	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10135.png	rock	flying
10136	minior-red	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10136.png	rock	flying
10137	minior-orange	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10137.png	rock	flying
10138	minior-yellow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10138.png	rock	flying
10139	minior-green	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10139.png	rock	flying
10140	minior-blue	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10140.png	rock	flying
10141	minior-indigo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10141.png	rock	flying
10142	minior-violet	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10142.png	rock	flying
10143	mimikyu-busted	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/10143.png	ghost	fairy
10144	mimikyu-totem-disguised	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10144.png	ghost	fairy
10145	mimikyu-totem-busted	static/images/pokeball.pokeball.png	ghost	fairy
10146	kommo-o-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10146.png	dragon	fighting
10147	magearna-original	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10147.png	steel	fairy
10148	pikachu-partner-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10148.png	electric	\N
10149	marowak-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10149.png	fire	ghost
10150	ribombee-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10150.png	bug	fairy
10151	rockruff-own-tempo	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10151.png	rock	\N
10152	lycanroc-dusk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10152.png	rock	\N
10153	araquanid-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10153.png	water	bug
10154	togedemaru-totem	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10154.png	electric	steel
10155	necrozma-dusk	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10155.png	psychic	steel
10156	necrozma-dawn	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10156.png	psychic	ghost
10157	necrozma-ultra	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10157.png	psychic	dragon
10158	pikachu-starter	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10158.png	electric	\N
10159	eevee-starter	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10159.png	normal	\N
10160	pikachu-world-cap	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10160.png	electric	\N
10161	meowth-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10161.png	steel	\N
10162	ponyta-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10162.png	psychic	\N
10163	rapidash-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10163.png	psychic	fairy
10164	slowpoke-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10164.png	psychic	\N
10165	slowbro-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10165.png	poison	psychic
10166	farfetchd-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10166.png	fighting	\N
10167	weezing-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10167.png	poison	fairy
10168	mr-mime-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10168.png	ice	psychic
10169	articuno-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10169.png	psychic	flying
10170	zapdos-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10170.png	fighting	flying
10171	moltres-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10171.png	dark	flying
10172	slowking-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10172.png	poison	psychic
10173	corsola-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10173.png	ghost	\N
10174	zigzagoon-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10174.png	dark	normal
10175	linoone-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10175.png	dark	normal
10176	darumaka-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10176.png	ice	\N
10177	darmanitan-galar-standard	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10177.png	ice	\N
10178	darmanitan-galar-zen	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10178.png	ice	fire
10179	yamask-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10179.png	ground	ghost
10180	stunfisk-galar	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10180.png	ground	steel
10181	zygarde-10	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10181.png	dragon	ground
10182	cramorant-gulping	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10182.png	flying	water
10183	cramorant-gorging	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10183.png	flying	water
10184	toxtricity-low-key	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10184.png	electric	poison
10185	eiscue-noice	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10185.png	ice	\N
10186	indeedee-female	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10186.png	psychic	normal
10187	morpeko-hangry	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10187.png	electric	dark
10188	zacian-crowned	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10188.png	fairy	steel
10189	zamazenta-crowned	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10189.png	fighting	steel
10190	eternatus-eternamax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10190.png	poison	dragon
10191	urshifu-rapid-strike	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10191.png	fighting	water
10192	zarude-dada	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10192.png	dark	grass
10193	calyrex-ice	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10193.png	psychic	ice
10194	calyrex-shadow	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10194.png	psychic	ghost
10195	venusaur-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10195.png	grass	poison
10196	charizard-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10196.png	fire	flying
10197	blastoise-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10197.png	water	\N
10198	butterfree-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10198.png	bug	flying
10199	pikachu-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10199.png	electric	\N
10200	meowth-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10200.png	normal	\N
10201	machamp-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10201.png	fighting	\N
10202	gengar-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10202.png	ghost	poison
10203	kingler-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10203.png	water	\N
10204	lapras-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10204.png	water	ice
10205	eevee-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10205.png	normal	\N
10206	snorlax-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10206.png	normal	\N
10207	garbodor-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10207.png	poison	\N
10208	melmetal-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10208.png	steel	\N
10209	rillaboom-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10209.png	grass	\N
10210	cinderace-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10210.png	fire	\N
10211	inteleon-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10211.png	water	\N
10212	corviknight-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10212.png	flying	steel
10213	orbeetle-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10213.png	bug	psychic
10214	drednaw-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10214.png	water	rock
10215	coalossal-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10215.png	rock	fire
10216	flapple-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10216.png	grass	dragon
10217	appletun-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10217.png	grass	dragon
10218	sandaconda-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10218.png	ground	\N
10219	toxtricity-amped-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10219.png	electric	poison
10220	centiskorch-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10220.png	fire	bug
10221	hatterene-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10221.png	psychic	fairy
10222	grimmsnarl-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10222.png	dark	fairy
10223	alcremie-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10223.png	fairy	\N
10224	copperajah-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10224.png	steel	\N
10225	duraludon-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10225.png	steel	dragon
10226	urshifu-single-strike-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10226.png	fighting	dark
10227	urshifu-rapid-strike-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10227.png	fighting	water
10228	toxtricity-low-key-gmax	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10228.png	electric	poison
10229	growlithe-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10229.png	fire	rock
10230	arcanine-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10230.png	fire	rock
10231	voltorb-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10231.png	electric	grass
10232	electrode-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10232.png	electric	grass
10233	typhlosion-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10233.png	fire	ghost
10234	qwilfish-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10234.png	dark	poison
10235	sneasel-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10235.png	fighting	poison
10236	samurott-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10236.png	water	dark
10237	lilligant-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10237.png	grass	fighting
10238	zorua-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10238.png	normal	ghost
10239	zoroark-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10239.png	normal	ghost
10240	braviary-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10240.png	psychic	flying
10241	sliggoo-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10241.png	steel	dragon
10242	goodra-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10242.png	steel	dragon
10243	avalugg-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10243.png	ice	rock
10244	decidueye-hisui	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10244.png	grass	fighting
10245	dialga-origin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10245.png	steel	dragon
10246	palkia-origin	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10246.png	water	dragon
10247	basculin-white-striped	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10247.png	water	\N
10248	basculegion-female	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10248.png	water	ghost
10249	enamorus-therian	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10249.png	fairy	flying
10250	tauros-paldea-combat-breed	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10250.png	fighting	\N
10251	tauros-paldea-blaze-breed	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10251.png	fighting	fire
10252	tauros-paldea-aqua-breed	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10252.png	fighting	water
10253	wooper-paldea	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10253.png	poison	ground
10254	oinkologne-female	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10254.png	normal	\N
10255	dudunsparce-three-segment	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10255.png	normal	\N
10256	palafin-hero	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10256.png	water	\N
10257	maushold-family-of-three	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10257.png	normal	\N
10258	tatsugiri-droopy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10258.png	dragon	water
10259	tatsugiri-stretchy	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10259.png	dragon	water
10260	squawkabilly-blue-plumage	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10260.png	normal	flying
10261	squawkabilly-yellow-plumage	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10261.png	normal	flying
10262	squawkabilly-white-plumage	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10262.png	normal	flying
10263	gimmighoul-roaming	https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10263.png	ghost	\N
10264	koraidon-limited-build	static/images/pokeball.pokeball.png	fighting	dragon
10265	koraidon-sprinting-build	static/images/pokeball.pokeball.png	fighting	dragon
10266	koraidon-swimming-build	static/images/pokeball.pokeball.png	fighting	dragon
10267	koraidon-gliding-build	static/images/pokeball.pokeball.png	fighting	dragon
10268	miraidon-low-power-mode	static/images/pokeball.pokeball.png	electric	dragon
10269	miraidon-drive-mode	static/images/pokeball.pokeball.png	electric	dragon
10270	miraidon-aquatic-mode	static/images/pokeball.pokeball.png	electric	dragon
10271	miraidon-glide-mode	static/images/pokeball.pokeball.png	electric	dragon
\.


--
-- Data for Name: pokemon_team_members; Type: TABLE DATA; Schema: public; Owner: nguarino
--

COPY public.pokemon_team_members (id, pokemon_id, pokemon_team_id) FROM stdin;
\.


--
-- Data for Name: pokemon_teams; Type: TABLE DATA; Schema: public; Owner: nguarino
--

COPY public.pokemon_teams (id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nguarino
--

COPY public.users (id, email, username, password, profile_img_url) FROM stdin;
\.


--
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nguarino
--

SELECT pg_catalog.setval('public.favorites_id_seq', 1, false);


--
-- Name: pokemon_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: nguarino
--

SELECT pg_catalog.setval('public.pokemon_pid_seq', 1, false);


--
-- Name: pokemon_team_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nguarino
--

SELECT pg_catalog.setval('public.pokemon_team_members_id_seq', 1, false);


--
-- Name: pokemon_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nguarino
--

SELECT pg_catalog.setval('public.pokemon_teams_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nguarino
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: favorites favorites_pkey; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pkey PRIMARY KEY (id);


--
-- Name: pokemon pokemon_name_key; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_name_key UNIQUE (name);


--
-- Name: pokemon pokemon_pkey; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon
    ADD CONSTRAINT pokemon_pkey PRIMARY KEY (pid);


--
-- Name: pokemon_team_members pokemon_team_members_pkey; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon_team_members
    ADD CONSTRAINT pokemon_team_members_pkey PRIMARY KEY (id);


--
-- Name: pokemon_teams pokemon_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon_teams
    ADD CONSTRAINT pokemon_teams_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: favorites favorites_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(pid);


--
-- Name: favorites favorites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: pokemon_team_members pokemon_team_members_pokemon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon_team_members
    ADD CONSTRAINT pokemon_team_members_pokemon_id_fkey FOREIGN KEY (pokemon_id) REFERENCES public.pokemon(pid);


--
-- Name: pokemon_team_members pokemon_team_members_pokemon_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon_team_members
    ADD CONSTRAINT pokemon_team_members_pokemon_team_id_fkey FOREIGN KEY (pokemon_team_id) REFERENCES public.pokemon_teams(id) ON DELETE CASCADE;


--
-- Name: pokemon_teams pokemon_teams_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: nguarino
--

ALTER TABLE ONLY public.pokemon_teams
    ADD CONSTRAINT pokemon_teams_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

