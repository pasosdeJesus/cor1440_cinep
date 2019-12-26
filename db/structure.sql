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
-- Name: es_co_utf_8; Type: COLLATION; Schema: public; Owner: -
--

CREATE COLLATION public.es_co_utf_8 (provider = libc, locale = 'es_CO.UTF-8');


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

CREATE FUNCTION public.soundexesp(input text) RETURNS text
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
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: actividad_actor_porborrar; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actividad_actor_porborrar (
    actividad_id integer NOT NULL,
    actor_id integer NOT NULL
);


--
-- Name: actividad_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actividad_grupo (
    actividad_id integer NOT NULL,
    grupo_id integer NOT NULL
);


--
-- Name: actividad_nucleoconflicto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actividad_nucleoconflicto (
    actividad_id integer NOT NULL,
    nucleoconflicto_id integer NOT NULL
);


--
-- Name: actividad_publicacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actividad_publicacion (
    actividad_id integer NOT NULL,
    publicacion_id integer NOT NULL
);


--
-- Name: actividadoficio_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.actividadoficio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: acto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.acto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: actor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actor (
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
    nivelrelacion_id integer,
    lineabase20182020 boolean DEFAULT false
);


--
-- Name: actor_efecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actor_efecto (
    actor_id bigint NOT NULL,
    efecto_id bigint NOT NULL
);


--
-- Name: actor_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actor_grupo (
    actor_id bigint NOT NULL,
    sip_grupo_id bigint NOT NULL
);


--
-- Name: actor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.actor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.actor_id_seq OWNED BY public.actor.id;


--
-- Name: actor_regiongrupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actor_regiongrupo (
    actor_id bigint NOT NULL,
    regiongrupo_id bigint NOT NULL
);


--
-- Name: actor_sectoractor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actor_sectoractor (
    actor_id integer NOT NULL,
    sectoractor_id integer NOT NULL
);


--
-- Name: actorsocial_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actorsocial_departamento (
    actorsocial_id bigint NOT NULL,
    departamento_id bigint NOT NULL
);


--
-- Name: actorsocial_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actorsocial_grupo (
    actorsocial_id bigint NOT NULL,
    grupo_id bigint NOT NULL
);


--
-- Name: actorsocial_municipio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actorsocial_municipio (
    actorsocial_id bigint NOT NULL,
    municipio_id bigint NOT NULL
);


--
-- Name: actorsocial_regiongrupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.actorsocial_regiongrupo (
    actorsocial_id bigint NOT NULL,
    regiongrupo_id bigint NOT NULL
);


--
-- Name: anexo_convenio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.anexo_convenio (
    id bigint NOT NULL,
    anexo_id integer,
    convenio_id integer
);


--
-- Name: anexo_convenio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.anexo_convenio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: anexo_convenio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.anexo_convenio_id_seq OWNED BY public.anexo_convenio.id;


--
-- Name: anexo_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.anexo_proyectofinanciero (
    id integer NOT NULL,
    anexo_id integer,
    proyectofinanciero_id integer,
    tipoanexo_id integer
);


--
-- Name: anexo_proyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.anexo_proyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: anexo_proyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.anexo_proyectofinanciero_id_seq OWNED BY public.anexo_proyectofinanciero.id;


--
-- Name: anexo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.anexo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: anexo_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.anexo_usuario (
    id bigint NOT NULL,
    anexo_id integer,
    usuario_id integer
);


--
-- Name: anexo_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.anexo_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: anexo_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.anexo_usuario_id_seq OWNED BY public.anexo_usuario.id;


