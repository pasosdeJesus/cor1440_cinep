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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: es_co_utf_8; Type: COLLATION; Schema: public; Owner: -
--

CREATE COLLATION es_co_utf_8 (lc_collate = 'es_CO.UTF-8', lc_ctype = 'es_CO.UTF-8');


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: soundexesp(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION soundexesp(input text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE STRICT COST 500
    AS $$
DECLARE
	soundex text='';	
	-- para determinar la primera letra
	pri_letra text;
	resto text;
	sustituida text ='';
	-- para quitar adyacentes
	anterior text;
	actual text;
	corregido text;
BEGIN
       -- devolver null si recibi un string en blanco o con espacios en blanco
	IF length(trim(input))= 0 then
		RETURN NULL;
	end IF;
 
 
	-- 1: LIMPIEZA:
		-- pasar a mayuscula, eliminar la letra "H" inicial, los acentos y la enie
		-- 'holá coñó' => 'OLA CONO'
		input=translate(ltrim(trim(upper(input)),'H'),'ÑÁÉÍÓÚÀÈÌÒÙÜ','NAEIOUAEIOUU');
 
		-- eliminar caracteres no alfabéticos (números, símbolos como &,%,",*,!,+, etc.
		input=regexp_replace(input, '[^a-zA-Z]', '', 'g');
 
	-- 2: PRIMERA LETRA ES IMPORTANTE, DEBO ASOCIAR LAS SIMILARES
	--  'vaca' se convierte en 'baca'  y 'zapote' se convierte en 'sapote'
	-- un fenomeno importante es GE y GI se vuelven JE y JI; CA se vuelve KA, etc
	pri_letra =substr(input,1,1);
	resto =substr(input,2);
	CASE 
		when pri_letra IN ('V') then
			sustituida='B';
		when pri_letra IN ('Z','X') then
			sustituida='S';
		when pri_letra IN ('G') AND substr(input,2,1) IN ('E','I') then
			sustituida='J';
		when pri_letra IN('C') AND substr(input,2,1) NOT IN ('H','E','I') then
			sustituida='K';
		else
			sustituida=pri_letra;
 
	end case;
	--corregir el parametro con las consonantes sustituidas:
	input=sustituida || resto;		
 
	-- 3: corregir "letras compuestas" y volverlas una sola
	input=REPLACE(input,'CH','V');
	input=REPLACE(input,'QU','K');
	input=REPLACE(input,'LL','J');
	input=REPLACE(input,'CE','S');
	input=REPLACE(input,'CI','S');
	input=REPLACE(input,'YA','J');
	input=REPLACE(input,'YE','J');
	input=REPLACE(input,'YI','J');
	input=REPLACE(input,'YO','J');
	input=REPLACE(input,'YU','J');
	input=REPLACE(input,'GE','J');
	input=REPLACE(input,'GI','J');
	input=REPLACE(input,'NY','N');
	-- para debug:    --return input;
 
	-- EMPIEZA EL CALCULO DEL SOUNDEX
	-- 4: OBTENER PRIMERA letra
	pri_letra=substr(input,1,1);
 
	-- 5: retener el resto del string
	resto=substr(input,2);
 
	--6: en el resto del string, quitar vocales y vocales fonéticas
	resto=translate(resto,'@AEIOUHWY','@');
 
	--7: convertir las letras foneticamente equivalentes a numeros  (esto hace que B sea equivalente a V, C con S y Z, etc.)
	resto=translate(resto, 'BPFVCGKSXZDTLMNRQJ', '111122222233455677');
	-- así va quedando la cosa
	soundex=pri_letra || resto;
 
	--8: eliminar números iguales adyacentes (A11233 se vuelve A123)
	anterior=substr(soundex,1,1);
	corregido=anterior;
 
	FOR i IN 2 .. length(soundex) LOOP
		actual = substr(soundex, i, 1);
		IF actual <> anterior THEN
			corregido=corregido || actual;
			anterior=actual;			
		END IF;
	END LOOP;
	-- así va la cosa
	soundex=corregido;
 
	-- 9: siempre retornar un string de 4 posiciones
	soundex=rpad(soundex,4,'0');
	soundex=substr(soundex,1,4);		
 
	-- YA ESTUVO
	RETURN soundex;	
END;	
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actividad_actor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actividad_actor (
    actividad_id integer NOT NULL,
    actor_id integer NOT NULL
);


--
-- Name: actividadoficio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actividadoficio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE acto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: actor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE actor (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    sectoractor_id integer,
    personacontacto character varying(100),
    cargo character varying(100),
    correo character varying(100),
    telefono character varying(100),
    fax character varying(100),
    celular character varying(100),
    direccion character varying(200),
    ciudad character varying(100),
    pais_id integer,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: actor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE actor_id_seq OWNED BY actor.id;


--
-- Name: anexo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE anexo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: antecedente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE antecedente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: caso_etiqueta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE caso_etiqueta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: caso_presponsable_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE caso_presponsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: caso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE caso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contexto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contexto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividad (
    id integer NOT NULL,
    minutos integer,
    nombre character varying(500),
    objetivo character varying(5000),
    resultado character varying(5000),
    fecha date,
    observaciones character varying(5000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    oficina_id integer NOT NULL,
    rangoedadac_id integer,
    desarrollo character varying(5000),
    papel character varying(5000),
    participantes character varying(5000),
    totorg integer,
    blancos integer,
    mestizos integer,
    indigenas integer,
    negros integer,
    hombres integer,
    mujeres integer,
    tipo character varying(500),
    convocante character varying(500),
    lugar character varying(500),
    valora integer,
    usuario_id integer
);


--
-- Name: cor1440_gen_actividad_actividadtipo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividad_actividadtipo (
    actividadtipo_id integer,
    actividad_id integer
);


--
-- Name: cor1440_gen_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividad_id_seq OWNED BY cor1440_gen_actividad.id;


--
-- Name: cor1440_gen_actividad_proyecto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividad_proyecto (
    id integer NOT NULL,
    actividad_id integer,
    proyecto_id integer
);


--
-- Name: cor1440_gen_actividad_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividad_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividad_proyecto_id_seq OWNED BY cor1440_gen_actividad_proyecto.id;


--
-- Name: cor1440_gen_actividad_rangoedadac; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividad_rangoedadac (
    id integer NOT NULL,
    actividad_id integer,
    rangoedadac_id integer,
    ml integer,
    mr integer,
    fl integer,
    fr integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cor1440_gen_actividad_rangoedadac_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividad_rangoedadac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_rangoedadac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividad_rangoedadac_id_seq OWNED BY cor1440_gen_actividad_rangoedadac.id;


--
-- Name: cor1440_gen_actividad_sip_anexo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividad_sip_anexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_sip_anexo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividad_sip_anexo (
    actividad_id integer NOT NULL,
    anexo_id integer NOT NULL,
    id integer DEFAULT nextval('cor1440_gen_actividad_sip_anexo_id_seq'::regclass) NOT NULL
);


--
-- Name: cor1440_gen_actividad_usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividad_usuario (
    actividad_id integer NOT NULL,
    usuario_id integer NOT NULL
);


--
-- Name: cor1440_gen_actividadarea; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividadarea (
    id integer NOT NULL,
    nombre character varying(500),
    observaciones character varying(5000),
    fechacreacion date DEFAULT ('now'::text)::date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cor1440_gen_actividadarea_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividadarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividadarea_id_seq OWNED BY cor1440_gen_actividadarea.id;


--
-- Name: cor1440_gen_actividadareas_actividad; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividadareas_actividad (
    id integer NOT NULL,
    actividad_id integer,
    actividadarea_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cor1440_gen_actividadareas_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividadareas_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadareas_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividadareas_actividad_id_seq OWNED BY cor1440_gen_actividadareas_actividad.id;


--
-- Name: cor1440_gen_actividadtipo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_actividadtipo (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cor1440_gen_actividadtipo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividadtipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadtipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividadtipo_id_seq OWNED BY cor1440_gen_actividadtipo.id;


--
-- Name: cor1440_gen_financiador; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_financiador (
    id integer NOT NULL,
    nombre character varying(1000),
    observaciones character varying(5000),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cor1440_gen_financiador_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_financiador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_financiador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_financiador_id_seq OWNED BY cor1440_gen_financiador.id;


--
-- Name: cor1440_gen_proyecto; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_proyecto (
    id integer NOT NULL,
    nombre character varying(1000),
    observaciones character varying(5000),
    fechainicio date,
    fechacierre date,
    resultados character varying(5000),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cor1440_gen_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_proyecto_id_seq OWNED BY cor1440_gen_proyecto.id;


--
-- Name: cor1440_gen_proyecto_proyectofinanciero; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_proyecto_proyectofinanciero (
    proyecto_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


--
-- Name: cor1440_gen_proyectofinanciero; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_proyectofinanciero (
    id integer NOT NULL,
    nombre character varying(1000),
    financiador_id integer,
    observaciones character varying(5000),
    fechainicio date,
    fechacierre date,
    responsable_id integer,
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    compromisos character varying(5000),
    monto integer
);


--
-- Name: cor1440_gen_proyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_proyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_proyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_proyectofinanciero_id_seq OWNED BY cor1440_gen_proyectofinanciero.id;


--
-- Name: cor1440_gen_rangoedadac; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE cor1440_gen_rangoedadac (
    id integer NOT NULL,
    nombre character varying(255),
    limiteinferior integer,
    limitesuperior integer,
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000)
);


--
-- Name: cor1440_gen_rangoedadac_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_rangoedadac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_rangoedadac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_rangoedadac_id_seq OWNED BY cor1440_gen_rangoedadac.id;


--
-- Name: escolaridad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE escolaridad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estadocivil_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estadocivil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: etnia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE etnia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ffrecuente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ffrecuente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: filiacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE filiacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fotra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fotra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: frontera_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE frontera_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grupoper_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grupoper_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: iglesia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE iglesia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: instanciader_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE instanciader_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intervalo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE intervalo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: maternidad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE maternidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pconsolidado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pconsolidado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: personadesea_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE personadesea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: presponsable_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE presponsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profesion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profesion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rangoedad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rangoedad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regimensalud_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE regimensalud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: region_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sectoractor; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sectoractor (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    enplantrienal boolean,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sectoractor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sectoractor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectoractor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sectoractor_id_seq OWNED BY sectoractor.id;


--
-- Name: sectorsocial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sectorsocial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_anexo; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_anexo (
    id integer NOT NULL,
    descripcion character varying(1500),
    adjunto_file_name character varying(255),
    adjunto_content_type character varying(255),
    adjunto_file_size integer,
    adjunto_updated_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sip_anexo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_anexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_anexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sip_anexo_id_seq OWNED BY sip_anexo.id;


--
-- Name: sip_clase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_clase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_clase; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_clase (
    id_clalocal integer,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    id_tclase character varying(10) DEFAULT 'CP'::character varying NOT NULL,
    latitud double precision,
    longitud double precision,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_municipio integer,
    id integer DEFAULT nextval('sip_clase_id_seq'::regclass) NOT NULL,
    observaciones character varying(5000),
    CONSTRAINT clase_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_departamento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_departamento (
    id_deplocal integer,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    latitud double precision,
    longitud double precision,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_pais integer NOT NULL,
    id integer DEFAULT nextval('sip_departamento_id_seq'::regclass) NOT NULL,
    observaciones character varying(5000),
    CONSTRAINT departamento_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_etiqueta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_etiqueta; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_etiqueta (
    id integer DEFAULT nextval('sip_etiqueta_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    observaciones character varying(500),
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT etiqueta_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_fuenteprensa; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_fuenteprensa (
    id integer NOT NULL,
    nombre character varying(500),
    observaciones character varying(5000),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: sip_fuenteprensa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_fuenteprensa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_fuenteprensa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sip_fuenteprensa_id_seq OWNED BY sip_fuenteprensa.id;


--
-- Name: sip_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_municipio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_municipio (
    id_munlocal integer,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    latitud double precision,
    longitud double precision,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_departamento integer,
    id integer DEFAULT nextval('sip_municipio_id_seq'::regclass) NOT NULL,
    observaciones character varying(5000),
    CONSTRAINT municipio_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_oficina_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_oficina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_oficina; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_oficina (
    id integer DEFAULT nextval('sip_oficina_id_seq'::regclass) NOT NULL,
    nombre character varying(50) NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000),
    CONSTRAINT regionsjr_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_pais; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_pais (
    id integer NOT NULL,
    nombre character varying(200),
    nombreiso character varying(200),
    latitud double precision,
    longitud double precision,
    alfa2 character varying(2),
    alfa3 character varying(3),
    codiso integer,
    div1 character varying(100),
    div2 character varying(100),
    div3 character varying(100),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000)
);


--
-- Name: sip_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sip_pais_id_seq OWNED BY sip_pais.id;


--
-- Name: sip_persona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_persona; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_persona (
    id integer DEFAULT nextval('sip_persona_id_seq'::regclass) NOT NULL,
    nombres character varying(100) COLLATE public.es_co_utf_8 NOT NULL,
    apellidos character varying(100) COLLATE public.es_co_utf_8 NOT NULL,
    anionac integer,
    mesnac integer,
    dianac integer,
    sexo character(1) NOT NULL,
    numerodocumento character varying(100),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_pais integer,
    nacionalde integer,
    tdocumento_id integer,
    id_departamento integer,
    id_municipio integer,
    id_clase integer,
    CONSTRAINT persona_check CHECK (((dianac IS NULL) OR ((((dianac >= 1) AND ((((((((mesnac = 1) OR (mesnac = 3)) OR (mesnac = 5)) OR (mesnac = 7)) OR (mesnac = 8)) OR (mesnac = 10)) OR (mesnac = 12)) AND (dianac <= 31))) OR (((((mesnac = 4) OR (mesnac = 6)) OR (mesnac = 9)) OR (mesnac = 11)) AND (dianac <= 30))) OR ((mesnac = 2) AND (dianac <= 29))))),
    CONSTRAINT persona_mesnac_check CHECK (((mesnac IS NULL) OR ((mesnac >= 1) AND (mesnac <= 12)))),
    CONSTRAINT persona_sexo_check CHECK ((((sexo = 'S'::bpchar) OR (sexo = 'F'::bpchar)) OR (sexo = 'M'::bpchar)))
);


--
-- Name: sip_persona_trelacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_persona_trelacion (
    persona1 integer NOT NULL,
    persona2 integer NOT NULL,
    id_trelacion character(2) DEFAULT 'SI'::bpchar NOT NULL,
    observaciones character varying(200),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: sip_tclase; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_tclase (
    id character varying(10) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000),
    CONSTRAINT tclase_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_tdocumento; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_tdocumento (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    sigla character varying(100),
    formatoregex character varying(500),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000)
);


--
-- Name: sip_tdocumento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_tdocumento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_tdocumento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sip_tdocumento_id_seq OWNED BY sip_tdocumento.id;


--
-- Name: sip_trelacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_trelacion (
    id character(2) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    observaciones character varying(200),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    inverso character varying(2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT trelacion_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_tsitio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_tsitio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_tsitio; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_tsitio (
    id integer DEFAULT nextval('sip_tsitio_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000),
    CONSTRAINT tsitio_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_ubicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_ubicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_ubicacion; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sip_ubicacion (
    id integer DEFAULT nextval('sip_ubicacion_id_seq'::regclass) NOT NULL,
    lugar character varying(500) COLLATE public.es_co_utf_8,
    sitio character varying(500) COLLATE public.es_co_utf_8,
    id_tsitio integer DEFAULT 1 NOT NULL,
    id_caso integer NOT NULL,
    latitud double precision,
    longitud double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_pais integer,
    id_departamento integer,
    id_municipio integer,
    id_clase integer
);


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuario (
    nusuario character varying(15) NOT NULL,
    password character varying(64) DEFAULT ''::character varying NOT NULL,
    nombre character varying(50) COLLATE public.es_co_utf_8,
    descripcion character varying(50),
    rol integer DEFAULT 4,
    idioma character varying(6) DEFAULT 'es_CO'::character varying NOT NULL,
    id integer DEFAULT nextval('usuario_id_seq'::regclass) NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    sign_in_count integer DEFAULT 0 NOT NULL,
    failed_attempts integer,
    unlock_token character varying(64),
    locked_at timestamp without time zone,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    regionsjr_id integer,
    oficina_id integer,
    CONSTRAINT usuario_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion))),
    CONSTRAINT usuario_rol_check CHECK (((rol >= 1) AND (rol <= 6)))
);


--
-- Name: victima_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE victima_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vinculoestado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vinculoestado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor ALTER COLUMN id SET DEFAULT nextval('actor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividad_proyecto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_rangoedadac ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividad_rangoedadac_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadarea ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividadarea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadareas_actividad ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividadareas_actividad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadtipo ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividadtipo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_financiador ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_financiador_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyecto ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_proyecto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_proyectofinanciero_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_rangoedadac ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_rangoedadac_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectoractor ALTER COLUMN id SET DEFAULT nextval('sectoractor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_anexo ALTER COLUMN id SET DEFAULT nextval('sip_anexo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_fuenteprensa ALTER COLUMN id SET DEFAULT nextval('sip_fuenteprensa_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_pais ALTER COLUMN id SET DEFAULT nextval('sip_pais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tdocumento ALTER COLUMN id SET DEFAULT nextval('sip_tdocumento_id_seq'::regclass);


--
-- Name: actor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto
    ADD CONSTRAINT cor1440_gen_actividad_proyecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_sip_anexo_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT cor1440_gen_actividad_sip_anexo_id_key UNIQUE (id);


--
-- Name: cor1440_gen_actividad_sip_anexo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT cor1440_gen_actividad_sip_anexo_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadtipo_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_financiador_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_financiador
    ADD CONSTRAINT cor1440_gen_financiador_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_proyecto
    ADD CONSTRAINT cor1440_gen_proyecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT cor1440_gen_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_etiqueta
    ADD CONSTRAINT etiqueta_pkey PRIMARY KEY (id);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: persona_trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_pkey PRIMARY KEY (persona1, persona2, id_trelacion);


--
-- Name: regionsjr_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_oficina
    ADD CONSTRAINT regionsjr_pkey PRIMARY KEY (id);


--
-- Name: sectoractor_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sectoractor
    ADD CONSTRAINT sectoractor_pkey PRIMARY KEY (id);


--
-- Name: sip_clase_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_id_key UNIQUE (id);


--
-- Name: sip_clase_id_municipio_id_clalocal_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_id_municipio_id_clalocal_key UNIQUE (id_municipio, id_clalocal);


--
-- Name: sip_clase_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_pkey PRIMARY KEY (id);


--
-- Name: sip_departamento_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_key UNIQUE (id);


--
-- Name: sip_departamento_id_pais_id_deplocal_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_key UNIQUE (id_pais, id_deplocal);


--
-- Name: sip_departamento_id_pais_id_deplocal_key1; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_key1 UNIQUE (id_pais, id_deplocal);


--
-- Name: sip_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_pkey PRIMARY KEY (id);


--
-- Name: sip_fuenteprensa_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_fuenteprensa
    ADD CONSTRAINT sip_fuenteprensa_pkey PRIMARY KEY (id);


--
-- Name: sip_municipio_id_departamento_id_munlocal_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_id_departamento_id_munlocal_key UNIQUE (id_departamento, id_munlocal);


--
-- Name: sip_municipio_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_id_key UNIQUE (id);


--
-- Name: sip_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT sivel2_gen_actividad_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_actividad_rangoedadac_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividad_rangoedadac
    ADD CONSTRAINT sivel2_gen_actividad_rangoedadac_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_actividadarea_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividadarea
    ADD CONSTRAINT sivel2_gen_actividadarea_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_actividadareas_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_actividadareas_actividad
    ADD CONSTRAINT sivel2_gen_actividadareas_actividad_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_anexoactividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_anexo
    ADD CONSTRAINT sivel2_gen_anexoactividad_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_pais
    ADD CONSTRAINT sivel2_gen_pais_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_rangoedadac_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY cor1440_gen_rangoedadac
    ADD CONSTRAINT sivel2_gen_rangoedadac_pkey PRIMARY KEY (id);


--
-- Name: sivel2_gen_tdocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_tdocumento
    ADD CONSTRAINT sivel2_gen_tdocumento_pkey PRIMARY KEY (id);


--
-- Name: tclase_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_tclase
    ADD CONSTRAINT tclase_pkey PRIMARY KEY (id);


--
-- Name: trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_trelacion
    ADD CONSTRAINT trelacion_pkey PRIMARY KEY (id);


--
-- Name: tsitio_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_tsitio
    ADD CONSTRAINT tsitio_pkey PRIMARY KEY (id);


--
-- Name: ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: index_actor_on_pais_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_actor_on_pais_id ON actor USING btree (pais_id);


--
-- Name: index_actor_on_sectoractor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_actor_on_sectoractor_id ON actor USING btree (sectoractor_id);


--
-- Name: index_cor1440_gen_actividad_sip_anexo_on_anexo_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_cor1440_gen_actividad_sip_anexo_on_anexo_id ON cor1440_gen_actividad_sip_anexo USING btree (anexo_id);


--
-- Name: index_sivel2_gen_actividad_on_rangoedadac_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sivel2_gen_actividad_on_rangoedadac_id ON cor1440_gen_actividad USING btree (rangoedadac_id);


--
-- Name: index_sivel2_gen_actividad_on_usuario_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sivel2_gen_actividad_on_usuario_id ON cor1440_gen_actividad USING btree (usuario_id);


--
-- Name: index_sivel2_gen_actividad_rangoedadac_on_actividad_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sivel2_gen_actividad_rangoedadac_on_actividad_id ON cor1440_gen_actividad_rangoedadac USING btree (actividad_id);


--
-- Name: index_sivel2_gen_actividad_rangoedadac_on_rangoedadac_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sivel2_gen_actividad_rangoedadac_on_rangoedadac_id ON cor1440_gen_actividad_rangoedadac USING btree (rangoedadac_id);


--
-- Name: index_usuario_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_usuario_on_email ON usuario USING btree (email);


--
-- Name: index_usuario_on_regionsjr_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_usuario_on_regionsjr_id ON usuario USING btree (regionsjr_id);


--
-- Name: index_usuario_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_usuario_on_reset_password_token ON usuario USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: usuario_nusuario; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX usuario_nusuario ON usuario USING btree (nusuario);


--
-- Name: actividad_regionsjr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT actividad_regionsjr_id_fkey FOREIGN KEY (oficina_id) REFERENCES sip_oficina(id);


--
-- Name: clase_id_tclase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT clase_id_tclase_fkey FOREIGN KEY (id_tclase) REFERENCES sip_tclase(id);


--
-- Name: cor1440_gen_actividad_usuario_lf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT cor1440_gen_actividad_usuario_lf FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: cor1440_gen_actividadtipo_actividad_actividad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_actividad_actividad_id_fkey FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_actividadtipo_actividad_actividadtipo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_actividad_actividadtipo_id_fkey FOREIGN KEY (actividadtipo_id) REFERENCES cor1440_gen_actividadtipo(id);


--
-- Name: departamento_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT departamento_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: fk_rails_395faa0882; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto
    ADD CONSTRAINT fk_rails_395faa0882 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: fk_rails_49ec1ae361; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT fk_rails_49ec1ae361 FOREIGN KEY (anexo_id) REFERENCES sip_anexo(id);


--
-- Name: fk_rails_56bdc49b83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_actor
    ADD CONSTRAINT fk_rails_56bdc49b83 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: fk_rails_59462e2800; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT fk_rails_59462e2800 FOREIGN KEY (sectoractor_id) REFERENCES sectoractor(id);


--
-- Name: fk_rails_7ebb208867; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_actor
    ADD CONSTRAINT fk_rails_7ebb208867 FOREIGN KEY (actor_id) REFERENCES actor(id);


--
-- Name: fk_rails_cc9d44f9de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT fk_rails_cc9d44f9de FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: fk_rails_cf09fb308c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT fk_rails_cf09fb308c FOREIGN KEY (pais_id) REFERENCES sip_pais(id);


--
-- Name: fk_rails_cf5d592625; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto
    ADD CONSTRAINT fk_rails_cf5d592625 FOREIGN KEY (proyecto_id) REFERENCES cor1440_gen_proyecto(id);


--
-- Name: fk_rails_ff046f92e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_ff046f92e5 FOREIGN KEY (oficina_id) REFERENCES sip_oficina(id);


--
-- Name: lf_proyectofinanciero_financiador; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT lf_proyectofinanciero_financiador FOREIGN KEY (financiador_id) REFERENCES cor1440_gen_financiador(id);


--
-- Name: lf_proyectofinanciero_responsable; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT lf_proyectofinanciero_responsable FOREIGN KEY (responsable_id) REFERENCES usuario(id);


--
-- Name: persona_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: persona_nacionalde_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_nacionalde_fkey FOREIGN KEY (nacionalde) REFERENCES sip_pais(id);


--
-- Name: persona_tdocumento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_tdocumento_id_fkey FOREIGN KEY (tdocumento_id) REFERENCES sip_tdocumento(id);


--
-- Name: persona_trelacion_id_trelacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_id_trelacion_fkey FOREIGN KEY (id_trelacion) REFERENCES sip_trelacion(id);


--
-- Name: persona_trelacion_persona1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona1_fkey FOREIGN KEY (persona1) REFERENCES sip_persona(id);


--
-- Name: persona_trelacion_persona2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona2_fkey FOREIGN KEY (persona2) REFERENCES sip_persona(id);


--
-- Name: sip_clase_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: sip_municipio_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: sip_persona_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT sip_persona_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES sip_clase(id);


--
-- Name: sip_persona_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT sip_persona_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: sip_persona_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT sip_persona_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: sip_ubicacion_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES sip_clase(id);


--
-- Name: sip_ubicacion_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: sip_ubicacion_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: trelacion_inverso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_trelacion
    ADD CONSTRAINT trelacion_inverso_fkey FOREIGN KEY (inverso) REFERENCES sip_trelacion(id);


--
-- Name: ubicacion_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: ubicacion_id_tsitio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_tsitio_fkey FOREIGN KEY (id_tsitio) REFERENCES sip_tsitio(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO public, pg_catalog;

INSERT INTO schema_migrations (version) VALUES ('20131128151014');

INSERT INTO schema_migrations (version) VALUES ('20131204135932');

INSERT INTO schema_migrations (version) VALUES ('20131204140000');

INSERT INTO schema_migrations (version) VALUES ('20131204143718');

INSERT INTO schema_migrations (version) VALUES ('20131204183530');

INSERT INTO schema_migrations (version) VALUES ('20131206081531');

INSERT INTO schema_migrations (version) VALUES ('20131210221541');

INSERT INTO schema_migrations (version) VALUES ('20131220103409');

INSERT INTO schema_migrations (version) VALUES ('20131223175141');

INSERT INTO schema_migrations (version) VALUES ('20140117212555');

INSERT INTO schema_migrations (version) VALUES ('20140129151136');

INSERT INTO schema_migrations (version) VALUES ('20140207102709');

INSERT INTO schema_migrations (version) VALUES ('20140207102739');

INSERT INTO schema_migrations (version) VALUES ('20140211162355');

INSERT INTO schema_migrations (version) VALUES ('20140211164659');

INSERT INTO schema_migrations (version) VALUES ('20140211172443');

INSERT INTO schema_migrations (version) VALUES ('20140313012209');

INSERT INTO schema_migrations (version) VALUES ('20140514142421');

INSERT INTO schema_migrations (version) VALUES ('20140518120059');

INSERT INTO schema_migrations (version) VALUES ('20140527110223');

INSERT INTO schema_migrations (version) VALUES ('20140528043115');

INSERT INTO schema_migrations (version) VALUES ('20140613044320');

INSERT INTO schema_migrations (version) VALUES ('20140704035033');

INSERT INTO schema_migrations (version) VALUES ('20140804194616');

INSERT INTO schema_migrations (version) VALUES ('20140804200235');

INSERT INTO schema_migrations (version) VALUES ('20140804202100');

INSERT INTO schema_migrations (version) VALUES ('20140804202101');

INSERT INTO schema_migrations (version) VALUES ('20140804202958');

INSERT INTO schema_migrations (version) VALUES ('20140804210000');

INSERT INTO schema_migrations (version) VALUES ('20140815111351');

INSERT INTO schema_migrations (version) VALUES ('20140815111352');

INSERT INTO schema_migrations (version) VALUES ('20140815121224');

INSERT INTO schema_migrations (version) VALUES ('20140815123542');

INSERT INTO schema_migrations (version) VALUES ('20140815124157');

INSERT INTO schema_migrations (version) VALUES ('20140815124606');

INSERT INTO schema_migrations (version) VALUES ('20140827142659');

INSERT INTO schema_migrations (version) VALUES ('20140901105741');

INSERT INTO schema_migrations (version) VALUES ('20140901106000');

INSERT INTO schema_migrations (version) VALUES ('20140909165233');

INSERT INTO schema_migrations (version) VALUES ('20140918115412');

INSERT INTO schema_migrations (version) VALUES ('20140922102737');

INSERT INTO schema_migrations (version) VALUES ('20140922110956');

INSERT INTO schema_migrations (version) VALUES ('20141002140242');

INSERT INTO schema_migrations (version) VALUES ('20141111102451');

INSERT INTO schema_migrations (version) VALUES ('20141111203313');

INSERT INTO schema_migrations (version) VALUES ('20141126085907');

INSERT INTO schema_migrations (version) VALUES ('20150217185859');

INSERT INTO schema_migrations (version) VALUES ('20150217195008');

INSERT INTO schema_migrations (version) VALUES ('20150217215359');

INSERT INTO schema_migrations (version) VALUES ('20150413000000');

INSERT INTO schema_migrations (version) VALUES ('20150413160156');

INSERT INTO schema_migrations (version) VALUES ('20150413160157');

INSERT INTO schema_migrations (version) VALUES ('20150413160158');

INSERT INTO schema_migrations (version) VALUES ('20150416074423');

INSERT INTO schema_migrations (version) VALUES ('20150416090140');

INSERT INTO schema_migrations (version) VALUES ('20150416095646');

INSERT INTO schema_migrations (version) VALUES ('20150416101228');

INSERT INTO schema_migrations (version) VALUES ('20150417071153');

INSERT INTO schema_migrations (version) VALUES ('20150417180000');

INSERT INTO schema_migrations (version) VALUES ('20150417180314');

INSERT INTO schema_migrations (version) VALUES ('20150419000000');

INSERT INTO schema_migrations (version) VALUES ('20150420104520');

INSERT INTO schema_migrations (version) VALUES ('20150420110000');

INSERT INTO schema_migrations (version) VALUES ('20150420125522');

INSERT INTO schema_migrations (version) VALUES ('20150420153835');

INSERT INTO schema_migrations (version) VALUES ('20150420200255');

INSERT INTO schema_migrations (version) VALUES ('20150503120915');

INSERT INTO schema_migrations (version) VALUES ('20150510125926');

INSERT INTO schema_migrations (version) VALUES ('20150513112126');

INSERT INTO schema_migrations (version) VALUES ('20150513130058');

INSERT INTO schema_migrations (version) VALUES ('20150513130510');

INSERT INTO schema_migrations (version) VALUES ('20150513160835');

INSERT INTO schema_migrations (version) VALUES ('20150520115257');

INSERT INTO schema_migrations (version) VALUES ('20150521092657');

INSERT INTO schema_migrations (version) VALUES ('20150521181918');

INSERT INTO schema_migrations (version) VALUES ('20150521191227');

INSERT INTO schema_migrations (version) VALUES ('20150521193040');

INSERT INTO schema_migrations (version) VALUES ('20150521203631');

INSERT INTO schema_migrations (version) VALUES ('20150521223501');

