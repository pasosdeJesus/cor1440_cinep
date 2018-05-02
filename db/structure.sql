SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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

CREATE COLLATION es_co_utf_8 (provider = libc, locale = 'es_CO.UTF-8');


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
-- Name: actividad_actor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actividad_actor (
    actividad_id integer NOT NULL,
    actor_id integer NOT NULL
);


--
-- Name: actividad_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actividad_grupo (
    actividad_id integer NOT NULL,
    grupo_id integer NOT NULL
);


--
-- Name: actividad_nucleoconflicto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actividad_nucleoconflicto (
    actividad_id integer NOT NULL,
    nucleoconflicto_id integer NOT NULL
);


--
-- Name: actividad_publicacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actividad_publicacion (
    actividad_id integer NOT NULL,
    publicacion_id integer NOT NULL
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
-- Name: actor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actor (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
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
    updated_at timestamp without time zone NOT NULL,
    nivelrelacion_id integer
);


--
-- Name: actor_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actor_grupo (
    actor_id bigint NOT NULL,
    sip_grupo_id bigint NOT NULL
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
-- Name: actor_regiongrupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actor_regiongrupo (
    actor_id bigint NOT NULL,
    regiongrupo_id bigint NOT NULL
);


--
-- Name: actor_sectoractor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE actor_sectoractor (
    actor_id integer NOT NULL,
    sectoractor_id integer NOT NULL
);


--
-- Name: anexo_efecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE anexo_efecto (
    id bigint NOT NULL,
    anexo_id integer,
    efecto_id integer
);


--
-- Name: anexo_efecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE anexo_efecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: anexo_efecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE anexo_efecto_id_seq OWNED BY anexo_efecto.id;


--
-- Name: anexo_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE anexo_proyectofinanciero (
    id integer NOT NULL,
    anexo_id integer,
    proyectofinanciero_id integer,
    tipoanexo_id integer
);


--
-- Name: anexo_proyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE anexo_proyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: anexo_proyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE anexo_proyectofinanciero_id_seq OWNED BY anexo_proyectofinanciero.id;


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
-- Name: anexo_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE anexo_usuario (
    id bigint NOT NULL,
    anexo_id integer,
    usuario_id integer
);


--
-- Name: anexo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE anexo_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: anexo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE anexo_usuario_id_seq OWNED BY anexo_usuario.id;


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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: areaestudios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE areaestudios (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: areaestudios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE areaestudios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areaestudios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE areaestudios_id_seq OWNED BY areaestudios.id;


--
-- Name: cajacompensacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cajacompensacion (
    id bigint NOT NULL,
    nombre character varying(500),
    observaciones character varying(5000),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cajacompensacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cajacompensacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cajacompensacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cajacompensacion_id_seq OWNED BY cajacompensacion.id;


--
-- Name: cargo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cargo (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cargo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cargo_id_seq OWNED BY cargo.id;


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
-- Name: contextoinv; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contextoinv (
    id integer NOT NULL,
    usuario_id integer,
    fechainicio date,
    fechafin date,
    regiongrupo_id integer,
    contexto text
);


--
-- Name: contextoinv_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contextoinv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contextoinv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contextoinv_id_seq OWNED BY contextoinv.id;


--
-- Name: contrato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contrato (
    id bigint NOT NULL,
    numero character varying(127),
    salarioanterior numeric,
    salario numeric,
    fechaini date,
    fechafin date,
    tipocontrato_id integer DEFAULT 1 NOT NULL,
    ciudadresidencia character varying(127),
    ciudadlabora character varying(127)
);


--
-- Name: contrato_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contrato_id_seq OWNED BY contrato.id;


--
-- Name: convenio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE convenio (
    id bigint NOT NULL,
    clasificacion character varying(1),
    tipoconvenio_id integer,
    institucion character varying(1000),
    descripcion character varying(5000),
    fechainicio date,
    fechacierre date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: convenio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE convenio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: convenio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE convenio_id_seq OWNED BY convenio.id;


--
-- Name: coordinador_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE coordinador_proyectofinanciero (
    id integer NOT NULL,
    proyectofinanciero_id integer,
    coordinador_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coordinador_proyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coordinador_proyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coordinador_proyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coordinador_proyectofinanciero_id_seq OWNED BY coordinador_proyectofinanciero.id;


--
-- Name: cor1440_gen_actividad; Type: TABLE; Schema: public; Owner: -
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
    usuario_id integer,
    departamento_id integer,
    municipio_id integer,
    contexto character varying(5000),
    duracion integer,
    mduracion character varying(50),
    alcance character varying(50),
    accionincidencia boolean,
    accioncgenero boolean,
    accioncetnia boolean,
    nucleoconflicto_id integer,
    redactor_id integer,
    contextoinv_id integer,
    sexo_onr integer,
    etnia_onr integer,
    creadopor_id integer
);


--
-- Name: cor1440_gen_actividad_actividadpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_actividad_actividadpf (
    actividad_id bigint NOT NULL,
    actividadpf_id bigint NOT NULL
);


--
-- Name: cor1440_gen_actividad_actividadtipo; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_actividad_objetivopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_actividad_objetivopf (
    actividad_id integer,
    objetivopf_id integer
);


--
-- Name: cor1440_gen_actividad_proyecto; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_actividad_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_actividad_proyectofinanciero (
    actividad_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


--
-- Name: cor1440_gen_actividad_rangoedadac; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_actividad_sip_anexo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_actividad_sip_anexo (
    actividad_id integer NOT NULL,
    anexo_id integer NOT NULL,
    id integer DEFAULT nextval('cor1440_gen_actividad_sip_anexo_id_seq'::regclass) NOT NULL
);


--
-- Name: cor1440_gen_actividad_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_actividad_usuario (
    actividad_id integer NOT NULL,
    usuario_id integer NOT NULL
);


--
-- Name: cor1440_gen_actividad_valorcampotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_actividad_valorcampotind (
    id bigint NOT NULL,
    actividad_id integer,
    valorcampotind_id integer
);


--
-- Name: cor1440_gen_actividad_valorcampotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividad_valorcampotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_valorcampotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividad_valorcampotind_id_seq OWNED BY cor1440_gen_actividad_valorcampotind.id;


--
-- Name: cor1440_gen_actividadarea; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_actividadareas_actividad; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_actividadpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_actividadpf (
    id integer NOT NULL,
    proyectofinanciero_id integer,
    nombrecorto character varying(15),
    titulo character varying(255),
    descripcion character varying(5000),
    resultadopf_id integer,
    actividadtipo_id integer
);


--
-- Name: cor1440_gen_actividadpf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_actividadpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_actividadpf_id_seq OWNED BY cor1440_gen_actividadpf.id;


--
-- Name: cor1440_gen_actividadtipo; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_cambiosproyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_cambiosproyectofinanciero (
    id bigint NOT NULL,
    cuando timestamp without time zone,
    ip character varying(100),
    usuario_id integer,
    proyectofinanciero_id integer,
    cambios character varying(5000),
    comentarios character varying(5000)
);


--
-- Name: cor1440_gen_cambiosproyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_cambiosproyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_cambiosproyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_cambiosproyectofinanciero_id_seq OWNED BY cor1440_gen_cambiosproyectofinanciero.id;


--
-- Name: cor1440_gen_campoact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_campoact (
    id bigint NOT NULL,
    actividadtipo_id integer,
    nombrecampo character varying(128),
    ayudauso character varying(1024)
);


--
-- Name: cor1440_gen_campoact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_campoact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_campoact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_campoact_id_seq OWNED BY cor1440_gen_campoact.id;


--
-- Name: cor1440_gen_campotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_campotind (
    id bigint NOT NULL,
    tipoindicador_id integer NOT NULL,
    nombrecampo character varying(128) NOT NULL,
    ayudauso character varying(1024)
);


--
-- Name: cor1440_gen_campotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_campotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_campotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_campotind_id_seq OWNED BY cor1440_gen_campotind.id;


--
-- Name: cor1440_gen_financiador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_financiador (
    id integer NOT NULL,
    nombre character varying(1000),
    observaciones character varying(5000),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    pais_id integer,
    razonsocial character varying(511),
    nit character varying(31),
    replegal character varying(511),
    domicilio character varying(511),
    web character varying(511)
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
-- Name: cor1440_gen_financiador_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_financiador_proyectofinanciero (
    financiador_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


--
-- Name: cor1440_gen_indicadorpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_indicadorpf (
    id bigint NOT NULL,
    proyectofinanciero_id integer,
    resultadopf_id integer,
    numero character varying(15) NOT NULL,
    indicador character varying(5000) NOT NULL,
    tipoindicador_id integer,
    objetivopf_id integer
);


--
-- Name: cor1440_gen_indicadorpf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_indicadorpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_indicadorpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_indicadorpf_id_seq OWNED BY cor1440_gen_indicadorpf.id;


--
-- Name: cor1440_gen_informe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_informe (
    id integer NOT NULL,
    titulo character varying(500) NOT NULL,
    filtrofechaini date NOT NULL,
    filtrofechafin date NOT NULL,
    filtroproyecto integer,
    filtroactividadarea integer,
    columnanombre boolean,
    columnatipo boolean,
    columnaobjetivo boolean,
    columnaproyecto boolean,
    columnapoblacion boolean,
    recomendaciones character varying(5000),
    avances character varying(5000),
    logros character varying(5000),
    dificultades character varying(5000),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    filtroproyectofinanciero integer,
    filtroresponsable integer,
    filtrooficina integer,
    columnafecha boolean,
    columnaresponsable boolean
);


--
-- Name: cor1440_gen_informe_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_informe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_informe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_informe_id_seq OWNED BY cor1440_gen_informe.id;


--
-- Name: cor1440_gen_mindicadorpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_mindicadorpf (
    id bigint NOT NULL,
    proyectofinanciero_id integer,
    indicadorpf_id integer,
    formulacion character varying(512),
    frecuenciaanual character varying(128),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    descd1 character varying(500),
    descd2 character varying(500),
    descd3 character varying(500),
    meta double precision
);


--
-- Name: cor1440_gen_mindicadorpf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_mindicadorpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_mindicadorpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_mindicadorpf_id_seq OWNED BY cor1440_gen_mindicadorpf.id;


--
-- Name: cor1440_gen_objetivopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_objetivopf (
    id bigint NOT NULL,
    proyectofinanciero_id integer,
    numero character varying(15) NOT NULL,
    objetivo character varying(5000) NOT NULL
);


--
-- Name: cor1440_gen_objetivopf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_objetivopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_objetivopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_objetivopf_id_seq OWNED BY cor1440_gen_objetivopf.id;


--
-- Name: cor1440_gen_pmindicadorpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_pmindicadorpf (
    id bigint NOT NULL,
    mindicadorpf_id integer,
    finicio date,
    ffin date,
    restiempo character varying(128),
    dmed1 double precision,
    dmed2 double precision,
    dmed3 double precision,
    datosmedicion json,
    rind double precision,
    meta double precision,
    resindicador json,
    porcump double precision,
    analisis character varying(5000),
    acciones character varying(5000),
    responsables character varying(5000),
    plazo character varying(5000),
    fecha date
);


--
-- Name: cor1440_gen_pmindicadorpf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_pmindicadorpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_pmindicadorpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_pmindicadorpf_id_seq OWNED BY cor1440_gen_pmindicadorpf.id;


--
-- Name: cor1440_gen_proyecto; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_proyecto_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_proyecto_proyectofinanciero (
    proyecto_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


--
-- Name: cor1440_gen_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_proyectofinanciero (
    id integer NOT NULL,
    nombre character varying(1000),
    observaciones character varying(5000),
    fechainicio date,
    fechacierre date,
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    monto numeric DEFAULT 0.0,
    referencia character varying(1000),
    referenciacinep character varying(1000),
    fuentefinanciador character varying(1000),
    respagencia character varying(100),
    emailrespagencia character varying(100),
    telrespagencia character varying(100),
    fechaliquidacion date,
    tipomoneda_id integer,
    saldo numeric(20,2),
    acuse boolean,
    sucursal character varying(500),
    centrocosto character varying(500),
    cuentasbancarias character varying(500),
    contrapartida boolean,
    anotacionescontab character varying(5000),
    gestiones character varying(5000),
    presupuestototal numeric DEFAULT 0.0,
    aportecinep numeric(20,2),
    otrosaportescinep character varying(500),
    empresaauditoria character varying(500),
    copiasdesoporte boolean,
    reportarrendimientosfinancieros boolean,
    reinvertirrendimientosfinancieros boolean,
    autenticarcompulsar boolean,
    anotacionesdb character varying(5000),
    anotacionesrh character varying(5000),
    anotacionesre character varying(5000),
    anotacionesinf character varying(5000),
    apresupuesto character varying(5000),
    aaportes character varying(5000),
    aotrosfin numeric,
    aotrosesp character varying(500),
    respgp_id integer,
    estado character varying(1) DEFAULT 'E'::character varying,
    dificultad character varying(1),
    objeto character varying(5000),
    observacionestramite character varying(5000),
    observacionesejecucion character varying(5000),
    observacionescierre character varying(5000),
    fechaformulacion date DEFAULT ('now'::text)::date NOT NULL,
    montopesos numeric DEFAULT 0.0,
    tasa double precision,
    tasaej double precision,
    montoej double precision,
    aportecinepej double precision,
    aporteotrosej double precision,
    saldoej double precision,
    presupuestototalej double precision,
    respgp2_id integer,
    razonsocialfinanciador character varying(511),
    nitfinanciador character varying(31),
    replegalfinanciador character varying(511),
    domiciliofinanciador character varying(511),
    webfinanciador character varying(511),
    skypefinanciador character varying(127),
    sectorapc_id integer
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
-- Name: cor1440_gen_rangoedadac; Type: TABLE; Schema: public; Owner: -
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
-- Name: cor1440_gen_resultadopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_resultadopf (
    id bigint NOT NULL,
    proyectofinanciero_id integer,
    objetivopf_id integer,
    numero character varying(15) NOT NULL,
    resultado character varying(5000) NOT NULL
);


--
-- Name: cor1440_gen_resultadopf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_resultadopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_resultadopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_resultadopf_id_seq OWNED BY cor1440_gen_resultadopf.id;


--
-- Name: cor1440_gen_tipoindicador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_tipoindicador (
    id bigint NOT NULL,
    nombre character varying(32),
    espcampos character varying(1000),
    espvaloresomision character varying(1000),
    espvalidaciones character varying(1000),
    esptipometa character varying(32),
    espfuncionmedir character varying(1000),
    medircon integer
);


--
-- Name: cor1440_gen_tipoindicador_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_tipoindicador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_tipoindicador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_tipoindicador_id_seq OWNED BY cor1440_gen_tipoindicador.id;


--
-- Name: cor1440_gen_valorcampoact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_valorcampoact (
    id bigint NOT NULL,
    actividad_id integer,
    campoact_id integer,
    valor character varying(5000)
);


--
-- Name: cor1440_gen_valorcampoact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_valorcampoact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_valorcampoact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_valorcampoact_id_seq OWNED BY cor1440_gen_valorcampoact.id;


--
-- Name: cor1440_gen_valorcampotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cor1440_gen_valorcampotind (
    id bigint NOT NULL,
    campotind_id integer,
    valor character varying(5000)
);


--
-- Name: cor1440_gen_valorcampotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE cor1440_gen_valorcampotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_valorcampotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE cor1440_gen_valorcampotind_id_seq OWNED BY cor1440_gen_valorcampotind.id;


--
-- Name: desembolso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE desembolso (
    id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL,
    detalle character varying(5000),
    fechaplaneada date,
    valorplaneado numeric(20,2),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: desembolso_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE desembolso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: desembolso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE desembolso_id_seq OWNED BY desembolso.id;


--
-- Name: efecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE efecto (
    id bigint NOT NULL,
    indicadorpf_id integer,
    actor_id integer,
    fecha date
);


--
-- Name: efecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE efecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: efecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE efecto_id_seq OWNED BY efecto.id;


--
-- Name: efecto_valorcampotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE efecto_valorcampotind (
    id bigint NOT NULL,
    efecto_id integer,
    valorcampotind_id integer
);


--
-- Name: efecto_valorcampotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE efecto_valorcampotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: efecto_valorcampotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE efecto_valorcampotind_id_seq OWNED BY efecto_valorcampotind.id;


--
-- Name: empresaps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE empresaps (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: empresaps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresaps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: empresaps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresaps_id_seq OWNED BY empresaps.id;


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
-- Name: fondopensiones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE fondopensiones (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fondopensiones_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fondopensiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fondopensiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fondopensiones_id_seq OWNED BY fondopensiones.id;


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
-- Name: grupo_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE grupo_proyectofinanciero (
    grupo_id bigint NOT NULL,
    proyectofinanciero_id bigint NOT NULL
);


--
-- Name: grupo_subgrupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE grupo_subgrupo (
    id bigint NOT NULL,
    grupo_id integer,
    subgrupo_id integer
);


--
-- Name: grupo_subgrupo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE grupo_subgrupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grupo_subgrupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE grupo_subgrupo_id_seq OWNED BY grupo_subgrupo.id;


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
-- Name: heb412_gen_campohc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE heb412_gen_campohc (
    id integer NOT NULL,
    doc_id integer NOT NULL,
    nombrecampo character varying(127) NOT NULL,
    columna character varying(5) NOT NULL,
    fila integer
);


--
-- Name: heb412_gen_campohc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE heb412_gen_campohc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_campohc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE heb412_gen_campohc_id_seq OWNED BY heb412_gen_campohc.id;


--
-- Name: heb412_gen_campoplantillahcm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE heb412_gen_campoplantillahcm (
    id integer NOT NULL,
    plantillahcm_id integer,
    nombrecampo character varying(127),
    columna character varying(5)
);


--
-- Name: heb412_gen_campoplantillahcm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE heb412_gen_campoplantillahcm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_campoplantillahcm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE heb412_gen_campoplantillahcm_id_seq OWNED BY heb412_gen_campoplantillahcm.id;


--
-- Name: heb412_gen_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE heb412_gen_doc (
    id integer NOT NULL,
    nombre character varying(512),
    tipodoc character varying(1),
    dirpapa integer,
    url character varying(1024),
    fuente character varying(1024),
    descripcion character varying(5000),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    adjunto_file_name character varying,
    adjunto_content_type character varying,
    adjunto_file_size integer,
    adjunto_updated_at timestamp without time zone,
    nombremenu character varying(127),
    vista character varying(255),
    filainicial integer,
    ruta character varying(2047),
    licencia character varying(255),
    tdoc_id integer,
    tdoc_type character varying
);


--
-- Name: heb412_gen_doc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE heb412_gen_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE heb412_gen_doc_id_seq OWNED BY heb412_gen_doc.id;


--
-- Name: heb412_gen_plantillahcm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE heb412_gen_plantillahcm (
    id integer NOT NULL,
    ruta character varying(2047) NOT NULL,
    fuente character varying(1023),
    licencia character varying(1023),
    vista character varying(127) NOT NULL,
    nombremenu character varying(127) NOT NULL,
    filainicial integer NOT NULL
);


--
-- Name: heb412_gen_plantillahcm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE heb412_gen_plantillahcm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_plantillahcm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE heb412_gen_plantillahcm_id_seq OWNED BY heb412_gen_plantillahcm.id;


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
-- Name: informeauditoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE informeauditoria (
    id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL,
    detalle character varying(5000),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fechaplaneada date,
    fechareal date,
    devoluciones boolean,
    seguimiento character varying(5000),
    presupuestodonante numeric,
    presupuestoorg numeric
);


--
-- Name: informeauditoria_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE informeauditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informeauditoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE informeauditoria_id_seq OWNED BY informeauditoria.id;


--
-- Name: informeevaluacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE informeevaluacion (
    id bigint NOT NULL,
    proyectofinanciero_id integer NOT NULL,
    detalle character varying(5000),
    fechaplaneada date,
    fechareal date,
    resultado character varying(5000)
);


--
-- Name: informeevaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE informeevaluacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informeevaluacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE informeevaluacion_id_seq OWNED BY informeevaluacion.id;


--
-- Name: informefinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE informefinanciero (
    id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL,
    detalle character varying(5000),
    fechaplaneada date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fechareal date,
    devoluciones boolean,
    seguimiento character varying(5000)
);


--
-- Name: informefinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE informefinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informefinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE informefinanciero_id_seq OWNED BY informefinanciero.id;


--
-- Name: informenarrativo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE informenarrativo (
    id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL,
    detalle character varying(5000),
    fechaplaneada date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fechareal date,
    devoluciones boolean,
    seguimiento character varying(5000)
);


--
-- Name: informenarrativo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE informenarrativo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informenarrativo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE informenarrativo_id_seq OWNED BY informenarrativo.id;


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
-- Name: niveleducacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE niveleducacion (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: niveleducacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE niveleducacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: niveleducacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE niveleducacion_id_seq OWNED BY niveleducacion.id;


--
-- Name: nivelrelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nivelrelacion (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nivelrelacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nivelrelacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nivelrelacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nivelrelacion_id_seq OWNED BY nivelrelacion.id;


--
-- Name: nucleoconflicto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nucleoconflicto (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nucleoconflicto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nucleoconflicto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nucleoconflicto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nucleoconflicto_id_seq OWNED BY nucleoconflicto.id;


--
-- Name: oficina_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE oficina_proyectofinanciero (
    oficina_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


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
-- Name: perfilprofesional; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE perfilprofesional (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: perfilprofesional_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE perfilprofesional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: perfilprofesional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE perfilprofesional_id_seq OWNED BY perfilprofesional.id;


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
-- Name: procesogh; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE procesogh (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: procesogh_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE procesogh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: procesogh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE procesogh_id_seq OWNED BY procesogh.id;


--
-- Name: productopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE productopf (
    id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL,
    tipoproductopf_id integer NOT NULL,
    detalle character varying(5000),
    fechaplaneada date,
    fechareal date,
    devoluciones boolean,
    seguimiento character varying(5000),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fechainiprod date,
    fechafinprod date,
    costoprevisto numeric
);


--
-- Name: productopf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE productopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: productopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE productopf_id_seq OWNED BY productopf.id;


--
-- Name: profesion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE profesion (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    areaestudios_id integer DEFAULT 1,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: profesion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE profesion_id_seq OWNED BY profesion.id;


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
-- Name: proyectofinanciero_uresponsable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE proyectofinanciero_uresponsable (
    id integer NOT NULL,
    proyectofinanciero_id integer,
    uresponsable_id integer,
    porcentaje integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: proyectofinanciero_uresponsable_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proyectofinanciero_uresponsable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proyectofinanciero_uresponsable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proyectofinanciero_uresponsable_id_seq OWNED BY proyectofinanciero_uresponsable.id;


--
-- Name: proyectofinanciero_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE proyectofinanciero_usuario (
    id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL,
    usuario_id integer,
    cargo_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    porcentaje integer,
    perfilprofesional_id integer,
    tipocontrato_id integer DEFAULT 1
);


--
-- Name: proyectofinanciero_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE proyectofinanciero_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proyectofinanciero_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE proyectofinanciero_usuario_id_seq OWNED BY proyectofinanciero_usuario.id;


--
-- Name: publicacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE publicacion (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: publicacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE publicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: publicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE publicacion_id_seq OWNED BY publicacion.id;


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
-- Name: redactor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE redactor (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: redactor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE redactor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redactor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE redactor_id_seq OWNED BY redactor.id;


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
-- Name: regiongrupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE regiongrupo (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    grupo_id integer,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: regiongrupo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE regiongrupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regiongrupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE regiongrupo_id_seq OWNED BY regiongrupo.id;


--
-- Name: regiongrupo_sip_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE regiongrupo_sip_departamento (
    regiongrupo_id integer NOT NULL,
    sip_departamento_id integer NOT NULL
);


--
-- Name: regiongrupo_sip_municipio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE regiongrupo_sip_municipio (
    regiongrupo_id integer NOT NULL,
    sip_municipio_id integer NOT NULL
);


--
-- Name: sal7711_gen_articulo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sal7711_gen_articulo (
    id integer NOT NULL,
    departamento_id integer,
    municipio_id integer,
    fuenteprensa_id integer,
    fecha date,
    pagina character varying(20),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    texto text,
    adjunto_file_name character varying,
    adjunto_content_type character varying,
    adjunto_file_size integer,
    adjunto_updated_at timestamp without time zone,
    anexo_id_antiguo integer,
    adjunto_descripcion character varying(1500),
    titulo character varying(1024),
    observaciones character varying(5000),
    url character varying(5000),
    pais_id integer
);


--
-- Name: sal7711_gen_articulo_categoriaprensa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sal7711_gen_articulo_categoriaprensa (
    articulo_id bigint NOT NULL,
    categoriaprensa_id bigint NOT NULL
);


--
-- Name: sal7711_gen_articulo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sal7711_gen_articulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sal7711_gen_articulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sal7711_gen_articulo_id_seq OWNED BY sal7711_gen_articulo.id;


--
-- Name: sal7711_gen_bitacora; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sal7711_gen_bitacora (
    id integer NOT NULL,
    fecha timestamp without time zone,
    ip character varying(100),
    usuario_id integer,
    operacion character varying(50),
    detalle character varying(5000),
    detalle2 character varying(500),
    detalle3 character varying(500)
);


--
-- Name: sal7711_gen_bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sal7711_gen_bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sal7711_gen_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sal7711_gen_bitacora_id_seq OWNED BY sal7711_gen_bitacora.id;


--
-- Name: sal7711_gen_categoriaprensa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sal7711_gen_categoriaprensa (
    id integer NOT NULL,
    codigo character varying(15),
    nombre character varying(500),
    observaciones character varying(5000),
    fechacreacion date,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: sal7711_gen_categoriaprensa_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sal7711_gen_categoriaprensa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sal7711_gen_categoriaprensa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sal7711_gen_categoriaprensa_id_seq OWNED BY sal7711_gen_categoriaprensa.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sectoractor; Type: TABLE; Schema: public; Owner: -
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
-- Name: sectorapc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sectorapc (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sectorapc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sectorapc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectorapc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sectorapc_id_seq OWNED BY sectorapc.id;


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
-- Name: sip_anexo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_anexo (
    id integer NOT NULL,
    descripcion character varying(1500) COLLATE public.es_co_utf_8,
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
-- Name: sip_clase; Type: TABLE; Schema: public; Owner: -
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
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
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
-- Name: sip_departamento; Type: TABLE; Schema: public; Owner: -
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
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
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
-- Name: sip_etiqueta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_etiqueta (
    id integer DEFAULT nextval('sip_etiqueta_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    CONSTRAINT etiqueta_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_fuenteprensa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_fuenteprensa (
    id integer NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
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
-- Name: sip_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_grupo (
    id integer NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ultimasincldap date,
    cn character varying(255),
    "gidNumber" integer,
    procesogh_id integer DEFAULT 1
);


--
-- Name: sip_grupo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sip_grupo_id_seq OWNED BY sip_grupo.id;


--
-- Name: sip_grupo_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_grupo_usuario (
    usuario_id integer NOT NULL,
    sip_grupo_id integer NOT NULL
);


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
-- Name: sip_municipio; Type: TABLE; Schema: public; Owner: -
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
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT municipio_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_mundep_sinorden; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW sip_mundep_sinorden AS
 SELECT ((sip_departamento.id_deplocal * 1000) + sip_municipio.id_munlocal) AS idlocal,
    (((sip_municipio.nombre)::text || ' / '::text) || (sip_departamento.nombre)::text) AS nombre
   FROM (sip_municipio
     JOIN sip_departamento ON ((sip_municipio.id_departamento = sip_departamento.id)))
  WHERE ((sip_departamento.id_pais = 170) AND (sip_municipio.fechadeshabilitacion IS NULL) AND (sip_departamento.fechadeshabilitacion IS NULL))
UNION
 SELECT sip_departamento.id_deplocal AS idlocal,
    sip_departamento.nombre
   FROM sip_departamento
  WHERE ((sip_departamento.id_pais = 170) AND (sip_departamento.fechadeshabilitacion IS NULL));


--
-- Name: sip_mundep; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW sip_mundep AS
 SELECT sip_mundep_sinorden.idlocal,
    sip_mundep_sinorden.nombre,
    to_tsvector('spanish'::regconfig, unaccent(sip_mundep_sinorden.nombre)) AS mundep
   FROM sip_mundep_sinorden
  ORDER BY (sip_mundep_sinorden.nombre COLLATE es_co_utf_8)
  WITH NO DATA;


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
-- Name: sip_oficina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_oficina (
    id integer DEFAULT nextval('sip_oficina_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT regionsjr_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_pais; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_pais (
    id integer NOT NULL,
    nombre character varying(200) COLLATE public.es_co_utf_8,
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
    observaciones character varying(5000) COLLATE public.es_co_utf_8
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
-- Name: sip_persona; Type: TABLE; Schema: public; Owner: -
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
    lugardocumento character varying(127),
    CONSTRAINT persona_check CHECK (((dianac IS NULL) OR (((dianac >= 1) AND (((mesnac = 1) OR (mesnac = 3) OR (mesnac = 5) OR (mesnac = 7) OR (mesnac = 8) OR (mesnac = 10) OR (mesnac = 12)) AND (dianac <= 31))) OR (((mesnac = 4) OR (mesnac = 6) OR (mesnac = 9) OR (mesnac = 11)) AND (dianac <= 30)) OR ((mesnac = 2) AND (dianac <= 29))))),
    CONSTRAINT persona_mesnac_check CHECK (((mesnac IS NULL) OR ((mesnac >= 1) AND (mesnac <= 12)))),
    CONSTRAINT persona_sexo_check CHECK (((sexo = 'S'::bpchar) OR (sexo = 'F'::bpchar) OR (sexo = 'M'::bpchar)))
);


--
-- Name: sip_persona_trelacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sip_persona_trelacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_persona_trelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_persona_trelacion (
    persona1 integer NOT NULL,
    persona2 integer NOT NULL,
    id_trelacion character(2) DEFAULT 'SI'::bpchar NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer DEFAULT nextval('sip_persona_trelacion_id_seq'::regclass) NOT NULL
);


--
-- Name: sip_tclase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_tclase (
    id character varying(10) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT tclase_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_tdocumento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_tdocumento (
    id integer NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    sigla character varying(100),
    formatoregex character varying(500),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8
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
-- Name: sip_trelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_trelacion (
    id character(2) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
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
-- Name: sip_tsitio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sip_tsitio (
    id integer DEFAULT nextval('sip_tsitio_id_seq'::regclass) NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
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
-- Name: sip_ubicacion; Type: TABLE; Schema: public; Owner: -
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
-- Name: tasacambio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tasacambio (
    id bigint NOT NULL,
    fecha date,
    tipomoneda_id integer,
    enpesos numeric,
    observaciones character varying(5000)
);


--
-- Name: tasacambio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tasacambio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasacambio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tasacambio_id_seq OWNED BY tasacambio.id;


--
-- Name: tipoanexo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipoanexo (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tipoanexo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipoanexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipoanexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipoanexo_id_seq OWNED BY tipoanexo.id;


--
-- Name: tipocontrato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipocontrato (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tiponomina_id integer DEFAULT 1 NOT NULL
);


--
-- Name: tipocontrato_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipocontrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipocontrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipocontrato_id_seq OWNED BY tipocontrato.id;


--
-- Name: tipoconvenio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipoconvenio (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tipoconvenio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipoconvenio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipoconvenio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipoconvenio_id_seq OWNED BY tipoconvenio.id;


--
-- Name: tipomoneda; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipomoneda (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    codiso4217 character varying(3) NOT NULL,
    simbolo character varying(10),
    pais_id integer,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tipomoneda_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipomoneda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipomoneda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipomoneda_id_seq OWNED BY tipomoneda.id;


--
-- Name: tiponomina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tiponomina (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tiponomina_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tiponomina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tiponomina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tiponomina_id_seq OWNED BY tiponomina.id;


--
-- Name: tipoproductopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipoproductopf (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tipoproductopf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipoproductopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipoproductopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipoproductopf_id_seq OWNED BY tipoproductopf.id;


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
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE usuario (
    nusuario character varying(63) NOT NULL,
    password character varying(64) DEFAULT ''::character varying NOT NULL,
    descripcion character varying(50),
    rol integer DEFAULT 5,
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
    oficina_id integer DEFAULT 1,
    ultimasincldap date,
    "uidNumber" integer,
    telefonos character varying(256),
    extension character varying(128),
    persona_id integer,
    direccionresidencia character varying(255),
    numhijos integer DEFAULT 0,
    numhijosmen12 integer DEFAULT 0,
    labdepartamento_id integer,
    labmunicipio_id integer,
    apellidos character varying(127),
    nombres character varying(127),
    perfilprofesional_id integer,
    cargo_id integer,
    contrato_id integer,
    niveleducacion_id integer DEFAULT 1,
    profesion_id integer DEFAULT 1,
    empresaps_id integer,
    cajacompensacion_id integer,
    fondopensiones_id integer,
    CONSTRAINT usuario_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion))),
    CONSTRAINT usuario_rol_check CHECK ((rol >= 1))
);


--
-- Name: v_solicitud_informes1; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW v_solicitud_informes1 AS
 SELECT informenarrativo.proyectofinanciero_id,
    informenarrativo.fechaplaneada,
    informenarrativo.fechareal,
    informenarrativo.devoluciones,
    ('INFORME NARRATIVO: '::text || (informenarrativo.detalle)::text) AS observaciones,
    informenarrativo.seguimiento
   FROM informenarrativo
UNION
 SELECT informefinanciero.proyectofinanciero_id,
    informefinanciero.fechaplaneada,
    informefinanciero.fechareal,
    informefinanciero.devoluciones,
    ('INFORME FINANCIERO: '::text || (informefinanciero.detalle)::text) AS observaciones,
    informefinanciero.seguimiento
   FROM informefinanciero
UNION
 SELECT informeauditoria.proyectofinanciero_id,
    informeauditoria.fechaplaneada,
    informeauditoria.fechareal,
    informeauditoria.devoluciones,
    ('INFORME DE AUDITORÍA: '::text || (informeauditoria.detalle)::text) AS observaciones,
    informeauditoria.seguimiento
   FROM informeauditoria
UNION
 SELECT productopf.proyectofinanciero_id,
    productopf.fechaplaneada,
    productopf.fechareal,
    productopf.devoluciones,
    (((tipoproductopf.nombre)::text || ': '::text) || (productopf.detalle)::text) AS observaciones,
    productopf.seguimiento
   FROM (productopf
     JOIN tipoproductopf ON ((productopf.tipoproductopf_id = tipoproductopf.id)));


--
-- Name: v_solicitud_informes; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW v_solicitud_informes AS
 SELECT p.id AS compromiso_id,
    p.referenciacinep AS titulo,
    array_to_string(ARRAY( SELECT (((sip_persona.nombres)::text || ' '::text) || (sip_persona.apellidos)::text)
           FROM ((sip_persona
             JOIN usuario ON ((sip_persona.id = usuario.persona_id)))
             JOIN coordinador_proyectofinanciero ON ((usuario.id = coordinador_proyectofinanciero.coordinador_id)))
          WHERE (coordinador_proyectofinanciero.proyectofinanciero_id = p.id)), ', '::text) AS coordinador,
    array_to_string(ARRAY( SELECT (((sip_persona.nombres)::text || ' '::text) || (sip_persona.apellidos)::text)
           FROM ((sip_persona
             JOIN usuario ON ((sip_persona.id = usuario.persona_id)))
             JOIN proyectofinanciero_uresponsable ON ((usuario.id = proyectofinanciero_uresponsable.uresponsable_id)))
          WHERE (proyectofinanciero_uresponsable.proyectofinanciero_id = p.id)), ', '::text) AS responsable,
    s.fechaplaneada,
    s.fechareal,
        CASE
            WHEN s.devoluciones THEN 'SI'::text
            WHEN (s.devoluciones IS NULL) THEN ''::text
            ELSE 'NO'::text
        END AS devoluciones,
    s.observaciones,
    s.seguimiento,
        CASE
            WHEN (s.fechareal <= (s.fechaplaneada + 7)) THEN 'SI'::text
            WHEN (s.fechareal > (s.fechaplaneada + 7)) THEN 'NO'::text
            WHEN ((s.fechareal IS NULL) AND (CURRENT_DATE > (s.fechaplaneada + 7))) THEN 'NO'::text
            ELSE ''::text
        END AS a_tiempo
   FROM (cor1440_gen_proyectofinanciero p
     JOIN v_solicitud_informes1 s ON ((p.id = s.proyectofinanciero_id)))
  WHERE (p.id = ANY (ARRAY[140, 149, 150, 154, 156, 117, 106, 18, 152, 133, 136, 138, 141, 142, 143, 144, 145, 147, 137, 101, 102, 122, 123, 125, 104, 157, 118, 109, 111, 155, 103, 116, 19, 115, 20, 120, 126, 119, 131, 132, 146, 127, 130, 128, 129, 134]))
  ORDER BY s.fechaplaneada;


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
-- Name: vinculacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vinculacion (
    id bigint NOT NULL,
    usuario_id integer,
    fechaini date,
    fechafin date,
    observaciones character varying(5000)
);


--
-- Name: vinculacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vinculacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vinculacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vinculacion_id_seq OWNED BY vinculacion.id;


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
-- Name: actor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor ALTER COLUMN id SET DEFAULT nextval('actor_id_seq'::regclass);


--
-- Name: anexo_efecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_efecto ALTER COLUMN id SET DEFAULT nextval('anexo_efecto_id_seq'::regclass);


--
-- Name: anexo_proyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('anexo_proyectofinanciero_id_seq'::regclass);


--
-- Name: anexo_usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_usuario ALTER COLUMN id SET DEFAULT nextval('anexo_usuario_id_seq'::regclass);


--
-- Name: areaestudios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY areaestudios ALTER COLUMN id SET DEFAULT nextval('areaestudios_id_seq'::regclass);


--
-- Name: cajacompensacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cajacompensacion ALTER COLUMN id SET DEFAULT nextval('cajacompensacion_id_seq'::regclass);


--
-- Name: cargo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargo ALTER COLUMN id SET DEFAULT nextval('cargo_id_seq'::regclass);


--
-- Name: contextoinv id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contextoinv ALTER COLUMN id SET DEFAULT nextval('contextoinv_id_seq'::regclass);


--
-- Name: contrato id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contrato ALTER COLUMN id SET DEFAULT nextval('contrato_id_seq'::regclass);


--
-- Name: convenio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY convenio ALTER COLUMN id SET DEFAULT nextval('convenio_id_seq'::regclass);


--
-- Name: coordinador_proyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinador_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('coordinador_proyectofinanciero_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividad_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad_proyecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividad_proyecto_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad_rangoedadac id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_rangoedadac ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividad_rangoedadac_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad_valorcampotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_valorcampotind ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividad_valorcampotind_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadarea id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadarea ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividadarea_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadareas_actividad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadareas_actividad ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividadareas_actividad_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadpf ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividadpf_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadtipo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadtipo ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_actividadtipo_id_seq'::regclass);


--
-- Name: cor1440_gen_cambiosproyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_cambiosproyectofinanciero ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_cambiosproyectofinanciero_id_seq'::regclass);


--
-- Name: cor1440_gen_campoact id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_campoact ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_campoact_id_seq'::regclass);


--
-- Name: cor1440_gen_campotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_campotind ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_campotind_id_seq'::regclass);


--
-- Name: cor1440_gen_financiador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_financiador ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_financiador_id_seq'::regclass);


--
-- Name: cor1440_gen_indicadorpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_indicadorpf ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_indicadorpf_id_seq'::regclass);


--
-- Name: cor1440_gen_informe id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_informe ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_informe_id_seq'::regclass);


--
-- Name: cor1440_gen_mindicadorpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_mindicadorpf ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_mindicadorpf_id_seq'::regclass);


--
-- Name: cor1440_gen_objetivopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_objetivopf ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_objetivopf_id_seq'::regclass);


--
-- Name: cor1440_gen_pmindicadorpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_pmindicadorpf ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_pmindicadorpf_id_seq'::regclass);


--
-- Name: cor1440_gen_proyecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyecto ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_proyecto_id_seq'::regclass);


--
-- Name: cor1440_gen_proyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_proyectofinanciero_id_seq'::regclass);


--
-- Name: cor1440_gen_rangoedadac id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_rangoedadac ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_rangoedadac_id_seq'::regclass);


--
-- Name: cor1440_gen_resultadopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_resultadopf ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_resultadopf_id_seq'::regclass);


--
-- Name: cor1440_gen_tipoindicador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_tipoindicador ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_tipoindicador_id_seq'::regclass);


--
-- Name: cor1440_gen_valorcampoact id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_valorcampoact ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_valorcampoact_id_seq'::regclass);


--
-- Name: cor1440_gen_valorcampotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_valorcampotind ALTER COLUMN id SET DEFAULT nextval('cor1440_gen_valorcampotind_id_seq'::regclass);


--
-- Name: desembolso id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY desembolso ALTER COLUMN id SET DEFAULT nextval('desembolso_id_seq'::regclass);


--
-- Name: efecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto ALTER COLUMN id SET DEFAULT nextval('efecto_id_seq'::regclass);


--
-- Name: efecto_valorcampotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto_valorcampotind ALTER COLUMN id SET DEFAULT nextval('efecto_valorcampotind_id_seq'::regclass);


--
-- Name: empresaps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresaps ALTER COLUMN id SET DEFAULT nextval('empresaps_id_seq'::regclass);


--
-- Name: fondopensiones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fondopensiones ALTER COLUMN id SET DEFAULT nextval('fondopensiones_id_seq'::regclass);


--
-- Name: grupo_subgrupo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_subgrupo ALTER COLUMN id SET DEFAULT nextval('grupo_subgrupo_id_seq'::regclass);


--
-- Name: heb412_gen_campohc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_campohc ALTER COLUMN id SET DEFAULT nextval('heb412_gen_campohc_id_seq'::regclass);


--
-- Name: heb412_gen_campoplantillahcm id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_campoplantillahcm ALTER COLUMN id SET DEFAULT nextval('heb412_gen_campoplantillahcm_id_seq'::regclass);


--
-- Name: heb412_gen_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_doc ALTER COLUMN id SET DEFAULT nextval('heb412_gen_doc_id_seq'::regclass);


--
-- Name: heb412_gen_plantillahcm id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_plantillahcm ALTER COLUMN id SET DEFAULT nextval('heb412_gen_plantillahcm_id_seq'::regclass);


--
-- Name: informeauditoria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY informeauditoria ALTER COLUMN id SET DEFAULT nextval('informeauditoria_id_seq'::regclass);


--
-- Name: informeevaluacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY informeevaluacion ALTER COLUMN id SET DEFAULT nextval('informeevaluacion_id_seq'::regclass);


--
-- Name: informefinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY informefinanciero ALTER COLUMN id SET DEFAULT nextval('informefinanciero_id_seq'::regclass);


--
-- Name: informenarrativo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY informenarrativo ALTER COLUMN id SET DEFAULT nextval('informenarrativo_id_seq'::regclass);


--
-- Name: niveleducacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY niveleducacion ALTER COLUMN id SET DEFAULT nextval('niveleducacion_id_seq'::regclass);


--
-- Name: nivelrelacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nivelrelacion ALTER COLUMN id SET DEFAULT nextval('nivelrelacion_id_seq'::regclass);


--
-- Name: nucleoconflicto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nucleoconflicto ALTER COLUMN id SET DEFAULT nextval('nucleoconflicto_id_seq'::regclass);


--
-- Name: perfilprofesional id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY perfilprofesional ALTER COLUMN id SET DEFAULT nextval('perfilprofesional_id_seq'::regclass);


--
-- Name: procesogh id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY procesogh ALTER COLUMN id SET DEFAULT nextval('procesogh_id_seq'::regclass);


--
-- Name: productopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY productopf ALTER COLUMN id SET DEFAULT nextval('productopf_id_seq'::regclass);


--
-- Name: profesion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesion ALTER COLUMN id SET DEFAULT nextval('profesion_id_seq'::regclass);


--
-- Name: proyectofinanciero_uresponsable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_uresponsable ALTER COLUMN id SET DEFAULT nextval('proyectofinanciero_uresponsable_id_seq'::regclass);


--
-- Name: proyectofinanciero_usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_usuario ALTER COLUMN id SET DEFAULT nextval('proyectofinanciero_usuario_id_seq'::regclass);


--
-- Name: publicacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY publicacion ALTER COLUMN id SET DEFAULT nextval('publicacion_id_seq'::regclass);


--
-- Name: redactor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY redactor ALTER COLUMN id SET DEFAULT nextval('redactor_id_seq'::regclass);


--
-- Name: regiongrupo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY regiongrupo ALTER COLUMN id SET DEFAULT nextval('regiongrupo_id_seq'::regclass);


--
-- Name: sal7711_gen_articulo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo ALTER COLUMN id SET DEFAULT nextval('sal7711_gen_articulo_id_seq'::regclass);


--
-- Name: sal7711_gen_bitacora id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_bitacora ALTER COLUMN id SET DEFAULT nextval('sal7711_gen_bitacora_id_seq'::regclass);


--
-- Name: sal7711_gen_categoriaprensa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_categoriaprensa ALTER COLUMN id SET DEFAULT nextval('sal7711_gen_categoriaprensa_id_seq'::regclass);


--
-- Name: sectoractor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectoractor ALTER COLUMN id SET DEFAULT nextval('sectoractor_id_seq'::regclass);


--
-- Name: sectorapc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectorapc ALTER COLUMN id SET DEFAULT nextval('sectorapc_id_seq'::regclass);


--
-- Name: sip_anexo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_anexo ALTER COLUMN id SET DEFAULT nextval('sip_anexo_id_seq'::regclass);


--
-- Name: sip_fuenteprensa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_fuenteprensa ALTER COLUMN id SET DEFAULT nextval('sip_fuenteprensa_id_seq'::regclass);


--
-- Name: sip_grupo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_grupo ALTER COLUMN id SET DEFAULT nextval('sip_grupo_id_seq'::regclass);


--
-- Name: sip_pais id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_pais ALTER COLUMN id SET DEFAULT nextval('sip_pais_id_seq'::regclass);


--
-- Name: sip_tdocumento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tdocumento ALTER COLUMN id SET DEFAULT nextval('sip_tdocumento_id_seq'::regclass);


--
-- Name: tasacambio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tasacambio ALTER COLUMN id SET DEFAULT nextval('tasacambio_id_seq'::regclass);


--
-- Name: tipoanexo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipoanexo ALTER COLUMN id SET DEFAULT nextval('tipoanexo_id_seq'::regclass);


--
-- Name: tipocontrato id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipocontrato ALTER COLUMN id SET DEFAULT nextval('tipocontrato_id_seq'::regclass);


--
-- Name: tipoconvenio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipoconvenio ALTER COLUMN id SET DEFAULT nextval('tipoconvenio_id_seq'::regclass);


--
-- Name: tipomoneda id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipomoneda ALTER COLUMN id SET DEFAULT nextval('tipomoneda_id_seq'::regclass);


--
-- Name: tiponomina id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tiponomina ALTER COLUMN id SET DEFAULT nextval('tiponomina_id_seq'::regclass);


--
-- Name: tipoproductopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipoproductopf ALTER COLUMN id SET DEFAULT nextval('tipoproductopf_id_seq'::regclass);


--
-- Name: vinculacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vinculacion ALTER COLUMN id SET DEFAULT nextval('vinculacion_id_seq'::regclass);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- Name: anexo_efecto anexo_efecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_efecto
    ADD CONSTRAINT anexo_efecto_pkey PRIMARY KEY (id);


--
-- Name: anexo_proyectofinanciero anexo_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_proyectofinanciero
    ADD CONSTRAINT anexo_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: anexo_usuario anexo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_usuario
    ADD CONSTRAINT anexo_usuario_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areaestudios areaestudios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY areaestudios
    ADD CONSTRAINT areaestudios_pkey PRIMARY KEY (id);


--
-- Name: cajacompensacion cajacompensacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cajacompensacion
    ADD CONSTRAINT cajacompensacion_pkey PRIMARY KEY (id);


--
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);


--
-- Name: contextoinv contextoinv_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contextoinv
    ADD CONSTRAINT contextoinv_pkey PRIMARY KEY (id);


--
-- Name: contrato contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT contrato_pkey PRIMARY KEY (id);


--
-- Name: convenio convenio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (id);


--
-- Name: coordinador_proyectofinanciero coordinador_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinador_proyectofinanciero
    ADD CONSTRAINT coordinador_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_proyecto cor1440_gen_actividad_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto
    ADD CONSTRAINT cor1440_gen_actividad_proyecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_sip_anexo cor1440_gen_actividad_sip_anexo_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT cor1440_gen_actividad_sip_anexo_id_key UNIQUE (id);


--
-- Name: cor1440_gen_actividad_sip_anexo cor1440_gen_actividad_sip_anexo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT cor1440_gen_actividad_sip_anexo_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_valorcampotind cor1440_gen_actividad_valorcampotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_valorcampotind
    ADD CONSTRAINT cor1440_gen_actividad_valorcampotind_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadpf cor1440_gen_actividadpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadpf
    ADD CONSTRAINT cor1440_gen_actividadpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadtipo cor1440_gen_actividadtipo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_cambiosproyectofinanciero cor1440_gen_cambiosproyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_cambiosproyectofinanciero
    ADD CONSTRAINT cor1440_gen_cambiosproyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_campoact cor1440_gen_campoact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_campoact
    ADD CONSTRAINT cor1440_gen_campoact_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_campotind cor1440_gen_campotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_campotind
    ADD CONSTRAINT cor1440_gen_campotind_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_financiador cor1440_gen_financiador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_financiador
    ADD CONSTRAINT cor1440_gen_financiador_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_indicadorpf cor1440_gen_indicadorpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_indicadorpf
    ADD CONSTRAINT cor1440_gen_indicadorpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_informe cor1440_gen_informe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_informe
    ADD CONSTRAINT cor1440_gen_informe_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_mindicadorpf cor1440_gen_mindicadorpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_mindicadorpf
    ADD CONSTRAINT cor1440_gen_mindicadorpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_objetivopf cor1440_gen_objetivopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_objetivopf
    ADD CONSTRAINT cor1440_gen_objetivopf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_pmindicadorpf cor1440_gen_pmindicadorpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_pmindicadorpf
    ADD CONSTRAINT cor1440_gen_pmindicadorpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_proyecto cor1440_gen_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyecto
    ADD CONSTRAINT cor1440_gen_proyecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_proyectofinanciero cor1440_gen_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT cor1440_gen_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_resultadopf cor1440_gen_resultadopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_resultadopf
    ADD CONSTRAINT cor1440_gen_resultadopf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_tipoindicador cor1440_gen_tipoindicador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_tipoindicador
    ADD CONSTRAINT cor1440_gen_tipoindicador_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_valorcampoact cor1440_gen_valorcampoact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_valorcampoact
    ADD CONSTRAINT cor1440_gen_valorcampoact_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_valorcampotind cor1440_gen_valorcampotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_valorcampotind
    ADD CONSTRAINT cor1440_gen_valorcampotind_pkey PRIMARY KEY (id);


--
-- Name: desembolso desembolso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY desembolso
    ADD CONSTRAINT desembolso_pkey PRIMARY KEY (id);


--
-- Name: efecto efecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto
    ADD CONSTRAINT efecto_pkey PRIMARY KEY (id);


--
-- Name: efecto_valorcampotind efecto_valorcampotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto_valorcampotind
    ADD CONSTRAINT efecto_valorcampotind_pkey PRIMARY KEY (id);


--
-- Name: empresaps empresaps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresaps
    ADD CONSTRAINT empresaps_pkey PRIMARY KEY (id);


--
-- Name: sip_etiqueta etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_etiqueta
    ADD CONSTRAINT etiqueta_pkey PRIMARY KEY (id);


--
-- Name: fondopensiones fondopensiones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY fondopensiones
    ADD CONSTRAINT fondopensiones_pkey PRIMARY KEY (id);


--
-- Name: grupo_subgrupo grupo_subgrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_subgrupo
    ADD CONSTRAINT grupo_subgrupo_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_campohc heb412_gen_campohc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_campohc
    ADD CONSTRAINT heb412_gen_campohc_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_campoplantillahcm heb412_gen_campoplantillahcm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_campoplantillahcm
    ADD CONSTRAINT heb412_gen_campoplantillahcm_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_doc heb412_gen_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_doc
    ADD CONSTRAINT heb412_gen_doc_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_plantillahcm heb412_gen_plantillahcm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_plantillahcm
    ADD CONSTRAINT heb412_gen_plantillahcm_pkey PRIMARY KEY (id);


--
-- Name: informeauditoria informeauditoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informeauditoria
    ADD CONSTRAINT informeauditoria_pkey PRIMARY KEY (id);


--
-- Name: informeevaluacion informeevaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informeevaluacion
    ADD CONSTRAINT informeevaluacion_pkey PRIMARY KEY (id);


--
-- Name: informefinanciero informefinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informefinanciero
    ADD CONSTRAINT informefinanciero_pkey PRIMARY KEY (id);


--
-- Name: informenarrativo informenarrativo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informenarrativo
    ADD CONSTRAINT informenarrativo_pkey PRIMARY KEY (id);


--
-- Name: niveleducacion niveleducacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY niveleducacion
    ADD CONSTRAINT niveleducacion_pkey PRIMARY KEY (id);


--
-- Name: nivelrelacion nivelrelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nivelrelacion
    ADD CONSTRAINT nivelrelacion_pkey PRIMARY KEY (id);


--
-- Name: nucleoconflicto nucleoconflicto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nucleoconflicto
    ADD CONSTRAINT nucleoconflicto_pkey PRIMARY KEY (id);


--
-- Name: perfilprofesional perfilprofesional_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY perfilprofesional
    ADD CONSTRAINT perfilprofesional_pkey PRIMARY KEY (id);


--
-- Name: sip_persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: procesogh procesogh_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY procesogh
    ADD CONSTRAINT procesogh_pkey PRIMARY KEY (id);


--
-- Name: productopf productopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY productopf
    ADD CONSTRAINT productopf_pkey PRIMARY KEY (id);


--
-- Name: profesion profesion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT profesion_pkey PRIMARY KEY (id);


--
-- Name: proyectofinanciero_uresponsable proyectofinanciero_uresponsable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_uresponsable
    ADD CONSTRAINT proyectofinanciero_uresponsable_pkey PRIMARY KEY (id);


--
-- Name: proyectofinanciero_usuario proyectofinanciero_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_usuario
    ADD CONSTRAINT proyectofinanciero_usuario_pkey PRIMARY KEY (id);


--
-- Name: publicacion publicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY publicacion
    ADD CONSTRAINT publicacion_pkey PRIMARY KEY (id);


--
-- Name: redactor redactor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY redactor
    ADD CONSTRAINT redactor_pkey PRIMARY KEY (id);


--
-- Name: regiongrupo regiongrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY regiongrupo
    ADD CONSTRAINT regiongrupo_pkey PRIMARY KEY (id);


--
-- Name: sip_oficina regionsjr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_oficina
    ADD CONSTRAINT regionsjr_pkey PRIMARY KEY (id);


--
-- Name: sal7711_gen_articulo sal7711_gen_articulo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo
    ADD CONSTRAINT sal7711_gen_articulo_pkey PRIMARY KEY (id);


--
-- Name: sal7711_gen_bitacora sal7711_gen_bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_bitacora
    ADD CONSTRAINT sal7711_gen_bitacora_pkey PRIMARY KEY (id);


--
-- Name: sal7711_gen_categoriaprensa sal7711_gen_categoriaprensa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_categoriaprensa
    ADD CONSTRAINT sal7711_gen_categoriaprensa_pkey PRIMARY KEY (id);


--
-- Name: sectoractor sectoractor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectoractor
    ADD CONSTRAINT sectoractor_pkey PRIMARY KEY (id);


--
-- Name: sectorapc sectorapc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sectorapc
    ADD CONSTRAINT sectorapc_pkey PRIMARY KEY (id);


--
-- Name: sip_clase sip_clase_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_id_key UNIQUE (id);


--
-- Name: sip_clase sip_clase_id_municipio_id_clalocal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_id_municipio_id_clalocal_key UNIQUE (id_municipio, id_clalocal);


--
-- Name: sip_clase sip_clase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_pkey PRIMARY KEY (id);


--
-- Name: sip_departamento sip_departamento_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_key UNIQUE (id);


--
-- Name: sip_departamento sip_departamento_id_pais_id_deplocal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_key UNIQUE (id_pais, id_deplocal);


--
-- Name: sip_departamento sip_departamento_id_pais_id_deplocal_key1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_key1 UNIQUE (id_pais, id_deplocal);


--
-- Name: sip_departamento sip_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT sip_departamento_pkey PRIMARY KEY (id);


--
-- Name: sip_fuenteprensa sip_fuenteprensa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_fuenteprensa
    ADD CONSTRAINT sip_fuenteprensa_pkey PRIMARY KEY (id);


--
-- Name: sip_grupo sip_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_grupo
    ADD CONSTRAINT sip_grupo_pkey PRIMARY KEY (id);


--
-- Name: sip_municipio sip_municipio_id_departamento_id_munlocal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_id_departamento_id_munlocal_key UNIQUE (id_departamento, id_munlocal);


--
-- Name: sip_municipio sip_municipio_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_id_key UNIQUE (id);


--
-- Name: sip_municipio sip_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_pkey PRIMARY KEY (id);


--
-- Name: sip_persona_trelacion sip_persona_trelacion_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_id_key UNIQUE (id);


--
-- Name: sip_persona_trelacion sip_persona_trelacion_persona1_persona2_id_trelacion_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_persona1_persona2_id_trelacion_key UNIQUE (persona1, persona2, id_trelacion);


--
-- Name: sip_persona_trelacion sip_persona_trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad sivel2_gen_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT sivel2_gen_actividad_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_rangoedadac sivel2_gen_actividad_rangoedadac_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_rangoedadac
    ADD CONSTRAINT sivel2_gen_actividad_rangoedadac_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadarea sivel2_gen_actividadarea_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadarea
    ADD CONSTRAINT sivel2_gen_actividadarea_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadareas_actividad sivel2_gen_actividadareas_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadareas_actividad
    ADD CONSTRAINT sivel2_gen_actividadareas_actividad_pkey PRIMARY KEY (id);


--
-- Name: sip_anexo sivel2_gen_anexoactividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_anexo
    ADD CONSTRAINT sivel2_gen_anexoactividad_pkey PRIMARY KEY (id);


--
-- Name: sip_pais sivel2_gen_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_pais
    ADD CONSTRAINT sivel2_gen_pais_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_rangoedadac sivel2_gen_rangoedadac_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_rangoedadac
    ADD CONSTRAINT sivel2_gen_rangoedadac_pkey PRIMARY KEY (id);


--
-- Name: sip_tdocumento sivel2_gen_tdocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tdocumento
    ADD CONSTRAINT sivel2_gen_tdocumento_pkey PRIMARY KEY (id);


--
-- Name: tasacambio tasacambio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tasacambio
    ADD CONSTRAINT tasacambio_pkey PRIMARY KEY (id);


--
-- Name: sip_tclase tclase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tclase
    ADD CONSTRAINT tclase_pkey PRIMARY KEY (id);


--
-- Name: tipoanexo tipoanexo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipoanexo
    ADD CONSTRAINT tipoanexo_pkey PRIMARY KEY (id);


--
-- Name: tipocontrato tipocontrato_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipocontrato
    ADD CONSTRAINT tipocontrato_pkey PRIMARY KEY (id);


--
-- Name: tipoconvenio tipoconvenio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipoconvenio
    ADD CONSTRAINT tipoconvenio_pkey PRIMARY KEY (id);


--
-- Name: tipomoneda tipomoneda_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipomoneda
    ADD CONSTRAINT tipomoneda_pkey PRIMARY KEY (id);


--
-- Name: tiponomina tiponomina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tiponomina
    ADD CONSTRAINT tiponomina_pkey PRIMARY KEY (id);


--
-- Name: tipoproductopf tipoproductopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipoproductopf
    ADD CONSTRAINT tipoproductopf_pkey PRIMARY KEY (id);


--
-- Name: sip_trelacion trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_trelacion
    ADD CONSTRAINT trelacion_pkey PRIMARY KEY (id);


--
-- Name: sip_tsitio tsitio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_tsitio
    ADD CONSTRAINT tsitio_pkey PRIMARY KEY (id);


--
-- Name: sip_ubicacion ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: vinculacion vinculacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vinculacion
    ADD CONSTRAINT vinculacion_pkey PRIMARY KEY (id);


--
-- Name: index_actor_on_pais_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_actor_on_pais_id ON actor USING btree (pais_id);


--
-- Name: index_cor1440_gen_actividad_sip_anexo_on_anexo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cor1440_gen_actividad_sip_anexo_on_anexo_id ON cor1440_gen_actividad_sip_anexo USING btree (anexo_id);


--
-- Name: index_heb412_gen_doc_on_tdoc_type_and_tdoc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_heb412_gen_doc_on_tdoc_type_and_tdoc_id ON heb412_gen_doc USING btree (tdoc_type, tdoc_id);


--
-- Name: index_sivel2_gen_actividad_on_rangoedadac_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_on_rangoedadac_id ON cor1440_gen_actividad USING btree (rangoedadac_id);


--
-- Name: index_sivel2_gen_actividad_on_usuario_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_on_usuario_id ON cor1440_gen_actividad USING btree (usuario_id);


--
-- Name: index_sivel2_gen_actividad_rangoedadac_on_actividad_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_rangoedadac_on_actividad_id ON cor1440_gen_actividad_rangoedadac USING btree (actividad_id);


--
-- Name: index_sivel2_gen_actividad_rangoedadac_on_rangoedadac_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_rangoedadac_on_rangoedadac_id ON cor1440_gen_actividad_rangoedadac USING btree (rangoedadac_id);


--
-- Name: index_usuario_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_usuario_on_email ON usuario USING btree (email);


--
-- Name: index_usuario_on_regionsjr_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_usuario_on_regionsjr_id ON usuario USING btree (regionsjr_id);


--
-- Name: index_usuario_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_usuario_on_reset_password_token ON usuario USING btree (reset_password_token);


--
-- Name: sip_busca_mundep; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sip_busca_mundep ON sip_mundep USING gin (mundep);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: usuario_nusuario; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX usuario_nusuario ON usuario USING btree (nusuario);


--
-- Name: cor1440_gen_actividad actividad_regionsjr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT actividad_regionsjr_id_fkey FOREIGN KEY (oficina_id) REFERENCES sip_oficina(id);


--
-- Name: sip_clase clase_id_tclase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT clase_id_tclase_fkey FOREIGN KEY (id_tclase) REFERENCES sip_tclase(id);


--
-- Name: cor1440_gen_actividad cor1440_gen_actividad_usuario_lf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT cor1440_gen_actividad_usuario_lf FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: cor1440_gen_actividad_actividadtipo cor1440_gen_actividadtipo_actividad_actividad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_actividad_actividad_id_fkey FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_actividad_actividadtipo cor1440_gen_actividadtipo_actividad_actividadtipo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_actividad_actividadtipo_id_fkey FOREIGN KEY (actividadtipo_id) REFERENCES cor1440_gen_actividadtipo(id);


--
-- Name: sip_departamento departamento_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_departamento
    ADD CONSTRAINT departamento_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: productopf fk_rails_005c6efcb9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY productopf
    ADD CONSTRAINT fk_rails_005c6efcb9 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad_valorcampotind fk_rails_0104bf757c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_valorcampotind
    ADD CONSTRAINT fk_rails_0104bf757c FOREIGN KEY (valorcampotind_id) REFERENCES cor1440_gen_valorcampotind(id);


--
-- Name: actor_sectoractor fk_rails_01abd767ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor_sectoractor
    ADD CONSTRAINT fk_rails_01abd767ad FOREIGN KEY (sectoractor_id) REFERENCES sectoractor(id);


--
-- Name: oficina_proyectofinanciero fk_rails_01cc410e26; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oficina_proyectofinanciero
    ADD CONSTRAINT fk_rails_01cc410e26 FOREIGN KEY (oficina_id) REFERENCES sip_oficina(id);


--
-- Name: cor1440_gen_mindicadorpf fk_rails_06564b910d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_mindicadorpf
    ADD CONSTRAINT fk_rails_06564b910d FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_resultadopf fk_rails_06ba24bd54; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_resultadopf
    ADD CONSTRAINT fk_rails_06ba24bd54 FOREIGN KEY (objetivopf_id) REFERENCES cor1440_gen_objetivopf(id);


--
-- Name: proyectofinanciero_usuario fk_rails_06be7b769b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_06be7b769b FOREIGN KEY (perfilprofesional_id) REFERENCES perfilprofesional(id);


--
-- Name: cor1440_gen_actividad_actividadpf fk_rails_08b9aa072b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_actividadpf
    ADD CONSTRAINT fk_rails_08b9aa072b FOREIGN KEY (actividadpf_id) REFERENCES cor1440_gen_actividadpf(id);


--
-- Name: cor1440_gen_actividadpf fk_rails_0b10834ba7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadpf
    ADD CONSTRAINT fk_rails_0b10834ba7 FOREIGN KEY (resultadopf_id) REFERENCES cor1440_gen_resultadopf(id);


--
-- Name: cor1440_gen_financiador_proyectofinanciero fk_rails_0cd09d688c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_financiador_proyectofinanciero
    ADD CONSTRAINT fk_rails_0cd09d688c FOREIGN KEY (financiador_id) REFERENCES cor1440_gen_financiador(id);


--
-- Name: informeevaluacion fk_rails_0dc2f89fdb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informeevaluacion
    ADD CONSTRAINT fk_rails_0dc2f89fdb FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: anexo_proyectofinanciero fk_rails_0ea362f58d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_0ea362f58d FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: contextoinv fk_rails_0fa44160c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contextoinv
    ADD CONSTRAINT fk_rails_0fa44160c3 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: cor1440_gen_mindicadorpf fk_rails_0fbac6136b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_mindicadorpf
    ADD CONSTRAINT fk_rails_0fbac6136b FOREIGN KEY (indicadorpf_id) REFERENCES cor1440_gen_indicadorpf(id);


--
-- Name: usuario fk_rails_114b393d00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_114b393d00 FOREIGN KEY (perfilprofesional_id) REFERENCES perfilprofesional(id);


--
-- Name: actor fk_rails_1a67af6964; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT fk_rails_1a67af6964 FOREIGN KEY (nivelrelacion_id) REFERENCES nivelrelacion(id);


--
-- Name: heb412_gen_campohc fk_rails_1e5f26c999; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_campohc
    ADD CONSTRAINT fk_rails_1e5f26c999 FOREIGN KEY (doc_id) REFERENCES heb412_gen_doc(id);


--
-- Name: informefinanciero fk_rails_1f7068d549; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informefinanciero
    ADD CONSTRAINT fk_rails_1f7068d549 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad fk_rails_20940a21f8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_20940a21f8 FOREIGN KEY (nucleoconflicto_id) REFERENCES nucleoconflicto(id);


--
-- Name: grupo_subgrupo fk_rails_20cec9f9a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_subgrupo
    ADD CONSTRAINT fk_rails_20cec9f9a1 FOREIGN KEY (grupo_id) REFERENCES sip_grupo(id);


--
-- Name: actividad_grupo fk_rails_214969d697; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_grupo
    ADD CONSTRAINT fk_rails_214969d697 FOREIGN KEY (grupo_id) REFERENCES sip_grupo(id);


--
-- Name: sip_grupo fk_rails_2562d186cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_grupo
    ADD CONSTRAINT fk_rails_2562d186cc FOREIGN KEY (procesogh_id) REFERENCES procesogh(id);


--
-- Name: usuario fk_rails_272649683b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_272649683b FOREIGN KEY (niveleducacion_id) REFERENCES niveleducacion(id);


--
-- Name: proyectofinanciero_uresponsable fk_rails_272a913d18; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_uresponsable
    ADD CONSTRAINT fk_rails_272a913d18 FOREIGN KEY (uresponsable_id) REFERENCES usuario(id);


--
-- Name: cor1440_gen_campotind fk_rails_2770ce966d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_campotind
    ADD CONSTRAINT fk_rails_2770ce966d FOREIGN KEY (tipoindicador_id) REFERENCES cor1440_gen_tipoindicador(id);


--
-- Name: proyectofinanciero_usuario fk_rails_28225d4dc2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_28225d4dc2 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: cor1440_gen_informe fk_rails_294895347e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_informe
    ADD CONSTRAINT fk_rails_294895347e FOREIGN KEY (filtroproyecto) REFERENCES cor1440_gen_proyecto(id);


--
-- Name: cor1440_gen_actividad fk_rails_2983c828da; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_2983c828da FOREIGN KEY (redactor_id) REFERENCES redactor(id);


--
-- Name: cor1440_gen_informe fk_rails_2bd685d2b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_informe
    ADD CONSTRAINT fk_rails_2bd685d2b3 FOREIGN KEY (filtroresponsable) REFERENCES usuario(id);


--
-- Name: heb412_gen_doc fk_rails_2dd6d3dac3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_doc
    ADD CONSTRAINT fk_rails_2dd6d3dac3 FOREIGN KEY (dirpapa) REFERENCES heb412_gen_doc(id);


--
-- Name: actor_regiongrupo fk_rails_2e83e09369; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor_regiongrupo
    ADD CONSTRAINT fk_rails_2e83e09369 FOREIGN KEY (regiongrupo_id) REFERENCES regiongrupo(id);


--
-- Name: cor1440_gen_valorcampoact fk_rails_3060a94455; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_valorcampoact
    ADD CONSTRAINT fk_rails_3060a94455 FOREIGN KEY (campoact_id) REFERENCES cor1440_gen_campoact(id);


--
-- Name: contrato fk_rails_31397bfaea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contrato
    ADD CONSTRAINT fk_rails_31397bfaea FOREIGN KEY (tipocontrato_id) REFERENCES tipocontrato(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_3792591d9e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_3792591d9e FOREIGN KEY (sectorapc_id) REFERENCES sectorapc(id);


--
-- Name: efecto_valorcampotind fk_rails_3881614cfb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto_valorcampotind
    ADD CONSTRAINT fk_rails_3881614cfb FOREIGN KEY (valorcampotind_id) REFERENCES cor1440_gen_valorcampotind(id);


--
-- Name: cor1440_gen_actividad_proyecto fk_rails_395faa0882; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto
    ADD CONSTRAINT fk_rails_395faa0882 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: productopf fk_rails_3abca040a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY productopf
    ADD CONSTRAINT fk_rails_3abca040a4 FOREIGN KEY (tipoproductopf_id) REFERENCES tipoproductopf(id);


--
-- Name: anexo_proyectofinanciero fk_rails_3b2f5808be; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_3b2f5808be FOREIGN KEY (tipoanexo_id) REFERENCES tipoanexo(id);


--
-- Name: actividad_grupo fk_rails_3d3c43f06c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_grupo
    ADD CONSTRAINT fk_rails_3d3c43f06c FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: proyectofinanciero_usuario fk_rails_3f5055fb42; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_3f5055fb42 FOREIGN KEY (cargo_id) REFERENCES cargo(id);


--
-- Name: cor1440_gen_informe fk_rails_40cb623d50; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_informe
    ADD CONSTRAINT fk_rails_40cb623d50 FOREIGN KEY (filtroproyectofinanciero) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: efecto_valorcampotind fk_rails_43198ca4c9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto_valorcampotind
    ADD CONSTRAINT fk_rails_43198ca4c9 FOREIGN KEY (efecto_id) REFERENCES efecto(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_4473f9ee28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_4473f9ee28 FOREIGN KEY (respgp_id) REFERENCES usuario(id);


--
-- Name: cor1440_gen_actividad fk_rails_45dcda8048; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_45dcda8048 FOREIGN KEY (contextoinv_id) REFERENCES contextoinv(id);


--
-- Name: usuario fk_rails_46c248bf39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_46c248bf39 FOREIGN KEY (labdepartamento_id) REFERENCES sip_departamento(id);


--
-- Name: informenarrativo fk_rails_473bd646f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informenarrativo
    ADD CONSTRAINT fk_rails_473bd646f9 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: grupo_proyectofinanciero fk_rails_488261d2c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_proyectofinanciero
    ADD CONSTRAINT fk_rails_488261d2c6 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad_sip_anexo fk_rails_49ec1ae361; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT fk_rails_49ec1ae361 FOREIGN KEY (anexo_id) REFERENCES sip_anexo(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_4a0bd96143; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_4a0bd96143 FOREIGN KEY (objetivopf_id) REFERENCES cor1440_gen_objetivopf(id);


--
-- Name: oficina_proyectofinanciero fk_rails_4a1ff4a976; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oficina_proyectofinanciero
    ADD CONSTRAINT fk_rails_4a1ff4a976 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_valorcampotind fk_rails_4f2fc96457; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_valorcampotind
    ADD CONSTRAINT fk_rails_4f2fc96457 FOREIGN KEY (campotind_id) REFERENCES cor1440_gen_campotind(id);


--
-- Name: cor1440_gen_actividad_proyectofinanciero fk_rails_524486e06b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyectofinanciero
    ADD CONSTRAINT fk_rails_524486e06b FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: sal7711_gen_bitacora fk_rails_52d9d2f700; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_bitacora
    ADD CONSTRAINT fk_rails_52d9d2f700 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: actividad_nucleoconflicto fk_rails_55868fbce2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_nucleoconflicto
    ADD CONSTRAINT fk_rails_55868fbce2 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: actividad_actor fk_rails_56bdc49b83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_actor
    ADD CONSTRAINT fk_rails_56bdc49b83 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_objetivopf fk_rails_57b4fd8780; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_objetivopf
    ADD CONSTRAINT fk_rails_57b4fd8780 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: anexo_efecto fk_rails_5a3da48239; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_efecto
    ADD CONSTRAINT fk_rails_5a3da48239 FOREIGN KEY (efecto_id) REFERENCES efecto(id);


--
-- Name: coordinador_proyectofinanciero fk_rails_5a7dd1dd10; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinador_proyectofinanciero
    ADD CONSTRAINT fk_rails_5a7dd1dd10 FOREIGN KEY (coordinador_id) REFERENCES usuario(id);


--
-- Name: profesion fk_rails_5bb470dd0c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT fk_rails_5bb470dd0c FOREIGN KEY (areaestudios_id) REFERENCES areaestudios(id);


--
-- Name: actividad_publicacion fk_rails_60dbe4c315; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_publicacion
    ADD CONSTRAINT fk_rails_60dbe4c315 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: sal7711_gen_articulo fk_rails_65eae7449f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_65eae7449f FOREIGN KEY (departamento_id) REFERENCES sip_departamento(id);


--
-- Name: informeauditoria fk_rails_67f52ffcf6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY informeauditoria
    ADD CONSTRAINT fk_rails_67f52ffcf6 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: vinculacion fk_rails_698ada5273; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vinculacion
    ADD CONSTRAINT fk_rails_698ada5273 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: cor1440_gen_pmindicadorpf fk_rails_701d924c54; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_pmindicadorpf
    ADD CONSTRAINT fk_rails_701d924c54 FOREIGN KEY (mindicadorpf_id) REFERENCES cor1440_gen_mindicadorpf(id);


--
-- Name: tipomoneda fk_rails_70898623bb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipomoneda
    ADD CONSTRAINT fk_rails_70898623bb FOREIGN KEY (pais_id) REFERENCES sip_pais(id);


--
-- Name: sip_grupo_usuario fk_rails_734ee21e62; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_grupo_usuario
    ADD CONSTRAINT fk_rails_734ee21e62 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: anexo_proyectofinanciero fk_rails_756688ae2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_756688ae2b FOREIGN KEY (anexo_id) REFERENCES sip_anexo(id);


--
-- Name: convenio fk_rails_77dbba47fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY convenio
    ADD CONSTRAINT fk_rails_77dbba47fe FOREIGN KEY (tipoconvenio_id) REFERENCES tipoconvenio(id);


--
-- Name: usuario fk_rails_7947b08826; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_7947b08826 FOREIGN KEY (persona_id) REFERENCES sip_persona(id);


--
-- Name: cor1440_gen_actividad_objetivopf fk_rails_79e913c753; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_objetivopf
    ADD CONSTRAINT fk_rails_79e913c753 FOREIGN KEY (objetivopf_id) REFERENCES cor1440_gen_objetivopf(id);


--
-- Name: sal7711_gen_articulo_categoriaprensa fk_rails_7d1213c35b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo_categoriaprensa
    ADD CONSTRAINT fk_rails_7d1213c35b FOREIGN KEY (articulo_id) REFERENCES sal7711_gen_articulo(id);


--
-- Name: actividad_actor fk_rails_7ebb208867; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_actor
    ADD CONSTRAINT fk_rails_7ebb208867 FOREIGN KEY (actor_id) REFERENCES actor(id);


--
-- Name: cor1440_gen_actividad fk_rails_8196c53609; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_8196c53609 FOREIGN KEY (departamento_id) REFERENCES sip_departamento(id);


--
-- Name: proyectofinanciero_uresponsable fk_rails_824959275e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_uresponsable
    ADD CONSTRAINT fk_rails_824959275e FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: usuario fk_rails_824d7925ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_824d7925ee FOREIGN KEY (profesion_id) REFERENCES profesion(id);


--
-- Name: tasacambio fk_rails_834c638220; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tasacambio
    ADD CONSTRAINT fk_rails_834c638220 FOREIGN KEY (tipomoneda_id) REFERENCES tipomoneda(id);


--
-- Name: usuario fk_rails_83add769ae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_83add769ae FOREIGN KEY (contrato_id) REFERENCES contrato(id);


--
-- Name: actor_sectoractor fk_rails_8718e4c155; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor_sectoractor
    ADD CONSTRAINT fk_rails_8718e4c155 FOREIGN KEY (actor_id) REFERENCES actor(id);


--
-- Name: sip_grupo_usuario fk_rails_8d24f7c1c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_grupo_usuario
    ADD CONSTRAINT fk_rails_8d24f7c1c0 FOREIGN KEY (sip_grupo_id) REFERENCES sip_grupo(id);


--
-- Name: cor1440_gen_actividad_objetivopf fk_rails_8d665a528c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_objetivopf
    ADD CONSTRAINT fk_rails_8d665a528c FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_cambiosproyectofinanciero fk_rails_8df1f2e905; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_cambiosproyectofinanciero
    ADD CONSTRAINT fk_rails_8df1f2e905 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: sal7711_gen_articulo fk_rails_8e3e0703f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_8e3e0703f9 FOREIGN KEY (municipio_id) REFERENCES sip_municipio(id);


--
-- Name: regiongrupo fk_rails_907d221630; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY regiongrupo
    ADD CONSTRAINT fk_rails_907d221630 FOREIGN KEY (grupo_id) REFERENCES sip_grupo(id);


--
-- Name: cor1440_gen_resultadopf fk_rails_95485cfc7a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_resultadopf
    ADD CONSTRAINT fk_rails_95485cfc7a FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: usuario fk_rails_969301a776; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_969301a776 FOREIGN KEY (empresaps_id) REFERENCES empresaps(id);


--
-- Name: sal7711_gen_articulo fk_rails_97ebadca1b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_97ebadca1b FOREIGN KEY (pais_id) REFERENCES sip_pais(id);


--
-- Name: efecto fk_rails_9b37deb543; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto
    ADD CONSTRAINT fk_rails_9b37deb543 FOREIGN KEY (indicadorpf_id) REFERENCES cor1440_gen_indicadorpf(id);


--
-- Name: cor1440_gen_financiador fk_rails_9daa099154; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_financiador
    ADD CONSTRAINT fk_rails_9daa099154 FOREIGN KEY (pais_id) REFERENCES sip_pais(id);


--
-- Name: anexo_efecto fk_rails_a3fa2e726c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_efecto
    ADD CONSTRAINT fk_rails_a3fa2e726c FOREIGN KEY (anexo_id) REFERENCES sip_anexo(id);


--
-- Name: proyectofinanciero_usuario fk_rails_a4c07cb119; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_a4c07cb119 FOREIGN KEY (tipocontrato_id) REFERENCES tipocontrato(id);


--
-- Name: cor1440_gen_actividad_proyectofinanciero fk_rails_a8489e0d62; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyectofinanciero
    ADD CONSTRAINT fk_rails_a8489e0d62 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_cambiosproyectofinanciero fk_rails_ad88a8cfe6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_cambiosproyectofinanciero
    ADD CONSTRAINT fk_rails_ad88a8cfe6 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: anexo_usuario fk_rails_aee8dfa79a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_usuario
    ADD CONSTRAINT fk_rails_aee8dfa79a FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: actividad_publicacion fk_rails_afe68ea314; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_publicacion
    ADD CONSTRAINT fk_rails_afe68ea314 FOREIGN KEY (publicacion_id) REFERENCES publicacion(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_b5b70fb7f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_b5b70fb7f7 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad_actividadpf fk_rails_baad271930; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_actividadpf
    ADD CONSTRAINT fk_rails_baad271930 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: usuario fk_rails_bc35a29f9e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_bc35a29f9e FOREIGN KEY (labmunicipio_id) REFERENCES sip_municipio(id);


--
-- Name: cor1440_gen_informe fk_rails_c02831dd89; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_informe
    ADD CONSTRAINT fk_rails_c02831dd89 FOREIGN KEY (filtroactividadarea) REFERENCES cor1440_gen_actividadarea(id);


--
-- Name: anexo_usuario fk_rails_c1def44150; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY anexo_usuario
    ADD CONSTRAINT fk_rails_c1def44150 FOREIGN KEY (anexo_id) REFERENCES sip_anexo(id);


--
-- Name: usuario fk_rails_c280879a8f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_c280879a8f FOREIGN KEY (fondopensiones_id) REFERENCES fondopensiones(id);


--
-- Name: contextoinv fk_rails_c2808a2b4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contextoinv
    ADD CONSTRAINT fk_rails_c2808a2b4f FOREIGN KEY (regiongrupo_id) REFERENCES regiongrupo(id);


--
-- Name: grupo_subgrupo fk_rails_c29a37734f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_subgrupo
    ADD CONSTRAINT fk_rails_c29a37734f FOREIGN KEY (subgrupo_id) REFERENCES sip_grupo(id);


--
-- Name: cor1440_gen_actividadpf fk_rails_c68e2278b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadpf
    ADD CONSTRAINT fk_rails_c68e2278b2 FOREIGN KEY (actividadtipo_id) REFERENCES cor1440_gen_actividadtipo(id);


--
-- Name: proyectofinanciero_usuario fk_rails_c719ad1d65; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_c719ad1d65 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: tipocontrato fk_rails_c7b9a3fdfa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipocontrato
    ADD CONSTRAINT fk_rails_c7b9a3fdfa FOREIGN KEY (tiponomina_id) REFERENCES tiponomina(id);


--
-- Name: cor1440_gen_financiador_proyectofinanciero fk_rails_ca93eb04dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_financiador_proyectofinanciero
    ADD CONSTRAINT fk_rails_ca93eb04dc FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: actividad_nucleoconflicto fk_rails_cb90ade2a0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actividad_nucleoconflicto
    ADD CONSTRAINT fk_rails_cb90ade2a0 FOREIGN KEY (nucleoconflicto_id) REFERENCES nucleoconflicto(id);


--
-- Name: actor_regiongrupo fk_rails_cbc36271a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor_regiongrupo
    ADD CONSTRAINT fk_rails_cbc36271a1 FOREIGN KEY (actor_id) REFERENCES actor(id);


--
-- Name: cor1440_gen_actividad_sip_anexo fk_rails_cc9d44f9de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT fk_rails_cc9d44f9de FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_campoact fk_rails_ceb6f1a7f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_campoact
    ADD CONSTRAINT fk_rails_ceb6f1a7f0 FOREIGN KEY (actividadtipo_id) REFERENCES cor1440_gen_actividadtipo(id);


--
-- Name: actor fk_rails_cf09fb308c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor
    ADD CONSTRAINT fk_rails_cf09fb308c FOREIGN KEY (pais_id) REFERENCES sip_pais(id);


--
-- Name: cor1440_gen_actividad_proyecto fk_rails_cf5d592625; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_proyecto
    ADD CONSTRAINT fk_rails_cf5d592625 FOREIGN KEY (proyecto_id) REFERENCES cor1440_gen_proyecto(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_cf888d1b56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_cf888d1b56 FOREIGN KEY (tipoindicador_id) REFERENCES cor1440_gen_tipoindicador(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_d0ff83bfc6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_d0ff83bfc6 FOREIGN KEY (tipomoneda_id) REFERENCES tipomoneda(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_d264d408b0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_d264d408b0 FOREIGN KEY (resultadopf_id) REFERENCES cor1440_gen_resultadopf(id);


--
-- Name: sal7711_gen_articulo fk_rails_d3b628101f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_d3b628101f FOREIGN KEY (fuenteprensa_id) REFERENCES sip_fuenteprensa(id);


--
-- Name: cor1440_gen_actividad fk_rails_d4a4fff34a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_d4a4fff34a FOREIGN KEY (creadopor_id) REFERENCES usuario(id);


--
-- Name: actor_grupo fk_rails_d790f09b08; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor_grupo
    ADD CONSTRAINT fk_rails_d790f09b08 FOREIGN KEY (sip_grupo_id) REFERENCES sip_grupo(id);


--
-- Name: cor1440_gen_informe fk_rails_daf0af8605; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_informe
    ADD CONSTRAINT fk_rails_daf0af8605 FOREIGN KEY (filtrooficina) REFERENCES sip_oficina(id);


--
-- Name: desembolso fk_rails_df556dc8d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY desembolso
    ADD CONSTRAINT fk_rails_df556dc8d1 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: heb412_gen_campoplantillahcm fk_rails_e0e38e0782; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY heb412_gen_campoplantillahcm
    ADD CONSTRAINT fk_rails_e0e38e0782 FOREIGN KEY (plantillahcm_id) REFERENCES heb412_gen_plantillahcm(id);


--
-- Name: grupo_proyectofinanciero fk_rails_e0f6406d5d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY grupo_proyectofinanciero
    ADD CONSTRAINT fk_rails_e0f6406d5d FOREIGN KEY (grupo_id) REFERENCES sip_grupo(id);


--
-- Name: cor1440_gen_valorcampoact fk_rails_e36cf046d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_valorcampoact
    ADD CONSTRAINT fk_rails_e36cf046d1 FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: actor_grupo fk_rails_e37d7223f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY actor_grupo
    ADD CONSTRAINT fk_rails_e37d7223f1 FOREIGN KEY (actor_id) REFERENCES actor(id);


--
-- Name: efecto fk_rails_e7b8b0f924; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY efecto
    ADD CONSTRAINT fk_rails_e7b8b0f924 FOREIGN KEY (actor_id) REFERENCES actor(id);


--
-- Name: cor1440_gen_actividad_valorcampotind fk_rails_e8cd697f5d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad_valorcampotind
    ADD CONSTRAINT fk_rails_e8cd697f5d FOREIGN KEY (actividad_id) REFERENCES cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_actividad fk_rails_f2cb2f1031; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_f2cb2f1031 FOREIGN KEY (municipio_id) REFERENCES sip_municipio(id);


--
-- Name: cor1440_gen_actividadpf fk_rails_f941b0c512; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_actividadpf
    ADD CONSTRAINT fk_rails_f941b0c512 FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: usuario fk_rails_fa2bc91a6c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_fa2bc91a6c FOREIGN KEY (cajacompensacion_id) REFERENCES cajacompensacion(id);


--
-- Name: coordinador_proyectofinanciero fk_rails_fab0c162ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coordinador_proyectofinanciero
    ADD CONSTRAINT fk_rails_fab0c162ed FOREIGN KEY (proyectofinanciero_id) REFERENCES cor1440_gen_proyectofinanciero(id);


--
-- Name: sal7711_gen_articulo_categoriaprensa fk_rails_fcf649bab3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sal7711_gen_articulo_categoriaprensa
    ADD CONSTRAINT fk_rails_fcf649bab3 FOREIGN KEY (categoriaprensa_id) REFERENCES sal7711_gen_categoriaprensa(id);


--
-- Name: usuario fk_rails_ff046f92e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT fk_rails_ff046f92e5 FOREIGN KEY (oficina_id) REFERENCES sip_oficina(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_ffc5f844f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_ffc5f844f0 FOREIGN KEY (respgp2_id) REFERENCES usuario(id);


--
-- Name: sip_persona persona_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: sip_persona persona_nacionalde_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_nacionalde_fkey FOREIGN KEY (nacionalde) REFERENCES sip_pais(id);


--
-- Name: sip_persona persona_tdocumento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT persona_tdocumento_id_fkey FOREIGN KEY (tdocumento_id) REFERENCES sip_tdocumento(id);


--
-- Name: sip_persona_trelacion persona_trelacion_id_trelacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_id_trelacion_fkey FOREIGN KEY (id_trelacion) REFERENCES sip_trelacion(id);


--
-- Name: sip_persona_trelacion persona_trelacion_persona1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona1_fkey FOREIGN KEY (persona1) REFERENCES sip_persona(id);


--
-- Name: sip_persona_trelacion persona_trelacion_persona2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona2_fkey FOREIGN KEY (persona2) REFERENCES sip_persona(id);


--
-- Name: sip_clase sip_clase_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_clase
    ADD CONSTRAINT sip_clase_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: sip_municipio sip_municipio_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_municipio
    ADD CONSTRAINT sip_municipio_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: sip_persona sip_persona_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT sip_persona_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES sip_clase(id);


--
-- Name: sip_persona sip_persona_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT sip_persona_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: sip_persona sip_persona_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_persona
    ADD CONSTRAINT sip_persona_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: sip_ubicacion sip_ubicacion_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES sip_clase(id);


--
-- Name: sip_ubicacion sip_ubicacion_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES sip_departamento(id);


--
-- Name: sip_ubicacion sip_ubicacion_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES sip_municipio(id);


--
-- Name: sip_trelacion trelacion_inverso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_trelacion
    ADD CONSTRAINT trelacion_inverso_fkey FOREIGN KEY (inverso) REFERENCES sip_trelacion(id);


--
-- Name: sip_ubicacion ubicacion_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES sip_pais(id);


--
-- Name: sip_ubicacion ubicacion_id_tsitio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sip_ubicacion
    ADD CONSTRAINT ubicacion_id_tsitio_fkey FOREIGN KEY (id_tsitio) REFERENCES sip_tsitio(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20131128151014'),
('20131204135932'),
('20131204140000'),
('20131204143718'),
('20131204183530'),
('20131206081531'),
('20131210221541'),
('20131220103409'),
('20131223175141'),
('20140117212555'),
('20140129151136'),
('20140207102709'),
('20140207102739'),
('20140211162355'),
('20140211164659'),
('20140211172443'),
('20140313012209'),
('20140514142421'),
('20140518120059'),
('20140527110223'),
('20140528043115'),
('20140613044320'),
('20140704035033'),
('20140804194616'),
('20140804200235'),
('20140804202100'),
('20140804202101'),
('20140804202958'),
('20140804210000'),
('20140815111351'),
('20140815111352'),
('20140815121224'),
('20140815123542'),
('20140815124157'),
('20140815124606'),
('20140827142659'),
('20140901105741'),
('20140901106000'),
('20140909165233'),
('20140918115412'),
('20140922102737'),
('20140922110956'),
('20141002140242'),
('20141111102451'),
('20141111203313'),
('20141126085907'),
('20150217185859'),
('20150217195008'),
('20150217215359'),
('20150413000000'),
('20150413160156'),
('20150413160157'),
('20150413160158'),
('20150413160159'),
('20150416074423'),
('20150416090140'),
('20150416095646'),
('20150416101228'),
('20150417071153'),
('20150417180000'),
('20150417180314'),
('20150419000000'),
('20150420104520'),
('20150420110000'),
('20150420125522'),
('20150420153835'),
('20150420200255'),
('20150503120915'),
('20150510125926'),
('20150510130031'),
('20150513112126'),
('20150513130058'),
('20150513130510'),
('20150513160835'),
('20150520115257'),
('20150521092657'),
('20150521181918'),
('20150521191227'),
('20150521193040'),
('20150521203631'),
('20150521223501'),
('20150528100944'),
('20150603181900'),
('20150604101858'),
('20150604102321'),
('20150624200701'),
('20150630042537'),
('20150630130814'),
('20150630214251'),
('20150630221321'),
('20150630221909'),
('20150630222017'),
('20150630224704'),
('20150630230130'),
('20150630230134'),
('20150702224217'),
('20150706172733'),
('20150706173649'),
('20150707164448'),
('20150709203137'),
('20150710012947'),
('20150710114451'),
('20150716085420'),
('20150717101243'),
('20150720115701'),
('20150720120236'),
('20150724003736'),
('20150803082520'),
('20150809032138'),
('20150819173047'),
('20151020203421'),
('20151030154449'),
('20151030154458'),
('20151030181131'),
('20160118101511'),
('20160202103751'),
('20160218102246'),
('20160218103000'),
('20160218144545'),
('20160223140842'),
('20160225093706'),
('20160225110056'),
('20160228133005'),
('20160229033451'),
('20160229081458'),
('20160229082436'),
('20160302142500'),
('20160302151832'),
('20160302162638'),
('20160302164308'),
('20160302164823'),
('20160302164858'),
('20160302165021'),
('20160302175724'),
('20160308104749'),
('20160308110000'),
('20160308115000'),
('20160308115001'),
('20160308135905'),
('20160308213334'),
('20160328153309'),
('20160518025044'),
('20160519195544'),
('20160616024857'),
('20160617030012'),
('20160621113440'),
('20160621125127'),
('20160628222616'),
('20160802134021'),
('20160805103310'),
('20160921112808'),
('20161009111443'),
('20161010152631'),
('20161019185830'),
('20161026110802'),
('20161027233011'),
('20161103080156'),
('20161103081041'),
('20161103083352'),
('20161108102349'),
('20161212175928'),
('20170327132108'),
('20170328172001'),
('20170329153630'),
('20170405104322'),
('20170413185012'),
('20170414035328'),
('20170417131432'),
('20170418143627'),
('20170419010845'),
('20170419135948'),
('20170422182531'),
('20170429035047'),
('20170501142000'),
('20170501142001'),
('20170501142638'),
('20170501144508'),
('20170501215130'),
('20170509120707'),
('20170509124538'),
('20170509133803'),
('20170509140334'),
('20170509140949'),
('20170516152206'),
('20170607125033'),
('20170629211019'),
('20170710082318'),
('20170720185946'),
('20170728131150'),
('20170810040012'),
('20170810183757'),
('20170812044235'),
('20170816100923'),
('20170817111035'),
('20170817122026'),
('20170823205820'),
('20170828104454'),
('20170912133101'),
('20170919113357'),
('20171011212156'),
('20171011213037'),
('20171011213405'),
('20171011213548'),
('20171019133203'),
('20171026121737'),
('20171026130000'),
('20171026144919'),
('20171026172501'),
('20171114185712'),
('20171123212504'),
('20171128234148'),
('20171130125044'),
('20171130133741'),
('20171130171954'),
('20171209014535'),
('20171211144559'),
('20171211161743'),
('20171212001011'),
('20171217135318'),
('20171217140031'),
('20171219122432'),
('20180108210001'),
('20180118104000'),
('20180119212433'),
('20180129024117'),
('20180203032539'),
('20180203035955'),
('20180203102441'),
('20180205032945'),
('20180205033819'),
('20180205110747'),
('20180205160644'),
('20180205161933'),
('20180211002048'),
('20180212015402'),
('20180212223621'),
('20180219032546'),
('20180220103644'),
('20180220104234'),
('20180223091622'),
('20180302163143'),
('20180303192259'),
('20180303200724'),
('20180313023554'),
('20180314142649'),
('20180320230847'),
('20180330104304'),
('20180330151308'),
('20180330211214'),
('20180402214147'),
('20180406095207'),
('20180409085315'),
('20180409231903'),
('20180413210209'),
('20180413211849'),
('20180413213754'),
('20180414092457'),
('20180414095556'),
('20180414100044'),
('20180414100850'),
('20180416102122'),
('20180417023024'),
('20180417124259'),
('20180417150807'),
('20180417155830'),
('20180418005742'),
('20180418010010'),
('20180419210718'),
('20180419212113'),
('20180419222803'),
('20180419225552'),
('20180420011442'),
('20180420162929'),
('20180420190517'),
('20180420200319'),
('20180420201358'),
('20180420203459'),
('20180424112441'),
('20180424184600'),
('20180424192034'),
('20180425114343'),
('20180425122603'),
('20180425124530'),
('20180425135438'),
('20180425140915'),
('20180425140955'),
('20180425142817'),
('20180426132957'),
('20180426134701'),
('20180427160857'),
('20180427194732'),
('20180427235322'),
('20180501225617');


