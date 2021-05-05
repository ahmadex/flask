--
-- PostgreSQL databases dump
--

-- Dumped from database version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.15 (Ubuntu 10.15-0ubuntu0.18.04.1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: ahmadex
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO ahmadex;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: ahmadex
--

CREATE TABLE public.comment (
    id integer NOT NULL,
    body text NOT NULL,
    created timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.comment OWNER TO ahmadex;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: ahmadex
--

CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO ahmadex;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ahmadex
--

ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;


--
-- Name: post; Type: TABLE; Schema: public; Owner: ahmadex
--

CREATE TABLE public.post (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    body text NOT NULL,
    created timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    updated timestamp without time zone
);


ALTER TABLE public.post OWNER TO ahmadex;

--
-- Name: post_id_seq; Type: SEQUENCE; Schema: public; Owner: ahmadex
--

CREATE SEQUENCE public.post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_id_seq OWNER TO ahmadex;

--
-- Name: post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ahmadex
--

ALTER SEQUENCE public.post_id_seq OWNED BY public.post.id;


--
-- Name: post_like; Type: TABLE; Schema: public; Owner: ahmadex
--

CREATE TABLE public.post_like (
    id integer NOT NULL,
    user_id integer NOT NULL,
    post_id integer NOT NULL
);


ALTER TABLE public.post_like OWNER TO ahmadex;

--
-- Name: post_like_id_seq; Type: SEQUENCE; Schema: public; Owner: ahmadex
--

CREATE SEQUENCE public.post_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_like_id_seq OWNER TO ahmadex;

--
-- Name: post_like_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ahmadex
--

ALTER SEQUENCE public.post_like_id_seq OWNED BY public.post_like.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: ahmadex
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(20) NOT NULL,
    email character varying(120) NOT NULL,
    password character varying(60) NOT NULL,
    image_file character varying(60) NOT NULL
);


ALTER TABLE public."user" OWNER TO ahmadex;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: ahmadex
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO ahmadex;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ahmadex
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: comment id; Type: DEFAULT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);


--
-- Name: post id; Type: DEFAULT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post ALTER COLUMN id SET DEFAULT nextval('public.post_id_seq'::regclass);


--
-- Name: post_like id; Type: DEFAULT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post_like ALTER COLUMN id SET DEFAULT nextval('public.post_like_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: ahmadex
--

COPY public.alembic_version (version_num) FROM stdin;
d450c30111fd
\.


--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: ahmadex
--

COPY public.comment (id, body, created, user_id, post_id) FROM stdin;
1	abcdefghikjl,onp	2021-04-28 17:52:23.352526	2	4
2	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s 	2021-04-28 18:23:33.126923	1	4
3	Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.	2021-04-28 18:32:29.216149	3	4
4	Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.	2021-04-28 18:33:05.324273	3	3
5	Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.	2021-04-28 18:33:15.414971	3	2
6	Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.	2021-04-28 18:33:25.592166	3	1
7	the last kinf=gdone	2021-04-29 05:34:02.505001	1	4
8	Lorem Ipsum. Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', 	2021-04-29 07:28:59.791718	1	4
9	of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. 	2021-04-29 07:58:04.378771	1	2
\.


--
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: ahmadex
--

COPY public.post (id, title, body, created, user_id, updated) FROM stdin;
1	Harry Potter	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).	2021-04-28 17:41:23.96797	1	\N
3	Cosmose	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).	2021-04-28 17:42:36.6765	2	\N
4	marry	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).	2021-04-28 17:42:49.807462	2	\N
5	Monkey King	Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.	2021-04-28 18:34:37.777112	3	\N
6	DeadKing	There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.	2021-04-28 18:35:42.711415	3	\N
7	Last Kingdome	orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).	2021-04-28 18:36:41.80514	3	\N
2	The Life of Father, son	Lorem Ipsum is simply dummy text f the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).	2021-04-28 17:41:57.037571	1	2021-04-30 13:22:41.858791
\.


--
-- Data for Name: post_like; Type: TABLE DATA; Schema: public; Owner: ahmadex
--

COPY public.post_like (id, user_id, post_id) FROM stdin;
5	1	1
10	1	6
12	1	4
14	1	7
16	2	6
19	3	6
20	3	7
21	3	4
22	1	3
23	4	7
28	1	2
29	1	5
33	2	2
35	2	5
38	5	6
39	5	4
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: ahmadex
--

COPY public."user" (id, username, email, password, image_file) FROM stdin;
1	assu	abc@132gamil.com	$2b$12$J83XEKYNg/uQZj9ikG1e4eRpSlbva/pvYKSoZwpa7QaChT6o9lAKS	default.jpeg
2	hasan1	abbasshaikh510@gmail.com	$2b$12$r0jXvfDAZagMy10LJqTscezYo/EUoiPOjwKU.NmVTFxHtpvShVNrq	424300774b678481.jpeg
3	ahmad	ansariahmad401@yahoo.com	$2b$12$kTtMQgl0oEs5iVxcCaHNce/b3gu1hS41kZQYdY5Pblg8e/YcdinBy	c09bf09e271d265c.jpeg
4	hasan145	abbasshaikh5100@gmail.com	$2b$12$DkIaOwh1AwstkCG5lgjSsOUzA32J/ymiKJQqizQ9P0701ifuSCCg2	default.jpeg
5	sammy	abbasshikh5100@gmail.com	$2b$12$cN2QHYjue7.NWdGJMefcP.Hxi/olCrQGOPfqjR4ZSAyQ.n8hsK8Gu	default.jpeg
\.


--
-- Name: comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ahmadex
--

SELECT pg_catalog.setval('public.comment_id_seq', 9, true);


--
-- Name: post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ahmadex
--

SELECT pg_catalog.setval('public.post_id_seq', 8, true);


--
-- Name: post_like_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ahmadex
--

SELECT pg_catalog.setval('public.post_like_id_seq', 39, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ahmadex
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: post_like post_like_pkey; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post_like
    ADD CONSTRAINT post_like_pkey PRIMARY KEY (id);


--
-- Name: post post_pkey; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_pkey PRIMARY KEY (id);


--
-- Name: post post_title_key; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_title_key UNIQUE (title);


--
-- Name: user user_email_key; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user user_username_key; Type: CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_username_key UNIQUE (username);


--
-- Name: comment comment_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);


--
-- Name: comment comment_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: post_like post_like_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post_like
    ADD CONSTRAINT post_like_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.post(id);


--
-- Name: post_like post_like_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post_like
    ADD CONSTRAINT post_like_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: post post_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ahmadex
--

ALTER TABLE ONLY public.post
    ADD CONSTRAINT post_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

