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
225	64	1	2999
226	65	1	2999
227	65	2	2595
228	65	1	2999
229	65	3	2900
230	65	1	2999
231	65	2	2595
232	65	3	2900
233	65	3	2900
234	65	3	2900
235	65	2	2595
236	65	2	2595
237	65	2	2595
238	65	2	2595
239	65	2	2595
240	65	2	2595
241	65	2	2595
242	65	2	2595
243	65	2	2595
244	65	2	2595
245	65	2	2595
246	65	2	2595
247	65	3	2900
248	65	3	2900
249	65	3	2900
250	65	3	2900
251	65	3	2900
252	65	3	2900
253	65	3	2900
254	65	3	2900
255	65	1	2999
256	65	3	2900
257	65	2	2595
258	65	2	2595
259	65	2	2595
260	65	2	2595
261	65	3	2900
262	65	3	2900
263	65	3	2900
264	65	3	2900
265	65	3	2900
266	65	3	2900
267	65	3	2900
268	65	3	2900
269	65	3	2900
270	65	3	2900
271	65	3	2900
272	65	3	2900
273	65	3	2900
274	65	3	2900
275	65	3	2900
276	65	3	2900
277	65	3	2900
278	65	3	2900
279	65	3	2900
280	65	3	2900
281	65	3	2900
282	65	3	2900
283	65	3	2900
284	65	3	2900
285	65	3	2900
286	65	3	2900
287	65	3	2900
288	65	3	2900
289	65	3	2900
290	65	3	2900
291	65	3	2900
292	65	3	2900
293	65	3	2900
294	65	3	2900
295	65	3	2900
296	65	3	2900
297	65	3	2900
298	65	3	2900
299	65	3	2900
300	65	3	2900
301	65	3	2900
302	65	3	2900
303	65	3	2900
304	65	3	2900
305	65	3	2900
306	65	3	2900
307	65	3	2900
308	65	3	2900
309	65	3	2900
310	65	3	2900
311	65	3	2900
312	65	3	2900
313	65	3	2900
314	65	3	2900
315	65	3	2900
316	65	3	2900
317	65	3	2900
318	65	3	2900
319	65	3	2900
320	65	3	2900
321	65	3	2900
322	65	3	2900
323	65	3	2900
324	65	2	2595
325	65	2	2595
326	65	3	2900
327	65	3	2900
328	65	1	2999
329	65	2	2595
330	65	3	2900
331	65	3	2900
332	65	3	2900
333	65	3	2900
334	65	3	2900
335	65	3	2900
336	65	3	2900
337	65	2	2595
338	65	2	2595
339	65	2	2595
340	65	3	2900
341	65	3	2900
342	65	3	2900
343	65	3	2900
344	65	3	2900
345	65	3	2900
346	66	3	2900
347	66	1	2999
348	67	3	2900
349	67	3	2900
350	68	3	2900
351	68	3	2900
352	68	3	2900
353	68	3	2900
354	68	3	2900
355	68	1	2999
356	69	7	18900
357	69	7	18900
358	69	8	18500
359	69	8	18500
360	69	8	18500
361	69	8	18500
362	69	8	18500
363	69	8	18500
364	69	8	18500
365	69	8	18500
366	69	8	18500
367	69	10	9500
368	69	8	18500
369	69	8	18500
370	69	8	18500
371	69	8	18500
372	69	8	18500
373	69	8	18500
374	69	8	18500
375	69	8	18500
376	69	8	18500
377	69	10	9500
378	69	7	18900
379	69	7	18900
380	69	8	18500
381	69	8	18500
382	69	7	18900
383	69	7	18900
384	69	10	9500
385	69	8	18500
386	69	8	18500
387	69	8	18500
388	69	8	18500
389	69	8	18500
390	69	8	18500
391	69	8	18500
392	69	10	9500
393	69	10	9500
394	69	8	18500
395	69	8	18500
396	69	8	18500
397	69	12	46500
398	69	8	18500
399	69	8	18500
400	69	8	18500
401	69	8	18500
402	69	8	18500
403	69	7	18900
404	69	7	18900
405	69	7	18900
406	69	7	18900
407	69	7	18900
408	69	7	18900
409	69	7	18900
410	69	7	18900
411	69	7	18900
412	69	7	18900
413	69	7	18900
414	69	7	18900
415	69	7	18900
416	69	7	18900
417	69	7	18900
418	69	7	18900
419	69	8	18500
420	69	7	18900
421	69	7	18900
422	69	10	9500
423	69	7	18900
424	69	7	18900
425	69	7	18900
426	69	7	18900
427	69	7	18900
428	69	7	18900
429	69	7	18900
430	69	7	18900
431	69	7	18900
432	69	7	18900
433	69	7	18900
434	69	7	18900
435	69	7	18900
436	69	7	18900
437	69	7	18900
438	69	7	18900
439	69	7	18900
440	69	7	18900
441	69	11	20900
442	69	9	89000
443	69	9	89000
444	69	7	18900
445	69	7	18900
446	69	7	18900
447	69	7	18900
448	69	7	18900
449	69	8	18500
450	69	7	18900
451	69	10	9500
452	69	9	89000
453	69	11	20900
454	69	12	46500
455	69	10	9500
456	69	8	18500
457	69	8	18500
458	69	7	18900
459	69	7	18900
460	69	7	18900
461	69	8	18500
462	69	8	18500
463	69	8	18500
464	69	10	9500
465	69	10	9500
466	69	10	9500
467	69	10	9500
468	69	8	18500
469	69	7	18900
470	69	7	18900
471	69	7	18900
472	69	12	46500
473	69	12	46500
474	69	12	46500
475	69	8	18500
476	70	7	18900
477	70	7	18900
478	70	7	18900
479	70	7	18900
480	70	7	18900
481	70	8	18500
482	70	8	18500
483	70	8	18500
484	70	8	18500
485	70	7	18900
486	70	8	18500
487	70	8	18500
488	70	9	89000
489	70	9	89000
490	70	9	89000
491	70	9	89000
492	70	7	18900
493	70	8	18500
494	70	8	18500
495	70	8	18500
496	70	10	9500
497	71	7	18900
498	71	7	18900
499	71	12	46500
500	71	7	18900
501	71	7	18900
502	71	7	18900
503	71	7	18900
504	71	7	18900
505	71	7	18900
506	71	11	20900
507	71	11	20900
508	71	11	20900
509	71	11	20900
510	71	7	18900
511	71	7	18900
512	71	7	18900
513	71	7	18900
514	71	7	18900
515	71	7	18900
516	71	7	18900
517	71	7	18900
518	71	7	18900
519	71	7	18900
520	71	7	18900
521	71	10	9500
522	71	10	9500
523	71	10	9500
524	71	10	9500
525	71	7	18900
526	71	7	18900
527	71	7	18900
528	71	7	18900
529	71	7	18900
530	71	7	18900
531	71	9	89000
532	71	9	89000
533	71	9	89000
534	71	9	89000
535	71	9	89000
536	71	9	89000
537	71	9	89000
538	71	9	89000
539	71	9	89000
540	71	9	89000
541	71	9	89000
542	71	9	89000
543	71	9	89000
544	71	9	89000
545	71	9	89000
546	71	9	89000
547	71	9	89000
548	71	9	89000
549	71	9	89000
550	71	9	89000
551	71	9	89000
552	71	9	89000
553	71	9	89000
554	71	9	89000
555	71	9	89000
556	71	9	89000
557	71	9	89000
558	71	9	89000
559	71	9	89000
560	71	9	89000
561	71	9	89000
562	71	9	89000
563	71	9	89000
564	71	9	89000
565	71	9	89000
566	71	9	89000
567	71	9	89000
568	71	9	89000
569	71	9	89000
570	71	9	89000
571	71	10	9500
572	71	10	9500
573	71	10	9500
574	71	10	9500
575	71	8	18500
576	71	8	18500
577	71	7	18900
578	71	8	18500
579	71	8	18500
580	71	8	18500
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
65	2020-11-17 17:35:06.582151+00
66	2020-11-17 21:43:41.121743+00
67	2020-11-17 22:59:14.342959+00
68	2020-11-17 23:00:58.316871+00
69	2020-11-17 23:46:48.966149+00
70	2020-11-18 05:18:23.912443+00
71	2020-11-18 16:37:39.1572+00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
1	65	qqqq	2487283974279429	1101 N Avila Place	2020-11-17 21:36:52.933981+00
2	66	austin	2487283974279429	1101 N Avila Place	2020-11-17 21:44:10.229661+00
3	68	austin	2487283974279429	110 N palmdale st	2020-11-17 23:04:29.61792+00
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription") FROM stdin;
7	ACNE STUDIOS EXFORD METALLIC FACE TEE	18900	/images/acne-tee.jpg	In bold black and gold, this Acne Studios tee is sure to crack a smile.	In bold black and gold, this Acne Studios tee is sure to crack a smile. Centered with the label’s signature face logo, it’s consciously crafted from organic cotton and cut to a relaxed fit for a nonchalant finish.
10	NEIGHBORHOOD IN MY EYES TEE	9500	/images/neighbor-tee.jpg	Neighborhood is heavily influenced by subcultures, with pieces like this tee synonymous with the label.	Neighborhood is heavily influenced by subcultures, with pieces like this tee synonymous with the label. Piercing eyes features printed at the chest, placed above metal-inspired text reading ‘MASTERS OF LEGALIZED CONFUSION’. The Ura-Hara-based label’s block letter logo features printed at the back to complete things.
8	PACCBET CHECKED HOOD POPOVER HOODY	18500	/images/paccbet-hoodie.jpg	The hood of this PACCBET sweater is covered with grey plaid.	The hood of this PACCBET sweater is covered with grey plaid, while the Russian brand’s logo is stamped in bold yellow at its chest. Made to look like two pieces layered, it’s a skate-ready piece that’s completed with snug ribbed trims.
9	VETEMENTS ALL OVER PRINT CREW KNIT	89000	/images/vetement-sweater.jpg	VETEMENTS serves up a healthy dose of logomania with this black crewneck.	VETEMENTS serves up a healthy dose of logomania with this black crew, detailing it all-over with ‘VETEMENTS’ in bright white. It’s handknitted in Italy using a blend of cotton and cashmere, resulting in a piece that’s equal parts luxe to street-ready.
11	COMME DES GARCONS PLAY PULLOVER HOODY	20900	/images/cdg-hoodie.jpg	Simply styled with a fun twist, this Comme des Garcons PLAY hoody.	Simply styled with a fun twist, this Comme des Garcons PLAY hoody recreates the aesthetic that gained the brand its cult following. The jet black jersey is trimmed with comfortable ribbing, while the label’s iconic heart logo stares out from the chest.
12	MONCLER MOUNTAIN LOGO SWEAT	46500	/images/moncler.jpg	Moncler pays homage to its heritage with this black sweat, detailing the front with a large, French Alps-inspired logo.	Moncler pays homage to its heritage with this black sweat, detailing the front with a large, French Alps-inspired logo. It’s cut from comfortable cotton jersey and finished, as you’d expect, with the iconic rooster logo at one arm.
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 580, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 71, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 3, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, true);


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

