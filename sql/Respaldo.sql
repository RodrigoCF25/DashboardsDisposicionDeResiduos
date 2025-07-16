--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Postgres.app)
-- Dumped by pg_dump version 16.0

-- Started on 2025-07-15 19:28:13 CST

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
-- TOC entry 216 (class 1259 OID 16417)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre character varying(100),
    fecha_alta date,
    activo boolean
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16416)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 218 (class 1259 OID 16424)
-- Name: servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicios (
    id integer NOT NULL,
    cliente_id integer,
    fecha date,
    tipo_servicio character varying(100),
    tipo_residuo character varying(100),
    kg_recolectados numeric,
    relleno_sanitario boolean,
    status character varying(50),
    duracion_disposicion_min integer,
    litros_combustible numeric,
    km_recorridos numeric,
    horas_operacion numeric,
    horas_muertas numeric,
    ingreso_disposicion numeric
);


ALTER TABLE public.servicios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16423)
-- Name: servicios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicios_id_seq OWNER TO postgres;

--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 217
-- Name: servicios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicios_id_seq OWNED BY public.servicios.id;


--
-- TOC entry 3470 (class 2604 OID 16420)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 3471 (class 2604 OID 16427)
-- Name: servicios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios ALTER COLUMN id SET DEFAULT nextval('public.servicios_id_seq'::regclass);


--
-- TOC entry 3621 (class 0 OID 16417)
-- Dependencies: 216
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, fecha_alta, activo) FROM stdin;
1	Andrea Ramírez	2024-06-03	t
2	Daniela López	2024-06-23	t
3	Valeria Gómez	2024-05-03	t
4	Robert Gómez	2024-06-16	t
5	Daniela Hernández	2024-05-19	t
6	Carlos Sánchez	2024-06-01	t
7	Carlos Martínez	2024-05-08	t
8	Miguel Gómez	2024-05-06	t
9	Andrea Torres	2024-05-28	t
10	Robert Martínez	2024-05-19	t
11	Robert Torres	2024-06-01	t
12	Luis López	2024-05-28	t
13	Daniela Sánchez	2024-06-06	t
14	Robert Flores	2024-06-24	t
15	Valeria López	2024-05-27	t
16	Daniela Martínez	2024-06-12	t
17	Luis García	2024-05-11	t
18	Andrea Hernández	2024-05-15	t
19	Laura López	2024-05-11	t
20	Jorge López	2024-06-04	t
21	Carlos García	2024-06-16	t
22	Carlos Hernández	2024-06-22	t
23	Robert Sánchez	2024-06-06	t
24	Laura Torres	2024-05-28	t
25	Laura Sánchez	2024-05-22	t
26	Andrea Pérez	2024-06-03	t
27	Valeria Hernández	2024-05-22	t
28	Sofía Flores	2024-06-13	t
29	Sofía Ramírez	2024-06-08	t
30	Sofía Pérez	2024-06-13	t
31	Valeria Pérez	2024-06-01	t
32	Valeria García	2024-06-20	t
33	Carlos Ramírez	2024-05-20	t
34	Miguel Martínez	2024-05-08	t
35	Luis Torres	2024-06-09	t
36	Luis Martínez	2024-06-06	t
37	Miguel Sánchez	2024-05-13	t
38	Andrea García	2024-05-24	t
39	Andrea López	2024-06-08	t
40	Luis Ramírez	2024-06-28	t
41	Laura García	2024-05-11	t
42	Luis Hernández	2024-05-26	t
43	Robert Ramírez	2024-05-04	t
44	Miguel López	2024-05-12	t
45	Carlos Gómez	2024-06-04	t
46	Sofía Martínez	2024-05-14	t
47	Laura Pérez	2024-06-08	t
48	Valeria Ramírez	2024-06-20	t
49	Luis Flores	2024-06-06	t
50	Laura Martínez	2024-05-15	t
51	Luis Gómez	2024-05-26	t
52	Sofía López	2024-06-07	t
53	Miguel García	2024-05-22	t
54	Daniela Torres	2024-06-04	t
55	Jorge Hernández	2024-05-05	t
56	Daniela Flores	2024-05-07	t
57	Carlos Flores	2024-05-12	t
58	Jorge Pérez	2024-06-14	t
59	Luis Pérez	2024-05-24	t
60	Andrea Flores	2024-05-22	t
61	Luis Sánchez	2024-05-27	t
62	Andrea Martínez	2024-06-24	t
63	Laura Hernández	2024-06-15	t
64	Carlos López	2024-05-19	t
65	Miguel Pérez	2024-05-28	t
66	Jorge Flores	2024-05-15	t
67	Robert Pérez	2024-05-09	t
68	Laura Flores	2024-06-07	t
69	Miguel Ramírez	2024-05-01	t
70	Carlos Torres	2024-05-16	t
71	Sofía Sánchez	2024-06-07	t
72	Carlos Pérez	2024-05-27	t
73	Jorge Gómez	2024-05-03	t
74	Robert López	2024-06-02	t
75	Andrea Sánchez	2024-05-15	t
76	Robert Hernández	2024-05-05	t
77	Sofía Gómez	2024-06-06	t
78	Valeria Sánchez	2024-06-10	t
79	Sofía Hernández	2024-06-15	t
80	Laura Gómez	2024-05-11	t
81	Robert García	2024-06-03	t
82	Valeria Torres	2024-05-19	t
83	Andrea Gómez	2024-05-15	t
84	Miguel Flores	2024-05-19	t
85	Sofía Torres	2024-06-04	t
86	Jorge Torres	2024-05-27	t
87	Jorge García	2024-05-26	t
88	Jorge Sánchez	2024-05-21	t
89	Daniela Gómez	2024-06-24	t
90	Daniela Pérez	2024-06-16	t
91	Sofía García	2024-05-24	t
92	Valeria Martínez	2024-06-09	t
93	Miguel Hernández	2024-06-12	t
94	Jorge Ramírez	2024-06-20	t
95	Valeria Flores	2024-05-09	t
96	Daniela Ramírez	2024-06-23	t
97	Laura Ramírez	2024-05-08	t
98	Daniela García	2024-06-11	t
99	Jorge Martínez	2024-05-06	t
100	Miguel Torres	2024-05-19	t
\.


