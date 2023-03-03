--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14
-- Dumped by pg_dump version 12.14

-- Started on 2023-03-02 21:30:05

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
-- TOC entry 202 (class 1259 OID 25098)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_no character varying(4) NOT NULL,
    dept_name character varying(24) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 25143)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_no integer NOT NULL,
    dept_no character varying(4) NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 25158)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_no character varying(4) NOT NULL,
    emp_no integer NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 25108)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title_id character varying(5) NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    sex character varying(1),
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 25118)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_no integer NOT NULL,
    salary integer NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 25103)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    title_id character varying(5) NOT NULL,
    title character varying(32) NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 2706 (class 2606 OID 25102)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);


--
-- TOC entry 2714 (class 2606 OID 25147)
-- Name: dept_emp dept_emp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 2716 (class 2606 OID 25162)
-- Name: dept_manager dept_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (emp_no, dept_no);


--
-- TOC entry 2710 (class 2606 OID 25112)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 2712 (class 2606 OID 25122)
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_no);


--
-- TOC entry 2708 (class 2606 OID 25107)
-- Name: titles titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);


--
-- TOC entry 2720 (class 2606 OID 25153)
-- Name: dept_emp dept_emp_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 2719 (class 2606 OID 25148)
-- Name: dept_emp dept_emp_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 2721 (class 2606 OID 25163)
-- Name: dept_manager dept_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no);


--
-- TOC entry 2722 (class 2606 OID 25168)
-- Name: dept_manager dept_manager_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


--
-- TOC entry 2717 (class 2606 OID 25113)
-- Name: employees employees_emp_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES public.titles(title_id);


--
-- TOC entry 2718 (class 2606 OID 25123)
-- Name: salaries salaries_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);


-- Completed on 2023-03-02 21:30:05

--
-- PostgreSQL database dump complete
--

