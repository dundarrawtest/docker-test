--
-- PostgreSQL database dump
--

\restrict hbSnmcBnA4TeN4NMvyQ2KETk7VPxN1mMXAaNLDBJWJJQaA5JC2DUeTXkVwsZ4h1

-- Dumped from database version 18.6 (Homebrew)
-- Dumped by pg_dump version 18.6 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: customers; Type: TABLE; Schema: public; Owner: dundar
--

CREATE TABLE public.customers (
    customer_id bigint NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(30),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.customers OWNER TO dundar;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: dundar
--

ALTER TABLE public.customers ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: dundar
--

CREATE TABLE public.order_items (
    order_item_id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    quantity integer NOT NULL,
    unit_price numeric(12,2) NOT NULL,
    CONSTRAINT order_items_quantity_check CHECK ((quantity > 0)),
    CONSTRAINT order_items_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE public.order_items OWNER TO dundar;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: dundar
--

ALTER TABLE public.order_items ALTER COLUMN order_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.order_items_order_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: dundar
--

CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    order_status character varying(30) DEFAULT 'pending'::character varying NOT NULL,
    ordered_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT chk_orders_status CHECK (((order_status)::text = ANY ((ARRAY['pending'::character varying, 'paid'::character varying, 'shipped'::character varying, 'delivered'::character varying, 'cancelled'::character varying])::text[])))
);


ALTER TABLE public.orders OWNER TO dundar;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: dundar
--

ALTER TABLE public.orders ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: dundar
--

CREATE TABLE public.products (
    product_id bigint NOT NULL,
    sku character varying(50) NOT NULL,
    product_name character varying(200) NOT NULL,
    category character varying(100) NOT NULL,
    unit_price numeric(12,2) NOT NULL,
    stock_quantity integer DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT products_stock_quantity_check CHECK ((stock_quantity >= 0)),
    CONSTRAINT products_unit_price_check CHECK ((unit_price >= (0)::numeric))
);


ALTER TABLE public.products OWNER TO dundar;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: dundar
--

ALTER TABLE public.products ALTER COLUMN product_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: dundar
--

COPY public.customers (customer_id, first_name, last_name, email, phone, created_at) FROM stdin;
1	Ahmet	Yılmaz	ahmet.yilmaz@example.com	+905321111111	2026-10-07 21:50:21.693261+03
2	Ayşe	Kaya	ayse.kaya@example.com	+905322222222	2026-10-07 21:50:21.693261+03
3	Mehmet	Demir	mehmet.demir@example.com	+905323333333	2026-10-07 21:50:21.693261+03
4	Zeynep	Çelik	zeynep.celik@example.com	+905324444444	2026-10-07 21:50:21.693261+03
5	Emre	Şahin	emre.sahin@example.com	+905325555555	2026-10-07 21:50:21.693261+03
6	Elif	Aydın	elif.aydin@example.com	+905326666666	2026-10-07 21:50:21.693261+03
7	Burak	Öztürk	burak.ozturk@example.com	+905327777777	2026-10-07 21:50:21.693261+03
8	Merve	Arslan	merve.arslan@example.com	+905328888888	2026-10-07 21:50:21.693261+03
9	Can	Kurt	can.kurt@example.com	+905329999999	2026-10-07 21:50:21.693261+03
10	Selin	Koç	selin.koc@example.com	+905320000000	2026-10-07 21:50:21.693261+03
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: dundar
--

COPY public.order_items (order_item_id, order_id, product_id, quantity, unit_price) FROM stdin;
1	1	1	1	45999.00
2	1	6	1	4299.00
3	1	9	2	2199.00
4	2	2	1	38999.00
5	2	7	1	3499.00
6	3	4	2	8999.00
7	3	6	1	4299.00
8	4	3	1	32999.00
9	4	8	1	2899.00
10	4	9	1	2199.00
11	5	5	1	10999.00
12	6	1	1	45999.00
13	6	10	1	4999.00
14	7	7	2	3499.00
15	8	2	1	38999.00
16	8	6	1	4299.00
17	9	4	1	8999.00
18	9	5	1	10999.00
19	10	8	1	2899.00
20	10	9	2	2199.00
21	11	1	1	45999.00
22	11	6	1	4299.00
23	12	3	1	32999.00
24	12	7	1	3499.00
25	13	10	2	4999.00
26	14	2	1	38999.00
27	14	9	1	2199.00
28	15	4	1	8999.00
29	15	8	1	2899.00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: dundar
--

COPY public.orders (order_id, customer_id, order_status, ordered_at) FROM stdin;
1	1	delivered	2026-09-20 10:15:00+03
2	2	shipped	2026-09-21 14:30:00+03
3	3	paid	2026-09-22 09:45:00+03
4	4	delivered	2026-09-23 16:20:00+03
5	5	cancelled	2026-09-24 11:10:00+03
6	1	delivered	2026-09-25 13:40:00+03
7	6	pending	2026-09-26 18:05:00+03
8	7	shipped	2026-09-27 12:25:00+03
9	8	delivered	2026-09-28 15:50:00+03
10	9	paid	2026-09-29 10:35:00+03
11	10	delivered	2026-09-30 17:15:00+03
12	2	shipped	2026-10-01 09:20:00+03
13	3	delivered	2026-10-02 14:45:00+03
14	5	paid	2026-10-03 11:30:00+03
15	7	pending	2026-10-04 19:10:00+03
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: dundar
--

COPY public.products (product_id, sku, product_name, category, unit_price, stock_quantity, is_active, created_at) FROM stdin;
1	LAP-001	MacBook Air M4	Laptop	45999.00	18	t	2026-10-07 21:36:00.514123+03
2	LAP-002	Lenovo ThinkPad E16	Laptop	38999.00	12	t	2026-10-07 21:36:00.514123+03
3	LAP-003	Dell Inspiron 15	Laptop	32999.00	9	t	2026-10-07 21:36:00.514123+03
4	MON-001	Dell 27 Inch Monitor	Monitor	8999.00	25	t	2026-10-07 21:36:00.514123+03
5	MON-002	LG UltraWide 29 Inch	Monitor	10999.00	14	t	2026-10-07 21:36:00.514123+03
6	KEY-001	Logitech MX Keys	Keyboard	4299.00	30	t	2026-10-07 21:36:00.514123+03
7	MOU-001	Logitech MX Master 3S	Mouse	3499.00	40	t	2026-10-07 21:36:00.514123+03
8	MOU-002	Razer DeathAdder V3	Mouse	2899.00	22	t	2026-10-07 21:36:00.514123+03
9	HUB-001	Anker USB-C Hub	Accessories	2199.00	35	t	2026-10-07 21:36:00.514123+03
10	SSD-001	Samsung 990 EVO 1TB	Storage	4999.00	17	t	2026-10-07 21:36:00.514123+03
\.


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dundar
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 12, true);


--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dundar
--

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 29, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dundar
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 15, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dundar
--

SELECT pg_catalog.setval('public.products_product_id_seq', 12, true);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- Name: products products_sku_key; Type: CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_sku_key UNIQUE (sku);


--
-- Name: idx_order_items_product_id; Type: INDEX; Schema: public; Owner: dundar
--

CREATE INDEX idx_order_items_product_id ON public.order_items USING btree (product_id);


--
-- Name: idx_orders_customer_id; Type: INDEX; Schema: public; Owner: dundar
--

CREATE INDEX idx_orders_customer_id ON public.orders USING btree (customer_id);


--
-- Name: idx_orders_ordered_at; Type: INDEX; Schema: public; Owner: dundar
--

CREATE INDEX idx_orders_ordered_at ON public.orders USING btree (ordered_at);


--
-- Name: order_items fk_order_items_order; Type: FK CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- Name: order_items fk_order_items_product; Type: FK CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- Name: orders fk_orders_customer; Type: FK CONSTRAINT; Schema: public; Owner: dundar
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- PostgreSQL database dump complete
--

\unrestrict hbSnmcBnA4TeN4NMvyQ2KETk7VPxN1mMXAaNLDBJWJJQaA5JC2DUeTXkVwsZ4h1