--
-- Name: antecedente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.antecedente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: areaestudios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.areaestudios (
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

CREATE SEQUENCE public.areaestudios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: areaestudios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.areaestudios_id_seq OWNED BY public.areaestudios.id;


--
-- Name: cajacompensacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cajacompensacion (
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

CREATE SEQUENCE public.cajacompensacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cajacompensacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cajacompensacion_id_seq OWNED BY public.cajacompensacion.id;


--
-- Name: cargo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cargo (
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

CREATE SEQUENCE public.cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cargo_id_seq OWNED BY public.cargo.id;


--
-- Name: caso_etiqueta_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.caso_etiqueta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: caso_presponsable_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.caso_presponsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: caso_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.caso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comunicado; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comunicado (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    contenido character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comunicado_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comunicado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comunicado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comunicado_id_seq OWNED BY public.comunicado.id;


--
-- Name: contexto_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contexto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contextoinv; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contextoinv (
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

CREATE SEQUENCE public.contextoinv_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contextoinv_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contextoinv_id_seq OWNED BY public.contextoinv.id;


--
-- Name: contrato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contrato (
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

CREATE SEQUENCE public.contrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.contrato_id_seq OWNED BY public.contrato.id;


--
-- Name: convenio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.convenio (
    id bigint NOT NULL,
    clasificacion character varying(1),
    tipoconvenio_id integer,
    institucion character varying(1000),
    descripcion character varying(5000),
    fechainicio date,
    fechacierre date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    responsable_id integer,
    observaciones character varying(5000)
);


--
-- Name: convenio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.convenio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: convenio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.convenio_id_seq OWNED BY public.convenio.id;


--
-- Name: coordinador_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.coordinador_proyectofinanciero (
    id integer NOT NULL,
    proyectofinanciero_id integer,
    coordinador_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: coordinador_proyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.coordinador_proyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coordinador_proyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.coordinador_proyectofinanciero_id_seq OWNED BY public.coordinador_proyectofinanciero.id;


--
-- Name: cor1440_gen_actividad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad (
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
    duracion numeric,
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
    creadopor_id integer,
    hombres_proceso integer,
    mujeres_proceso integer,
    sexo_onr_proceso integer,
    hombres_nobef integer,
    mujeres_nobef integer,
    sexo_onr_nobef integer,
    negros_proceso integer,
    indigenas_proceso integer,
    etnia_onr_proceso integer,
    negros_nobef integer,
    indigenas_nobef integer,
    etnia_onr_nobef integer,
    vistobuenopar boolean,
    vistobuenodir boolean,
    observacionespar character varying(5000),
    observacionesdir character varying(5000),
    precedidapor integer
);


--
-- Name: cor1440_gen_actividad_actividadpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_actividadpf (
    actividad_id bigint NOT NULL,
    actividadpf_id bigint NOT NULL
);


--
-- Name: cor1440_gen_actividad_actividadtipo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_actividadtipo (
    actividadtipo_id integer,
    actividad_id integer
);


--
-- Name: cor1440_gen_actividad_actorsocial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_actorsocial (
    actividad_id bigint NOT NULL,
    actorsocial_id bigint NOT NULL
);


--
-- Name: cor1440_gen_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividad_id_seq OWNED BY public.cor1440_gen_actividad.id;


--
-- Name: cor1440_gen_actividad_objetivopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_objetivopf (
    actividad_id integer,
    objetivopf_id integer
);


--
-- Name: cor1440_gen_actividad_proyecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_proyecto (
    id integer NOT NULL,
    actividad_id integer,
    proyecto_id integer
);


--
-- Name: cor1440_gen_actividad_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_actividad_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividad_proyecto_id_seq OWNED BY public.cor1440_gen_actividad_proyecto.id;


--
-- Name: cor1440_gen_actividad_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_proyectofinanciero (
    actividad_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


--
-- Name: cor1440_gen_actividad_rangoedadac; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_rangoedadac (
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

CREATE SEQUENCE public.cor1440_gen_actividad_rangoedadac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_rangoedadac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividad_rangoedadac_id_seq OWNED BY public.cor1440_gen_actividad_rangoedadac.id;


--
-- Name: cor1440_gen_actividad_respuestafor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_respuestafor (
    actividad_id integer NOT NULL,
    respuestafor_id integer NOT NULL
);


--
-- Name: cor1440_gen_actividad_sip_anexo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_actividad_sip_anexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_sip_anexo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_sip_anexo (
    actividad_id integer NOT NULL,
    anexo_id integer NOT NULL,
    id integer DEFAULT nextval('public.cor1440_gen_actividad_sip_anexo_id_seq'::regclass) NOT NULL
);


--
-- Name: cor1440_gen_actividad_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_usuario (
    actividad_id integer NOT NULL,
    usuario_id integer NOT NULL
);


--
-- Name: cor1440_gen_actividad_valorcampotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividad_valorcampotind (
    id bigint NOT NULL,
    actividad_id integer,
    valorcampotind_id integer
);


--
-- Name: cor1440_gen_actividad_valorcampotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_actividad_valorcampotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividad_valorcampotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividad_valorcampotind_id_seq OWNED BY public.cor1440_gen_actividad_valorcampotind.id;


--
-- Name: cor1440_gen_actividadarea; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividadarea (
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

CREATE SEQUENCE public.cor1440_gen_actividadarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividadarea_id_seq OWNED BY public.cor1440_gen_actividadarea.id;


--
-- Name: cor1440_gen_actividadareas_actividad; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividadareas_actividad (
    id integer NOT NULL,
    actividad_id integer,
    actividadarea_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: cor1440_gen_actividadareas_actividad_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_actividadareas_actividad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadareas_actividad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividadareas_actividad_id_seq OWNED BY public.cor1440_gen_actividadareas_actividad.id;


--
-- Name: cor1440_gen_actividadpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividadpf (
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

CREATE SEQUENCE public.cor1440_gen_actividadpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividadpf_id_seq OWNED BY public.cor1440_gen_actividadpf.id;


--
-- Name: cor1440_gen_actividadtipo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividadtipo (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    listadoasistencia boolean
);


--
-- Name: cor1440_gen_actividadtipo_formulario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actividadtipo_formulario (
    actividadtipo_id integer NOT NULL,
    formulario_id integer NOT NULL
);


--
-- Name: cor1440_gen_actividadtipo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_actividadtipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_actividadtipo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_actividadtipo_id_seq OWNED BY public.cor1440_gen_actividadtipo.id;


--
-- Name: cor1440_gen_actorsocial_efecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_actorsocial_efecto (
    actorsocial_id bigint NOT NULL,
    efecto_id bigint NOT NULL
);


--
-- Name: cor1440_gen_anexo_efecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_anexo_efecto (
    id bigint NOT NULL,
    anexo_id integer,
    efecto_id integer
);


--
-- Name: cor1440_gen_anexo_efecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_anexo_efecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_anexo_efecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_anexo_efecto_id_seq OWNED BY public.cor1440_gen_anexo_efecto.id;


--
-- Name: cor1440_gen_anexo_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_anexo_proyectofinanciero (
    id bigint NOT NULL,
    anexo_id integer,
    proyectofinanciero_id integer
);


--
-- Name: cor1440_gen_anexo_proyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_anexo_proyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_anexo_proyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_anexo_proyectofinanciero_id_seq OWNED BY public.cor1440_gen_anexo_proyectofinanciero.id;


--
-- Name: cor1440_gen_asistencia; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_asistencia (
    id bigint NOT NULL,
    actividad_id integer NOT NULL,
    persona_id integer NOT NULL,
    rangoedadac_id integer,
    externo boolean,
    actorsocial_id integer,
    perfilactorsocial_id integer
);


--
-- Name: cor1440_gen_asistencia_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_asistencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_asistencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_asistencia_id_seq OWNED BY public.cor1440_gen_asistencia.id;


--
-- Name: cor1440_gen_beneficiariopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_beneficiariopf (
    persona_id integer,
    proyectofinanciero_id integer
);


--
-- Name: cor1440_gen_cambiosproyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_cambiosproyectofinanciero (
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

CREATE SEQUENCE public.cor1440_gen_cambiosproyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_cambiosproyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_cambiosproyectofinanciero_id_seq OWNED BY public.cor1440_gen_cambiosproyectofinanciero.id;


--
-- Name: cor1440_gen_campoact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_campoact (
    id bigint NOT NULL,
    actividadtipo_id integer,
    nombrecampo character varying(128),
    ayudauso character varying(1024),
    tipo integer DEFAULT 1
);


--
-- Name: cor1440_gen_campoact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_campoact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_campoact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_campoact_id_seq OWNED BY public.cor1440_gen_campoact.id;


--
-- Name: cor1440_gen_campotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_campotind (
    id bigint NOT NULL,
    tipoindicador_id integer NOT NULL,
    nombrecampo character varying(128) NOT NULL,
    ayudauso character varying(1024),
    tipo integer DEFAULT 1
);


--
-- Name: cor1440_gen_campotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_campotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_campotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_campotind_id_seq OWNED BY public.cor1440_gen_campotind.id;


--
-- Name: cor1440_gen_caracterizacionpersona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_caracterizacionpersona (
    id bigint NOT NULL,
    persona_id integer NOT NULL,
    respuestafor_id integer NOT NULL,
    ulteditor_id integer NOT NULL
);


--
-- Name: cor1440_gen_caracterizacionpersona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_caracterizacionpersona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_caracterizacionpersona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_caracterizacionpersona_id_seq OWNED BY public.cor1440_gen_caracterizacionpersona.id;


--
-- Name: cor1440_gen_caracterizacionpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_caracterizacionpf (
    formulario_id integer,
    proyectofinanciero_id integer
);


--
-- Name: cor1440_gen_efecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_efecto (
    id bigint NOT NULL,
    indicadorpf_id integer,
    actor_id_porborrar integer,
    fecha date,
    registradopor_id integer,
    nombre character varying(500),
    porcentajeprog integer DEFAULT 0,
    descripcion character varying(5000),
    fecha20 date,
    fecha40 date,
    fecha60 date,
    fecha80 date,
    fecha100 date,
    aprobadodir boolean,
    observacionesdir character varying(1000)
);


--
-- Name: cor1440_gen_efecto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_efecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_efecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_efecto_id_seq OWNED BY public.cor1440_gen_efecto.id;


--
-- Name: cor1440_gen_efecto_respuestafor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_efecto_respuestafor (
    efecto_id integer,
    respuestafor_id integer
);


--
-- Name: cor1440_gen_financiador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_financiador (
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

CREATE SEQUENCE public.cor1440_gen_financiador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_financiador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_financiador_id_seq OWNED BY public.cor1440_gen_financiador.id;


--
-- Name: cor1440_gen_financiador_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_financiador_proyectofinanciero (
    financiador_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


--
-- Name: cor1440_gen_formulario_tipoindicador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_formulario_tipoindicador (
    tipoindicador_id integer NOT NULL,
    formulario_id integer NOT NULL
);


--
-- Name: cor1440_gen_indicadorpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_indicadorpf (
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

CREATE SEQUENCE public.cor1440_gen_indicadorpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_indicadorpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_indicadorpf_id_seq OWNED BY public.cor1440_gen_indicadorpf.id;


--
-- Name: cor1440_gen_informe; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_informe (
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

CREATE SEQUENCE public.cor1440_gen_informe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_informe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_informe_id_seq OWNED BY public.cor1440_gen_informe.id;


--
-- Name: cor1440_gen_mindicadorpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_mindicadorpf (
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

CREATE SEQUENCE public.cor1440_gen_mindicadorpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_mindicadorpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_mindicadorpf_id_seq OWNED BY public.cor1440_gen_mindicadorpf.id;


--
-- Name: cor1440_gen_objetivopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_objetivopf (
    id bigint NOT NULL,
    proyectofinanciero_id integer,
    numero character varying(15) NOT NULL,
    objetivo character varying(5000) NOT NULL
);


--
-- Name: cor1440_gen_objetivopf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_objetivopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_objetivopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_objetivopf_id_seq OWNED BY public.cor1440_gen_objetivopf.id;


--
-- Name: cor1440_gen_plantillahcm_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_plantillahcm_proyectofinanciero (
    plantillahcm_id integer,
    proyectofinanciero_id integer
);


--
-- Name: cor1440_gen_pmindicadorpf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_pmindicadorpf (
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
    fecha date,
    urlev1 character varying(1024),
    urlev2 character varying(1024),
    urlev3 character varying(1024),
    urlevrind character varying(1024)
);


--
-- Name: cor1440_gen_pmindicadorpf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_pmindicadorpf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_pmindicadorpf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_pmindicadorpf_id_seq OWNED BY public.cor1440_gen_pmindicadorpf.id;


--
-- Name: cor1440_gen_pprogtind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_pprogtind (
    id bigint NOT NULL,
    tipoindicador_id integer NOT NULL,
    fase character varying(1024),
    porcentaje integer
);


--
-- Name: cor1440_gen_pprogtind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_pprogtind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_pprogtind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_pprogtind_id_seq OWNED BY public.cor1440_gen_pprogtind.id;


--
-- Name: cor1440_gen_proyecto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_proyecto (
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

CREATE SEQUENCE public.cor1440_gen_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_proyecto_id_seq OWNED BY public.cor1440_gen_proyecto.id;


--
-- Name: cor1440_gen_proyecto_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_proyecto_proyectofinanciero (
    proyecto_id integer NOT NULL,
    proyectofinanciero_id integer NOT NULL
);


--
-- Name: cor1440_gen_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_proyectofinanciero (
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
    nitfinanciador character varying(127),
    replegalfinanciador character varying(511),
    domiciliofinanciador character varying(511),
    webfinanciador character varying(511),
    skypefinanciador character varying(127),
    sectorapc_id integer,
    idtributariaextfinanciador character varying(511),
    fechaaprobacion date
);


--
-- Name: cor1440_gen_proyectofinanciero_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_proyectofinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_proyectofinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_proyectofinanciero_id_seq OWNED BY public.cor1440_gen_proyectofinanciero.id;


--
-- Name: cor1440_gen_rangoedadac; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_rangoedadac (
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

CREATE SEQUENCE public.cor1440_gen_rangoedadac_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_rangoedadac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_rangoedadac_id_seq OWNED BY public.cor1440_gen_rangoedadac.id;


--
-- Name: cor1440_gen_resultadopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_resultadopf (
    id bigint NOT NULL,
    proyectofinanciero_id integer,
    objetivopf_id integer,
    numero character varying(15) NOT NULL,
    resultado character varying(5000) NOT NULL
);


--
-- Name: cor1440_gen_resultadopf_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_resultadopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_resultadopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_resultadopf_id_seq OWNED BY public.cor1440_gen_resultadopf.id;


--
-- Name: cor1440_gen_tipoindicador; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_tipoindicador (
    id bigint NOT NULL,
    nombre character varying(32),
    espcampos character varying(1000),
    espvaloresomision character varying(1000),
    espvalidaciones character varying(1000),
    esptipometa character varying(32),
    espfuncionmedir character varying(1000),
    medircon integer,
    desc20 character varying(128),
    desc40 character varying(128),
    desc60 character varying(128),
    desc80 character varying(128),
    desc100 character varying(128),
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at date,
    updated_at date
);


--
-- Name: cor1440_gen_tipoindicador_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_tipoindicador_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_tipoindicador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_tipoindicador_id_seq OWNED BY public.cor1440_gen_tipoindicador.id;


--
-- Name: cor1440_gen_valorcampoact; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_valorcampoact (
    id bigint NOT NULL,
    actividad_id integer,
    campoact_id integer,
    valor character varying(5000)
);


--
-- Name: cor1440_gen_valorcampoact_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_valorcampoact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_valorcampoact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_valorcampoact_id_seq OWNED BY public.cor1440_gen_valorcampoact.id;


--
-- Name: cor1440_gen_valorcampotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cor1440_gen_valorcampotind (
    id bigint NOT NULL,
    campotind_id integer,
    valor character varying(5000)
);


--
-- Name: cor1440_gen_valorcampotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cor1440_gen_valorcampotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cor1440_gen_valorcampotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cor1440_gen_valorcampotind_id_seq OWNED BY public.cor1440_gen_valorcampotind.id;


--
-- Name: desembolso; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.desembolso (
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

CREATE SEQUENCE public.desembolso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: desembolso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.desembolso_id_seq OWNED BY public.desembolso.id;


--
-- Name: efecto_valorcampotind; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.efecto_valorcampotind (
    id bigint NOT NULL,
    efecto_id integer,
    valorcampotind_id integer
);


--
-- Name: efecto_valorcampotind_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.efecto_valorcampotind_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: efecto_valorcampotind_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.efecto_valorcampotind_id_seq OWNED BY public.efecto_valorcampotind.id;


--
-- Name: empresaps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.empresaps (
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

CREATE SEQUENCE public.empresaps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: empresaps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.empresaps_id_seq OWNED BY public.empresaps.id;


--
-- Name: escolaridad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.escolaridad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estadocivil_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.estadocivil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: etnia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.etnia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ffrecuente_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ffrecuente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: filiacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.filiacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fondopensiones; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fondopensiones (
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

CREATE SEQUENCE public.fondopensiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fondopensiones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fondopensiones_id_seq OWNED BY public.fondopensiones.id;


--
-- Name: fotra_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fotra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: frontera_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.frontera_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grupo_proyectofinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupo_proyectofinanciero (
    grupo_id bigint NOT NULL,
    proyectofinanciero_id bigint NOT NULL
);


--
-- Name: grupo_subgrupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.grupo_subgrupo (
    id bigint NOT NULL,
    grupo_id integer,
    subgrupo_id integer
);


--
-- Name: grupo_subgrupo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grupo_subgrupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grupo_subgrupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.grupo_subgrupo_id_seq OWNED BY public.grupo_subgrupo.id;


--
-- Name: grupoper_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.grupoper_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_campohc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_campohc (
    id integer NOT NULL,
    doc_id integer NOT NULL,
    nombrecampo character varying(127) NOT NULL,
    columna character varying(5) NOT NULL,
    fila integer
);


--
-- Name: heb412_gen_campohc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.heb412_gen_campohc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_campohc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_campohc_id_seq OWNED BY public.heb412_gen_campohc.id;


--
-- Name: heb412_gen_campoplantillahcm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_campoplantillahcm (
    id integer NOT NULL,
    plantillahcm_id integer,
    nombrecampo character varying(183),
    columna character varying(5)
);


--
-- Name: heb412_gen_campoplantillahcm_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.heb412_gen_campoplantillahcm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_campoplantillahcm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_campoplantillahcm_id_seq OWNED BY public.heb412_gen_campoplantillahcm.id;


--
-- Name: heb412_gen_campoplantillahcr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_campoplantillahcr (
    id bigint NOT NULL,
    plantillahcr_id integer,
    nombrecampo character varying(127),
    columna character varying(5),
    fila integer
);


--
-- Name: heb412_gen_campoplantillahcr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.heb412_gen_campoplantillahcr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_campoplantillahcr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_campoplantillahcr_id_seq OWNED BY public.heb412_gen_campoplantillahcr.id;


--
-- Name: heb412_gen_doc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_doc (
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

CREATE SEQUENCE public.heb412_gen_doc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_doc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_doc_id_seq OWNED BY public.heb412_gen_doc.id;


--
-- Name: heb412_gen_formulario_plantillahcr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_formulario_plantillahcr (
    id bigint NOT NULL,
    plantillahcr_id integer,
    formulario_id integer
);


--
-- Name: heb412_gen_formulario_plantillahcr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.heb412_gen_formulario_plantillahcr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_formulario_plantillahcr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_formulario_plantillahcr_id_seq OWNED BY public.heb412_gen_formulario_plantillahcr.id;


--
-- Name: heb412_gen_plantilladoc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_plantilladoc (
    id bigint NOT NULL,
    ruta character varying(2047),
    fuente character varying(1023),
    licencia character varying(1023),
    vista character varying(127),
    nombremenu character varying(127)
);


--
-- Name: heb412_gen_plantilladoc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.heb412_gen_plantilladoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_plantilladoc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_plantilladoc_id_seq OWNED BY public.heb412_gen_plantilladoc.id;


--
-- Name: heb412_gen_plantillahcm; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_plantillahcm (
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

CREATE SEQUENCE public.heb412_gen_plantillahcm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_plantillahcm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_plantillahcm_id_seq OWNED BY public.heb412_gen_plantillahcm.id;


--
-- Name: heb412_gen_plantillahcr; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.heb412_gen_plantillahcr (
    id bigint NOT NULL,
    ruta character varying(2047),
    fuente character varying(1023),
    licencia character varying(1023),
    vista character varying(127),
    nombremenu character varying(127)
);


--
-- Name: heb412_gen_plantillahcr_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.heb412_gen_plantillahcr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: heb412_gen_plantillahcr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.heb412_gen_plantillahcr_id_seq OWNED BY public.heb412_gen_plantillahcr.id;


--
-- Name: iglesia_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.iglesia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informeauditoria; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.informeauditoria (
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

CREATE SEQUENCE public.informeauditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informeauditoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.informeauditoria_id_seq OWNED BY public.informeauditoria.id;


--
-- Name: informeevaluacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.informeevaluacion (
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

CREATE SEQUENCE public.informeevaluacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informeevaluacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.informeevaluacion_id_seq OWNED BY public.informeevaluacion.id;


--
-- Name: informefinanciero; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.informefinanciero (
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

CREATE SEQUENCE public.informefinanciero_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informefinanciero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.informefinanciero_id_seq OWNED BY public.informefinanciero.id;


--
-- Name: informenarrativo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.informenarrativo (
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

CREATE SEQUENCE public.informenarrativo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: informenarrativo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.informenarrativo_id_seq OWNED BY public.informenarrativo.id;


--
-- Name: instanciader_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.instanciader_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intervalo_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.intervalo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: maternidad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.maternidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_campo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mr519_gen_campo (
    id bigint NOT NULL,
    nombre character varying(512) NOT NULL,
    ayudauso character varying(1024),
    tipo integer DEFAULT 1 NOT NULL,
    obligatorio boolean,
    formulario_id integer NOT NULL,
    nombreinterno character varying(60),
    fila integer,
    columna integer,
    ancho integer,
    tablabasica character varying(32)
);


--
-- Name: mr519_gen_campo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mr519_gen_campo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_campo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mr519_gen_campo_id_seq OWNED BY public.mr519_gen_campo.id;


--
-- Name: mr519_gen_encuestapersona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mr519_gen_encuestapersona (
    id bigint NOT NULL,
    persona_id integer,
    fecha date,
    adurl character varying(32),
    respuestafor_id integer,
    fechainv date,
    planencuesta_id integer,
    destcorreoinv character varying(2048),
    evidenciacorreoinv character varying(256),
    anexo_id integer
);


--
-- Name: mr519_gen_encuestapersona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mr519_gen_encuestapersona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_encuestapersona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mr519_gen_encuestapersona_id_seq OWNED BY public.mr519_gen_encuestapersona.id;


--
-- Name: mr519_gen_encuestausuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mr519_gen_encuestausuario (
    id bigint NOT NULL,
    usuario_id integer NOT NULL,
    formulario_id integer,
    fecha date,
    fechainicio date NOT NULL,
    fechafin date,
    respuestafor_id integer
);


--
-- Name: mr519_gen_encuestausuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mr519_gen_encuestausuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_encuestausuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mr519_gen_encuestausuario_id_seq OWNED BY public.mr519_gen_encuestausuario.id;


--
-- Name: mr519_gen_formulario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mr519_gen_formulario (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    nombreinterno character varying(60)
);


--
-- Name: mr519_gen_formulario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mr519_gen_formulario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_formulario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mr519_gen_formulario_id_seq OWNED BY public.mr519_gen_formulario.id;


--
-- Name: mr519_gen_opcioncs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mr519_gen_opcioncs (
    id bigint NOT NULL,
    campo_id integer NOT NULL,
    nombre character varying(1024) NOT NULL,
    valor character varying(60) NOT NULL
);


--
-- Name: mr519_gen_opcioncs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mr519_gen_opcioncs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_opcioncs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mr519_gen_opcioncs_id_seq OWNED BY public.mr519_gen_opcioncs.id;


--
-- Name: mr519_gen_respuestafor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mr519_gen_respuestafor (
    id bigint NOT NULL,
    formulario_id integer,
    fechaini date NOT NULL,
    fechacambio date NOT NULL
);


--
-- Name: mr519_gen_respuestafor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mr519_gen_respuestafor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_respuestafor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mr519_gen_respuestafor_id_seq OWNED BY public.mr519_gen_respuestafor.id;


--
-- Name: mr519_gen_valorcampo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mr519_gen_valorcampo (
    id bigint NOT NULL,
    campo_id integer NOT NULL,
    valor character varying(5000),
    respuestafor_id integer NOT NULL,
    valorjson json
);


--
-- Name: mr519_gen_valorcampo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mr519_gen_valorcampo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mr519_gen_valorcampo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mr519_gen_valorcampo_id_seq OWNED BY public.mr519_gen_valorcampo.id;


--
-- Name: niveleducacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.niveleducacion (
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

CREATE SEQUENCE public.niveleducacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: niveleducacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.niveleducacion_id_seq OWNED BY public.niveleducacion.id;


--
-- Name: nivelrelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nivelrelacion (
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

CREATE SEQUENCE public.nivelrelacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nivelrelacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nivelrelacion_id_seq OWNED BY public.nivelrelacion.id;


--
-- Name: nucleoconflicto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nucleoconflicto (
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

CREATE SEQUENCE public.nucleoconflicto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nucleoconflicto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.nucleoconflicto_id_seq OWNED BY public.nucleoconflicto.id;


--
-- Name: organizacion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizacion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pconsolidado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pconsolidado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: perfilprofesional; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.perfilprofesional (
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

CREATE SEQUENCE public.perfilprofesional_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: perfilprofesional_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.perfilprofesional_id_seq OWNED BY public.perfilprofesional.id;


--
-- Name: personadesea_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.personadesea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planencuesta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planencuesta (
    id bigint NOT NULL,
    fechaini date,
    fechafin date,
    formulario_id integer,
    plantillacorreoinv_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: planencuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planencuesta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planencuesta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planencuesta_id_seq OWNED BY public.planencuesta.id;


--
-- Name: plantillacorreo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.plantillacorreo (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    contenido character varying(5000),
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: plantillacorreo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.plantillacorreo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plantillacorreo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.plantillacorreo_id_seq OWNED BY public.plantillacorreo.id;


--
-- Name: presponsable_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.presponsable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: procesogh; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.procesogh (
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

CREATE SEQUENCE public.procesogh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: procesogh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.procesogh_id_seq OWNED BY public.procesogh.id;


--
-- Name: productopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.productopf (
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

CREATE SEQUENCE public.productopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: productopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.productopf_id_seq OWNED BY public.productopf.id;


--
-- Name: profesion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.profesion (
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

CREATE SEQUENCE public.profesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profesion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.profesion_id_seq OWNED BY public.profesion.id;


--
-- Name: profesion_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.profesion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proyectofinanciero_uresponsable; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proyectofinanciero_uresponsable (
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

CREATE SEQUENCE public.proyectofinanciero_uresponsable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proyectofinanciero_uresponsable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.proyectofinanciero_uresponsable_id_seq OWNED BY public.proyectofinanciero_uresponsable.id;


--
-- Name: proyectofinanciero_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.proyectofinanciero_usuario (
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

CREATE SEQUENCE public.proyectofinanciero_usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: proyectofinanciero_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.proyectofinanciero_usuario_id_seq OWNED BY public.proyectofinanciero_usuario.id;


--
-- Name: publicacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.publicacion (
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

CREATE SEQUENCE public.publicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: publicacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.publicacion_id_seq OWNED BY public.publicacion.id;


--
-- Name: rangoedad_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.rangoedad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redactor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.redactor (
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

CREATE SEQUENCE public.redactor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redactor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.redactor_id_seq OWNED BY public.redactor.id;


--
-- Name: regimensalud_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.regimensalud_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: region_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.region_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regiongrupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regiongrupo (
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

CREATE SEQUENCE public.regiongrupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regiongrupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.regiongrupo_id_seq OWNED BY public.regiongrupo.id;


--
-- Name: regiongrupo_sip_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regiongrupo_sip_departamento (
    regiongrupo_id integer NOT NULL,
    sip_departamento_id integer NOT NULL
);


--
-- Name: regiongrupo_sip_municipio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.regiongrupo_sip_municipio (
    regiongrupo_id integer NOT NULL,
    sip_municipio_id integer NOT NULL
);


--
-- Name: sal7711_gen_articulo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sal7711_gen_articulo (
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

CREATE TABLE public.sal7711_gen_articulo_categoriaprensa (
    articulo_id bigint NOT NULL,
    categoriaprensa_id bigint NOT NULL
);


--
-- Name: sal7711_gen_articulo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sal7711_gen_articulo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sal7711_gen_articulo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sal7711_gen_articulo_id_seq OWNED BY public.sal7711_gen_articulo.id;


--
-- Name: sal7711_gen_bitacora; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sal7711_gen_bitacora (
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

CREATE SEQUENCE public.sal7711_gen_bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sal7711_gen_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sal7711_gen_bitacora_id_seq OWNED BY public.sal7711_gen_bitacora.id;


--
-- Name: sal7711_gen_categoriaprensa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sal7711_gen_categoriaprensa (
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

CREATE SEQUENCE public.sal7711_gen_categoriaprensa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sal7711_gen_categoriaprensa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sal7711_gen_categoriaprensa_id_seq OWNED BY public.sal7711_gen_categoriaprensa.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sectoractor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sectoractor (
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

CREATE SEQUENCE public.sectoractor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectoractor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sectoractor_id_seq OWNED BY public.sectoractor.id;


--
-- Name: sectorapc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sectorapc (
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

CREATE SEQUENCE public.sectorapc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sectorapc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sectorapc_id_seq OWNED BY public.sectorapc.id;


--
-- Name: sectorsocial_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sectorsocial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_actorsocial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_actorsocial (
    id bigint NOT NULL,
    grupoper_id integer NOT NULL,
    telefono character varying(500),
    fax character varying(500),
    direccion character varying(500),
    pais_id integer,
    web character varying(500),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    personacontacto character varying(100),
    cargo character varying(100),
    correo character varying(100),
    celular character varying(100),
    ciudad character varying(100),
    nivelrelacion_id integer,
    lineabase20182020 boolean,
    fechadeshabilitacion date
);


--
-- Name: sip_actorsocial_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_actorsocial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_actorsocial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_actorsocial_id_seq OWNED BY public.sip_actorsocial.id;


--
-- Name: sip_actorsocial_persona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_actorsocial_persona (
    id bigint NOT NULL,
    persona_id integer NOT NULL,
    actorsocial_id integer,
    perfilactorsocial_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    correo character varying(254),
    cargo character varying(254)
);


--
-- Name: sip_actorsocial_persona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_actorsocial_persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_actorsocial_persona_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_actorsocial_persona_id_seq OWNED BY public.sip_actorsocial_persona.id;


--
-- Name: sip_actorsocial_sectoractor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_actorsocial_sectoractor (
    actorsocial_id integer,
    sectoractor_id integer
);


--
-- Name: sip_anexo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_anexo (
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

CREATE SEQUENCE public.sip_anexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_anexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_anexo_id_seq OWNED BY public.sip_anexo.id;


--
-- Name: sip_clase_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_clase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_clase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_clase (
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
    id integer DEFAULT nextval('public.sip_clase_id_seq'::regclass) NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT clase_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_departamento; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_departamento (
    id_deplocal integer,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    latitud double precision,
    longitud double precision,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_pais integer NOT NULL,
    id integer DEFAULT nextval('public.sip_departamento_id_seq'::regclass) NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT departamento_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_etiqueta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_etiqueta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_etiqueta (
    id integer DEFAULT nextval('public.sip_etiqueta_id_seq'::regclass) NOT NULL,
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

CREATE TABLE public.sip_fuenteprensa (
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

CREATE SEQUENCE public.sip_fuenteprensa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_fuenteprensa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_fuenteprensa_id_seq OWNED BY public.sip_fuenteprensa.id;


--
-- Name: sip_grupo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_grupo (
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

CREATE SEQUENCE public.sip_grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_grupo_id_seq OWNED BY public.sip_grupo.id;


--
-- Name: sip_grupo_usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_grupo_usuario (
    usuario_id integer NOT NULL,
    sip_grupo_id integer NOT NULL
);


--
-- Name: sip_grupoper; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_grupoper (
    id bigint NOT NULL,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    anotaciones character varying(1000)
);


--
-- Name: TABLE sip_grupoper; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.sip_grupoper IS 'Creado por sip en cor1440cinep_desarrollo';


--
-- Name: sip_grupoper_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_grupoper_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_grupoper_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_grupoper_id_seq OWNED BY public.sip_grupoper.id;


--
-- Name: sip_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_municipio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_municipio (
    id_munlocal integer,
    nombre character varying(500) COLLATE public.es_co_utf_8 NOT NULL,
    latitud double precision,
    longitud double precision,
    fechacreacion date DEFAULT ('now'::text)::date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id_departamento integer,
    id integer DEFAULT nextval('public.sip_municipio_id_seq'::regclass) NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    CONSTRAINT municipio_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion)))
);


--
-- Name: sip_mundep_sinorden; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.sip_mundep_sinorden AS
 SELECT ((sip_departamento.id_deplocal * 1000) + sip_municipio.id_munlocal) AS idlocal,
    (((sip_municipio.nombre)::text || ' / '::text) || (sip_departamento.nombre)::text) AS nombre
   FROM (public.sip_municipio
     JOIN public.sip_departamento ON ((sip_municipio.id_departamento = sip_departamento.id)))
  WHERE ((sip_departamento.id_pais = 170) AND (sip_municipio.fechadeshabilitacion IS NULL) AND (sip_departamento.fechadeshabilitacion IS NULL))
UNION
 SELECT sip_departamento.id_deplocal AS idlocal,
    sip_departamento.nombre
   FROM public.sip_departamento
  WHERE ((sip_departamento.id_pais = 170) AND (sip_departamento.fechadeshabilitacion IS NULL));


--
-- Name: sip_mundep; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.sip_mundep AS
 SELECT sip_mundep_sinorden.idlocal,
    sip_mundep_sinorden.nombre,
    to_tsvector('spanish'::regconfig, public.unaccent(sip_mundep_sinorden.nombre)) AS mundep
   FROM public.sip_mundep_sinorden
  ORDER BY (sip_mundep_sinorden.nombre COLLATE public.es_co_utf_8)
  WITH NO DATA;


--
-- Name: sip_oficina_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_oficina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_oficina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_oficina (
    id integer DEFAULT nextval('public.sip_oficina_id_seq'::regclass) NOT NULL,
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

CREATE TABLE public.sip_pais (
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

CREATE SEQUENCE public.sip_pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_pais_id_seq OWNED BY public.sip_pais.id;


--
-- Name: sip_perfilactorsocial; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_perfilactorsocial (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sip_perfilactorsocial_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_perfilactorsocial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_perfilactorsocial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_perfilactorsocial_id_seq OWNED BY public.sip_perfilactorsocial.id;


--
-- Name: sip_persona_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_persona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_persona (
    id integer DEFAULT nextval('public.sip_persona_id_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE public.sip_persona_trelacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_persona_trelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_persona_trelacion (
    persona1 integer NOT NULL,
    persona2 integer NOT NULL,
    id_trelacion character(2) DEFAULT 'SI'::bpchar NOT NULL,
    observaciones character varying(5000) COLLATE public.es_co_utf_8,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer DEFAULT nextval('public.sip_persona_trelacion_id_seq'::regclass) NOT NULL
);


--
-- Name: sip_sectoractor; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_sectoractor (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    entrienal2015 boolean
);


--
-- Name: sip_sectoractor_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_sectoractor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_sectoractor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_sectoractor_id_seq OWNED BY public.sip_sectoractor.id;


--
-- Name: sip_tclase; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_tclase (
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

CREATE TABLE public.sip_tdocumento (
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

CREATE SEQUENCE public.sip_tdocumento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_tdocumento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_tdocumento_id_seq OWNED BY public.sip_tdocumento.id;


--
-- Name: sip_tema; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_tema (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    nav_ini character varying(8),
    nav_fin character varying(8),
    nav_fuente character varying(8),
    fondo_lista character varying(8),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    btn_primario_fondo_ini character varying(127),
    btn_primario_fondo_fin character varying(127),
    btn_primario_fuente character varying(127),
    btn_peligro_fondo_ini character varying(127),
    btn_peligro_fondo_fin character varying(127),
    btn_peligro_fuente character varying(127),
    btn_accion_fondo_ini character varying(127),
    btn_accion_fondo_fin character varying(127),
    btn_accion_fuente character varying(127),
    alerta_exito_fondo character varying(127),
    alerta_exito_fuente character varying(127),
    alerta_problema_fondo character varying(127),
    alerta_problema_fuente character varying(127),
    fondo character varying(127),
    color_fuente character varying(127),
    color_flota_subitem_fuente character varying,
    color_flota_subitem_fondo character varying
);


--
-- Name: sip_tema_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_tema_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_tema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_tema_id_seq OWNED BY public.sip_tema.id;


--
-- Name: sip_trelacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_trelacion (
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
-- Name: sip_trivalente; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_trivalente (
    id bigint NOT NULL,
    nombre character varying(500) NOT NULL,
    observaciones character varying(5000),
    fechacreacion date NOT NULL,
    fechadeshabilitacion date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sip_trivalente_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_trivalente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_trivalente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sip_trivalente_id_seq OWNED BY public.sip_trivalente.id;


--
-- Name: sip_tsitio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sip_tsitio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_tsitio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_tsitio (
    id integer DEFAULT nextval('public.sip_tsitio_id_seq'::regclass) NOT NULL,
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

CREATE SEQUENCE public.sip_ubicacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sip_ubicacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sip_ubicacion (
    id integer DEFAULT nextval('public.sip_ubicacion_id_seq'::regclass) NOT NULL,
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

CREATE TABLE public.tasacambio (
    id bigint NOT NULL,
    fecha date,
    tipomoneda_id integer,
    enpesos numeric,
    observaciones character varying(5000)
);


--
-- Name: tasacambio_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tasacambio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasacambio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tasacambio_id_seq OWNED BY public.tasacambio.id;


--
-- Name: tipoanexo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipoanexo (
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

CREATE SEQUENCE public.tipoanexo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipoanexo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipoanexo_id_seq OWNED BY public.tipoanexo.id;


--
-- Name: tipocontrato; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipocontrato (
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

CREATE SEQUENCE public.tipocontrato_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipocontrato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipocontrato_id_seq OWNED BY public.tipocontrato.id;


--
-- Name: tipoconvenio; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipoconvenio (
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

CREATE SEQUENCE public.tipoconvenio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipoconvenio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipoconvenio_id_seq OWNED BY public.tipoconvenio.id;


--
-- Name: tipomoneda; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipomoneda (
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

CREATE SEQUENCE public.tipomoneda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipomoneda_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipomoneda_id_seq OWNED BY public.tipomoneda.id;


--
-- Name: tiponomina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tiponomina (
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

CREATE SEQUENCE public.tiponomina_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tiponomina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tiponomina_id_seq OWNED BY public.tiponomina.id;


--
-- Name: tipoproductopf; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tipoproductopf (
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

CREATE SEQUENCE public.tipoproductopf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tipoproductopf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tipoproductopf_id_seq OWNED BY public.tipoproductopf.id;


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    nusuario character varying(63) NOT NULL,
    password character varying(64) DEFAULT ''::character varying NOT NULL,
    descripcion character varying(50),
    rol integer DEFAULT 5,
    idioma character varying(6) DEFAULT 'es_CO'::character varying NOT NULL,
    id integer DEFAULT nextval('public.usuario_id_seq'::regclass) NOT NULL,
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
    tema_id integer,
    CONSTRAINT usuario_check CHECK (((fechadeshabilitacion IS NULL) OR (fechadeshabilitacion >= fechacreacion))),
    CONSTRAINT usuario_rol_check CHECK ((rol >= 1))
);


--
-- Name: v_solicitud_informes1; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_solicitud_informes1 AS
 SELECT informenarrativo.proyectofinanciero_id,
    informenarrativo.fechaplaneada,
    informenarrativo.fechareal,
    informenarrativo.devoluciones,
    ('INFORME NARRATIVO: '::text || (informenarrativo.detalle)::text) AS observaciones,
    informenarrativo.seguimiento
   FROM public.informenarrativo
UNION
 SELECT informefinanciero.proyectofinanciero_id,
    informefinanciero.fechaplaneada,
    informefinanciero.fechareal,
    informefinanciero.devoluciones,
    ('INFORME FINANCIERO: '::text || (informefinanciero.detalle)::text) AS observaciones,
    informefinanciero.seguimiento
   FROM public.informefinanciero
UNION
 SELECT informeauditoria.proyectofinanciero_id,
    informeauditoria.fechaplaneada,
    informeauditoria.fechareal,
    informeauditoria.devoluciones,
    ('INFORME DE AUDITORÍA: '::text || (informeauditoria.detalle)::text) AS observaciones,
    informeauditoria.seguimiento
   FROM public.informeauditoria
UNION
 SELECT productopf.proyectofinanciero_id,
    productopf.fechaplaneada,
    productopf.fechareal,
    productopf.devoluciones,
    (((tipoproductopf.nombre)::text || ': '::text) || (productopf.detalle)::text) AS observaciones,
    productopf.seguimiento
   FROM (public.productopf
     JOIN public.tipoproductopf ON ((productopf.tipoproductopf_id = tipoproductopf.id)));


--
-- Name: v_solicitud_informes; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.v_solicitud_informes AS
 SELECT p.id AS compromiso_id,
    p.referenciacinep AS titulo,
    array_to_string(ARRAY( SELECT (((sip_persona.nombres)::text || ' '::text) || (sip_persona.apellidos)::text)
           FROM ((public.sip_persona
             JOIN public.usuario ON ((sip_persona.id = usuario.persona_id)))
             JOIN public.coordinador_proyectofinanciero ON ((usuario.id = coordinador_proyectofinanciero.coordinador_id)))
          WHERE (coordinador_proyectofinanciero.proyectofinanciero_id = p.id)), ', '::text) AS coordinador,
    array_to_string(ARRAY( SELECT (((sip_persona.nombres)::text || ' '::text) || (sip_persona.apellidos)::text)
           FROM ((public.sip_persona
             JOIN public.usuario ON ((sip_persona.id = usuario.persona_id)))
             JOIN public.proyectofinanciero_uresponsable ON ((usuario.id = proyectofinanciero_uresponsable.uresponsable_id)))
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
   FROM (public.cor1440_gen_proyectofinanciero p
     JOIN public.v_solicitud_informes1 s ON ((p.id = s.proyectofinanciero_id)))
  WHERE (p.id = ANY (ARRAY[125, 129, 128, 161, 173, 193, 194, 196, 103, 102, 111, 127, 109, 130, 133, 134, 131, 123, 132, 136, 104, 293, 237, 238, 239, 240, 119, 164, 20, 174, 190, 163, 195, 197, 122, 141, 142, 143, 144, 145, 147, 152, 146, 155, 137, 101, 138, 175, 149, 167, 166, 18, 150, 156, 120, 236, 116, 158, 176, 177, 170, 178, 179, 106, 118, 115, 171, 180, 157, 159, 172, 198, 199, 200, 201, 202, 168, 206, 117, 126, 233, 234, 235, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 254, 255, 256, 257, 295, 260, 267, 272, 286, 276, 309, 278, 280, 288, 19, 162, 140]))
  ORDER BY s.fechaplaneada;


--
-- Name: victima_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.victima_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vinculacion; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.vinculacion (
    id bigint NOT NULL,
    usuario_id integer,
    fechaini date,
    fechafin date,
    observaciones character varying(5000)
);


--
-- Name: vinculacion_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vinculacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vinculacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.vinculacion_id_seq OWNED BY public.vinculacion.id;


--
-- Name: vinculoestado_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.vinculoestado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: actor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor ALTER COLUMN id SET DEFAULT nextval('public.actor_id_seq'::regclass);


--
-- Name: anexo_convenio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_convenio ALTER COLUMN id SET DEFAULT nextval('public.anexo_convenio_id_seq'::regclass);


--
-- Name: anexo_proyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('public.anexo_proyectofinanciero_id_seq'::regclass);


--
-- Name: anexo_usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_usuario ALTER COLUMN id SET DEFAULT nextval('public.anexo_usuario_id_seq'::regclass);


--
-- Name: areaestudios id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areaestudios ALTER COLUMN id SET DEFAULT nextval('public.areaestudios_id_seq'::regclass);


--
-- Name: cajacompensacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cajacompensacion ALTER COLUMN id SET DEFAULT nextval('public.cajacompensacion_id_seq'::regclass);


--
-- Name: cargo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo ALTER COLUMN id SET DEFAULT nextval('public.cargo_id_seq'::regclass);


--
-- Name: comunicado id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comunicado ALTER COLUMN id SET DEFAULT nextval('public.comunicado_id_seq'::regclass);


--
-- Name: contextoinv id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contextoinv ALTER COLUMN id SET DEFAULT nextval('public.contextoinv_id_seq'::regclass);


--
-- Name: contrato id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contrato ALTER COLUMN id SET DEFAULT nextval('public.contrato_id_seq'::regclass);


--
-- Name: convenio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.convenio ALTER COLUMN id SET DEFAULT nextval('public.convenio_id_seq'::regclass);


--
-- Name: coordinador_proyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordinador_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('public.coordinador_proyectofinanciero_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividad_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad_proyecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_proyecto ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividad_proyecto_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad_rangoedadac id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_rangoedadac ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividad_rangoedadac_id_seq'::regclass);


--
-- Name: cor1440_gen_actividad_valorcampotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_valorcampotind ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividad_valorcampotind_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadarea id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadarea ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividadarea_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadareas_actividad id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadareas_actividad ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividadareas_actividad_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadpf ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividadpf_id_seq'::regclass);


--
-- Name: cor1440_gen_actividadtipo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadtipo ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_actividadtipo_id_seq'::regclass);


--
-- Name: cor1440_gen_anexo_efecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_efecto ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_anexo_efecto_id_seq'::regclass);


--
-- Name: cor1440_gen_anexo_proyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_anexo_proyectofinanciero_id_seq'::regclass);


--
-- Name: cor1440_gen_asistencia id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_asistencia ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_asistencia_id_seq'::regclass);


--
-- Name: cor1440_gen_cambiosproyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_cambiosproyectofinanciero ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_cambiosproyectofinanciero_id_seq'::regclass);


--
-- Name: cor1440_gen_campoact id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_campoact ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_campoact_id_seq'::regclass);


--
-- Name: cor1440_gen_campotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_campotind ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_campotind_id_seq'::regclass);


--
-- Name: cor1440_gen_caracterizacionpersona id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_caracterizacionpersona ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_caracterizacionpersona_id_seq'::regclass);


--
-- Name: cor1440_gen_efecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_efecto ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_efecto_id_seq'::regclass);


--
-- Name: cor1440_gen_financiador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_financiador ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_financiador_id_seq'::regclass);


--
-- Name: cor1440_gen_indicadorpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_indicadorpf ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_indicadorpf_id_seq'::regclass);


--
-- Name: cor1440_gen_informe id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_informe ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_informe_id_seq'::regclass);


--
-- Name: cor1440_gen_mindicadorpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_mindicadorpf ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_mindicadorpf_id_seq'::regclass);


--
-- Name: cor1440_gen_objetivopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_objetivopf ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_objetivopf_id_seq'::regclass);


--
-- Name: cor1440_gen_pmindicadorpf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_pmindicadorpf ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_pmindicadorpf_id_seq'::regclass);


--
-- Name: cor1440_gen_pprogtind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_pprogtind ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_pprogtind_id_seq'::regclass);


--
-- Name: cor1440_gen_proyecto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyecto ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_proyecto_id_seq'::regclass);


--
-- Name: cor1440_gen_proyectofinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyectofinanciero ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_proyectofinanciero_id_seq'::regclass);


--
-- Name: cor1440_gen_rangoedadac id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_rangoedadac ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_rangoedadac_id_seq'::regclass);


--
-- Name: cor1440_gen_resultadopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_resultadopf ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_resultadopf_id_seq'::regclass);


--
-- Name: cor1440_gen_tipoindicador id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_tipoindicador ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_tipoindicador_id_seq'::regclass);


--
-- Name: cor1440_gen_valorcampoact id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_valorcampoact ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_valorcampoact_id_seq'::regclass);


--
-- Name: cor1440_gen_valorcampotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_valorcampotind ALTER COLUMN id SET DEFAULT nextval('public.cor1440_gen_valorcampotind_id_seq'::regclass);


--
-- Name: desembolso id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.desembolso ALTER COLUMN id SET DEFAULT nextval('public.desembolso_id_seq'::regclass);


--
-- Name: efecto_valorcampotind id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.efecto_valorcampotind ALTER COLUMN id SET DEFAULT nextval('public.efecto_valorcampotind_id_seq'::regclass);


--
-- Name: empresaps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresaps ALTER COLUMN id SET DEFAULT nextval('public.empresaps_id_seq'::regclass);


--
-- Name: fondopensiones id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fondopensiones ALTER COLUMN id SET DEFAULT nextval('public.fondopensiones_id_seq'::regclass);


--
-- Name: grupo_subgrupo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_subgrupo ALTER COLUMN id SET DEFAULT nextval('public.grupo_subgrupo_id_seq'::regclass);


--
-- Name: heb412_gen_campohc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campohc ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_campohc_id_seq'::regclass);


--
-- Name: heb412_gen_campoplantillahcm id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campoplantillahcm ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_campoplantillahcm_id_seq'::regclass);


--
-- Name: heb412_gen_campoplantillahcr id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campoplantillahcr ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_campoplantillahcr_id_seq'::regclass);


--
-- Name: heb412_gen_doc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_doc ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_doc_id_seq'::regclass);


--
-- Name: heb412_gen_formulario_plantillahcr id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_formulario_plantillahcr ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_formulario_plantillahcr_id_seq'::regclass);


--
-- Name: heb412_gen_plantilladoc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_plantilladoc ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_plantilladoc_id_seq'::regclass);


--
-- Name: heb412_gen_plantillahcm id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_plantillahcm ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_plantillahcm_id_seq'::regclass);


--
-- Name: heb412_gen_plantillahcr id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_plantillahcr ALTER COLUMN id SET DEFAULT nextval('public.heb412_gen_plantillahcr_id_seq'::regclass);


--
-- Name: informeauditoria id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informeauditoria ALTER COLUMN id SET DEFAULT nextval('public.informeauditoria_id_seq'::regclass);


--
-- Name: informeevaluacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informeevaluacion ALTER COLUMN id SET DEFAULT nextval('public.informeevaluacion_id_seq'::regclass);


--
-- Name: informefinanciero id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informefinanciero ALTER COLUMN id SET DEFAULT nextval('public.informefinanciero_id_seq'::regclass);


--
-- Name: informenarrativo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informenarrativo ALTER COLUMN id SET DEFAULT nextval('public.informenarrativo_id_seq'::regclass);


--
-- Name: mr519_gen_campo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_campo ALTER COLUMN id SET DEFAULT nextval('public.mr519_gen_campo_id_seq'::regclass);


--
-- Name: mr519_gen_encuestapersona id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestapersona ALTER COLUMN id SET DEFAULT nextval('public.mr519_gen_encuestapersona_id_seq'::regclass);


--
-- Name: mr519_gen_encuestausuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestausuario ALTER COLUMN id SET DEFAULT nextval('public.mr519_gen_encuestausuario_id_seq'::regclass);


--
-- Name: mr519_gen_formulario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_formulario ALTER COLUMN id SET DEFAULT nextval('public.mr519_gen_formulario_id_seq'::regclass);


--
-- Name: mr519_gen_opcioncs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_opcioncs ALTER COLUMN id SET DEFAULT nextval('public.mr519_gen_opcioncs_id_seq'::regclass);


--
-- Name: mr519_gen_respuestafor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_respuestafor ALTER COLUMN id SET DEFAULT nextval('public.mr519_gen_respuestafor_id_seq'::regclass);


--
-- Name: mr519_gen_valorcampo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_valorcampo ALTER COLUMN id SET DEFAULT nextval('public.mr519_gen_valorcampo_id_seq'::regclass);


--
-- Name: niveleducacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.niveleducacion ALTER COLUMN id SET DEFAULT nextval('public.niveleducacion_id_seq'::regclass);


--
-- Name: nivelrelacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nivelrelacion ALTER COLUMN id SET DEFAULT nextval('public.nivelrelacion_id_seq'::regclass);


--
-- Name: nucleoconflicto id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleoconflicto ALTER COLUMN id SET DEFAULT nextval('public.nucleoconflicto_id_seq'::regclass);


--
-- Name: perfilprofesional id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfilprofesional ALTER COLUMN id SET DEFAULT nextval('public.perfilprofesional_id_seq'::regclass);


--
-- Name: planencuesta id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planencuesta ALTER COLUMN id SET DEFAULT nextval('public.planencuesta_id_seq'::regclass);


--
-- Name: plantillacorreo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plantillacorreo ALTER COLUMN id SET DEFAULT nextval('public.plantillacorreo_id_seq'::regclass);


--
-- Name: procesogh id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procesogh ALTER COLUMN id SET DEFAULT nextval('public.procesogh_id_seq'::regclass);


--
-- Name: productopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productopf ALTER COLUMN id SET DEFAULT nextval('public.productopf_id_seq'::regclass);


--
-- Name: profesion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesion ALTER COLUMN id SET DEFAULT nextval('public.profesion_id_seq'::regclass);


--
-- Name: proyectofinanciero_uresponsable id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_uresponsable ALTER COLUMN id SET DEFAULT nextval('public.proyectofinanciero_uresponsable_id_seq'::regclass);


--
-- Name: proyectofinanciero_usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_usuario ALTER COLUMN id SET DEFAULT nextval('public.proyectofinanciero_usuario_id_seq'::regclass);


--
-- Name: publicacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publicacion ALTER COLUMN id SET DEFAULT nextval('public.publicacion_id_seq'::regclass);


--
-- Name: redactor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redactor ALTER COLUMN id SET DEFAULT nextval('public.redactor_id_seq'::regclass);


--
-- Name: regiongrupo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regiongrupo ALTER COLUMN id SET DEFAULT nextval('public.regiongrupo_id_seq'::regclass);


--
-- Name: sal7711_gen_articulo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo ALTER COLUMN id SET DEFAULT nextval('public.sal7711_gen_articulo_id_seq'::regclass);


--
-- Name: sal7711_gen_bitacora id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_bitacora ALTER COLUMN id SET DEFAULT nextval('public.sal7711_gen_bitacora_id_seq'::regclass);


--
-- Name: sal7711_gen_categoriaprensa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_categoriaprensa ALTER COLUMN id SET DEFAULT nextval('public.sal7711_gen_categoriaprensa_id_seq'::regclass);


--
-- Name: sectoractor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectoractor ALTER COLUMN id SET DEFAULT nextval('public.sectoractor_id_seq'::regclass);


--
-- Name: sectorapc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectorapc ALTER COLUMN id SET DEFAULT nextval('public.sectorapc_id_seq'::regclass);


--
-- Name: sip_actorsocial id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial ALTER COLUMN id SET DEFAULT nextval('public.sip_actorsocial_id_seq'::regclass);


--
-- Name: sip_actorsocial_persona id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial_persona ALTER COLUMN id SET DEFAULT nextval('public.sip_actorsocial_persona_id_seq'::regclass);


--
-- Name: sip_anexo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_anexo ALTER COLUMN id SET DEFAULT nextval('public.sip_anexo_id_seq'::regclass);


--
-- Name: sip_fuenteprensa id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_fuenteprensa ALTER COLUMN id SET DEFAULT nextval('public.sip_fuenteprensa_id_seq'::regclass);


--
-- Name: sip_grupo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_grupo ALTER COLUMN id SET DEFAULT nextval('public.sip_grupo_id_seq'::regclass);


--
-- Name: sip_grupoper id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_grupoper ALTER COLUMN id SET DEFAULT nextval('public.sip_grupoper_id_seq'::regclass);


--
-- Name: sip_pais id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_pais ALTER COLUMN id SET DEFAULT nextval('public.sip_pais_id_seq'::regclass);


--
-- Name: sip_perfilactorsocial id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_perfilactorsocial ALTER COLUMN id SET DEFAULT nextval('public.sip_perfilactorsocial_id_seq'::regclass);


--
-- Name: sip_sectoractor id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_sectoractor ALTER COLUMN id SET DEFAULT nextval('public.sip_sectoractor_id_seq'::regclass);


--
-- Name: sip_tdocumento id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_tdocumento ALTER COLUMN id SET DEFAULT nextval('public.sip_tdocumento_id_seq'::regclass);


--
-- Name: sip_tema id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_tema ALTER COLUMN id SET DEFAULT nextval('public.sip_tema_id_seq'::regclass);


--
-- Name: sip_trivalente id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_trivalente ALTER COLUMN id SET DEFAULT nextval('public.sip_trivalente_id_seq'::regclass);


--
-- Name: tasacambio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasacambio ALTER COLUMN id SET DEFAULT nextval('public.tasacambio_id_seq'::regclass);


--
-- Name: tipoanexo id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoanexo ALTER COLUMN id SET DEFAULT nextval('public.tipoanexo_id_seq'::regclass);


--
-- Name: tipocontrato id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipocontrato ALTER COLUMN id SET DEFAULT nextval('public.tipocontrato_id_seq'::regclass);


--
-- Name: tipoconvenio id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoconvenio ALTER COLUMN id SET DEFAULT nextval('public.tipoconvenio_id_seq'::regclass);


--
-- Name: tipomoneda id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipomoneda ALTER COLUMN id SET DEFAULT nextval('public.tipomoneda_id_seq'::regclass);


--
-- Name: tiponomina id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tiponomina ALTER COLUMN id SET DEFAULT nextval('public.tiponomina_id_seq'::regclass);


--
-- Name: tipoproductopf id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoproductopf ALTER COLUMN id SET DEFAULT nextval('public.tipoproductopf_id_seq'::regclass);


--
-- Name: vinculacion id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vinculacion ALTER COLUMN id SET DEFAULT nextval('public.vinculacion_id_seq'::regclass);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- Name: anexo_convenio anexo_convenio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_convenio
    ADD CONSTRAINT anexo_convenio_pkey PRIMARY KEY (id);


--
-- Name: anexo_proyectofinanciero anexo_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_proyectofinanciero
    ADD CONSTRAINT anexo_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: anexo_usuario anexo_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_usuario
    ADD CONSTRAINT anexo_usuario_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: areaestudios areaestudios_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.areaestudios
    ADD CONSTRAINT areaestudios_pkey PRIMARY KEY (id);


--
-- Name: cajacompensacion cajacompensacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cajacompensacion
    ADD CONSTRAINT cajacompensacion_pkey PRIMARY KEY (id);


--
-- Name: cargo cargo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);


--
-- Name: comunicado comunicado_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comunicado
    ADD CONSTRAINT comunicado_pkey PRIMARY KEY (id);


--
-- Name: contextoinv contextoinv_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contextoinv
    ADD CONSTRAINT contextoinv_pkey PRIMARY KEY (id);


--
-- Name: contrato contrato_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT contrato_pkey PRIMARY KEY (id);


--
-- Name: convenio convenio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT convenio_pkey PRIMARY KEY (id);


--
-- Name: coordinador_proyectofinanciero coordinador_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordinador_proyectofinanciero
    ADD CONSTRAINT coordinador_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_proyecto cor1440_gen_actividad_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_proyecto
    ADD CONSTRAINT cor1440_gen_actividad_proyecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_sip_anexo cor1440_gen_actividad_sip_anexo_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT cor1440_gen_actividad_sip_anexo_id_key UNIQUE (id);


--
-- Name: cor1440_gen_actividad_sip_anexo cor1440_gen_actividad_sip_anexo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT cor1440_gen_actividad_sip_anexo_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_valorcampotind cor1440_gen_actividad_valorcampotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_valorcampotind
    ADD CONSTRAINT cor1440_gen_actividad_valorcampotind_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadpf cor1440_gen_actividadpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadpf
    ADD CONSTRAINT cor1440_gen_actividadpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadtipo cor1440_gen_actividadtipo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_anexo_efecto cor1440_gen_anexo_efecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_efecto
    ADD CONSTRAINT cor1440_gen_anexo_efecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_anexo_proyectofinanciero cor1440_gen_anexo_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_proyectofinanciero
    ADD CONSTRAINT cor1440_gen_anexo_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_asistencia cor1440_gen_asistencia_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_asistencia
    ADD CONSTRAINT cor1440_gen_asistencia_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_cambiosproyectofinanciero cor1440_gen_cambiosproyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_cambiosproyectofinanciero
    ADD CONSTRAINT cor1440_gen_cambiosproyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_campoact cor1440_gen_campoact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_campoact
    ADD CONSTRAINT cor1440_gen_campoact_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_campotind cor1440_gen_campotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_campotind
    ADD CONSTRAINT cor1440_gen_campotind_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_caracterizacionpersona cor1440_gen_caracterizacionpersona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_caracterizacionpersona
    ADD CONSTRAINT cor1440_gen_caracterizacionpersona_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_efecto cor1440_gen_efecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_efecto
    ADD CONSTRAINT cor1440_gen_efecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_financiador cor1440_gen_financiador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_financiador
    ADD CONSTRAINT cor1440_gen_financiador_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_indicadorpf cor1440_gen_indicadorpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_indicadorpf
    ADD CONSTRAINT cor1440_gen_indicadorpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_informe cor1440_gen_informe_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_informe
    ADD CONSTRAINT cor1440_gen_informe_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_mindicadorpf cor1440_gen_mindicadorpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_mindicadorpf
    ADD CONSTRAINT cor1440_gen_mindicadorpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_objetivopf cor1440_gen_objetivopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_objetivopf
    ADD CONSTRAINT cor1440_gen_objetivopf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_pmindicadorpf cor1440_gen_pmindicadorpf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_pmindicadorpf
    ADD CONSTRAINT cor1440_gen_pmindicadorpf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_pprogtind cor1440_gen_pprogtind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_pprogtind
    ADD CONSTRAINT cor1440_gen_pprogtind_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_proyecto cor1440_gen_proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyecto
    ADD CONSTRAINT cor1440_gen_proyecto_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_proyectofinanciero cor1440_gen_proyectofinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyectofinanciero
    ADD CONSTRAINT cor1440_gen_proyectofinanciero_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_resultadopf cor1440_gen_resultadopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_resultadopf
    ADD CONSTRAINT cor1440_gen_resultadopf_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_tipoindicador cor1440_gen_tipoindicador_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_tipoindicador
    ADD CONSTRAINT cor1440_gen_tipoindicador_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_valorcampoact cor1440_gen_valorcampoact_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_valorcampoact
    ADD CONSTRAINT cor1440_gen_valorcampoact_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_valorcampotind cor1440_gen_valorcampotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_valorcampotind
    ADD CONSTRAINT cor1440_gen_valorcampotind_pkey PRIMARY KEY (id);


--
-- Name: desembolso desembolso_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.desembolso
    ADD CONSTRAINT desembolso_pkey PRIMARY KEY (id);


--
-- Name: efecto_valorcampotind efecto_valorcampotind_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.efecto_valorcampotind
    ADD CONSTRAINT efecto_valorcampotind_pkey PRIMARY KEY (id);


--
-- Name: empresaps empresaps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.empresaps
    ADD CONSTRAINT empresaps_pkey PRIMARY KEY (id);


--
-- Name: sip_etiqueta etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_etiqueta
    ADD CONSTRAINT etiqueta_pkey PRIMARY KEY (id);


--
-- Name: fondopensiones fondopensiones_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fondopensiones
    ADD CONSTRAINT fondopensiones_pkey PRIMARY KEY (id);


--
-- Name: grupo_subgrupo grupo_subgrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_subgrupo
    ADD CONSTRAINT grupo_subgrupo_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_campohc heb412_gen_campohc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campohc
    ADD CONSTRAINT heb412_gen_campohc_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_campoplantillahcm heb412_gen_campoplantillahcm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campoplantillahcm
    ADD CONSTRAINT heb412_gen_campoplantillahcm_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_campoplantillahcr heb412_gen_campoplantillahcr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campoplantillahcr
    ADD CONSTRAINT heb412_gen_campoplantillahcr_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_doc heb412_gen_doc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_doc
    ADD CONSTRAINT heb412_gen_doc_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_formulario_plantillahcr heb412_gen_formulario_plantillahcr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_formulario_plantillahcr
    ADD CONSTRAINT heb412_gen_formulario_plantillahcr_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_plantilladoc heb412_gen_plantilladoc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_plantilladoc
    ADD CONSTRAINT heb412_gen_plantilladoc_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_plantillahcm heb412_gen_plantillahcm_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_plantillahcm
    ADD CONSTRAINT heb412_gen_plantillahcm_pkey PRIMARY KEY (id);


--
-- Name: heb412_gen_plantillahcr heb412_gen_plantillahcr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_plantillahcr
    ADD CONSTRAINT heb412_gen_plantillahcr_pkey PRIMARY KEY (id);


--
-- Name: informeauditoria informeauditoria_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informeauditoria
    ADD CONSTRAINT informeauditoria_pkey PRIMARY KEY (id);


--
-- Name: informeevaluacion informeevaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informeevaluacion
    ADD CONSTRAINT informeevaluacion_pkey PRIMARY KEY (id);


--
-- Name: informefinanciero informefinanciero_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informefinanciero
    ADD CONSTRAINT informefinanciero_pkey PRIMARY KEY (id);


--
-- Name: informenarrativo informenarrativo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informenarrativo
    ADD CONSTRAINT informenarrativo_pkey PRIMARY KEY (id);


--
-- Name: mr519_gen_campo mr519_gen_campo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_campo
    ADD CONSTRAINT mr519_gen_campo_pkey PRIMARY KEY (id);


--
-- Name: mr519_gen_encuestapersona mr519_gen_encuestapersona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestapersona
    ADD CONSTRAINT mr519_gen_encuestapersona_pkey PRIMARY KEY (id);


--
-- Name: mr519_gen_encuestausuario mr519_gen_encuestausuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestausuario
    ADD CONSTRAINT mr519_gen_encuestausuario_pkey PRIMARY KEY (id);


--
-- Name: mr519_gen_formulario mr519_gen_formulario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_formulario
    ADD CONSTRAINT mr519_gen_formulario_pkey PRIMARY KEY (id);


--
-- Name: mr519_gen_opcioncs mr519_gen_opcioncs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_opcioncs
    ADD CONSTRAINT mr519_gen_opcioncs_pkey PRIMARY KEY (id);


--
-- Name: mr519_gen_respuestafor mr519_gen_respuestafor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_respuestafor
    ADD CONSTRAINT mr519_gen_respuestafor_pkey PRIMARY KEY (id);


--
-- Name: mr519_gen_valorcampo mr519_gen_valorcampo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_valorcampo
    ADD CONSTRAINT mr519_gen_valorcampo_pkey PRIMARY KEY (id);


--
-- Name: niveleducacion niveleducacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.niveleducacion
    ADD CONSTRAINT niveleducacion_pkey PRIMARY KEY (id);


--
-- Name: nivelrelacion nivelrelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nivelrelacion
    ADD CONSTRAINT nivelrelacion_pkey PRIMARY KEY (id);


--
-- Name: nucleoconflicto nucleoconflicto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.nucleoconflicto
    ADD CONSTRAINT nucleoconflicto_pkey PRIMARY KEY (id);


--
-- Name: perfilprofesional perfilprofesional_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.perfilprofesional
    ADD CONSTRAINT perfilprofesional_pkey PRIMARY KEY (id);


--
-- Name: sip_persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: planencuesta planencuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planencuesta
    ADD CONSTRAINT planencuesta_pkey PRIMARY KEY (id);


--
-- Name: plantillacorreo plantillacorreo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.plantillacorreo
    ADD CONSTRAINT plantillacorreo_pkey PRIMARY KEY (id);


--
-- Name: procesogh procesogh_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.procesogh
    ADD CONSTRAINT procesogh_pkey PRIMARY KEY (id);


--
-- Name: productopf productopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productopf
    ADD CONSTRAINT productopf_pkey PRIMARY KEY (id);


--
-- Name: profesion profesion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesion
    ADD CONSTRAINT profesion_pkey PRIMARY KEY (id);


--
-- Name: proyectofinanciero_uresponsable proyectofinanciero_uresponsable_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_uresponsable
    ADD CONSTRAINT proyectofinanciero_uresponsable_pkey PRIMARY KEY (id);


--
-- Name: proyectofinanciero_usuario proyectofinanciero_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_usuario
    ADD CONSTRAINT proyectofinanciero_usuario_pkey PRIMARY KEY (id);


--
-- Name: publicacion publicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.publicacion
    ADD CONSTRAINT publicacion_pkey PRIMARY KEY (id);


--
-- Name: redactor redactor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.redactor
    ADD CONSTRAINT redactor_pkey PRIMARY KEY (id);


--
-- Name: regiongrupo regiongrupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regiongrupo
    ADD CONSTRAINT regiongrupo_pkey PRIMARY KEY (id);


--
-- Name: sip_oficina regionsjr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_oficina
    ADD CONSTRAINT regionsjr_pkey PRIMARY KEY (id);


--
-- Name: sal7711_gen_articulo sal7711_gen_articulo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo
    ADD CONSTRAINT sal7711_gen_articulo_pkey PRIMARY KEY (id);


--
-- Name: sal7711_gen_bitacora sal7711_gen_bitacora_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_bitacora
    ADD CONSTRAINT sal7711_gen_bitacora_pkey PRIMARY KEY (id);


--
-- Name: sal7711_gen_categoriaprensa sal7711_gen_categoriaprensa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_categoriaprensa
    ADD CONSTRAINT sal7711_gen_categoriaprensa_pkey PRIMARY KEY (id);


--
-- Name: sectoractor sectoractor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectoractor
    ADD CONSTRAINT sectoractor_pkey PRIMARY KEY (id);


--
-- Name: sectorapc sectorapc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sectorapc
    ADD CONSTRAINT sectorapc_pkey PRIMARY KEY (id);


--
-- Name: sip_actorsocial_persona sip_actorsocial_persona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial_persona
    ADD CONSTRAINT sip_actorsocial_persona_pkey PRIMARY KEY (id);


--
-- Name: sip_actorsocial sip_actorsocial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial
    ADD CONSTRAINT sip_actorsocial_pkey PRIMARY KEY (id);


--
-- Name: sip_clase sip_clase_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_clase
    ADD CONSTRAINT sip_clase_id_key UNIQUE (id);


--
-- Name: sip_clase sip_clase_id_municipio_id_clalocal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_clase
    ADD CONSTRAINT sip_clase_id_municipio_id_clalocal_key UNIQUE (id_municipio, id_clalocal);


--
-- Name: sip_clase sip_clase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_clase
    ADD CONSTRAINT sip_clase_pkey PRIMARY KEY (id);


--
-- Name: sip_departamento sip_departamento_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_departamento
    ADD CONSTRAINT sip_departamento_id_key UNIQUE (id);


--
-- Name: sip_departamento sip_departamento_id_pais_id_deplocal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_departamento
    ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_key UNIQUE (id_pais, id_deplocal);


--
-- Name: sip_departamento sip_departamento_id_pais_id_deplocal_key1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_departamento
    ADD CONSTRAINT sip_departamento_id_pais_id_deplocal_key1 UNIQUE (id_pais, id_deplocal);


--
-- Name: sip_departamento sip_departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_departamento
    ADD CONSTRAINT sip_departamento_pkey PRIMARY KEY (id);


--
-- Name: sip_fuenteprensa sip_fuenteprensa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_fuenteprensa
    ADD CONSTRAINT sip_fuenteprensa_pkey PRIMARY KEY (id);


--
-- Name: sip_grupo sip_grupo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_grupo
    ADD CONSTRAINT sip_grupo_pkey PRIMARY KEY (id);


--
-- Name: sip_grupoper sip_grupoper_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_grupoper
    ADD CONSTRAINT sip_grupoper_pkey PRIMARY KEY (id);


--
-- Name: sip_municipio sip_municipio_id_departamento_id_munlocal_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_municipio
    ADD CONSTRAINT sip_municipio_id_departamento_id_munlocal_key UNIQUE (id_departamento, id_munlocal);


--
-- Name: sip_municipio sip_municipio_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_municipio
    ADD CONSTRAINT sip_municipio_id_key UNIQUE (id);


--
-- Name: sip_municipio sip_municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_municipio
    ADD CONSTRAINT sip_municipio_pkey PRIMARY KEY (id);


--
-- Name: sip_perfilactorsocial sip_perfilactorsocial_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_perfilactorsocial
    ADD CONSTRAINT sip_perfilactorsocial_pkey PRIMARY KEY (id);


--
-- Name: sip_persona_trelacion sip_persona_trelacion_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_id_key UNIQUE (id);


--
-- Name: sip_persona_trelacion sip_persona_trelacion_persona1_persona2_id_trelacion_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_persona1_persona2_id_trelacion_key UNIQUE (persona1, persona2, id_trelacion);


--
-- Name: sip_persona_trelacion sip_persona_trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona_trelacion
    ADD CONSTRAINT sip_persona_trelacion_pkey PRIMARY KEY (id);


--
-- Name: sip_sectoractor sip_sectoractor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_sectoractor
    ADD CONSTRAINT sip_sectoractor_pkey PRIMARY KEY (id);


--
-- Name: sip_tema sip_tema_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_tema
    ADD CONSTRAINT sip_tema_pkey PRIMARY KEY (id);


--
-- Name: sip_trivalente sip_trivalente_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_trivalente
    ADD CONSTRAINT sip_trivalente_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad sivel2_gen_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT sivel2_gen_actividad_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_rangoedadac sivel2_gen_actividad_rangoedadac_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_rangoedadac
    ADD CONSTRAINT sivel2_gen_actividad_rangoedadac_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadarea sivel2_gen_actividadarea_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadarea
    ADD CONSTRAINT sivel2_gen_actividadarea_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividadareas_actividad sivel2_gen_actividadareas_actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadareas_actividad
    ADD CONSTRAINT sivel2_gen_actividadareas_actividad_pkey PRIMARY KEY (id);


--
-- Name: sip_anexo sivel2_gen_anexoactividad_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_anexo
    ADD CONSTRAINT sivel2_gen_anexoactividad_pkey PRIMARY KEY (id);


--
-- Name: sip_pais sivel2_gen_pais_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_pais
    ADD CONSTRAINT sivel2_gen_pais_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_rangoedadac sivel2_gen_rangoedadac_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_rangoedadac
    ADD CONSTRAINT sivel2_gen_rangoedadac_pkey PRIMARY KEY (id);


--
-- Name: sip_tdocumento sivel2_gen_tdocumento_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_tdocumento
    ADD CONSTRAINT sivel2_gen_tdocumento_pkey PRIMARY KEY (id);


--
-- Name: tasacambio tasacambio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasacambio
    ADD CONSTRAINT tasacambio_pkey PRIMARY KEY (id);


--
-- Name: sip_tclase tclase_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_tclase
    ADD CONSTRAINT tclase_pkey PRIMARY KEY (id);


--
-- Name: tipoanexo tipoanexo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoanexo
    ADD CONSTRAINT tipoanexo_pkey PRIMARY KEY (id);


--
-- Name: tipocontrato tipocontrato_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipocontrato
    ADD CONSTRAINT tipocontrato_pkey PRIMARY KEY (id);


--
-- Name: tipoconvenio tipoconvenio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoconvenio
    ADD CONSTRAINT tipoconvenio_pkey PRIMARY KEY (id);


--
-- Name: tipomoneda tipomoneda_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipomoneda
    ADD CONSTRAINT tipomoneda_pkey PRIMARY KEY (id);


--
-- Name: tiponomina tiponomina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tiponomina
    ADD CONSTRAINT tiponomina_pkey PRIMARY KEY (id);


--
-- Name: tipoproductopf tipoproductopf_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipoproductopf
    ADD CONSTRAINT tipoproductopf_pkey PRIMARY KEY (id);


--
-- Name: sip_trelacion trelacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_trelacion
    ADD CONSTRAINT trelacion_pkey PRIMARY KEY (id);


--
-- Name: sip_tsitio tsitio_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_tsitio
    ADD CONSTRAINT tsitio_pkey PRIMARY KEY (id);


--
-- Name: sip_ubicacion ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: vinculacion vinculacion_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vinculacion
    ADD CONSTRAINT vinculacion_pkey PRIMARY KEY (id);


--
-- Name: cor1440_gen_actividad_proyectofinanciero_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX cor1440_gen_actividad_proyectofinanciero_idx ON public.cor1440_gen_actividad_proyectofinanciero USING btree (actividad_id, proyectofinanciero_id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_actor_on_pais_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_actor_on_pais_id ON public.actor USING btree (pais_id);


--
-- Name: index_comunicado_on_nombre; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_comunicado_on_nombre ON public.comunicado USING btree (nombre);


--
-- Name: index_cor1440_gen_actividad_sip_anexo_on_anexo_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_cor1440_gen_actividad_sip_anexo_on_anexo_id ON public.cor1440_gen_actividad_sip_anexo USING btree (anexo_id);


--
-- Name: index_heb412_gen_doc_on_tdoc_type_and_tdoc_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_heb412_gen_doc_on_tdoc_type_and_tdoc_id ON public.heb412_gen_doc USING btree (tdoc_type, tdoc_id);


--
-- Name: index_mr519_gen_encuestapersona_on_adurl; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_mr519_gen_encuestapersona_on_adurl ON public.mr519_gen_encuestapersona USING btree (adurl);


--
-- Name: index_sip_actorsocial_on_grupoper_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sip_actorsocial_on_grupoper_id ON public.sip_actorsocial USING btree (grupoper_id);


--
-- Name: index_sip_actorsocial_on_pais_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sip_actorsocial_on_pais_id ON public.sip_actorsocial USING btree (pais_id);


--
-- Name: index_sip_ubicacion_on_id_clase; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sip_ubicacion_on_id_clase ON public.sip_ubicacion USING btree (id_clase);


--
-- Name: index_sip_ubicacion_on_id_departamento; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sip_ubicacion_on_id_departamento ON public.sip_ubicacion USING btree (id_departamento);


--
-- Name: index_sip_ubicacion_on_id_municipio; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sip_ubicacion_on_id_municipio ON public.sip_ubicacion USING btree (id_municipio);


--
-- Name: index_sip_ubicacion_on_id_pais; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sip_ubicacion_on_id_pais ON public.sip_ubicacion USING btree (id_pais);


--
-- Name: index_sivel2_gen_actividad_on_rangoedadac_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_on_rangoedadac_id ON public.cor1440_gen_actividad USING btree (rangoedadac_id);


--
-- Name: index_sivel2_gen_actividad_on_usuario_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_on_usuario_id ON public.cor1440_gen_actividad USING btree (usuario_id);


--
-- Name: index_sivel2_gen_actividad_rangoedadac_on_actividad_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_rangoedadac_on_actividad_id ON public.cor1440_gen_actividad_rangoedadac USING btree (actividad_id);


--
-- Name: index_sivel2_gen_actividad_rangoedadac_on_rangoedadac_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_sivel2_gen_actividad_rangoedadac_on_rangoedadac_id ON public.cor1440_gen_actividad_rangoedadac USING btree (rangoedadac_id);


--
-- Name: index_usuario_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_usuario_on_email ON public.usuario USING btree (email);


--
-- Name: index_usuario_on_regionsjr_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_usuario_on_regionsjr_id ON public.usuario USING btree (regionsjr_id);


--
-- Name: index_usuario_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_usuario_on_reset_password_token ON public.usuario USING btree (reset_password_token);


--
-- Name: sip_busca_mundep; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX sip_busca_mundep ON public.sip_mundep USING gin (mundep);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: usuario_nusuario; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX usuario_nusuario ON public.usuario USING btree (nusuario);


--
-- Name: cor1440_gen_actividad actividad_regionsjr_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT actividad_regionsjr_id_fkey FOREIGN KEY (oficina_id) REFERENCES public.sip_oficina(id);


--
-- Name: sip_clase clase_id_tclase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_clase
    ADD CONSTRAINT clase_id_tclase_fkey FOREIGN KEY (id_tclase) REFERENCES public.sip_tclase(id);


--
-- Name: cor1440_gen_actividad cor1440_gen_actividad_usuario_lf; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT cor1440_gen_actividad_usuario_lf FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_actividad_actividadtipo cor1440_gen_actividadtipo_actividad_actividad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_actividad_actividad_id_fkey FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_actividad_actividadtipo cor1440_gen_actividadtipo_actividad_actividadtipo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_actividadtipo
    ADD CONSTRAINT cor1440_gen_actividadtipo_actividad_actividadtipo_id_fkey FOREIGN KEY (actividadtipo_id) REFERENCES public.cor1440_gen_actividadtipo(id);


--
-- Name: sip_departamento departamento_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_departamento
    ADD CONSTRAINT departamento_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES public.sip_pais(id);


--
-- Name: productopf fk_rails_005c6efcb9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productopf
    ADD CONSTRAINT fk_rails_005c6efcb9 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad_valorcampotind fk_rails_0104bf757c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_valorcampotind
    ADD CONSTRAINT fk_rails_0104bf757c FOREIGN KEY (valorcampotind_id) REFERENCES public.cor1440_gen_valorcampotind(id);


--
-- Name: actor_sectoractor fk_rails_01abd767ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_sectoractor
    ADD CONSTRAINT fk_rails_01abd767ad FOREIGN KEY (sectoractor_id) REFERENCES public.sectoractor(id);


--
-- Name: actor_efecto fk_rails_043ee8d6b5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_efecto
    ADD CONSTRAINT fk_rails_043ee8d6b5 FOREIGN KEY (actor_id) REFERENCES public.actor(id);


--
-- Name: cor1440_gen_mindicadorpf fk_rails_06564b910d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_mindicadorpf
    ADD CONSTRAINT fk_rails_06564b910d FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_resultadopf fk_rails_06ba24bd54; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_resultadopf
    ADD CONSTRAINT fk_rails_06ba24bd54 FOREIGN KEY (objetivopf_id) REFERENCES public.cor1440_gen_objetivopf(id);


--
-- Name: proyectofinanciero_usuario fk_rails_06be7b769b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_06be7b769b FOREIGN KEY (perfilprofesional_id) REFERENCES public.perfilprofesional(id);


--
-- Name: sip_municipio fk_rails_089870a38d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_municipio
    ADD CONSTRAINT fk_rails_089870a38d FOREIGN KEY (id_departamento) REFERENCES public.sip_departamento(id);


--
-- Name: cor1440_gen_actividad_actividadpf fk_rails_08b9aa072b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_actividadpf
    ADD CONSTRAINT fk_rails_08b9aa072b FOREIGN KEY (actividadpf_id) REFERENCES public.cor1440_gen_actividadpf(id);


--
-- Name: cor1440_gen_actividadpf fk_rails_0b10834ba7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadpf
    ADD CONSTRAINT fk_rails_0b10834ba7 FOREIGN KEY (resultadopf_id) REFERENCES public.cor1440_gen_resultadopf(id);


--
-- Name: cor1440_gen_actividad_respuestafor fk_rails_0b4fb6fceb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_respuestafor
    ADD CONSTRAINT fk_rails_0b4fb6fceb FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_efecto_respuestafor fk_rails_0ba7ab4660; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_efecto_respuestafor
    ADD CONSTRAINT fk_rails_0ba7ab4660 FOREIGN KEY (efecto_id) REFERENCES public.cor1440_gen_efecto(id);


--
-- Name: cor1440_gen_financiador_proyectofinanciero fk_rails_0cd09d688c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_financiador_proyectofinanciero
    ADD CONSTRAINT fk_rails_0cd09d688c FOREIGN KEY (financiador_id) REFERENCES public.cor1440_gen_financiador(id);


--
-- Name: informeevaluacion fk_rails_0dc2f89fdb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informeevaluacion
    ADD CONSTRAINT fk_rails_0dc2f89fdb FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: anexo_proyectofinanciero fk_rails_0ea362f58d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_0ea362f58d FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: contextoinv fk_rails_0fa44160c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contextoinv
    ADD CONSTRAINT fk_rails_0fa44160c3 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_mindicadorpf fk_rails_0fbac6136b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_mindicadorpf
    ADD CONSTRAINT fk_rails_0fbac6136b FOREIGN KEY (indicadorpf_id) REFERENCES public.cor1440_gen_indicadorpf(id);


--
-- Name: cor1440_gen_actorsocial_efecto fk_rails_109a11e304; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actorsocial_efecto
    ADD CONSTRAINT fk_rails_109a11e304 FOREIGN KEY (efecto_id) REFERENCES public.cor1440_gen_efecto(id);


--
-- Name: usuario fk_rails_114b393d00; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_114b393d00 FOREIGN KEY (perfilprofesional_id) REFERENCES public.perfilprofesional(id);


--
-- Name: cor1440_gen_caracterizacionpersona fk_rails_119f5dffb4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_caracterizacionpersona
    ADD CONSTRAINT fk_rails_119f5dffb4 FOREIGN KEY (ulteditor_id) REFERENCES public.usuario(id);


--
-- Name: convenio fk_rails_1229b62348; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fk_rails_1229b62348 FOREIGN KEY (responsable_id) REFERENCES public.usuario(id);


--
-- Name: mr519_gen_encuestapersona fk_rails_13f8d66312; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestapersona
    ADD CONSTRAINT fk_rails_13f8d66312 FOREIGN KEY (planencuesta_id) REFERENCES public.planencuesta(id);


--
-- Name: actor fk_rails_1a67af6964; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT fk_rails_1a67af6964 FOREIGN KEY (nivelrelacion_id) REFERENCES public.nivelrelacion(id);


--
-- Name: mr519_gen_encuestausuario fk_rails_1b24d10e82; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestausuario
    ADD CONSTRAINT fk_rails_1b24d10e82 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: heb412_gen_formulario_plantillahcr fk_rails_1bdf79898c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_formulario_plantillahcr
    ADD CONSTRAINT fk_rails_1bdf79898c FOREIGN KEY (plantillahcr_id) REFERENCES public.heb412_gen_plantillahcr(id);


--
-- Name: cor1440_gen_caracterizacionpf fk_rails_1d1caee38f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_caracterizacionpf
    ADD CONSTRAINT fk_rails_1d1caee38f FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: heb412_gen_campohc fk_rails_1e5f26c999; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campohc
    ADD CONSTRAINT fk_rails_1e5f26c999 FOREIGN KEY (doc_id) REFERENCES public.heb412_gen_doc(id);


--
-- Name: cor1440_gen_actividad fk_rails_1f29b04750; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_1f29b04750 FOREIGN KEY (precedidapor) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: informefinanciero fk_rails_1f7068d549; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informefinanciero
    ADD CONSTRAINT fk_rails_1f7068d549 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad fk_rails_20940a21f8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_20940a21f8 FOREIGN KEY (nucleoconflicto_id) REFERENCES public.nucleoconflicto(id);


--
-- Name: grupo_subgrupo fk_rails_20cec9f9a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_subgrupo
    ADD CONSTRAINT fk_rails_20cec9f9a1 FOREIGN KEY (grupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: actividad_grupo fk_rails_214969d697; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_grupo
    ADD CONSTRAINT fk_rails_214969d697 FOREIGN KEY (grupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: cor1440_gen_caracterizacionpersona fk_rails_240640f30e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_caracterizacionpersona
    ADD CONSTRAINT fk_rails_240640f30e FOREIGN KEY (persona_id) REFERENCES public.sip_persona(id);


--
-- Name: sip_grupo fk_rails_2562d186cc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_grupo
    ADD CONSTRAINT fk_rails_2562d186cc FOREIGN KEY (procesogh_id) REFERENCES public.procesogh(id);


--
-- Name: cor1440_gen_anexo_proyectofinanciero fk_rails_26e56f96f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_26e56f96f9 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: usuario fk_rails_272649683b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_272649683b FOREIGN KEY (niveleducacion_id) REFERENCES public.niveleducacion(id);


--
-- Name: proyectofinanciero_uresponsable fk_rails_272a913d18; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_uresponsable
    ADD CONSTRAINT fk_rails_272a913d18 FOREIGN KEY (uresponsable_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_campotind fk_rails_2770ce966d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_campotind
    ADD CONSTRAINT fk_rails_2770ce966d FOREIGN KEY (tipoindicador_id) REFERENCES public.cor1440_gen_tipoindicador(id);


--
-- Name: proyectofinanciero_usuario fk_rails_28225d4dc2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_28225d4dc2 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_informe fk_rails_294895347e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_informe
    ADD CONSTRAINT fk_rails_294895347e FOREIGN KEY (filtroproyecto) REFERENCES public.cor1440_gen_proyecto(id);


--
-- Name: cor1440_gen_actividad fk_rails_2983c828da; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_2983c828da FOREIGN KEY (redactor_id) REFERENCES public.redactor(id);


--
-- Name: cor1440_gen_informe fk_rails_2bd685d2b3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_informe
    ADD CONSTRAINT fk_rails_2bd685d2b3 FOREIGN KEY (filtroresponsable) REFERENCES public.usuario(id);


--
-- Name: mr519_gen_encuestausuario fk_rails_2cb09d778a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestausuario
    ADD CONSTRAINT fk_rails_2cb09d778a FOREIGN KEY (respuestafor_id) REFERENCES public.mr519_gen_respuestafor(id);


--
-- Name: heb412_gen_doc fk_rails_2dd6d3dac3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_doc
    ADD CONSTRAINT fk_rails_2dd6d3dac3 FOREIGN KEY (dirpapa) REFERENCES public.heb412_gen_doc(id);


--
-- Name: actor_regiongrupo fk_rails_2e83e09369; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_regiongrupo
    ADD CONSTRAINT fk_rails_2e83e09369 FOREIGN KEY (regiongrupo_id) REFERENCES public.regiongrupo(id);


--
-- Name: cor1440_gen_valorcampoact fk_rails_3060a94455; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_valorcampoact
    ADD CONSTRAINT fk_rails_3060a94455 FOREIGN KEY (campoact_id) REFERENCES public.cor1440_gen_campoact(id);


--
-- Name: contrato fk_rails_31397bfaea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contrato
    ADD CONSTRAINT fk_rails_31397bfaea FOREIGN KEY (tipocontrato_id) REFERENCES public.tipocontrato(id);


--
-- Name: actorsocial_regiongrupo fk_rails_3254d1bd1e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_regiongrupo
    ADD CONSTRAINT fk_rails_3254d1bd1e FOREIGN KEY (regiongrupo_id) REFERENCES public.regiongrupo(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_3792591d9e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_3792591d9e FOREIGN KEY (sectorapc_id) REFERENCES public.sectorapc(id);


--
-- Name: efecto_valorcampotind fk_rails_3881614cfb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.efecto_valorcampotind
    ADD CONSTRAINT fk_rails_3881614cfb FOREIGN KEY (valorcampotind_id) REFERENCES public.cor1440_gen_valorcampotind(id);


--
-- Name: cor1440_gen_actividad_proyecto fk_rails_395faa0882; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_proyecto
    ADD CONSTRAINT fk_rails_395faa0882 FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: productopf fk_rails_3abca040a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.productopf
    ADD CONSTRAINT fk_rails_3abca040a4 FOREIGN KEY (tipoproductopf_id) REFERENCES public.tipoproductopf(id);


--
-- Name: anexo_proyectofinanciero fk_rails_3b2f5808be; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_3b2f5808be FOREIGN KEY (tipoanexo_id) REFERENCES public.tipoanexo(id);


--
-- Name: actividad_grupo fk_rails_3d3c43f06c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_grupo
    ADD CONSTRAINT fk_rails_3d3c43f06c FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: proyectofinanciero_usuario fk_rails_3f5055fb42; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_3f5055fb42 FOREIGN KEY (cargo_id) REFERENCES public.cargo(id);


--
-- Name: cor1440_gen_informe fk_rails_40cb623d50; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_informe
    ADD CONSTRAINT fk_rails_40cb623d50 FOREIGN KEY (filtroproyectofinanciero) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: efecto_valorcampotind fk_rails_43198ca4c9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.efecto_valorcampotind
    ADD CONSTRAINT fk_rails_43198ca4c9 FOREIGN KEY (efecto_id) REFERENCES public.cor1440_gen_efecto(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_4473f9ee28; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_4473f9ee28 FOREIGN KEY (respgp_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_actividad fk_rails_45dcda8048; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_45dcda8048 FOREIGN KEY (contextoinv_id) REFERENCES public.contextoinv(id);


--
-- Name: sip_actorsocial_persona fk_rails_4672f6cbcd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial_persona
    ADD CONSTRAINT fk_rails_4672f6cbcd FOREIGN KEY (persona_id) REFERENCES public.sip_persona(id);


--
-- Name: usuario fk_rails_46c248bf39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_46c248bf39 FOREIGN KEY (labdepartamento_id) REFERENCES public.sip_departamento(id);


--
-- Name: informenarrativo fk_rails_473bd646f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informenarrativo
    ADD CONSTRAINT fk_rails_473bd646f9 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: grupo_proyectofinanciero fk_rails_488261d2c6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_proyectofinanciero
    ADD CONSTRAINT fk_rails_488261d2c6 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad_sip_anexo fk_rails_49ec1ae361; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT fk_rails_49ec1ae361 FOREIGN KEY (anexo_id) REFERENCES public.sip_anexo(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_4a0bd96143; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_4a0bd96143 FOREIGN KEY (objetivopf_id) REFERENCES public.cor1440_gen_objetivopf(id);


--
-- Name: anexo_convenio fk_rails_4b4b8b698d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_convenio
    ADD CONSTRAINT fk_rails_4b4b8b698d FOREIGN KEY (convenio_id) REFERENCES public.convenio(id);


--
-- Name: mr519_gen_encuestapersona fk_rails_4d1a033a1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestapersona
    ADD CONSTRAINT fk_rails_4d1a033a1f FOREIGN KEY (anexo_id) REFERENCES public.sip_anexo(id);


--
-- Name: sip_ubicacion fk_rails_4dd7a7f238; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT fk_rails_4dd7a7f238 FOREIGN KEY (id_departamento) REFERENCES public.sip_departamento(id);


--
-- Name: cor1440_gen_valorcampotind fk_rails_4f2fc96457; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_valorcampotind
    ADD CONSTRAINT fk_rails_4f2fc96457 FOREIGN KEY (campotind_id) REFERENCES public.cor1440_gen_campotind(id);


--
-- Name: cor1440_gen_pprogtind fk_rails_4fbdcc73b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_pprogtind
    ADD CONSTRAINT fk_rails_4fbdcc73b2 FOREIGN KEY (tipoindicador_id) REFERENCES public.cor1440_gen_tipoindicador(id);


--
-- Name: cor1440_gen_caracterizacionpf fk_rails_4fcf0ffb4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_caracterizacionpf
    ADD CONSTRAINT fk_rails_4fcf0ffb4f FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividad_proyectofinanciero fk_rails_524486e06b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_proyectofinanciero
    ADD CONSTRAINT fk_rails_524486e06b FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: sal7711_gen_bitacora fk_rails_52d9d2f700; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_bitacora
    ADD CONSTRAINT fk_rails_52d9d2f700 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: mr519_gen_encuestapersona fk_rails_54b3e0ed5c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestapersona
    ADD CONSTRAINT fk_rails_54b3e0ed5c FOREIGN KEY (persona_id) REFERENCES public.sip_persona(id);


--
-- Name: actividad_nucleoconflicto fk_rails_55868fbce2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_nucleoconflicto
    ADD CONSTRAINT fk_rails_55868fbce2 FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: actividad_actor_porborrar fk_rails_56bdc49b83; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_actor_porborrar
    ADD CONSTRAINT fk_rails_56bdc49b83 FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: actorsocial_regiongrupo fk_rails_56d1b6e3d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_regiongrupo
    ADD CONSTRAINT fk_rails_56d1b6e3d4 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: cor1440_gen_objetivopf fk_rails_57b4fd8780; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_objetivopf
    ADD CONSTRAINT fk_rails_57b4fd8780 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_anexo_efecto fk_rails_5a3da48239; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_efecto
    ADD CONSTRAINT fk_rails_5a3da48239 FOREIGN KEY (efecto_id) REFERENCES public.cor1440_gen_efecto(id);


--
-- Name: coordinador_proyectofinanciero fk_rails_5a7dd1dd10; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordinador_proyectofinanciero
    ADD CONSTRAINT fk_rails_5a7dd1dd10 FOREIGN KEY (coordinador_id) REFERENCES public.usuario(id);


--
-- Name: sip_actorsocial fk_rails_5b21e3a2af; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial
    ADD CONSTRAINT fk_rails_5b21e3a2af FOREIGN KEY (grupoper_id) REFERENCES public.sip_grupoper(id);


--
-- Name: profesion fk_rails_5bb470dd0c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.profesion
    ADD CONSTRAINT fk_rails_5bb470dd0c FOREIGN KEY (areaestudios_id) REFERENCES public.areaestudios(id);


--
-- Name: actividad_publicacion fk_rails_60dbe4c315; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_publicacion
    ADD CONSTRAINT fk_rails_60dbe4c315 FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: actorsocial_municipio fk_rails_619ad97755; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_municipio
    ADD CONSTRAINT fk_rails_619ad97755 FOREIGN KEY (municipio_id) REFERENCES public.sip_municipio(id);


--
-- Name: cor1440_gen_plantillahcm_proyectofinanciero fk_rails_62c9243a43; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_plantillahcm_proyectofinanciero
    ADD CONSTRAINT fk_rails_62c9243a43 FOREIGN KEY (plantillahcm_id) REFERENCES public.heb412_gen_plantillahcm(id);


--
-- Name: mr519_gen_opcioncs fk_rails_656b4a3ca7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_opcioncs
    ADD CONSTRAINT fk_rails_656b4a3ca7 FOREIGN KEY (campo_id) REFERENCES public.mr519_gen_campo(id);


--
-- Name: sal7711_gen_articulo fk_rails_65eae7449f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_65eae7449f FOREIGN KEY (departamento_id) REFERENCES public.sip_departamento(id);


--
-- Name: informeauditoria fk_rails_67f52ffcf6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.informeauditoria
    ADD CONSTRAINT fk_rails_67f52ffcf6 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: heb412_gen_formulario_plantillahcr fk_rails_696d27d6f5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_formulario_plantillahcr
    ADD CONSTRAINT fk_rails_696d27d6f5 FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: vinculacion fk_rails_698ada5273; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.vinculacion
    ADD CONSTRAINT fk_rails_698ada5273 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_caracterizacionpersona fk_rails_6a82dffb63; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_caracterizacionpersona
    ADD CONSTRAINT fk_rails_6a82dffb63 FOREIGN KEY (respuestafor_id) REFERENCES public.mr519_gen_respuestafor(id);


--
-- Name: sip_ubicacion fk_rails_6ed05ed576; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT fk_rails_6ed05ed576 FOREIGN KEY (id_pais) REFERENCES public.sip_pais(id);


--
-- Name: cor1440_gen_pmindicadorpf fk_rails_701d924c54; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_pmindicadorpf
    ADD CONSTRAINT fk_rails_701d924c54 FOREIGN KEY (mindicadorpf_id) REFERENCES public.cor1440_gen_mindicadorpf(id);


--
-- Name: tipomoneda fk_rails_70898623bb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipomoneda
    ADD CONSTRAINT fk_rails_70898623bb FOREIGN KEY (pais_id) REFERENCES public.sip_pais(id);


--
-- Name: cor1440_gen_actividad_actorsocial fk_rails_70b1848d0a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_actorsocial
    ADD CONSTRAINT fk_rails_70b1848d0a FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: sip_grupo_usuario fk_rails_734ee21e62; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_grupo_usuario
    ADD CONSTRAINT fk_rails_734ee21e62 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: anexo_proyectofinanciero fk_rails_756688ae2b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_756688ae2b FOREIGN KEY (anexo_id) REFERENCES public.sip_anexo(id);


--
-- Name: convenio fk_rails_77dbba47fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.convenio
    ADD CONSTRAINT fk_rails_77dbba47fe FOREIGN KEY (tipoconvenio_id) REFERENCES public.tipoconvenio(id);


--
-- Name: usuario fk_rails_7947b08826; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_7947b08826 FOREIGN KEY (persona_id) REFERENCES public.sip_persona(id);


--
-- Name: cor1440_gen_actividad_objetivopf fk_rails_79e913c753; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_objetivopf
    ADD CONSTRAINT fk_rails_79e913c753 FOREIGN KEY (objetivopf_id) REFERENCES public.cor1440_gen_objetivopf(id);


--
-- Name: sip_actorsocial fk_rails_7bc2a60574; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial
    ADD CONSTRAINT fk_rails_7bc2a60574 FOREIGN KEY (pais_id) REFERENCES public.sip_pais(id);


--
-- Name: sip_actorsocial_persona fk_rails_7c335482f6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial_persona
    ADD CONSTRAINT fk_rails_7c335482f6 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: sal7711_gen_articulo_categoriaprensa fk_rails_7d1213c35b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo_categoriaprensa
    ADD CONSTRAINT fk_rails_7d1213c35b FOREIGN KEY (articulo_id) REFERENCES public.sal7711_gen_articulo(id);


--
-- Name: actividad_actor_porborrar fk_rails_7ebb208867; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_actor_porborrar
    ADD CONSTRAINT fk_rails_7ebb208867 FOREIGN KEY (actor_id) REFERENCES public.actor(id);


--
-- Name: actorsocial_grupo fk_rails_7f5f9e6435; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_grupo
    ADD CONSTRAINT fk_rails_7f5f9e6435 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: mr519_gen_respuestafor fk_rails_805efe6935; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_respuestafor
    ADD CONSTRAINT fk_rails_805efe6935 FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: cor1440_gen_actividad fk_rails_8196c53609; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_8196c53609 FOREIGN KEY (departamento_id) REFERENCES public.sip_departamento(id);


--
-- Name: mr519_gen_valorcampo fk_rails_819cf17399; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_valorcampo
    ADD CONSTRAINT fk_rails_819cf17399 FOREIGN KEY (campo_id) REFERENCES public.mr519_gen_campo(id);


--
-- Name: proyectofinanciero_uresponsable fk_rails_824959275e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_uresponsable
    ADD CONSTRAINT fk_rails_824959275e FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: usuario fk_rails_824d7925ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_824d7925ee FOREIGN KEY (profesion_id) REFERENCES public.profesion(id);


--
-- Name: tasacambio fk_rails_834c638220; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tasacambio
    ADD CONSTRAINT fk_rails_834c638220 FOREIGN KEY (tipomoneda_id) REFERENCES public.tipomoneda(id);


--
-- Name: mr519_gen_encuestapersona fk_rails_83755e20b9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestapersona
    ADD CONSTRAINT fk_rails_83755e20b9 FOREIGN KEY (respuestafor_id) REFERENCES public.mr519_gen_respuestafor(id);


--
-- Name: usuario fk_rails_83add769ae; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_83add769ae FOREIGN KEY (contrato_id) REFERENCES public.contrato(id);


--
-- Name: actor_sectoractor fk_rails_8718e4c155; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_sectoractor
    ADD CONSTRAINT fk_rails_8718e4c155 FOREIGN KEY (actor_id) REFERENCES public.actor(id);


--
-- Name: cor1440_gen_formulario_tipoindicador fk_rails_8978582d8a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_formulario_tipoindicador
    ADD CONSTRAINT fk_rails_8978582d8a FOREIGN KEY (tipoindicador_id) REFERENCES public.cor1440_gen_tipoindicador(id);


--
-- Name: mr519_gen_valorcampo fk_rails_8bb7650018; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_valorcampo
    ADD CONSTRAINT fk_rails_8bb7650018 FOREIGN KEY (respuestafor_id) REFERENCES public.mr519_gen_respuestafor(id);


--
-- Name: sip_grupo_usuario fk_rails_8d24f7c1c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_grupo_usuario
    ADD CONSTRAINT fk_rails_8d24f7c1c0 FOREIGN KEY (sip_grupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: cor1440_gen_actividad_objetivopf fk_rails_8d665a528c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_objetivopf
    ADD CONSTRAINT fk_rails_8d665a528c FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_cambiosproyectofinanciero fk_rails_8df1f2e905; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_cambiosproyectofinanciero
    ADD CONSTRAINT fk_rails_8df1f2e905 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: sal7711_gen_articulo fk_rails_8e3e0703f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_8e3e0703f9 FOREIGN KEY (municipio_id) REFERENCES public.sip_municipio(id);


--
-- Name: regiongrupo fk_rails_907d221630; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.regiongrupo
    ADD CONSTRAINT fk_rails_907d221630 FOREIGN KEY (grupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: sip_departamento fk_rails_92093de1a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_departamento
    ADD CONSTRAINT fk_rails_92093de1a1 FOREIGN KEY (id_pais) REFERENCES public.sip_pais(id);


--
-- Name: cor1440_gen_resultadopf fk_rails_95485cfc7a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_resultadopf
    ADD CONSTRAINT fk_rails_95485cfc7a FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_efecto_respuestafor fk_rails_95a3aff09f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_efecto_respuestafor
    ADD CONSTRAINT fk_rails_95a3aff09f FOREIGN KEY (respuestafor_id) REFERENCES public.mr519_gen_respuestafor(id);


--
-- Name: usuario fk_rails_969301a776; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_969301a776 FOREIGN KEY (empresaps_id) REFERENCES public.empresaps(id);


--
-- Name: sal7711_gen_articulo fk_rails_97ebadca1b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_97ebadca1b FOREIGN KEY (pais_id) REFERENCES public.sip_pais(id);


--
-- Name: actorsocial_municipio fk_rails_9a935e84f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_municipio
    ADD CONSTRAINT fk_rails_9a935e84f1 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: cor1440_gen_efecto fk_rails_9b37deb543; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_efecto
    ADD CONSTRAINT fk_rails_9b37deb543 FOREIGN KEY (indicadorpf_id) REFERENCES public.cor1440_gen_indicadorpf(id);


--
-- Name: cor1440_gen_financiador fk_rails_9daa099154; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_financiador
    ADD CONSTRAINT fk_rails_9daa099154 FOREIGN KEY (pais_id) REFERENCES public.sip_pais(id);


--
-- Name: actorsocial_departamento fk_rails_9f266aaf54; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_departamento
    ADD CONSTRAINT fk_rails_9f266aaf54 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: sip_actorsocial_sectoractor fk_rails_9f61a364e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial_sectoractor
    ADD CONSTRAINT fk_rails_9f61a364e0 FOREIGN KEY (sectoractor_id) REFERENCES public.sip_sectoractor(id);


--
-- Name: mr519_gen_campo fk_rails_a186e1a8a0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_campo
    ADD CONSTRAINT fk_rails_a186e1a8a0 FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: sip_ubicacion fk_rails_a1d509c79a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT fk_rails_a1d509c79a FOREIGN KEY (id_clase) REFERENCES public.sip_clase(id);


--
-- Name: cor1440_gen_anexo_efecto fk_rails_a3fa2e726c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_efecto
    ADD CONSTRAINT fk_rails_a3fa2e726c FOREIGN KEY (anexo_id) REFERENCES public.sip_anexo(id);


--
-- Name: proyectofinanciero_usuario fk_rails_a4c07cb119; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_a4c07cb119 FOREIGN KEY (tipocontrato_id) REFERENCES public.tipocontrato(id);


--
-- Name: actorsocial_departamento fk_rails_a5ab97cd2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_departamento
    ADD CONSTRAINT fk_rails_a5ab97cd2f FOREIGN KEY (departamento_id) REFERENCES public.sip_departamento(id);


--
-- Name: cor1440_gen_actividad_proyectofinanciero fk_rails_a8489e0d62; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_proyectofinanciero
    ADD CONSTRAINT fk_rails_a8489e0d62 FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_actividad_respuestafor fk_rails_abc0cafc05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_respuestafor
    ADD CONSTRAINT fk_rails_abc0cafc05 FOREIGN KEY (respuestafor_id) REFERENCES public.mr519_gen_respuestafor(id);


--
-- Name: cor1440_gen_beneficiariopf fk_rails_ac70e973ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_beneficiariopf
    ADD CONSTRAINT fk_rails_ac70e973ee FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_cambiosproyectofinanciero fk_rails_ad88a8cfe6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_cambiosproyectofinanciero
    ADD CONSTRAINT fk_rails_ad88a8cfe6 FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: anexo_usuario fk_rails_aee8dfa79a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_usuario
    ADD CONSTRAINT fk_rails_aee8dfa79a FOREIGN KEY (usuario_id) REFERENCES public.usuario(id);


--
-- Name: actividad_publicacion fk_rails_afe68ea314; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_publicacion
    ADD CONSTRAINT fk_rails_afe68ea314 FOREIGN KEY (publicacion_id) REFERENCES public.publicacion(id);


--
-- Name: planencuesta fk_rails_b3c9e4973a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planencuesta
    ADD CONSTRAINT fk_rails_b3c9e4973a FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_b5b70fb7f7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_b5b70fb7f7 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: sip_ubicacion fk_rails_b82283d945; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT fk_rails_b82283d945 FOREIGN KEY (id_municipio) REFERENCES public.sip_municipio(id);


--
-- Name: cor1440_gen_actividad_actividadpf fk_rails_baad271930; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_actividadpf
    ADD CONSTRAINT fk_rails_baad271930 FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: usuario fk_rails_bc35a29f9e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_bc35a29f9e FOREIGN KEY (labmunicipio_id) REFERENCES public.sip_municipio(id);


--
-- Name: cor1440_gen_informe fk_rails_c02831dd89; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_informe
    ADD CONSTRAINT fk_rails_c02831dd89 FOREIGN KEY (filtroactividadarea) REFERENCES public.cor1440_gen_actividadarea(id);


--
-- Name: anexo_usuario fk_rails_c1def44150; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_usuario
    ADD CONSTRAINT fk_rails_c1def44150 FOREIGN KEY (anexo_id) REFERENCES public.sip_anexo(id);


--
-- Name: usuario fk_rails_c280879a8f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_c280879a8f FOREIGN KEY (fondopensiones_id) REFERENCES public.fondopensiones(id);


--
-- Name: contextoinv fk_rails_c2808a2b4f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contextoinv
    ADD CONSTRAINT fk_rails_c2808a2b4f FOREIGN KEY (regiongrupo_id) REFERENCES public.regiongrupo(id);


--
-- Name: grupo_subgrupo fk_rails_c29a37734f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_subgrupo
    ADD CONSTRAINT fk_rails_c29a37734f FOREIGN KEY (subgrupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: cor1440_gen_actividad_actorsocial fk_rails_c59859a180; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_actorsocial
    ADD CONSTRAINT fk_rails_c59859a180 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: cor1440_gen_actividadpf fk_rails_c68e2278b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadpf
    ADD CONSTRAINT fk_rails_c68e2278b2 FOREIGN KEY (actividadtipo_id) REFERENCES public.cor1440_gen_actividadtipo(id);


--
-- Name: proyectofinanciero_usuario fk_rails_c719ad1d65; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.proyectofinanciero_usuario
    ADD CONSTRAINT fk_rails_c719ad1d65 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actorsocial_efecto fk_rails_c7b12f3be7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actorsocial_efecto
    ADD CONSTRAINT fk_rails_c7b12f3be7 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: tipocontrato fk_rails_c7b9a3fdfa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tipocontrato
    ADD CONSTRAINT fk_rails_c7b9a3fdfa FOREIGN KEY (tiponomina_id) REFERENCES public.tiponomina(id);


--
-- Name: cor1440_gen_financiador_proyectofinanciero fk_rails_ca93eb04dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_financiador_proyectofinanciero
    ADD CONSTRAINT fk_rails_ca93eb04dc FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: actividad_nucleoconflicto fk_rails_cb90ade2a0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actividad_nucleoconflicto
    ADD CONSTRAINT fk_rails_cb90ade2a0 FOREIGN KEY (nucleoconflicto_id) REFERENCES public.nucleoconflicto(id);


--
-- Name: actor_regiongrupo fk_rails_cbc36271a1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_regiongrupo
    ADD CONSTRAINT fk_rails_cbc36271a1 FOREIGN KEY (actor_id) REFERENCES public.actor(id);


--
-- Name: usuario fk_rails_cc636858ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_cc636858ad FOREIGN KEY (tema_id) REFERENCES public.sip_tema(id);


--
-- Name: cor1440_gen_actividad_sip_anexo fk_rails_cc9d44f9de; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_sip_anexo
    ADD CONSTRAINT fk_rails_cc9d44f9de FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: cor1440_gen_campoact fk_rails_ceb6f1a7f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_campoact
    ADD CONSTRAINT fk_rails_ceb6f1a7f0 FOREIGN KEY (actividadtipo_id) REFERENCES public.cor1440_gen_actividadtipo(id);


--
-- Name: actor fk_rails_cf09fb308c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT fk_rails_cf09fb308c FOREIGN KEY (pais_id) REFERENCES public.sip_pais(id);


--
-- Name: cor1440_gen_actividad_proyecto fk_rails_cf5d592625; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_proyecto
    ADD CONSTRAINT fk_rails_cf5d592625 FOREIGN KEY (proyecto_id) REFERENCES public.cor1440_gen_proyecto(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_cf888d1b56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_cf888d1b56 FOREIGN KEY (tipoindicador_id) REFERENCES public.cor1440_gen_tipoindicador(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_d0ff83bfc6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_d0ff83bfc6 FOREIGN KEY (tipomoneda_id) REFERENCES public.tipomoneda(id);


--
-- Name: cor1440_gen_indicadorpf fk_rails_d264d408b0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_indicadorpf
    ADD CONSTRAINT fk_rails_d264d408b0 FOREIGN KEY (resultadopf_id) REFERENCES public.cor1440_gen_resultadopf(id);


--
-- Name: sal7711_gen_articulo fk_rails_d3b628101f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo
    ADD CONSTRAINT fk_rails_d3b628101f FOREIGN KEY (fuenteprensa_id) REFERENCES public.sip_fuenteprensa(id);


--
-- Name: cor1440_gen_actividad fk_rails_d4a4fff34a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_d4a4fff34a FOREIGN KEY (creadopor_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_plantillahcm_proyectofinanciero fk_rails_d56d245f70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_plantillahcm_proyectofinanciero
    ADD CONSTRAINT fk_rails_d56d245f70 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: planencuesta fk_rails_d678e61758; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planencuesta
    ADD CONSTRAINT fk_rails_d678e61758 FOREIGN KEY (plantillacorreoinv_id) REFERENCES public.plantillacorreo(id);


--
-- Name: actor_grupo fk_rails_d790f09b08; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_grupo
    ADD CONSTRAINT fk_rails_d790f09b08 FOREIGN KEY (sip_grupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: sip_actorsocial fk_rails_d857409da3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial
    ADD CONSTRAINT fk_rails_d857409da3 FOREIGN KEY (nivelrelacion_id) REFERENCES public.nivelrelacion(id);


--
-- Name: cor1440_gen_informe fk_rails_daf0af8605; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_informe
    ADD CONSTRAINT fk_rails_daf0af8605 FOREIGN KEY (filtrooficina) REFERENCES public.sip_oficina(id);


--
-- Name: anexo_convenio fk_rails_de42ac915e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.anexo_convenio
    ADD CONSTRAINT fk_rails_de42ac915e FOREIGN KEY (anexo_id) REFERENCES public.sip_anexo(id);


--
-- Name: desembolso fk_rails_df556dc8d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.desembolso
    ADD CONSTRAINT fk_rails_df556dc8d1 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: actorsocial_grupo fk_rails_e0916fe46d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actorsocial_grupo
    ADD CONSTRAINT fk_rails_e0916fe46d FOREIGN KEY (grupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: heb412_gen_campoplantillahcm fk_rails_e0e38e0782; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.heb412_gen_campoplantillahcm
    ADD CONSTRAINT fk_rails_e0e38e0782 FOREIGN KEY (plantillahcm_id) REFERENCES public.heb412_gen_plantillahcm(id);


--
-- Name: grupo_proyectofinanciero fk_rails_e0f6406d5d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.grupo_proyectofinanciero
    ADD CONSTRAINT fk_rails_e0f6406d5d FOREIGN KEY (grupo_id) REFERENCES public.sip_grupo(id);


--
-- Name: cor1440_gen_valorcampoact fk_rails_e36cf046d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_valorcampoact
    ADD CONSTRAINT fk_rails_e36cf046d1 FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: actor_grupo fk_rails_e37d7223f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_grupo
    ADD CONSTRAINT fk_rails_e37d7223f1 FOREIGN KEY (actor_id) REFERENCES public.actor(id);


--
-- Name: cor1440_gen_beneficiariopf fk_rails_e6ba73556e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_beneficiariopf
    ADD CONSTRAINT fk_rails_e6ba73556e FOREIGN KEY (persona_id) REFERENCES public.sip_persona(id);


--
-- Name: cor1440_gen_actividad_valorcampotind fk_rails_e8cd697f5d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad_valorcampotind
    ADD CONSTRAINT fk_rails_e8cd697f5d FOREIGN KEY (actividad_id) REFERENCES public.cor1440_gen_actividad(id);


--
-- Name: mr519_gen_encuestausuario fk_rails_eccb6f9972; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mr519_gen_encuestausuario
    ADD CONSTRAINT fk_rails_eccb6f9972 FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: sip_actorsocial_sectoractor fk_rails_f032bb21a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_actorsocial_sectoractor
    ADD CONSTRAINT fk_rails_f032bb21a6 FOREIGN KEY (actorsocial_id) REFERENCES public.sip_actorsocial(id);


--
-- Name: cor1440_gen_actividadtipo_formulario fk_rails_f17af6bf9c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadtipo_formulario
    ADD CONSTRAINT fk_rails_f17af6bf9c FOREIGN KEY (actividadtipo_id) REFERENCES public.cor1440_gen_actividadtipo(id);


--
-- Name: cor1440_gen_efecto fk_rails_f1989d21d0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_efecto
    ADD CONSTRAINT fk_rails_f1989d21d0 FOREIGN KEY (registradopor_id) REFERENCES public.usuario(id);


--
-- Name: cor1440_gen_actividad fk_rails_f2cb2f1031; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividad
    ADD CONSTRAINT fk_rails_f2cb2f1031 FOREIGN KEY (municipio_id) REFERENCES public.sip_municipio(id);


--
-- Name: cor1440_gen_actividadpf fk_rails_f941b0c512; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadpf
    ADD CONSTRAINT fk_rails_f941b0c512 FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: usuario fk_rails_fa2bc91a6c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_fa2bc91a6c FOREIGN KEY (cajacompensacion_id) REFERENCES public.cajacompensacion(id);


--
-- Name: coordinador_proyectofinanciero fk_rails_fab0c162ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.coordinador_proyectofinanciero
    ADD CONSTRAINT fk_rails_fab0c162ed FOREIGN KEY (proyectofinanciero_id) REFERENCES public.cor1440_gen_proyectofinanciero(id);


--
-- Name: cor1440_gen_actividadtipo_formulario fk_rails_faf663ab7f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_actividadtipo_formulario
    ADD CONSTRAINT fk_rails_faf663ab7f FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: sip_clase fk_rails_fb09f016e4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_clase
    ADD CONSTRAINT fk_rails_fb09f016e4 FOREIGN KEY (id_municipio) REFERENCES public.sip_municipio(id);


--
-- Name: sal7711_gen_articulo_categoriaprensa fk_rails_fcf649bab3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sal7711_gen_articulo_categoriaprensa
    ADD CONSTRAINT fk_rails_fcf649bab3 FOREIGN KEY (categoriaprensa_id) REFERENCES public.sal7711_gen_categoriaprensa(id);


--
-- Name: cor1440_gen_formulario_tipoindicador fk_rails_fd2fbcd1b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_formulario_tipoindicador
    ADD CONSTRAINT fk_rails_fd2fbcd1b8 FOREIGN KEY (formulario_id) REFERENCES public.mr519_gen_formulario(id);


--
-- Name: cor1440_gen_anexo_proyectofinanciero fk_rails_fd94296801; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_anexo_proyectofinanciero
    ADD CONSTRAINT fk_rails_fd94296801 FOREIGN KEY (anexo_id) REFERENCES public.sip_anexo(id);


--
-- Name: actor_efecto fk_rails_fedc30fafe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.actor_efecto
    ADD CONSTRAINT fk_rails_fedc30fafe FOREIGN KEY (efecto_id) REFERENCES public.cor1440_gen_efecto(id);


--
-- Name: usuario fk_rails_ff046f92e5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT fk_rails_ff046f92e5 FOREIGN KEY (oficina_id) REFERENCES public.sip_oficina(id);


--
-- Name: cor1440_gen_proyectofinanciero fk_rails_ffc5f844f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cor1440_gen_proyectofinanciero
    ADD CONSTRAINT fk_rails_ffc5f844f0 FOREIGN KEY (respgp2_id) REFERENCES public.usuario(id);


--
-- Name: sip_persona persona_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona
    ADD CONSTRAINT persona_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES public.sip_pais(id);


--
-- Name: sip_persona persona_nacionalde_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona
    ADD CONSTRAINT persona_nacionalde_fkey FOREIGN KEY (nacionalde) REFERENCES public.sip_pais(id);


--
-- Name: sip_persona persona_tdocumento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona
    ADD CONSTRAINT persona_tdocumento_id_fkey FOREIGN KEY (tdocumento_id) REFERENCES public.sip_tdocumento(id);


--
-- Name: sip_persona_trelacion persona_trelacion_id_trelacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_id_trelacion_fkey FOREIGN KEY (id_trelacion) REFERENCES public.sip_trelacion(id);


--
-- Name: sip_persona_trelacion persona_trelacion_persona1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona1_fkey FOREIGN KEY (persona1) REFERENCES public.sip_persona(id);


--
-- Name: sip_persona_trelacion persona_trelacion_persona2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona_trelacion
    ADD CONSTRAINT persona_trelacion_persona2_fkey FOREIGN KEY (persona2) REFERENCES public.sip_persona(id);


--
-- Name: sip_clase sip_clase_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_clase
    ADD CONSTRAINT sip_clase_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES public.sip_municipio(id);


--
-- Name: sip_municipio sip_municipio_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_municipio
    ADD CONSTRAINT sip_municipio_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.sip_departamento(id);


--
-- Name: sip_persona sip_persona_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona
    ADD CONSTRAINT sip_persona_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.sip_clase(id);


--
-- Name: sip_persona sip_persona_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona
    ADD CONSTRAINT sip_persona_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.sip_departamento(id);


--
-- Name: sip_persona sip_persona_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_persona
    ADD CONSTRAINT sip_persona_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES public.sip_municipio(id);


--
-- Name: sip_ubicacion sip_ubicacion_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.sip_clase(id);


--
-- Name: sip_ubicacion sip_ubicacion_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.sip_departamento(id);


--
-- Name: sip_ubicacion sip_ubicacion_id_municipio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT sip_ubicacion_id_municipio_fkey FOREIGN KEY (id_municipio) REFERENCES public.sip_municipio(id);


--
-- Name: sip_ubicacion ubicacion_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT ubicacion_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES public.sip_pais(id);


--
-- Name: sip_ubicacion ubicacion_id_tsitio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sip_ubicacion
    ADD CONSTRAINT ubicacion_id_tsitio_fkey FOREIGN KEY (id_tsitio) REFERENCES public.sip_tsitio(id);


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
('20180501225617'),
('20180502083127'),
('20180509111948'),
('20180509114933'),
('20180509125608'),
('20180519102415'),
('20180522102059'),
('20180523103836'),
('20180605025410'),
('20180607180122'),
('20180611222635'),
('20180612024009'),
('20180612030340'),
('20180612090934'),
('20180615094624'),
('20180626123640'),
('20180627031905'),
('20180627100822'),
('20180628005903'),
('20180630005551'),
('20180703115744'),
('20180704094831'),
('20180717135811'),
('20180720140443'),
('20180720171842'),
('20180724135332'),
('20180724202353'),
('20180810220807'),
('20180810221619'),
('20180812220011'),
('20180813110808'),
('20180905031342'),
('20180905031617'),
('20180912114413'),
('20180914153010'),
('20180914170936'),
('20180917072914'),
('20180917083429'),
('20180918195008'),
('20180918195821'),
('20180918200715'),
('20180920031351'),
('20180920124019'),
('20180921120954'),
('20181011104537'),
('20181012110629'),
('20181019101427'),
('20181019102523'),
('20181105150700'),
('20181105152106'),
('20181105154520'),
('20181105155740'),
('20181105160739'),
('20181105162056'),
('20181105162654'),
('20181107094815'),
('20181107095150'),
('20181113025055'),
('20181113094541'),
('20181113102940'),
('20181122103550'),
('20181124121044'),
('20181124122025'),
('20181124125648'),
('20181124130126'),
('20181204113317'),
('20181205114055'),
('20181205234729'),
('20181206012527'),
('20181213103204'),
('20181218165548'),
('20181218165559'),
('20181218215222'),
('20181219085236'),
('20181224112813'),
('20181227093834'),
('20181227094559'),
('20181227095037'),
('20181227100523'),
('20181227114431'),
('20181227210510'),
('20181228014507'),
('20181228144036'),
('20181228182153'),
('20181229003242'),
('20190109125417'),
('20190110191802'),
('20190111092816'),
('20190111102201'),
('20190115125923'),
('20190115130408'),
('20190115143706'),
('20190205203619'),
('20190206005635'),
('20190208102022'),
('20190208103518'),
('20190213095617'),
('20190213103730'),
('20190213125833'),
('20190213130957'),
('20190220114719'),
('20190220133730'),
('20190226130025'),
('20190301121943'),
('20190322102311'),
('20190326150948'),
('20190328180407'),
('20190331111015'),
('20190401175521'),
('20190403202049'),
('20190406141156'),
('20190406164301'),
('20190418011743'),
('20190418014012'),
('20190418123920'),
('20190418142712'),
('20190426125052'),
('20190426131119'),
('20190603213842'),
('20190603234145'),
('20190605143420'),
('20190605144951'),
('20190606102503'),
('20190606151757'),
('20190612101211'),
('20190612111043'),
('20190612113734'),
('20190612133753'),
('20190612192746'),
('20190612198000'),
('20190612200000'),
('20190612210000'),
('20190613155738'),
('20190613155843'),
('20190614110908'),
('20190614144234'),
('20190618135559'),
('20190625112649'),
('20190625140232'),
('20190625173502'),
('20190703044126'),
('20190715083916'),
('20190715182611'),
('20190726203302'),
('20190804223012'),
('20190818013251'),
('20190826003810'),
('20190826092827'),
('20190826092828'),
('20190826101038'),
('20190830120819'),
('20190830170656'),
('20190830172824'),
('20190926104116'),
('20190930022748'),
('20190930102643'),
('20191009103744'),
('20191010135124'),
('20191205200007'),
('20191205202150'),
('20191205204511'),
('20191219011910');


