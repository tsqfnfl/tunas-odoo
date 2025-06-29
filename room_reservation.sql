--
-- PostgreSQL database dump
--

-- Dumped from database version 13.21 (Debian 13.21-1.pgdg120+1)
-- Dumped by pg_dump version 13.21 (Debian 13.21-1.pgdg120+1)

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
-- Name: room_reservation; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.room_reservation (
    id integer NOT NULL,
    number character varying NOT NULL,
    room_id integer NOT NULL,
    name character varying NOT NULL,
    date date NOT NULL,
    state character varying,
    notes text,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);


ALTER TABLE public.room_reservation OWNER TO odoo;

--
-- Name: TABLE room_reservation; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON TABLE public.room_reservation IS 'Room Reservation (Pemesanan Ruangan)';


--
-- Name: COLUMN room_reservation.number; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.number IS 'Nomor Pemesanan';


--
-- Name: COLUMN room_reservation.room_id; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.room_id IS 'Ruangan';


--
-- Name: COLUMN room_reservation.name; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.name IS 'Nama Pemesanan';


--
-- Name: COLUMN room_reservation.date; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.date IS 'Tanggal Pemesanan';


--
-- Name: COLUMN room_reservation.state; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.state IS 'Status Pemesanan';


--
-- Name: COLUMN room_reservation.notes; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.notes IS 'Catatan Pemesanan';


--
-- Name: COLUMN room_reservation.create_uid; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.create_uid IS 'Created by';


--
-- Name: COLUMN room_reservation.create_date; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.create_date IS 'Created on';


--
-- Name: COLUMN room_reservation.write_uid; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.write_uid IS 'Last Updated by';


--
-- Name: COLUMN room_reservation.write_date; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_reservation.write_date IS 'Last Updated on';


--
-- Name: room_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.room_reservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_reservation_id_seq OWNER TO odoo;

--
-- Name: room_reservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.room_reservation_id_seq OWNED BY public.room_reservation.id;


--
-- Name: room_room; Type: TABLE; Schema: public; Owner: odoo
--

CREATE TABLE public.room_room (
    id integer NOT NULL,
    name character varying NOT NULL,
    room_type character varying NOT NULL,
    location character varying NOT NULL,
    photo_name character varying,
    capacity integer NOT NULL,
    notes text,
    create_uid integer,
    create_date timestamp without time zone,
    write_uid integer,
    write_date timestamp without time zone
);


ALTER TABLE public.room_room OWNER TO odoo;

--
-- Name: TABLE room_room; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON TABLE public.room_room IS 'Room Master (Master Ruangan)';


--
-- Name: COLUMN room_room.name; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.name IS 'Nama Ruangan';


--
-- Name: COLUMN room_room.room_type; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.room_type IS 'Tipe Ruangan';


--
-- Name: COLUMN room_room.location; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.location IS 'Lokasi Ruangan';


--
-- Name: COLUMN room_room.photo_name; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.photo_name IS 'Photo Name';


--
-- Name: COLUMN room_room.capacity; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.capacity IS 'Kapasitas Ruangan';


--
-- Name: COLUMN room_room.notes; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.notes IS 'Keterangan';


--
-- Name: COLUMN room_room.create_uid; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.create_uid IS 'Created by';


--
-- Name: COLUMN room_room.create_date; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.create_date IS 'Created on';


--
-- Name: COLUMN room_room.write_uid; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.write_uid IS 'Last Updated by';


--
-- Name: COLUMN room_room.write_date; Type: COMMENT; Schema: public; Owner: odoo
--

COMMENT ON COLUMN public.room_room.write_date IS 'Last Updated on';


--
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_room_id_seq OWNER TO odoo;

--
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: odoo
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room_room.id;


--
-- Name: room_reservation id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_reservation ALTER COLUMN id SET DEFAULT nextval('public.room_reservation_id_seq'::regclass);


--
-- Name: room_room id; Type: DEFAULT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_room ALTER COLUMN id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- Name: room_reservation room_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_reservation
    ADD CONSTRAINT room_reservation_pkey PRIMARY KEY (id);


--
-- Name: room_room room_room_pkey; Type: CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_room
    ADD CONSTRAINT room_room_pkey PRIMARY KEY (id);


--
-- Name: room_reservation room_reservation_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_reservation
    ADD CONSTRAINT room_reservation_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: room_reservation room_reservation_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_reservation
    ADD CONSTRAINT room_reservation_room_id_fkey FOREIGN KEY (room_id) REFERENCES public.room_room(id) ON DELETE RESTRICT;


--
-- Name: room_reservation room_reservation_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_reservation
    ADD CONSTRAINT room_reservation_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: room_room room_room_create_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_room
    ADD CONSTRAINT room_room_create_uid_fkey FOREIGN KEY (create_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- Name: room_room room_room_write_uid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: odoo
--

ALTER TABLE ONLY public.room_room
    ADD CONSTRAINT room_room_write_uid_fkey FOREIGN KEY (write_uid) REFERENCES public.res_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

