--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.14 (Ubuntu 10.14-0ubuntu0.18.04.1)

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

ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.carts DROP CONSTRAINT IF EXISTS carts_pkey;
ALTER TABLE IF EXISTS ONLY public."cartItems" DROP CONSTRAINT IF EXISTS "cartItems_pkey";
ALTER TABLE IF EXISTS public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE IF EXISTS public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE IF EXISTS public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE IF EXISTS public."products_productId_seq";
DROP TABLE IF EXISTS public.products;
DROP SEQUENCE IF EXISTS public."orders_orderId_seq";
DROP TABLE IF EXISTS public.orders;
DROP SEQUENCE IF EXISTS public."carts_cartId_seq";
DROP TABLE IF EXISTS public.carts;
DROP SEQUENCE IF EXISTS public."cartItems_cartItemId_seq";
DROP TABLE IF EXISTS public."cartItems";
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
1	48	3	2900
2	49	3	2900
3	50	3	2900
4	51	3	2900
5	52	3	2900
6	53	3	2900
7	54	3	2900
8	55	3	2900
9	56	3	2900
10	57	3	2900
11	58	3	2900
12	59	4	999
13	60	1	2999
14	60	1	2999
15	61	3	2900
16	61	3	2900
17	61	3	2900
18	61	3	2900
19	61	3	2900
20	61	3	2900
21	61	3	2900
22	61	3	2900
23	61	3	2900
24	61	3	2900
25	61	3	2900
26	61	3	2900
27	61	3	2900
28	61	3	2900
29	61	3	2900
30	61	3	2900
31	61	3	2900
32	61	3	2900
33	61	3	2900
34	61	3	2900
35	61	3	2900
36	61	3	2900
37	61	3	2900
38	61	3	2900
39	61	3	2900
40	61	3	2900
41	61	3	2900
42	61	3	2900
43	61	3	2900
44	61	3	2900
45	61	3	2900
46	61	3	2900
47	61	1	2999
48	61	1	2999
49	61	1	2999
50	61	1	2999
51	61	1	2999
52	61	1	2999
53	61	5	9900
54	61	5	9900
55	61	5	9900
56	61	5	9900
57	61	5	9900
58	61	6	830
59	61	6	830
60	61	4	999
61	61	4	999
62	61	4	999
63	61	3	2900
64	61	3	2900
65	61	2	2595
66	61	2	2595
67	61	2	2595
68	61	2	2595
69	61	3	2900
70	61	3	2900
71	61	3	2900
72	61	3	2900
73	62	1	2999
74	62	1	2999
75	62	1	2999
76	62	1	2999
77	62	1	2999
78	62	1	2999
79	62	1	2999
80	62	2	2595
81	62	2	2595
82	62	2	2595
83	62	5	9900
84	62	5	9900
85	62	5	9900
86	62	5	9900
87	62	5	9900
88	62	5	9900
89	62	5	9900
90	62	5	9900
91	62	5	9900
92	62	5	9900
93	62	5	9900
94	62	5	9900
95	62	5	9900
96	62	5	9900
97	62	3	2900
98	62	2	2595
99	62	1	2999
100	62	3	2900
101	62	3	2900
102	62	3	2900
103	62	3	2900
104	62	3	2900
105	62	3	2900
106	62	3	2900
107	62	3	2900
108	62	3	2900
109	62	3	2900
110	62	3	2900
111	62	3	2900
112	62	3	2900
113	62	3	2900
114	62	3	2900
115	62	3	2900
116	62	3	2900
117	62	3	2900
118	62	3	2900
119	62	2	2595
120	62	2	2595
121	62	2	2595
122	62	2	2595
123	62	2	2595
124	62	2	2595
125	62	1	2999
126	62	2	2595
127	62	2	2595
128	62	2	2595
129	62	2	2595
130	62	3	2900
131	62	3	2900
132	62	3	2900
133	62	3	2900
134	62	2	2595
135	62	2	2595
136	62	2	2595
137	62	2	2595
138	62	1	2999
139	62	1	2999
140	62	1	2999
141	62	3	2900
142	62	3	2900
143	62	2	2595
144	62	2	2595
145	62	2	2595
146	62	3	2900
147	62	3	2900
148	62	3	2900
149	63	3	2900
150	63	3	2900
151	63	3	2900
152	63	3	2900
153	63	3	2900
154	63	3	2900
155	63	3	2900
156	63	3	2900
157	63	3	2900
158	63	3	2900
159	63	3	2900
160	63	3	2900
161	63	3	2900
162	63	3	2900
163	63	3	2900
164	63	3	2900
165	63	3	2900
166	63	3	2900
167	63	3	2900
168	63	3	2900
169	63	3	2900
170	63	3	2900
171	63	3	2900
172	63	3	2900
173	63	3	2900
174	63	3	2900
175	63	3	2900
176	63	3	2900
177	63	2	2595
178	63	2	2595
179	63	3	2900
180	63	3	2900
181	63	2	2595
182	63	3	2900
183	63	2	2595
184	63	3	2900
185	63	3	2900
186	63	2	2595
187	63	1	2999
188	63	2	2595
189	63	2	2595
190	63	3	2900
191	63	2	2595
192	63	3	2900
193	63	3	2900
194	63	3	2900
195	63	3	2900
196	63	3	2900
197	63	3	2900
198	63	3	2900
199	63	3	2900
200	63	3	2900
201	63	3	2900
202	63	3	2900
203	63	2	2595
204	63	1	2999
205	63	4	999
206	63	5	9900
207	63	6	830
208	63	3	2900
209	63	3	2900
210	63	3	2900
211	63	3	2900
212	63	3	2900
213	63	3	2900
214	63	2	2595
215	63	2	2595
216	63	2	2595
217	63	2	2595
218	63	1	2999
219	63	1	2999
220	63	1	2999
221	63	1	2999
222	63	1	2999
223	64	3	2900
224	64	3	2900
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
1	2020-11-06 21:28:42.891908+00
2	2020-11-06 21:30:48.822419+00
3	2020-11-06 21:33:04.618523+00
4	2020-11-06 21:44:49.942876+00
5	2020-11-06 22:29:27.304382+00
6	2020-11-06 22:29:52.413034+00
7	2020-11-06 22:30:16.373384+00
8	2020-11-06 22:30:47.59504+00
9	2020-11-07 00:01:58.892237+00
10	2020-11-07 00:02:14.080549+00
11	2020-11-07 00:02:35.732466+00
12	2020-11-07 00:02:44.888195+00
13	2020-11-07 00:03:27.655997+00
14	2020-11-07 00:54:14.148803+00
15	2020-11-07 00:54:41.529104+00
16	2020-11-07 00:55:10.254401+00
17	2020-11-07 00:55:29.324671+00
18	2020-11-07 00:55:40.62969+00
19	2020-11-07 00:56:12.049494+00
20	2020-11-07 00:56:24.804464+00
21	2020-11-07 00:56:47.113122+00
22	2020-11-07 01:04:00.21897+00
23	2020-11-07 01:29:25.964289+00
24	2020-11-07 01:32:27.912627+00
25	2020-11-07 01:34:41.238308+00
26	2020-11-07 01:36:03.055779+00
27	2020-11-07 01:36:36.288754+00
28	2020-11-07 01:37:03.202966+00
29	2020-11-07 01:39:46.511196+00
30	2020-11-07 01:44:30.853499+00
31	2020-11-07 01:44:40.640987+00
32	2020-11-07 01:50:01.65753+00
33	2020-11-07 01:50:35.713198+00
34	2020-11-07 01:50:40.643311+00
35	2020-11-07 01:51:14.017546+00
36	2020-11-07 01:51:19.273967+00
37	2020-11-07 01:52:46.011102+00
38	2020-11-07 01:52:58.924681+00
39	2020-11-07 02:23:54.67465+00
40	2020-11-07 02:25:32.900258+00
41	2020-11-07 02:28:21.512775+00
42	2020-11-07 02:29:05.7945+00
43	2020-11-07 02:31:13.628154+00
44	2020-11-07 02:32:36.874839+00
45	2020-11-07 02:33:09.056465+00
46	2020-11-07 02:43:06.137184+00
47	2020-11-07 02:44:35.57483+00
48	2020-11-07 02:45:54.937576+00
49	2020-11-07 02:51:31.260373+00
50	2020-11-07 02:52:59.411298+00
51	2020-11-07 02:53:19.127027+00
52	2020-11-07 02:54:18.526321+00
53	2020-11-07 02:55:10.305129+00
54	2020-11-07 02:59:30.861808+00
55	2020-11-07 03:03:44.388554+00
56	2020-11-07 18:18:14.289441+00
57	2020-11-07 18:18:50.217141+00
58	2020-11-07 18:19:12.577617+00
59	2020-11-07 18:27:59.758195+00
60	2020-11-07 18:29:57.932749+00
61	2020-11-08 01:21:35.490258+00
62	2020-11-09 01:59:44.262303+00
63	2020-11-09 15:46:23.07272+00
64	2020-11-17 02:59:02.823845+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
1	Shake Weight	2999	/images/shake-weight.jpg	Dynamic Inertia technology ignites muscles in arms, shoulders, and chest.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock.\\nAesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
2	ShamWow	2595	/images/shamwow.jpg	It's like a chamois, towel, and sponge, all in one! Soaks up to 10x it's weight in any liquid!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock.\\nAesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
3	Snuggie	2900	/images/snuggie.jpg	Super-Soft Fleece with pockets! One Size fits all Adults! Keeps you Warm & Your Hands-Free!	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock.\\nAesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
4	Wax Vac	999	/images/wax-vac.jpg	Gentle way to remove ear wax. Safe and hygienic. Reduces the risk of painful infections.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock.\\nAesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
5	Ostrich Pillow	9900	/images/ostrich-pillow.jpg	Create your own snugly space in the world and feel-good anywhere with the ultimate cocoon pillow.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock.\\nAesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
6	Tater Mitts	830	/images/tater-mitts.jpg	8 Seconds is all you need with Tater Mitts. Quickly and easily prepare all your favorite potato dishes with Tater Mitts.	Lorem ipsum dolor amet fashion axe pour-over jianbing, adaptogen waistcoat tacos master cleanse pitchfork next level. Thundercats pour-over chartreuse 90's. Master cleanse hot chicken ennui offal. Freegan slow-carb offal hell of. Umami polaroid wolf slow-carb next level. Gentrify cardigan seitan, kombucha tacos chambray roof party typewriter man braid. Tote bag lo-fi hell of chia fam hammock.\\nAesthetic photo booth la croix, vaporware leggings biodiesel man braid tumeric skateboard tousled slow-carb four dollar toast synth pabst pickled. Typewriter church-key chia slow-carb vice gochujang actually. Shoreditch austin woke hot chicken, single-origin coffee ugh affogato four loko green juice. Migas iPhone four dollar toast mustache.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 224, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 64, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 1, false);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