--
-- TOC entry 3623 (class 0 OID 16424)
-- Dependencies: 218
-- Data for Name: servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicios (id, cliente_id, fecha, tipo_servicio, tipo_residuo, kg_recolectados, relleno_sanitario, status, duracion_disposicion_min, litros_combustible, km_recorridos, horas_operacion, horas_muertas, ingreso_disposicion) FROM stdin;
1	1	2024-06-12	Recolección	Orgánico	822.65	f	Cancelado	58	3.02	12.28	0.9	0.2	1207
2	1	2024-05-28	Recolección	Metal	1013.37	f	Cancelado	47	3.52	18.58	0.8	1.0	1245
3	2	2024-06-25	Recolección	Vidrio	1382.83	f	Completado	43	18.26	2.18	3.6	0.2	1106
4	2	2024-05-03	Recolección	Vidrio	827.8	t	Completado	50	11.64	19.53	1.5	0.6	1128
5	3	2024-05-14	Recolección	Plástico	1137.94	t	Cancelado	54	1.38	17.42	3.3	0.9	1247
6	3	2024-06-22	Disposición	Orgánico	1296.02	f	Completado	38	5.5	22.47	1.9	0.7	1419
7	4	2024-05-22	Disposición	Metal	583.5	f	Pendiente	35	17.6	12.29	1.2	0.1	841
8	4	2024-05-19	Disposición	Plástico	1073.48	t	Pendiente	38	25.32	21.85	1.0	0.9	1253
9	5	2024-06-11	Recolección	Vidrio	970.04	f	Cancelado	32	13.72	5.3	1.8	0.9	1057
10	5	2024-05-01	Disposición	Plástico	1112.17	t	Completado	58	21.67	11.96	1.7	0.1	1012
11	6	2024-06-15	Disposición	Orgánico	1193.08	t	Completado	58	39.48	23.02	2.9	0.4	879
12	6	2024-05-01	Disposición	Plástico	887.55	f	Completado	45	33.49	24.36	3.4	0.0	1091
13	7	2024-05-01	Disposición	Plástico	1006.19	f	Completado	36	37.63	13.03	3.1	0.7	1573
14	7	2024-06-10	Disposición	Orgánico	731.48	t	Pendiente	33	38.29	16.4	3.5	0.9	1115
15	8	2024-05-06	Recolección	Orgánico	905.54	f	Cancelado	51	36.48	2.67	3.1	0.4	948
16	8	2024-06-20	Recolección	Plástico	1445.82	t	Completado	58	30.8	15.39	0.7	0.0	1437
17	9	2024-05-21	Disposición	Vidrio	936.09	t	Cancelado	57	8.25	8.41	0.7	0.1	1237
18	9	2024-06-09	Recolección	Orgánico	1041.0	t	Completado	35	14.11	22.6	0.8	0.9	1273
19	10	2024-05-15	Recolección	Orgánico	1406.21	f	Completado	40	2.45	21.57	3.9	0.8	1445
20	10	2024-05-14	Recolección	Plástico	771.25	f	Cancelado	55	15.52	17.67	2.4	0.3	1561
21	11	2024-05-13	Disposición	Metal	1173.36	f	Completado	46	24.4	20.28	0.7	0.9	1082
22	11	2024-06-24	Recolección	Orgánico	701.67	t	Pendiente	52	34.34	24.67	3.6	1.0	961
23	12	2024-05-24	Disposición	Vidrio	1190.53	f	Completado	48	4.52	17.93	1.9	0.4	918
24	12	2024-06-03	Recolección	Plástico	1379.13	f	Completado	39	29.22	20.11	1.8	0.0	1223
25	13	2024-06-07	Disposición	Orgánico	906.29	t	Pendiente	52	5.53	21.16	2.7	0.8	1472
26	13	2024-05-05	Recolección	Vidrio	1325.9	t	Completado	32	20.95	21.25	3.4	0.2	1329
27	14	2024-05-20	Recolección	Metal	759.88	t	Cancelado	46	30.72	24.96	2.0	0.8	1205
28	14	2024-05-02	Disposición	Plástico	856.98	t	Pendiente	54	0.84	17.73	3.2	0.4	1264
29	15	2024-06-25	Disposición	Vidrio	1045.91	t	Cancelado	55	1.65	2.01	3.5	0.8	973
30	15	2024-06-10	Recolección	Orgánico	1016.25	t	Pendiente	56	38.83	1.06	3.6	0.7	1352
31	16	2024-05-08	Recolección	Plástico	534.7	t	Cancelado	39	16.97	12.12	2.0	0.2	1080
32	16	2024-05-07	Recolección	Vidrio	1438.02	f	Completado	40	30.93	24.23	3.1	0.1	1467
33	17	2024-05-14	Disposición	Metal	1494.12	f	Pendiente	58	5.57	24.36	2.5	0.6	930
34	17	2024-05-03	Recolección	Metal	703.83	f	Pendiente	53	37.15	15.11	3.4	0.0	1233
35	18	2024-05-07	Recolección	Vidrio	1481.09	f	Cancelado	49	15.47	13.51	2.5	0.7	1327
36	18	2024-06-02	Disposición	Orgánico	593.18	t	Completado	41	13.41	3.36	3.2	0.8	1036
37	19	2024-05-24	Recolección	Metal	1030.93	t	Completado	46	18.92	21.73	1.9	0.9	1201
38	19	2024-05-11	Recolección	Vidrio	767.33	t	Pendiente	43	36.96	20.1	3.7	0.9	843
39	20	2024-06-13	Disposición	Orgánico	982.75	t	Cancelado	47	35.93	11.57	3.4	0.9	1229
40	20	2024-06-26	Disposición	Plástico	502.23	t	Pendiente	44	18.6	1.82	1.9	0.7	1359
41	21	2024-05-01	Disposición	Plástico	707.07	f	Cancelado	34	3.69	12.73	3.4	0.8	1273
42	21	2024-06-28	Recolección	Metal	730.89	f	Completado	55	7.64	14.12	0.9	0.0	1320
43	22	2024-05-23	Disposición	Plástico	1378.48	t	Cancelado	36	32.83	4.95	3.6	0.4	1509
44	22	2024-05-21	Recolección	Plástico	537.76	t	Pendiente	33	33.84	17.44	2.6	0.3	1109
45	23	2024-05-21	Recolección	Plástico	990.22	f	Completado	55	17.99	21.65	2.3	0.5	813
46	23	2024-05-22	Recolección	Metal	1017.5	f	Completado	34	31.13	19.83	2.8	0.9	1557
47	24	2024-05-11	Disposición	Plástico	900.01	t	Completado	32	20.57	20.7	3.7	0.9	1356
48	24	2024-06-24	Disposición	Vidrio	589.23	t	Completado	40	13.38	22.79	2.3	0.6	1026
49	25	2024-06-11	Recolección	Vidrio	1173.21	t	Completado	52	8.01	12.88	0.9	0.9	1477
50	25	2024-05-05	Recolección	Metal	1496.08	f	Cancelado	37	3.08	12.2	0.7	0.2	1419
51	26	2024-06-20	Disposición	Metal	534.47	f	Cancelado	57	7.46	14.85	1.5	0.4	855
52	26	2024-05-04	Recolección	Vidrio	1081.02	f	Completado	59	4.85	7.14	3.4	0.7	1316
53	27	2024-06-17	Recolección	Orgánico	1489.41	f	Pendiente	44	31.2	16.25	2.4	0.1	1423
54	27	2024-06-27	Recolección	Vidrio	837.12	f	Pendiente	49	27.5	7.81	1.4	0.9	862
55	28	2024-06-03	Recolección	Metal	1131.54	f	Completado	57	26.07	12.1	3.1	0.4	1105
56	28	2024-06-26	Recolección	Vidrio	651.59	f	Completado	54	24.52	0.44	2.8	0.6	1299
57	29	2024-05-05	Recolección	Vidrio	624.32	t	Cancelado	36	21.21	22.99	3.3	0.5	994
58	29	2024-05-03	Disposición	Metal	811.48	t	Cancelado	45	22.78	21.86	0.6	0.8	1001
59	30	2024-05-17	Disposición	Plástico	1240.37	f	Completado	42	7.48	11.3	2.2	0.6	1387
60	30	2024-06-21	Disposición	Metal	527.67	t	Cancelado	53	29.13	23.6	2.8	0.6	993
61	31	2024-06-16	Recolección	Vidrio	779.87	f	Cancelado	53	8.24	7.54	1.5	0.3	1249
62	31	2024-06-16	Recolección	Plástico	1361.09	t	Completado	56	35.54	1.43	1.1	1.0	1286
63	32	2024-05-17	Recolección	Orgánico	1184.78	f	Cancelado	48	38.1	19.04	3.1	0.4	1580
64	32	2024-06-06	Recolección	Orgánico	1363.24	t	Cancelado	39	38.07	0.84	3.7	0.2	968
65	33	2024-05-08	Recolección	Orgánico	1357.39	t	Pendiente	32	27.03	24.2	0.7	0.9	1599
66	33	2024-06-14	Recolección	Vidrio	964.44	t	Pendiente	59	28.48	15.57	3.6	0.9	1324
67	34	2024-05-28	Recolección	Vidrio	850.24	t	Cancelado	54	31.83	5.36	1.6	0.1	1283
68	34	2024-06-04	Recolección	Vidrio	641.09	t	Cancelado	45	10.9	6.56	1.7	0.0	1520
69	35	2024-06-06	Recolección	Metal	1104.58	t	Pendiente	55	18.02	7.59	0.9	0.5	1127
70	35	2024-05-01	Disposición	Orgánico	1299.82	f	Pendiente	57	14.26	1.89	2.8	1.0	1204
71	36	2024-06-28	Recolección	Plástico	1219.2	t	Pendiente	45	36.61	14.75	2.4	0.1	1004
72	36	2024-05-06	Disposición	Orgánico	581.08	t	Cancelado	54	38.54	8.33	0.8	0.8	1589
73	37	2024-05-15	Disposición	Orgánico	709.22	f	Completado	36	36.61	19.63	3.3	0.4	1561
74	37	2024-06-09	Recolección	Metal	777.03	t	Pendiente	33	30.75	11.29	1.4	0.6	1231
75	38	2024-06-04	Disposición	Plástico	925.29	f	Pendiente	37	23.71	7.39	3.4	0.6	1484
76	38	2024-06-20	Disposición	Orgánico	1052.49	t	Cancelado	60	38.3	12.35	1.7	1.0	1008
77	39	2024-05-06	Disposición	Orgánico	782.64	t	Completado	53	1.66	4.33	1.9	0.8	1168
78	39	2024-05-21	Recolección	Metal	1311.49	t	Pendiente	39	10.49	16.07	1.8	0.4	1453
79	40	2024-06-14	Disposición	Vidrio	1445.77	t	Cancelado	35	36.17	7.94	1.9	0.2	1493
80	40	2024-06-12	Disposición	Metal	1426.7	t	Pendiente	57	30.72	18.59	1.0	0.7	915
81	41	2024-05-26	Recolección	Plástico	1344.17	f	Completado	37	17.7	6.14	2.1	0.9	1597
82	41	2024-06-11	Recolección	Vidrio	1395.22	f	Cancelado	45	4.84	19.09	3.4	0.7	944
83	42	2024-05-16	Recolección	Plástico	1079.66	t	Completado	32	1.64	7.45	3.5	0.7	1450
84	42	2024-06-28	Recolección	Plástico	1316.91	t	Completado	45	6.97	24.79	3.0	0.3	1153
85	43	2024-06-09	Recolección	Orgánico	921.39	t	Cancelado	57	0.79	5.77	1.1	0.8	1500
86	43	2024-05-20	Disposición	Metal	1224.52	f	Pendiente	52	31.37	3.81	2.1	0.4	886
87	44	2024-05-21	Recolección	Metal	904.36	f	Cancelado	48	10.31	19.69	3.3	0.5	800
88	44	2024-05-18	Disposición	Orgánico	1212.64	t	Cancelado	41	14.84	2.36	3.5	0.4	1042
89	45	2024-05-27	Recolección	Vidrio	1061.71	t	Cancelado	30	32.0	11.93	0.6	0.7	1277
90	45	2024-05-25	Recolección	Plástico	771.24	f	Completado	41	2.35	18.7	1.7	0.4	873
91	46	2024-05-08	Recolección	Plástico	1199.17	t	Cancelado	45	9.78	15.22	1.6	0.5	873
92	46	2024-05-26	Recolección	Metal	1346.21	t	Completado	40	9.09	15.85	2.0	0.5	1281
93	47	2024-05-20	Recolección	Orgánico	984.76	f	Completado	30	2.39	12.0	1.8	0.7	1535
94	47	2024-05-19	Disposición	Orgánico	1357.61	t	Cancelado	55	19.44	19.45	2.9	0.6	1520
95	48	2024-05-08	Disposición	Vidrio	673.63	f	Pendiente	33	8.17	21.17	1.1	0.8	1256
96	48	2024-06-20	Disposición	Orgánico	1462.41	f	Cancelado	39	7.92	10.85	2.5	0.7	1056
97	49	2024-05-08	Disposición	Metal	1287.07	f	Completado	55	39.13	24.74	3.5	0.9	1520
98	49	2024-05-06	Disposición	Metal	939.29	f	Cancelado	53	26.66	10.89	3.6	0.6	1138
99	50	2024-05-25	Disposición	Plástico	656.34	f	Completado	42	0.12	7.9	2.5	0.1	1153
100	50	2024-05-13	Disposición	Plástico	1111.07	t	Cancelado	30	37.63	13.84	3.7	0.3	883
101	51	2024-05-12	Recolección	Orgánico	1294.44	t	Completado	44	15.91	13.97	2.9	0.6	1275
102	51	2024-05-21	Recolección	Orgánico	1159.55	t	Completado	50	37.31	21.11	1.9	0.2	1337
103	52	2024-06-08	Recolección	Metal	1498.16	t	Pendiente	47	8.45	8.63	2.7	0.7	1225
104	52	2024-05-24	Recolección	Vidrio	1167.26	f	Cancelado	55	6.08	13.13	3.9	0.7	1271
105	53	2024-06-02	Disposición	Orgánico	680.79	f	Completado	51	16.94	7.57	3.9	0.6	1206
106	53	2024-06-25	Disposición	Plástico	949.33	f	Cancelado	43	28.72	13.63	2.3	0.8	963
107	54	2024-05-28	Disposición	Orgánico	652.68	t	Cancelado	46	15.58	11.6	1.7	0.2	1120
108	54	2024-05-27	Disposición	Metal	1291.74	f	Completado	39	37.41	23.97	3.8	0.1	883
109	55	2024-05-27	Recolección	Orgánico	808.43	f	Pendiente	52	36.53	8.27	2.4	0.3	819
110	55	2024-05-10	Disposición	Vidrio	1046.41	f	Cancelado	54	13.44	7.47	3.7	0.8	855
111	56	2024-06-01	Disposición	Metal	940.1	f	Completado	40	4.18	22.44	2.9	0.3	977
112	56	2024-06-23	Disposición	Plástico	1092.71	f	Completado	34	28.49	6.16	0.8	0.3	961
113	57	2024-06-28	Recolección	Plástico	1033.18	t	Cancelado	42	30.55	24.17	1.0	0.3	990
114	57	2024-06-21	Recolección	Metal	1444.33	f	Cancelado	50	8.9	5.43	3.3	0.8	1274
115	58	2024-05-07	Recolección	Orgánico	712.03	t	Pendiente	56	30.53	20.51	2.8	1.0	1214
116	58	2024-05-04	Disposición	Plástico	555.53	f	Pendiente	55	37.0	11.47	2.6	0.6	998
117	59	2024-05-25	Disposición	Metal	620.8	f	Pendiente	58	36.09	1.33	0.7	0.6	1267
118	59	2024-06-02	Disposición	Plástico	1025.9	f	Completado	58	32.35	11.92	0.6	0.1	1294
119	60	2024-05-11	Recolección	Plástico	559.2	f	Cancelado	54	20.29	11.17	0.5	0.1	1484
120	60	2024-05-20	Disposición	Orgánico	1187.6	t	Pendiente	52	26.3	20.95	0.8	0.2	957
121	61	2024-06-14	Disposición	Plástico	1160.83	f	Pendiente	32	35.84	7.36	1.8	0.9	1440
122	61	2024-06-05	Recolección	Vidrio	885.29	f	Completado	54	34.72	7.59	3.6	0.2	996
123	62	2024-06-03	Recolección	Orgánico	1115.42	f	Pendiente	58	34.41	8.39	2.9	0.5	1427
124	62	2024-05-28	Disposición	Plástico	1127.58	t	Completado	56	34.78	21.33	3.5	0.3	1256
125	63	2024-05-20	Disposición	Orgánico	999.53	t	Pendiente	49	38.17	22.79	1.6	0.0	1394
126	63	2024-06-14	Recolección	Orgánico	1068.8	t	Completado	30	38.11	15.94	2.1	0.4	1220
127	64	2024-05-24	Disposición	Plástico	1327.96	t	Cancelado	54	39.99	18.99	2.3	0.9	1243
128	64	2024-06-18	Recolección	Vidrio	853.69	t	Pendiente	44	35.08	4.76	0.7	0.8	1249
129	65	2024-05-26	Recolección	Metal	673.67	f	Completado	43	16.91	1.98	1.2	0.4	1084
130	65	2024-06-14	Disposición	Vidrio	860.83	t	Pendiente	31	37.04	6.57	3.3	0.9	1184
131	66	2024-06-12	Recolección	Metal	1324.26	t	Completado	47	23.35	23.64	3.9	0.4	1443
132	66	2024-05-24	Disposición	Vidrio	1130.72	f	Completado	33	18.17	7.3	1.9	0.8	868
133	67	2024-06-12	Disposición	Metal	1179.38	f	Completado	37	15.64	6.22	2.7	0.2	965
134	67	2024-05-08	Disposición	Vidrio	1119.28	f	Cancelado	57	29.52	0.5	0.8	0.8	1406
135	68	2024-06-20	Recolección	Orgánico	1312.3	t	Cancelado	42	8.56	5.24	0.9	0.3	1303
136	68	2024-05-24	Recolección	Metal	892.32	f	Cancelado	56	38.31	21.27	0.5	0.7	1141
137	69	2024-06-15	Disposición	Vidrio	813.38	f	Cancelado	31	2.99	0.03	0.9	0.2	1240
138	69	2024-06-10	Disposición	Metal	770.26	f	Pendiente	49	14.53	15.64	3.5	0.2	1430
139	70	2024-05-21	Disposición	Orgánico	560.66	t	Cancelado	50	15.63	23.35	1.9	0.4	1152
140	70	2024-06-26	Recolección	Plástico	831.44	f	Completado	46	16.46	21.13	1.0	0.4	1590
141	71	2024-05-21	Recolección	Metal	906.11	t	Pendiente	60	9.77	15.31	3.0	0.2	1039
142	71	2024-05-28	Disposición	Plástico	1338.06	f	Completado	50	17.96	6.94	0.7	0.3	1170
143	72	2024-05-13	Disposición	Orgánico	1463.66	f	Completado	44	13.93	20.28	2.8	0.2	1591
144	72	2024-06-08	Recolección	Vidrio	1486.66	f	Cancelado	45	28.95	16.77	0.8	0.8	1232
145	73	2024-05-18	Disposición	Orgánico	990.62	t	Completado	49	31.74	10.44	1.4	0.1	1182
146	73	2024-05-19	Disposición	Metal	501.05	t	Cancelado	41	18.4	24.02	3.9	0.2	852
147	74	2024-05-19	Disposición	Vidrio	1488.4	t	Cancelado	31	29.38	9.0	2.8	0.2	806
148	74	2024-05-02	Disposición	Plástico	1460.4	f	Completado	41	10.29	4.69	3.4	0.2	1589
149	75	2024-06-14	Disposición	Metal	1489.07	f	Completado	33	7.04	8.99	3.6	0.8	1435
150	75	2024-05-13	Recolección	Plástico	1477.91	f	Completado	50	5.7	7.59	1.9	0.8	969
151	76	2024-06-04	Disposición	Orgánico	917.43	t	Pendiente	45	1.4	16.04	2.7	0.5	1457
152	76	2024-06-21	Recolección	Vidrio	798.44	f	Cancelado	36	27.2	3.0	1.2	1.0	974
153	77	2024-05-20	Recolección	Vidrio	734.16	f	Pendiente	31	20.9	14.22	3.1	0.4	1178
154	77	2024-06-28	Recolección	Plástico	1079.25	f	Cancelado	30	27.91	13.19	3.6	0.1	844
155	78	2024-06-07	Recolección	Orgánico	599.59	f	Pendiente	35	13.36	24.93	3.3	0.1	1210
156	78	2024-05-06	Disposición	Metal	1367.85	f	Pendiente	34	25.11	11.13	1.1	0.3	1008
157	79	2024-06-02	Disposición	Vidrio	892.47	f	Completado	40	6.61	20.74	1.5	1.0	1459
158	79	2024-06-09	Disposición	Vidrio	1483.83	f	Cancelado	31	26.55	7.6	2.6	0.8	1316
159	80	2024-05-26	Disposición	Plástico	701.17	t	Cancelado	39	6.68	16.47	1.8	0.7	1353
160	80	2024-05-23	Recolección	Plástico	742.54	t	Completado	33	32.3	21.48	1.7	0.3	1117
161	81	2024-06-07	Recolección	Vidrio	826.24	f	Pendiente	39	12.65	11.46	1.0	0.9	1002
162	81	2024-06-18	Disposición	Vidrio	1077.13	f	Cancelado	44	24.62	2.2	2.2	0.1	1264
163	82	2024-06-13	Recolección	Metal	1473.12	t	Cancelado	40	32.26	23.7	1.7	0.1	1544
164	82	2024-06-09	Disposición	Metal	1160.53	t	Cancelado	59	32.51	24.48	2.0	0.6	892
165	83	2024-05-02	Disposición	Metal	1150.67	t	Cancelado	41	16.05	22.77	2.6	0.2	1570
166	83	2024-05-15	Recolección	Plástico	1161.85	f	Pendiente	41	23.81	21.08	2.3	0.6	970
167	84	2024-06-24	Recolección	Vidrio	1494.7	t	Cancelado	53	31.16	21.12	3.0	0.4	1486
168	84	2024-05-16	Disposición	Metal	539.13	f	Completado	60	38.47	0.12	2.0	0.6	1336
169	85	2024-05-23	Recolección	Vidrio	651.5	f	Completado	59	22.49	1.79	0.7	0.9	1294
170	85	2024-05-28	Disposición	Orgánico	1333.41	f	Cancelado	37	2.68	8.16	4.0	0.6	852
171	86	2024-05-25	Disposición	Orgánico	1333.74	f	Completado	44	7.21	15.24	1.4	0.1	1108
172	86	2024-06-27	Disposición	Plástico	1343.4	f	Completado	43	26.79	9.2	0.6	0.2	1476
173	87	2024-05-11	Recolección	Vidrio	1337.93	t	Completado	51	21.17	6.75	2.0	0.5	832
174	87	2024-05-12	Recolección	Vidrio	755.38	t	Pendiente	33	30.72	6.95	2.5	0.1	1415
175	88	2024-05-03	Disposición	Plástico	520.5	f	Cancelado	43	21.12	18.74	3.3	1.0	906
176	88	2024-06-12	Disposición	Vidrio	936.21	f	Completado	42	15.07	3.36	1.5	0.9	1552
177	89	2024-06-27	Disposición	Vidrio	680.16	t	Pendiente	54	18.72	10.78	0.5	0.4	1013
178	89	2024-06-08	Disposición	Metal	1367.31	f	Pendiente	34	18.0	8.53	0.9	0.7	1426
179	90	2024-06-24	Disposición	Orgánico	1109.52	t	Completado	56	39.18	1.68	2.4	0.8	861
180	90	2024-05-15	Recolección	Vidrio	816.98	t	Cancelado	34	36.17	13.23	1.1	0.5	984
181	91	2024-06-11	Recolección	Metal	599.84	t	Completado	32	1.72	5.58	0.9	0.0	1337
182	91	2024-05-11	Disposición	Orgánico	713.16	f	Pendiente	56	16.1	4.19	3.6	0.1	1197
183	92	2024-05-20	Disposición	Vidrio	1233.78	t	Completado	51	7.64	14.58	3.2	0.2	1354
184	92	2024-05-21	Recolección	Metal	1034.32	t	Pendiente	60	8.86	21.74	1.5	0.3	1037
185	93	2024-05-27	Disposición	Metal	541.37	f	Completado	33	36.36	6.28	2.3	0.7	1303
186	93	2024-05-12	Recolección	Orgánico	1468.33	t	Completado	59	14.79	0.77	2.6	0.7	1492
187	94	2024-06-21	Recolección	Vidrio	1343.31	f	Completado	60	30.02	3.61	1.0	0.8	1460
188	94	2024-05-07	Disposición	Metal	1458.53	t	Completado	35	2.32	0.21	4.0	0.8	926
189	95	2024-05-28	Disposición	Plástico	596.82	t	Pendiente	30	19.09	6.38	1.6	0.9	913
190	95	2024-05-22	Disposición	Orgánico	728.86	f	Cancelado	42	23.01	21.22	0.6	0.8	811
191	96	2024-05-27	Recolección	Orgánico	1116.15	t	Completado	30	38.98	13.87	3.1	0.6	1107
192	96	2024-05-18	Disposición	Vidrio	1197.18	t	Completado	47	7.53	18.8	0.7	0.7	1039
193	97	2024-06-11	Recolección	Metal	928.28	t	Cancelado	34	8.27	12.06	1.6	0.5	1447
194	97	2024-05-25	Disposición	Plástico	632.33	f	Pendiente	60	6.89	6.84	2.8	0.7	1429
195	98	2024-06-04	Recolección	Metal	989.36	f	Cancelado	58	38.46	14.63	2.4	0.8	1182
196	98	2024-06-09	Disposición	Vidrio	1141.91	f	Pendiente	33	27.48	1.99	1.9	0.7	843
197	99	2024-05-03	Recolección	Orgánico	770.74	f	Pendiente	37	33.66	7.6	3.8	0.7	857
198	99	2024-06-18	Recolección	Vidrio	650.52	t	Cancelado	41	28.03	9.32	0.8	1.0	1258
199	100	2024-06-12	Disposición	Metal	893.35	t	Completado	46	15.06	19.54	3.9	0.1	1477
200	100	2024-05-03	Disposición	Plástico	1407.8	t	Cancelado	36	15.76	4.68	1.8	0.3	915
\.


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 215
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 100, true);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 217
-- Name: servicios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicios_id_seq', 1, false);


--
-- TOC entry 3473 (class 2606 OID 16422)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3475 (class 2606 OID 16431)
-- Name: servicios servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT servicios_pkey PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 16432)
-- Name: servicios fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicios
    ADD CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE SET NULL;


-- Completed on 2025-07-15 19:28:22 CST

--
-- PostgreSQL database dump complete
--

