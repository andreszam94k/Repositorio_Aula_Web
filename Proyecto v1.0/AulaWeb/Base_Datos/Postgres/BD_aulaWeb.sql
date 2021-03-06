PGDMP     	                	    u            Aula_Web    9.6.2    9.6.2 r   ~	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           1262    24958    Aula_Web    DATABASE     �   CREATE DATABASE "Aula_Web" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "Aula_Web";
             postgres    false                        2615    66926    multi_idioma    SCHEMA        CREATE SCHEMA multi_idioma;
    DROP SCHEMA multi_idioma;
             postgres    false            �	           0    0    SCHEMA multi_idioma    COMMENT     w   COMMENT ON SCHEMA multi_idioma IS 'schema que guarda las tabals ncesarias para el control de idioma de la aplicacion';
                  postgres    false    6                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        2615    25529 	   seguridad    SCHEMA        CREATE SCHEMA seguridad;
    DROP SCHEMA seguridad;
             postgres    false            �	           0    0    SCHEMA seguridad    COMMENT     q   COMMENT ON SCHEMA seguridad IS 'Schema que almacenara la informaicón relevante a seguridad de la aplicación.';
                  postgres    false    4                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �           1247    67051    consultar_idioma_type    TYPE     �   CREATE TYPE consultar_idioma_type AS (
	id_control_idioma bigint,
	id_control bigint,
	id_idioma bigint,
	texto text,
	id_control_formualario bigint,
	id_formulario bigint,
	componente text
);
 .   DROP TYPE multi_idioma.consultar_idioma_type;
       multi_idioma       postgres    false    6            �	           0    0    TYPE consultar_idioma_type    COMMENT     k   COMMENT ON TYPE consultar_idioma_type IS 'almacena los tipo de datos necesarios para sp_consultar_idioma';
            multi_idioma       postgres    false    758            �           1247    25526    consultar_archivos_type    TYPE     �  CREATE TYPE consultar_archivos_type AS (
	id_archivo integer,
	nombre character varying(30),
	anio character varying(30),
	sinopsis character varying(1000),
	num_pag integer,
	imagen_portada text,
	url text,
	id_usuario integer,
	id_estado integer,
	id_categoria integer,
	tags character varying(300),
	id_moderador integer,
	estado_mod integer,
	modified_by integer,
	categoria character varying(30)
);
 *   DROP TYPE public.consultar_archivos_type;
       public       postgres    false    3            �	           0    0    TYPE consultar_archivos_type    COMMENT     �   COMMENT ON TYPE consultar_archivos_type IS 'almacena los tipo de datos necesarios para sp_consultar_archivos, sp_mostrar_archivos';
            public       postgres    false    708            �           1247    25572    consultar_comentarios_type    TYPE     �   CREATE TYPE consultar_comentarios_type AS (
	id_comentario integer,
	id_usuario integer,
	id_archivo integer,
	comentario character varying(200),
	fecha timestamp without time zone,
	modified_by integer,
	usuario character varying(30)
);
 -   DROP TYPE public.consultar_comentarios_type;
       public       postgres    false    3            �	           0    0    TYPE consultar_comentarios_type    COMMENT     m   COMMENT ON TYPE consultar_comentarios_type IS 'almacena los datos necesarios para sp_consultar_comentarios';
            public       postgres    false    722            �           1247    25507    datos_archivos_type    TYPE     ?  CREATE TYPE datos_archivos_type AS (
	id_archivo integer,
	nombre character varying(30),
	sinopsis character varying(1000),
	imagen_portada text,
	url text,
	id_usuario integer,
	id_estado integer,
	id_categoria integer,
	tags character varying(300),
	categoria character varying(30),
	usuario character varying(30)
);
 &   DROP TYPE public.datos_archivos_type;
       public       postgres    false    3            �	           0    0    TYPE datos_archivos_type    COMMENT     g   COMMENT ON TYPE datos_archivos_type IS 'almacena los datos necesarios para sp_consulta_archivo_datos';
            public       postgres    false    705            �           1247    33790    reporte_archivos_type    TYPE     �  CREATE TYPE reporte_archivos_type AS (
	id_archivo integer,
	nombre character varying(30),
	anio character varying(30),
	sinopsis character varying(1000),
	num_pag integer,
	imagen_portada text,
	url text,
	id_usuario integer,
	id_estado integer,
	id_categoria integer,
	tags character varying(300),
	id_moderador integer,
	estado_mod integer,
	modified_by integer,
	user_name character varying(30),
	categoria character varying(30),
	precio integer
);
 (   DROP TYPE public.reporte_archivos_type;
       public       postgres    false    3            �	           0    0    TYPE reporte_archivos_type    COMMENT     c   COMMENT ON TYPE reporte_archivos_type IS 'almacena los datos necesarios para sp_reporte_archivos';
            public       postgres    false    731            �           1247    33794    reporte_autores_type    TYPE        CREATE TYPE reporte_autores_type AS (
	id_autor integer,
	nombre character varying(30),
	fecha_birth character varying(30),
	fecha_death character varying(30),
	foto text,
	descripcion character varying(200),
	id_nacionalidad integer,
	modified_by integer,
	pais character varying(30)
);
 '   DROP TYPE public.reporte_autores_type;
       public       postgres    false    3            �	           0    0    TYPE reporte_autores_type    COMMENT     a   COMMENT ON TYPE reporte_autores_type IS 'almacena los datos necesarios para sp_reporte_autores';
            public       postgres    false    734            �           1247    67010    reporte_usuarios_type    TYPE     M  CREATE TYPE reporte_usuarios_type AS (
	id_usuario integer,
	nombre character varying(30),
	apellido character varying(30),
	documento bigint,
	telefono character varying(10),
	correo character varying(30),
	usuario character varying(30),
	clave character varying(30),
	dinero integer,
	id_rol integer,
	rol character varying(30)
);
 (   DROP TYPE public.reporte_usuarios_type;
       public       postgres    false    3            �	           0    0    TYPE reporte_usuarios_type    COMMENT     c   COMMENT ON TYPE reporte_usuarios_type IS 'almacena los datos necesarios para sp_reporte_usuarios';
            public       postgres    false    750            �           1247    25588    ver_archivo_autor_type    TYPE     �   CREATE TYPE ver_archivo_autor_type AS (
	id_archivo integer,
	nombre_archivo character varying(30),
	sinopsis character varying(1000),
	imagen_portada text,
	nombre_autor character varying(30),
	id_estado integer
);
 )   DROP TYPE public.ver_archivo_autor_type;
       public       postgres    false    3            �	           0    0    TYPE ver_archivo_autor_type    COMMENT     e   COMMENT ON TYPE ver_archivo_autor_type IS 'almacena los datos necesarios para sp_ver_archivo_autor';
            public       postgres    false    728            �           1247    25565    ver_archivo_type    TYPE     �  CREATE TYPE ver_archivo_type AS (
	id_archivo integer,
	nombre character varying(30),
	anio character varying(30),
	sinopsis character varying(1000),
	num_pag integer,
	imagen_portada text,
	url text,
	id_usuario integer,
	id_estado integer,
	id_categoria integer,
	tags character varying(300),
	id_moderador integer,
	estado_mod integer,
	modified_by integer,
	categoria character varying(30),
	precio integer,
	nombre_autor character varying(30)
);
 #   DROP TYPE public.ver_archivo_type;
       public       postgres    false    3            �	           0    0    TYPE ver_archivo_type    COMMENT     Y   COMMENT ON TYPE ver_archivo_type IS 'almacena los datos necesarios para sp_ver_archivo';
            public       postgres    false    719            �           1247    25582    ver_autor_type    TYPE     (  CREATE TYPE ver_autor_type AS (
	id_autor integer,
	nombre character varying(30),
	fecha_nacimiento character varying(30),
	fecha_muerte character varying(30),
	foto text,
	descripcion character varying(200),
	id_nacionalidad integer,
	modified_by integer,
	nacionalidad character varying(30)
);
 !   DROP TYPE public.ver_autor_type;
       public       postgres    false    3            �	           0    0    TYPE ver_autor_type    COMMENT     U   COMMENT ON TYPE ver_autor_type IS 'almacena los datos necesarios para sp_ver_autor';
            public       postgres    false    725            �            1259    67040    idiomas_id_idiomas_seq    SEQUENCE     x   CREATE SEQUENCE idiomas_id_idiomas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE multi_idioma.idiomas_id_idiomas_seq;
       multi_idioma       postgres    false    6            �            1259    67027    idiomas    TABLE     �   CREATE TABLE idiomas (
    id_idiomas bigint DEFAULT nextval('idiomas_id_idiomas_seq'::regclass) NOT NULL,
    nombre text,
    terminacion text
);
 !   DROP TABLE multi_idioma.idiomas;
       multi_idioma         postgres    false    228    6            �	           0    0    TABLE idiomas    COMMENT     S   COMMENT ON TABLE idiomas IS 'Tabla que guarda lo idiomas que posee la plataforma';
            multi_idioma       postgres    false    227            )           1255    67228    sp_consulta_idioma(text)    FUNCTION     �   CREATE FUNCTION sp_consulta_idioma(_nombre text) RETURNS SETOF idiomas
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	multi_idioma.idiomas i
        WHERE
        	i.nombre ILIKE('%'||_nombre||'%');

END;

$$;
 =   DROP FUNCTION multi_idioma.sp_consulta_idioma(_nombre text);
       multi_idioma       postgres    false    227    1    6            �	           0    0 )   FUNCTION sp_consulta_idioma(_nombre text)    COMMENT     z   COMMENT ON FUNCTION sp_consulta_idioma(_nombre text) IS 'Funcion que retorna los datos del idioma dependiendo el nombre';
            multi_idioma       postgres    false    297            *           1255    67229    sp_consulta_terminacion(text)    FUNCTION       CREATE FUNCTION sp_consulta_terminacion(_terminacion text) RETURNS SETOF idiomas
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	multi_idioma.idiomas i
        WHERE
        	i.terminacion ILIKE('%'||_terminacion||'%');

END;

$$;
 G   DROP FUNCTION multi_idioma.sp_consulta_terminacion(_terminacion text);
       multi_idioma       postgres    false    227    1    6            �	           0    0 3   FUNCTION sp_consulta_terminacion(_terminacion text)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_terminacion(_terminacion text) IS 'Funcion que retorna los datos del idioma dependiendo la terminacion';
            multi_idioma       postgres    false    298                       1255    67094 #   sp_consultar_idioma(bigint, bigint)    FUNCTION     9  CREATE FUNCTION sp_consultar_idioma(_idioma bigint, _formulario bigint) RETURNS SETOF consultar_idioma_type
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY
		SELECT
            ci.id_control_idioma, ci.id_control, ci.id_idioma, ci.texto,
            cf.id_control_formualario, cf.id_formulario, cf.componente
		FROM
			multi_idioma.control_idioma ci
        JOIN multi_idioma.control_formulario cf ON cf.id_control_formualario = ci.id_control
		WHERE
        	ci.id_idioma = _idioma and cf.id_formulario = _formulario
		ORDER BY ci.id_control_idioma ASC;
END;

$$;
 T   DROP FUNCTION multi_idioma.sp_consultar_idioma(_idioma bigint, _formulario bigint);
       multi_idioma       postgres    false    758    6    1            �	           0    0 @   FUNCTION sp_consultar_idioma(_idioma bigint, _formulario bigint)    COMMENT     �   COMMENT ON FUNCTION sp_consultar_idioma(_idioma bigint, _formulario bigint) IS 'Funcion que retorna los texto de cada componente dependiendo el idioma y el formulario';
            multi_idioma       postgres    false    285            '           1255    67227    sp_insertar_idioma(text, text)    FUNCTION     �   CREATE FUNCTION sp_insertar_idioma(_idioma text, _terminacion text) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO multi_idioma.idiomas(
    nombre, terminacion)
    VALUES(_idioma, _terminacion);

END;

$$;
 P   DROP FUNCTION multi_idioma.sp_insertar_idioma(_idioma text, _terminacion text);
       multi_idioma       postgres    false    1    6            �	           0    0 <   FUNCTION sp_insertar_idioma(_idioma text, _terminacion text)    COMMENT     l   COMMENT ON FUNCTION sp_insertar_idioma(_idioma text, _terminacion text) IS 'Funcion que inserta un idioma';
            multi_idioma       postgres    false    295            (           1255    67230    sp_mostrar_idioma()    FUNCTION     S  CREATE FUNCTION sp_mostrar_idioma() RETURNS SETOF idiomas
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	multi_idioma.idiomas i
        -- validamos que no muestre los idiomas 1 (ES) y 2 (IN)  
        WHERE i.id_idiomas <> 1 AND i.id_idiomas <> 2
        ORDER BY i.id_idiomas ASC;
END;

$$;
 0   DROP FUNCTION multi_idioma.sp_mostrar_idioma();
       multi_idioma       postgres    false    6    1    227            �	           0    0    FUNCTION sp_mostrar_idioma()    COMMENT     N   COMMENT ON FUNCTION sp_mostrar_idioma() IS 'Funcion que retorna los idiomas';
            multi_idioma       postgres    false    296                       1255    42035 '   prueba_resta(integer, integer, integer)    FUNCTION     �   CREATE FUNCTION prueba_resta(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

update public.usuario
set dinero = dinero - _dinero, modified_by = _user_cambio
where id_usuario = _id;

END;

$$;
 W   DROP FUNCTION public.prueba_resta(_id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    1    3                       1255    42036 &   prueba_suma(integer, integer, integer)    FUNCTION     �   CREATE FUNCTION prueba_suma(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

update public.usuario
set dinero = dinero + _dinero, modified_by = _user_cambio
where id_usuario = _id;

END;

$$;
 V   DROP FUNCTION public.prueba_suma(_id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    3    1                       1255    42037 ?   sp_aprobar_archivo(integer, integer, integer, integer, integer)    FUNCTION     :  CREATE FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
BEGIN

	-- actualizamos la categoria y estado del archivo
	UPDATE public.archivo
    SET id_categoria = _id_categoria, id_estado = 2, estado_mod = 2, modified_by = _user_cambio
    WHERE id_archivo = _id_archivo;
    -- agregamos el dinero en la cuenta del user
    UPDATE public.usuario
    SET dinero = dinero + _dinero, modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 �   DROP FUNCTION public.sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 {   FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer) IS 'Funcion que cambia el estado, categoria de un archivo y agrega dinero a la cuenta del user';
            public       postgres    false    272            �            1259    24969    usuario    TABLE       CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    nombre character varying(30) NOT NULL,
    apellido character varying(30) NOT NULL,
    documento bigint NOT NULL,
    telefono character varying(10) NOT NULL,
    correo character varying(30) NOT NULL,
    usuario character varying(30) NOT NULL,
    clave character varying(30) NOT NULL,
    dinero integer NOT NULL,
    id_rol integer NOT NULL,
    ip character varying(50),
    mac character varying(50),
    modified_by integer,
    control_sessiones integer
);
    DROP TABLE public.usuario;
       public         postgres    false    3            �	           0    0    TABLE usuario    COMMENT     U   COMMENT ON TABLE usuario IS 'Tabla que contiene los datos de los users registrados';
            public       postgres    false    190            �	           0    0    COLUMN usuario.id_usuario    COMMENT     S   COMMENT ON COLUMN usuario.id_usuario IS 'representa el identificador de la tabla';
            public       postgres    false    190            �	           0    0    COLUMN usuario.nombre    COMMENT     E   COMMENT ON COLUMN usuario.nombre IS 'representa el nombre del user';
            public       postgres    false    190            �	           0    0    COLUMN usuario.apellido    COMMENT     I   COMMENT ON COLUMN usuario.apellido IS 'representa el apellido del user';
            public       postgres    false    190            �	           0    0    COLUMN usuario.documento    COMMENT     K   COMMENT ON COLUMN usuario.documento IS 'representa el documento del user';
            public       postgres    false    190            �	           0    0    COLUMN usuario.telefono    COMMENT     S   COMMENT ON COLUMN usuario.telefono IS 'representa el numero de contacto del user';
            public       postgres    false    190            �	           0    0    COLUMN usuario.correo    COMMENT     Q   COMMENT ON COLUMN usuario.correo IS 'representa el e-mail de contacto del user';
            public       postgres    false    190            �	           0    0    COLUMN usuario.usuario    COMMENT     Y   COMMENT ON COLUMN usuario.usuario IS 'representa el nickname del usuario en el sistema';
            public       postgres    false    190            �	           0    0    COLUMN usuario.clave    COMMENT     O   COMMENT ON COLUMN usuario.clave IS 'representa la clave de acceso al sistema';
            public       postgres    false    190            �	           0    0    COLUMN usuario.dinero    COMMENT     Z   COMMENT ON COLUMN usuario.dinero IS 'representa la cantidad de dinero que posee el user';
            public       postgres    false    190            �	           0    0    COLUMN usuario.id_rol    COMMENT     T   COMMENT ON COLUMN usuario.id_rol IS 'representa el identificador del rol del user';
            public       postgres    false    190            �	           0    0    COLUMN usuario.ip    COMMENT     s   COMMENT ON COLUMN usuario.ip IS 'representa la ip desde la cual se accedio al sistema, valor por defecto: sin IP';
            public       postgres    false    190            �	           0    0    COLUMN usuario.mac    COMMENT     t   COMMENT ON COLUMN usuario.mac IS 'representa la mac desde donde se accedio al sistema, valor por defecto: sin MAC';
            public       postgres    false    190            �	           0    0    COLUMN usuario.modified_by    COMMENT     j   COMMENT ON COLUMN usuario.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    190            �	           0    0     COLUMN usuario.control_sessiones    COMMENT     �   COMMENT ON COLUMN usuario.control_sessiones IS 'Almacena la cantidad de intentos que el usuario ingreso su contraseña. NOTA: mas de intentos 3 erroneos bloqueo de ingreso..';
            public       postgres    false    190                       1255    42038 �   sp_cambiar_rol(integer, character varying, character varying, bigint, character varying, character varying, character varying, character varying, integer, integer, integer)    FUNCTION       CREATE FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$
BEGIN

	UPDATE public.usuario
	SET nombre=_nombre, apellido=_apellido, documento=_documento, telefono=_telefono, correo=_correo, usuario=_user, clave=_clave, 
    id_rol=CASE -- casos cambio de rol 
    WHEN id_rol = 3 THEN 2 
    WHEN id_rol = 2 THEN 3 
    END
    ,dinero=CASE -- casos dinero segun rol
    WHEN _id_rol = 3 THEN 100000 
    WHEN _id_rol = 2 THEN 500 
    END
    , modified_by = _user_cambio
    
	WHERE id_usuario=_id;

END;

$$;
    DROP FUNCTION public.sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer);
       public       postgres    false    3    1    190            �	           0    0   FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer)    COMMENT     I  COMMENT ON FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer) IS 'Funcion que cambia el rol de un user';
            public       postgres    false    273                       1255    42039 #   sp_cerrar_session(integer, integer)    FUNCTION     �   CREATE FUNCTION sp_cerrar_session(_id integer, _user_cambio integer) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.usuario
    SET ip='sin IP', mac='sin MAC', modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 K   DROP FUNCTION public.sp_cerrar_session(_id integer, _user_cambio integer);
       public       postgres    false    1    190    3            �	           0    0 =   FUNCTION sp_cerrar_session(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_cerrar_session(_id integer, _user_cambio integer) IS 'Funcion que modifica la IP/MAC cuando el usuario cierra session';
            public       postgres    false    271                       1255    25508 "   sp_consulta_archivo_datos(integer)    FUNCTION     �  CREATE FUNCTION sp_consulta_archivo_datos(_id_rol integer) RETURNS SETOF datos_archivos_type
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
        SELECT
	    	a.id_archivo, a.nombre, a.sinopsis, a.imagen_portada, a.url, a.id_usuario, a.id_estado, a.id_categoria, a.tags,
            c.categoria,
            u.usuario
        FROM
	    	archivo a 
		JOIN categoria c ON a.id_categoria = c.id_categoria
		JOIN usuario u ON a.id_usuario = u.id_usuario
        WHERE 
        	-- validamos que solo se muestren los archivos no aprovados (1)
            u.id_rol = _id_rol AND a.id_estado = '1'
        ORDER BY a.id_archivo asc;

END;
$$;
 A   DROP FUNCTION public.sp_consulta_archivo_datos(_id_rol integer);
       public       postgres    false    705    1    3            �	           0    0 3   FUNCTION sp_consulta_archivo_datos(_id_rol integer)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_archivo_datos(_id_rol integer) IS 'Funcion que retorna los archivos no aprobados y dependiendo el rol';
            public       postgres    false    260            �            1259    24977    archivo    TABLE     �  CREATE TABLE archivo (
    id_archivo integer NOT NULL,
    nombre character varying(30) NOT NULL,
    anio character varying(30) NOT NULL,
    sinopsis character varying(1000) NOT NULL,
    num_pag integer NOT NULL,
    imagen_portada text NOT NULL,
    url text NOT NULL,
    id_usuario integer NOT NULL,
    id_estado integer NOT NULL,
    id_categoria integer,
    tags character varying(300),
    id_moderador integer NOT NULL,
    estado_mod integer,
    modified_by integer
);
    DROP TABLE public.archivo;
       public         postgres    false    3            �	           0    0    TABLE archivo    COMMENT     ]   COMMENT ON TABLE archivo IS 'Tabla que almacena la info de los archivos subidos al sistema';
            public       postgres    false    192            �	           0    0    COLUMN archivo.id_archivo    COMMENT     S   COMMENT ON COLUMN archivo.id_archivo IS 'representa el identificador de la tabla';
            public       postgres    false    192            �	           0    0    COLUMN archivo.nombre    COMMENT     H   COMMENT ON COLUMN archivo.nombre IS 'representa el nombre del archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.anio    COMMENT     S   COMMENT ON COLUMN archivo.anio IS 'representa el anio de publicacion del archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.sinopsis    COMMENT     e   COMMENT ON COLUMN archivo.sinopsis IS 'representa la descripcion general del contenido del archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.num_pag    COMMENT     ]   COMMENT ON COLUMN archivo.num_pag IS 'representa la cantidad de hojas que tiene el archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.imagen_portada    COMMENT     n   COMMENT ON COLUMN archivo.imagen_portada IS 'almacena la url de la imagen de portada alojada en el servidor';
            public       postgres    false    192            �	           0    0    COLUMN archivo.url    COMMENT     W   COMMENT ON COLUMN archivo.url IS 'almacena la url del archivo alojado en el servidor';
            public       postgres    false    192            �	           0    0    COLUMN archivo.id_usuario    COMMENT     ]   COMMENT ON COLUMN archivo.id_usuario IS 'representa el id del usuario que subio el archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.id_estado    COMMENT     v   COMMENT ON COLUMN archivo.id_estado IS 'representa el estado (aprobado, no aprobado) en que se encuentra el archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.id_categoria    COMMENT     Y   COMMENT ON COLUMN archivo.id_categoria IS 'representa la categoria asociada al archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.tags    COMMENT     O   COMMENT ON COLUMN archivo.tags IS 'representa los index que posee el archivo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.id_moderador    COMMENT     n   COMMENT ON COLUMN archivo.id_moderador IS 'representa el id del moderador del sistema, por defecto 1=>Admin';
            public       postgres    false    192            �	           0    0    COLUMN archivo.estado_mod    COMMENT     �   COMMENT ON COLUMN archivo.estado_mod IS 'permite saber si el archivo esta moderado o no (1,2) con el fin de evitar moderar un mismo archivo al mismo tiempo';
            public       postgres    false    192            �	           0    0    COLUMN archivo.modified_by    COMMENT     j   COMMENT ON COLUMN archivo.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    192            �            1255    25373 -   sp_consulta_archivo_nombre(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_archivo_nombre(_nombre character varying) RETURNS SETOF archivo
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT
			*
		FROM
			archivo a
		WHERE
        	a.nombre = _nombre;

END;
$$;
 L   DROP FUNCTION public.sp_consulta_archivo_nombre(_nombre character varying);
       public       postgres    false    1    192    3            �	           0    0 >   FUNCTION sp_consulta_archivo_nombre(_nombre character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_archivo_nombre(_nombre character varying) IS 'Funcion que retorna los datos del archivo dependiendo el nombre';
            public       postgres    false    252            �            1259    25036    autor    TABLE     =  CREATE TABLE autor (
    id_autor integer NOT NULL,
    nombre character varying(30) NOT NULL,
    fecha_nacimiento character varying(30),
    fecha_muerte character varying(30),
    foto text NOT NULL,
    descripcion character varying(200) NOT NULL,
    id_nacionalidad integer NOT NULL,
    modified_by integer
);
    DROP TABLE public.autor;
       public         postgres    false    3            �	           0    0    TABLE autor    COMMENT     B   COMMENT ON TABLE autor IS 'Tabla que contiene la info del autor';
            public       postgres    false    206            �	           0    0    COLUMN autor.id_autor    COMMENT     O   COMMENT ON COLUMN autor.id_autor IS 'representa el identificador de la tabla';
            public       postgres    false    206            �	           0    0    COLUMN autor.nombre    COMMENT     D   COMMENT ON COLUMN autor.nombre IS 'representa el nombre del autor';
            public       postgres    false    206            �	           0    0    COLUMN autor.fecha_nacimiento    COMMENT     [   COMMENT ON COLUMN autor.fecha_nacimiento IS 'representa la fecha de nacimiento del autor';
            public       postgres    false    206            �	           0    0    COLUMN autor.fecha_muerte    COMMENT     _   COMMENT ON COLUMN autor.fecha_muerte IS 'representa la fecha de muerte del autor (si aplica)';
            public       postgres    false    206            �	           0    0    COLUMN autor.foto    COMMENT     ^   COMMENT ON COLUMN autor.foto IS 'almacena la url de la foto de autor alojada en el servidor';
            public       postgres    false    206            �	           0    0    COLUMN autor.descripcion    COMMENT     T   COMMENT ON COLUMN autor.descripcion IS 'representa una breve descipcion del autor';
            public       postgres    false    206            �	           0    0    COLUMN autor.id_nacionalidad    COMMENT     g   COMMENT ON COLUMN autor.id_nacionalidad IS 'representa el identificador de la nacionalidad del autor';
            public       postgres    false    206            �	           0    0    COLUMN autor.modified_by    COMMENT     h   COMMENT ON COLUMN autor.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    206            �            1255    25483 $   sp_consulta_autor(character varying)    FUNCTION        CREATE FUNCTION sp_consulta_autor(_nom_autor character varying) RETURNS SETOF autor
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	autor a
        WHERE
        	a.nombre ILIKE('%'||_nom_autor||'%');

END;
$$;
 F   DROP FUNCTION public.sp_consulta_autor(_nom_autor character varying);
       public       postgres    false    3    1    206            �	           0    0 8   FUNCTION sp_consulta_autor(_nom_autor character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_autor(_nom_autor character varying) IS 'Funcion que retorna los datos del autor dependiendo el nombre';
            public       postgres    false    255            �            1259    24988 	   categoria    TABLE     �   CREATE TABLE categoria (
    id_categoria integer NOT NULL,
    categoria character varying(30) NOT NULL,
    precio integer,
    modified_by integer
);
    DROP TABLE public.categoria;
       public         postgres    false    3            �	           0    0    TABLE categoria    COMMENT     \   COMMENT ON TABLE categoria IS 'Tabla que contiene la info de la categoria de cada archivo';
            public       postgres    false    194            �	           0    0    COLUMN categoria.id_categoria    COMMENT     W   COMMENT ON COLUMN categoria.id_categoria IS 'representa el identificador de la tabla';
            public       postgres    false    194            �	           0    0    COLUMN categoria.categoria    COMMENT     Q   COMMENT ON COLUMN categoria.categoria IS 'representa el nombre de la categoria';
            public       postgres    false    194            �	           0    0    COLUMN categoria.precio    COMMENT     U   COMMENT ON COLUMN categoria.precio IS 'representa el precio que posee la categoria';
            public       postgres    false    194            �	           0    0    COLUMN categoria.modified_by    COMMENT     l   COMMENT ON COLUMN categoria.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    194            �            1255    25346 (   sp_consulta_categoria(character varying)    FUNCTION       CREATE FUNCTION sp_consulta_categoria(_categoria character varying) RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	categoria c
        WHERE
        	c.categoria ILIKE('%'||_categoria||'%');

END;
$$;
 J   DROP FUNCTION public.sp_consulta_categoria(_categoria character varying);
       public       postgres    false    1    3    194            �	           0    0 <   FUNCTION sp_consulta_categoria(_categoria character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_categoria(_categoria character varying) IS 'Funcion que retorna los datos de la categoria dependiendo el nombre';
            public       postgres    false    234            �            1255    25222 %   sp_consulta_correo(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_correo(_correo character varying) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY
		SELECT
			*
		FROM
			usuario u
		WHERE
        	u.correo = _correo;

END;

$$;
 D   DROP FUNCTION public.sp_consulta_correo(_correo character varying);
       public       postgres    false    190    1    3            �	           0    0 6   FUNCTION sp_consulta_correo(_correo character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_correo(_correo character varying) IS 'Funcion que retorna los datos del usuario dependiendo el correo';
            public       postgres    false    232            �            1255    25229    sp_consulta_documento(bigint)    FUNCTION     �   CREATE FUNCTION sp_consulta_documento(_documento bigint) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY
		SELECT
			*
		FROM
			usuario u
		WHERE
        	u.documento = _documento;

END;

$$;
 ?   DROP FUNCTION public.sp_consulta_documento(_documento bigint);
       public       postgres    false    3    190    1            �	           0    0 1   FUNCTION sp_consulta_documento(_documento bigint)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_documento(_documento bigint) IS 'Funcion que retorna los datos del usuario dependiendo el documento';
            public       postgres    false    233            �            1255    25323    sp_consulta_rol(integer)    FUNCTION     �   CREATE FUNCTION sp_consulta_rol(_rol integer) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT
			*
		FROM
			usuario u
		WHERE
        	u.id_rol = _rol;

END;
$$;
 4   DROP FUNCTION public.sp_consulta_rol(_rol integer);
       public       postgres    false    190    3    1            �	           0    0 &   FUNCTION sp_consulta_rol(_rol integer)    COMMENT     l   COMMENT ON FUNCTION sp_consulta_rol(_rol integer) IS 'Funcion que retorna los usuarios asociados a un rol';
            public       postgres    false    236            �            1259    25004    tags    TABLE     u   CREATE TABLE tags (
    id_tags integer NOT NULL,
    tag character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.tags;
       public         postgres    false    3            �	           0    0 
   TABLE tags    COMMENT     K   COMMENT ON TABLE tags IS 'Tabla que contiene los index para cada archivo';
            public       postgres    false    198            �	           0    0    COLUMN tags.id_tags    COMMENT     M   COMMENT ON COLUMN tags.id_tags IS 'representa el identificador de la tabla';
            public       postgres    false    198            �	           0    0    COLUMN tags.tag    COMMENT     @   COMMENT ON COLUMN tags.tag IS 'representa el nombre del index';
            public       postgres    false    198            �	           0    0    COLUMN tags.modified_by    COMMENT     g   COMMENT ON COLUMN tags.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    198                        1255    25355 #   sp_consulta_tags(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_tags(_tag character varying) RETURNS SETOF tags
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	tags t
        WHERE
        	t.tag ILIKE('%'||_tag||'%');

END;
$$;
 ?   DROP FUNCTION public.sp_consulta_tags(_tag character varying);
       public       postgres    false    1    3    198            �	           0    0 1   FUNCTION sp_consulta_tags(_tag character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_tags(_tag character varying) IS 'Funcion que retorna los datos de un tag dependiendo el nombre';
            public       postgres    false    256            �            1255    25220 &   sp_consulta_usuario(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_usuario(_usuario character varying) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY
		SELECT
			*
		FROM
			usuario u
		WHERE
        	u.usuario = _usuario;

END;

$$;
 F   DROP FUNCTION public.sp_consulta_usuario(_usuario character varying);
       public       postgres    false    3    1    190            �	           0    0 8   FUNCTION sp_consulta_usuario(_usuario character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_usuario(_usuario character varying) IS 'Funcion que retorna los datos del usuario dependiendo el username';
            public       postgres    false    230                       1255    25527 (   sp_consultar_archivos(character varying)    FUNCTION     9  CREATE FUNCTION sp_consultar_archivos(_parametro character varying) RETURNS SETOF consultar_archivos_type
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
        SELECT
	    	a.*,
            c.categoria
        FROM
	    	archivo a 
		JOIN categoria c ON a.id_categoria = c.id_categoria
        WHERE 
            a.id_estado <> '1' AND a.nombre ILIKE('%'||_parametro||'%') OR
            a.id_estado <> '1' AND a.tags ILIKE('%'||_parametro||'%') OR
            a.id_estado <> '1' AND c.categoria ILIKE('%'||_parametro||'%')
        ORDER BY a.nombre asc;

END;
$$;
 J   DROP FUNCTION public.sp_consultar_archivos(_parametro character varying);
       public       postgres    false    708    1    3            �	           0    0 <   FUNCTION sp_consultar_archivos(_parametro character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consultar_archivos(_parametro character varying) IS 'Funcion que retorna un archivo dependiendo un parametro y que este aprobado (2)';
            public       postgres    false    259                       1255    25573 !   sp_consultar_comentarios(integer)    FUNCTION     ^  CREATE FUNCTION sp_consultar_comentarios(_id_archivo integer) RETURNS SETOF consultar_comentarios_type
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT
			c.*, u.usuario
		FROM
			comentario c
        JOIN usuario u ON c.id_usuario = u.id_usuario
		WHERE
        	c.id_archivo = _id_archivo
        ORDER BY c.id_comentario ASC;

END;
$$;
 D   DROP FUNCTION public.sp_consultar_comentarios(_id_archivo integer);
       public       postgres    false    3    722    1            �	           0    0 6   FUNCTION sp_consultar_comentarios(_id_archivo integer)    COMMENT     z   COMMENT ON FUNCTION sp_consultar_comentarios(_id_archivo integer) IS 'Funcion que retorna los comentarios de un archivo';
            public       postgres    false    262                       1255    42040 /   sp_descargar_archivo(integer, integer, integer)    FUNCTION     B  CREATE FUNCTION sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

    -- restamos el dinero de la cuenta del user
    UPDATE public.usuario
    SET dinero = dinero - _dinero, modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 _   DROP FUNCTION public.sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 Q   FUNCTION sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer) IS 'Funcion que actualiza el saldo del usuario cuando descarga un archivo';
            public       postgres    false    274                       1255    42041 %   sp_eliminar_archivo(integer, integer)    FUNCTION     V  CREATE FUNCTION sp_eliminar_archivo(_id integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$BEGIN
	
    -- agregamos el user que elimina el registro
	UPDATE public.archivo
    SET modified_by = _user_cambio
    WHERE id_archivo = _id;
	-- elimina el archivo
	DELETE FROM public.archivo
    WHERE id_archivo = _id;
    
    -- agregamos el user que elimina el registro
	UPDATE public.archivo_autor
    SET modified_by = _user_cambio
    WHERE id_archivo = _id;
    -- elimina la relacion con autor
	DELETE FROM public.archivo_autor
    WHERE id_archivo = _id;

END;

$$;
 M   DROP FUNCTION public.sp_eliminar_archivo(_id integer, _user_cambio integer);
       public       postgres    false    1    3            �	           0    0 ?   FUNCTION sp_eliminar_archivo(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_eliminar_archivo(_id integer, _user_cambio integer) IS 'Funcion que elimina un archivo y su relacion con autor';
            public       postgres    false    268                       1255    42042 '   sp_eliminar_categoria(integer, integer)    FUNCTION     �  CREATE FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer) RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$DECLARE _id_archivo integer[];
DECLARE n integer;
DECLARE i integer;
BEGIN

    -- obtenemos el id del archivo segun la categoria
    _id_archivo = ARRAY(SELECT id_archivo FROM archivo WHERE id_categoria=_id);
    -- obtenemos las dimensiones del array
    n = array_length(_id_archivo,1);
    -- eliminamos la relacion con archivo y actualizamos
    IF n > 0
      THEN
        FOR i IN 0..n LOOP
          UPDATE public.archivo
          SET id_categoria = 1, id_estado = 1, estado_mod = 1, modified_by = _user_cambio
          WHERE id_archivo = _id_archivo[i];
        END LOOP;
    END IF;

    -- agregamos el user que elimina el registro
	UPDATE public.categoria
    SET modified_by = _user_cambio
    WHERE id_categoria = _id;
	-- eliminamos la categoria
	DELETE FROM public.categoria
    WHERE id_categoria = _id;

END;

$$;
 O   DROP FUNCTION public.sp_eliminar_categoria(_id integer, _user_cambio integer);
       public       postgres    false    1    194    3            �	           0    0 A   FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer) IS 'Funcion que elimina una categoria y la relacion con archivo actualizando estado';
            public       postgres    false    277                       1255    42043 "   sp_eliminar_tags(integer, integer)    FUNCTION     X  CREATE FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer) RETURNS SETOF tags
    LANGUAGE plpgsql
    AS $$

BEGIN

    -- agregamos el user que elimina el registro
    UPDATE public.tags
    SET modified_by = _user_cambio
    WHERE id_tags = _id;
    -- eliminamos el tag
	DELETE FROM public.tags
    WHERE id_tags = _id;

END;

$$;
 J   DROP FUNCTION public.sp_eliminar_tags(_id integer, _user_cambio integer);
       public       postgres    false    1    3    198            �	           0    0 <   FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer)    COMMENT     i   COMMENT ON FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer) IS 'Funcion que elimina un tag';
            public       postgres    false    275                        1255    67162 �   sp_insertar_archivo(integer, character varying, character varying, character varying, integer, text, text, integer, integer, character varying, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.archivo(
	nombre, anio, sinopsis, num_pag, imagen_portada, url, id_usuario, id_estado, id_categoria, tags, id_moderador, estado_mod, modified_by)
	VALUES (_nombre, _fecha, _sinopsis, _num_pag, _foto, _link, _id_user, 
            CASE -- casos estado archivo por rol 
            WHEN _id_rol = 3 THEN 1
            WHEN _id_rol = 2 THEN 1
            WHEN _id_rol = 1 THEN 2
            END
            , _id_categoria, _tags, 1,
            CASE -- casos estado mod
            WHEN _id_rol = 3 THEN 1
            WHEN _id_rol = 2 THEN 1
            WHEN _id_rol = 1 THEN 2
            END
            , _user_cambio);

END;

$$;
   DROP FUNCTION public.sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer);
       public       postgres    false    1    3            �	           0    0   FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer)    COMMENT     R  COMMENT ON FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer) IS 'Funcion que inserta un archivo y asigna estado dependiendo rol';
            public       postgres    false    288            !           1255    67163 5   sp_insertar_archivo_autor(character varying, integer)    FUNCTION     0  CREATE FUNCTION sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

DECLARE _id_archivo integer;
DECLARE _id_autor integer;

BEGIN
	-- obtenemos el id del ultimo archivo agregado
	_id_archivo = (SELECT MAX(id_archivo) FROM archivo);
	-- obtenemos el id del autor segun el nombre
    _id_autor = (SELECT id_autor FROM autor WHERE nombre=_nombre);
    
	INSERT INTO public.archivo_autor(
    id_autor, id_archivo, modified_by)
    VALUES(_id_autor, _id_archivo, _user_cambio);

END;

$$;
 a   DROP FUNCTION public.sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 S   FUNCTION sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer) IS 'Funcion que crear la relacion entre un archivo y autor';
            public       postgres    false    289            "           1255    67164 u   sp_insertar_autor(character varying, character varying, character varying, text, character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.autor(
	nombre, fecha_nacimiento, fecha_muerte, foto, descripcion, id_nacionalidad, modified_by)
	VALUES (_nombre, _fecha_birth, _fecha_death, _foto, _descripcion, _nacionalidad, _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 �   FUNCTION sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer) IS 'Funcion que inserta un autor';
            public       postgres    false    290                       1255    67161 :   sp_insertar_categoria(character varying, integer, integer)    FUNCTION        CREATE FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$
BEGIN

	INSERT INTO public.categoria(
    categoria, precio, modified_by)
    VALUES(_categoria, _precio, _user_cambio);

END;
$$;
 q   DROP FUNCTION public.sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 c   FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer) IS 'Funcion que inserta una catgoria con precio';
            public       postgres    false    286            #           1255    67165 D   sp_insertar_comentario(integer, integer, character varying, integer)    FUNCTION     L  CREATE FUNCTION sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.comentario(
	id_usuario, id_archivo, comentario, modified_by)
	VALUES (_id, _id_archivo, _comentario, _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 v   FUNCTION sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer) IS 'Funcion que inserta el comentario de un usuario en un archivo';
            public       postgres    false    291                       1255    67166 J   sp_insertar_ip_mac(integer, character varying, character varying, integer)    FUNCTION     "  CREATE FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.usuario
    SET ip=_ip, mac=_mac, modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 {   DROP FUNCTION public.sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 m   FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer) IS 'Funcion que inserta la IP/MAC cuando el usuario inicia session';
            public       postgres    false    287            $           1255    67167 R   sp_insertar_subir_descargar(integer, integer, character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.subir_descargar(
    id_usuario, id_archivo, concepto, precio, modified_by)
    VALUES(_id_user, _id_archivo, _concepto, _precio, _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer);
       public       postgres    false    1    3            �	           0    0 �   FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer) IS 'Funcion que inserta la transaccion realizada sobre un archivo Upload/Download';
            public       postgres    false    292            %           1255    67168 ,   sp_insertar_tags(character varying, integer)    FUNCTION     �   CREATE FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.tags(
    tag, modified_by)
    VALUES(_tag, _user_cambio);

END;

$$;
 U   DROP FUNCTION public.sp_insertar_tags(_tag character varying, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 G   FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer)    COMMENT     t   COMMENT ON FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer) IS 'Funcion que inserta un tag';
            public       postgres    false    293            &           1255    67169 �   sp_insertar_usuario(character varying, character varying, bigint, character varying, character varying, character varying, character varying, integer)    FUNCTION     0  CREATE FUNCTION sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.usuario(
	nombre, apellido, documento, telefono, correo, usuario, clave, dinero, id_rol, ip, mac, modified_by)
	VALUES (_nombre, _apellido, _documento, _telefono, _correo, _user, _clave, 500, 3, 'sin IP', 'sin MAC', _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer);
       public       postgres    false    1    3            �	           0    0 �   FUNCTION sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer)    COMMENT       COMMENT ON FUNCTION sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer) IS 'Funcion que inserta un usuario';
            public       postgres    false    294            �            1255    25231 7   sp_loggin_usuario(character varying, character varying)    FUNCTION       CREATE FUNCTION sp_loggin_usuario(_user character varying, _password character varying) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY
		SELECT
			*
		FROM
			usuario u
		WHERE
			u.usuario = _user
		AND	u.clave = _password;

END;

$$;
 ^   DROP FUNCTION public.sp_loggin_usuario(_user character varying, _password character varying);
       public       postgres    false    190    1    3            �	           0    0 P   FUNCTION sp_loggin_usuario(_user character varying, _password character varying)    COMMENT     �   COMMENT ON FUNCTION sp_loggin_usuario(_user character varying, _password character varying) IS 'Funcion que retorna los datos de usuario dependiendo user y clave';
            public       postgres    false    235                       1255    42053 D   sp_modificar_categoria(integer, character varying, integer, integer)    FUNCTION     C  CREATE FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer) RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.categoria
    SET categoria=_categoria, precio=_precio, modified_by = _user_cambio
    WHERE id_categoria = _id;

END;

$$;
    DROP FUNCTION public.sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer);
       public       postgres    false    194    1    3            �	           0    0 q   FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer) IS 'Funcion que modifica el precio de una categoria';
            public       postgres    false    276            �            1255    25377    sp_mostrar_archivo()    FUNCTION     �   CREATE FUNCTION sp_mostrar_archivo() RETURNS SETOF archivo
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
		SELECT
        	*
        FROM
        	archivo
        ORDER BY id_archivo ASC;
END;
$$;
 +   DROP FUNCTION public.sp_mostrar_archivo();
       public       postgres    false    3    192    1            �	           0    0    FUNCTION sp_mostrar_archivo()    COMMENT     V   COMMENT ON FUNCTION sp_mostrar_archivo() IS 'Funcion que retorna todos los archivos';
            public       postgres    false    253                       1255    25528    sp_mostrar_archivos()    FUNCTION     [  CREATE FUNCTION sp_mostrar_archivos() RETURNS SETOF consultar_archivos_type
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
        SELECT
	    	a.*,
            c.categoria
        FROM
	    	archivo a 
		JOIN categoria c ON a.id_categoria = c.id_categoria
        WHERE 
            a.id_estado = '2'
        ORDER BY a.nombre asc;

END;
$$;
 ,   DROP FUNCTION public.sp_mostrar_archivos();
       public       postgres    false    3    708    1            �	           0    0    FUNCTION sp_mostrar_archivos()    COMMENT     �   COMMENT ON FUNCTION sp_mostrar_archivos() IS 'Funcion que retorna todos los archivos y la categoria dependiendo si estan aprobados (2)';
            public       postgres    false    257            �            1255    25372    sp_mostrar_autor()    FUNCTION     �   CREATE FUNCTION sp_mostrar_autor() RETURNS SETOF autor
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
		SELECT
        	*
        FROM
        	autor
        ORDER BY id_autor ASC;
END;
$$;
 )   DROP FUNCTION public.sp_mostrar_autor();
       public       postgres    false    1    206    3            �	           0    0    FUNCTION sp_mostrar_autor()    COMMENT     S   COMMENT ON FUNCTION sp_mostrar_autor() IS 'Funcion que retorna todos los autores';
            public       postgres    false    251                       1255    25351    sp_mostrar_categoria()    FUNCTION     +  CREATE FUNCTION sp_mostrar_categoria() RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	categoria
        -- validamos que no muestre el 1 (sin categoria) 
        WHERE id_categoria <> 1
        ORDER BY id_categoria ASC;
END;
$$;
 -   DROP FUNCTION public.sp_mostrar_categoria();
       public       postgres    false    1    3    194            �	           0    0    FUNCTION sp_mostrar_categoria()    COMMENT     T   COMMENT ON FUNCTION sp_mostrar_categoria() IS 'Funcion que retorna las categorias';
            public       postgres    false    258            �            1255    25484    sp_mostrar_categoria_archivo()    FUNCTION     �   CREATE FUNCTION sp_mostrar_categoria_archivo() RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT
        	*
        FROM
        	categoria
        ORDER BY id_categoria ASC;
END;
$$;
 5   DROP FUNCTION public.sp_mostrar_categoria_archivo();
       public       postgres    false    1    3    194            �	           0    0 '   FUNCTION sp_mostrar_categoria_archivo()    COMMENT     b   COMMENT ON FUNCTION sp_mostrar_categoria_archivo() IS 'Funcion que retorna todas las categorias';
            public       postgres    false    254            �            1259    25045    pais    TABLE     ~   CREATE TABLE pais (
    id_nacionalidad integer NOT NULL,
    pais character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.pais;
       public         postgres    false    3            �	           0    0 
   TABLE pais    COMMENT     I   COMMENT ON TABLE pais IS 'Tabla que contiene la nacionalidad del autor';
            public       postgres    false    208            �	           0    0    COLUMN pais.id_nacionalidad    COMMENT     U   COMMENT ON COLUMN pais.id_nacionalidad IS 'representa el identificador de la tabla';
            public       postgres    false    208            �	           0    0    COLUMN pais.pais    COMMENT     @   COMMENT ON COLUMN pais.pais IS 'representa el nombre del pais';
            public       postgres    false    208            �	           0    0    COLUMN pais.modified_by    COMMENT     g   COMMENT ON COLUMN pais.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    208            �            1255    25341    sp_mostrar_pais()    FUNCTION     �   CREATE FUNCTION sp_mostrar_pais() RETURNS SETOF pais
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT
			*
		FROM
			pais;
END;
$$;
 (   DROP FUNCTION public.sp_mostrar_pais();
       public       postgres    false    3    208    1            �	           0    0    FUNCTION sp_mostrar_pais()    COMMENT     Q   COMMENT ON FUNCTION sp_mostrar_pais() IS 'Funcion que retorna todos los paises';
            public       postgres    false    249            �            1255    25352    sp_mostrar_tags()    FUNCTION     �   CREATE FUNCTION sp_mostrar_tags() RETURNS SETOF tags
    LANGUAGE plpgsql
    AS $$
BEGIN
RETURN QUERY
		SELECT
        	*
        FROM
        	tags
        ORDER BY id_tags ASC;
END;
$$;
 (   DROP FUNCTION public.sp_mostrar_tags();
       public       postgres    false    198    3    1            �	           0    0    FUNCTION sp_mostrar_tags()    COMMENT     O   COMMENT ON FUNCTION sp_mostrar_tags() IS 'Funcion que retorna todos los tags';
            public       postgres    false    250                       1255    33791    sp_reporte_archivos()    FUNCTION     �  CREATE FUNCTION sp_reporte_archivos() RETURNS SETOF reporte_archivos_type
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
        SELECT 
            a.*, u.usuario, c.categoria, c.precio
        FROM 
            archivo a
        JOIN usuario u ON u.id_usuario = a.id_usuario
        JOIN categoria c ON c.id_categoria = a.id_categoria
        WHERE -- validamos que muestre solo los archivos aprobados
            a.id_estado <> 1
        ORDER BY a.id_archivo ASC;
        
END;
$$;
 ,   DROP FUNCTION public.sp_reporte_archivos();
       public       postgres    false    731    3    1            �	           0    0    FUNCTION sp_reporte_archivos()    COMMENT     |   COMMENT ON FUNCTION sp_reporte_archivos() IS 'Funcion que retorna los datos del archivo, con categoria, precio y username';
            public       postgres    false    264            	           1255    33795    sp_reporte_autores()    FUNCTION     8  CREATE FUNCTION sp_reporte_autores() RETURNS SETOF reporte_autores_type
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
        SELECT
            au.*, p.pais
        FROM 
            autor au
        JOIN pais p ON p.id_nacionalidad = au.id_nacionalidad
        ORDER BY au.id_autor ASC;
        
END;
$$;
 +   DROP FUNCTION public.sp_reporte_autores();
       public       postgres    false    1    3    734            �	           0    0    FUNCTION sp_reporte_autores()    COMMENT     i   COMMENT ON FUNCTION sp_reporte_autores() IS 'Funcion que retorna los datos del autor, con nacionalidad';
            public       postgres    false    265                       1255    67011    sp_reporte_usuarios()    FUNCTION     �  CREATE FUNCTION sp_reporte_usuarios() RETURNS SETOF reporte_usuarios_type
    LANGUAGE plpgsql
    AS $$

BEGIN

RETURN QUERY
		SELECT 
            u.id_usuario, u.nombre, u.apellido, u.documento, 
            u.telefono, u.correo, u.usuario, u.clave, u.dinero, 
            u.id_rol, r.rol 
        FROM 
        	usuario u
        JOIN rol r ON r.id_rol = u.id_rol
        ORDER BY id_usuario ASC;
        
END;

$$;
 ,   DROP FUNCTION public.sp_reporte_usuarios();
       public       postgres    false    750    1    3            �	           0    0    FUNCTION sp_reporte_usuarios()    COMMENT     e   COMMENT ON FUNCTION sp_reporte_usuarios() IS 'Funcion que retorna los datos del usuario con el rol';
            public       postgres    false    284                       1255    25566    sp_ver_archivo(integer)    FUNCTION     �  CREATE FUNCTION sp_ver_archivo(_id_archivo integer) RETURNS SETOF ver_archivo_type
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
        SELECT
			a.*, c.categoria, c.precio, u.nombre
        FROM
	    	archivo a 
		JOIN archivo_autor au ON a.id_archivo = au.id_archivo
		JOIN autor u ON au.id_autor = u.id_autor
		JOIN categoria c ON a.id_categoria = c.id_categoria
        WHERE 
            a.id_archivo = _id_archivo
        ORDER BY a.id_archivo ASC;

END;
$$;
 :   DROP FUNCTION public.sp_ver_archivo(_id_archivo integer);
       public       postgres    false    1    719    3            �	           0    0 ,   FUNCTION sp_ver_archivo(_id_archivo integer)    COMMENT     �   COMMENT ON FUNCTION sp_ver_archivo(_id_archivo integer) IS 'Funcion que retorna los datos del archivo, con categoria, precio y autores';
            public       postgres    false    261            
           1255    25589    sp_ver_archivo_autor(integer)    FUNCTION     �  CREATE FUNCTION sp_ver_archivo_autor(_id_autor integer) RETURNS SETOF ver_archivo_autor_type
    LANGUAGE plpgsql
    AS $$BEGIN

RETURN QUERY
        SELECT
			a.id_archivo, a.nombre, a.sinopsis, a.imagen_portada, u.nombre, a.id_estado
        FROM
	    	archivo a 
		JOIN archivo_autor au ON au.id_archivo = a.id_archivo
		JOIN autor u ON u.id_autor = au.id_autor
        WHERE 
            u.id_autor = _id_autor AND a.id_estado = '2'
        ORDER BY u.id_autor ASC;

END;
$$;
 >   DROP FUNCTION public.sp_ver_archivo_autor(_id_autor integer);
       public       postgres    false    1    3    728            �	           0    0 0   FUNCTION sp_ver_archivo_autor(_id_autor integer)    COMMENT     x   COMMENT ON FUNCTION sp_ver_archivo_autor(_id_autor integer) IS 'Funcion que retorna los archivos asociados a un autor';
            public       postgres    false    266                       1255    25585    sp_ver_autor(integer)    FUNCTION     T  CREATE FUNCTION sp_ver_autor(_id_autor integer) RETURNS SETOF ver_autor_type
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
        SELECT
			u.*, n.pais
        FROM
	    	autor u 
        JOIN pais n ON n.id_nacionalidad = u.id_nacionalidad
        WHERE 
            u.id_autor = _id_autor
        ORDER BY u.id_autor ASC;

END;
$$;
 6   DROP FUNCTION public.sp_ver_autor(_id_autor integer);
       public       postgres    false    1    3    725            �	           0    0 (   FUNCTION sp_ver_autor(_id_autor integer)    COMMENT     t   COMMENT ON FUNCTION sp_ver_autor(_id_autor integer) IS 'Funcion que retorna los datos del autor y la nacionalidad';
            public       postgres    false    263            �            1255    33808    f_log_auditoria()    FUNCTION     #  CREATE FUNCTION f_log_auditoria() RETURNS trigger
    LANGUAGE plpgsql
    AS $$	 DECLARE	
		_pk TEXT :='';		-- Representa la llave primaria de la tabla que esta siedno modificada.
		_sql TEXT;		-- Variable para la creacion del procedured.
		_column_guia RECORD; 	-- Variable para el FOR guarda los nombre de las columnas.
		_column_key RECORD; 	-- Variable para el FOR guarda los PK de las columnas.
		_user_modif INTEGER;	-- Almacena el usuario que genera el cambio.
		_user_db TEXT;		-- Almacena el usuario de bd que genera la transaccion.
		_control INT;		-- Variabel de control par alas llaves primarias.
		_count_key INT = 0;	-- Cantidad de columnas pertenecientes al PK.
		_sql_insert TEXT;	-- Variable para la construcción del insert del json de forma dinamica.
		_sql_delete TEXT;	-- Variable para la construcción del delete del json de forma dinamica.
		_sql_update TEXT;	-- Variable para la construcción del update del json de forma dinamica.
		_new_data RECORD; 	-- Fila que representa los campos nuevos del registro.
		_old_data RECORD;	-- Fila que representa los campos viejos del registro.
	        _ip CHARACTER VARYING(50);
		_mac CHARACTER VARYING(50);


	BEGIN

			-- Se genera la evaluacion para determianr el tipo de accion sobre la tabla
		 IF (TG_OP = 'INSERT') THEN
			_new_data := NEW;
			_old_data := NEW;
		ELSEIF (TG_OP = 'UPDATE') THEN
			_new_data := NEW;
			_old_data := OLD;
		ELSE
			_new_data := OLD;
			_old_data := OLD;
		END IF;

		-- Se genera la evaluacion para determianr el tipo de accion sobre la tabla
		IF ((SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME AND column_name = 'id' ) > 0) THEN
			_pk := _new_data.id;
		ELSE
			_pk := '1';
		END IF;

		-- Se valida que exista el campo modified_by
		IF ((SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME AND column_name = 'modified_by') > 0) THEN
			_user_modif := _new_data.modified_by;
		ELSE
			_user_modif := NULL;
		END IF;
		
                SELECT ip, mac INTO _ip, _mac FROM public.usuario where id_usuario = _user_modif ORDER BY id_usuario DESC Limit 1;
		-- Se guarda el susuario de bd que genera la transaccion
		_user_db := (SELECT CURRENT_USER);

		-- Se evalua que exista el procedimeinto adecuado
		IF (SELECT COUNT(*) FROM seguridad.function_db_view acfdv WHERE acfdv.b_function = 'field_audit' AND acfdv.b_type_parameters = TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', '|| TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', character varying, character varying, character varying, integer, character varying, text, text') > 0
			THEN
				-- Se realiza la invocación del procedured generado dinamivamente
				PERFORM seguridad.field_audit(_new_data, _old_data, TG_OP, _ip, _mac, _user_modif, _user_db , _pk, ''::text);
		ELSE
			-- Se empieza la construcción del Procedured generico
			_sql := 'CREATE OR REPLACE FUNCTION seguridad.field_audit( _data_new '|| TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', _data_old '|| TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text)'
			|| ' RETURNS TEXT AS ''
'
			|| '
'
	|| '	DECLARE
'
	|| '		_column_data TEXT;
	 	_datos TEXT;
	 	
'
	|| '	BEGIN
';
			-- Se evalua si hay que actualizar la pk del registro de auditoria.
			IF _pk = '1'
				THEN
					_sql := _sql
					|| '
		_column_data := ';

					-- Se genera el update con la clave pk de la tabla
					SELECT COUNT(column_name) FROM  information_schema.key_column_usage WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME AND UPPER(constraint_name) like '%PK%' INTO _control;

					FOR _column_key IN SELECT column_name FROM  information_schema.key_column_usage WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME AND (UPPER(constraint_name) like '%PK%' OR position_in_unique_constraint isnull) ORDER BY ordinal_position  LOOP

						_sql := _sql || ' _data_new.' || _column_key.column_name;
						
						_count_key := _count_key + 1 ;
						
						IF _count_key < _control THEN
							_sql :=	_sql || ' || ' || ''''',''''' || ' ||';
						END IF;
					END LOOP;
					_sql := _sql || ';';
			END IF;

			_count_key := 0;
			-- Ciclo de Guardado

			-- Se genera el ciclo de agregado de columnas para el nuevo procedured
			FOR _column_guia IN SELECT column_name, data_type FROM information_schema.columns WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME LOOP
				IF _count_key = 0
					THEN
						_sql_insert:='
		IF _accion = ''''INSERT''''
			THEN
				_datos := json_build_object('''''
						|| _column_guia.column_name
						|| '_nuevo'
						|| ''''', '
						|| '_data_new.'
						|| _column_guia.column_name;

						IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
							_sql_insert:= _sql_insert
							||'::text';
						END IF;

						_sql_insert:= _sql_insert || ');
';

						_sql_delete:='
		ELSEIF _accion = ''''DELETE''''
			THEN
				_datos := json_build_object('''''
						|| _column_guia.column_name
						|| '_anterior'
						|| ''''', '
						|| '_data_old.'
						|| _column_guia.column_name;

						IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
							_sql_delete:= _sql_delete
							||'::text';
						END IF;

						_sql_delete:= _sql_delete || ');
';

						_sql_update:='
		ELSE
		_datos := _init;

			IF _data_old.' || _column_guia.column_name || ' <> _data_new.' || _column_guia.column_name || '
				THEN _datos := json_build_object('''''
						|| _column_guia.column_name
						|| '_anterior'
						|| ''''', '
						|| '_data_old.'
						|| _column_guia.column_name;

						IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
							_sql_update:= _sql_update
							||'::text';
						END IF;

						_sql_update:= _sql_update
						|| ', '''''
						|| _column_guia.column_name
						|| '_nuevo'
						|| ''''', _data_new.'
						|| _column_guia.column_name;

						IF _column_guia.data_type = 'bytea' THEN 
							_sql_update:= _sql_update
							||'::text';
						END IF;

						_sql_update:= _sql_update
						|| ');
			END IF;
';

				ELSE

				-- Insert Dinamico
				_sql_insert := _sql_insert|| 
'				_datos := replace(_datos::text || json_build_object('''''
				|| _column_guia.column_name
				|| '_nuevo'
				|| ''''', '
				|| '_data_new.'
				|| _column_guia.column_name;

				IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
					_sql_insert:= _sql_insert
					||'::text';
				END IF;

				_sql_insert:= _sql_insert
				|| ')::text,'
				||'''''}{'''','''', '''');
';

				-- Delete Dinamico
				_sql_delete := _sql_delete ||
'				_datos := replace(_datos::text || json_build_object('''''
				|| _column_guia.column_name
				|| '_old'
				|| ''''', '
				|| '_data_old.'
				|| _column_guia.column_name;

				IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
					_sql_delete:= _sql_delete
					||'::text';
				END IF;

				_sql_delete:= _sql_delete 
				|| ')::text,'
				||'''''}{'''','''', '''');
';

				-- Update Dinamico
				_sql_update := _sql_update
				|| '
			IF _data_old.' || _column_guia.column_name || ' <> _data_new.' || _column_guia.column_name || '
				THEN _datos := replace(_datos::text || json_build_object('''''
						|| _column_guia.column_name
						|| '_anterior'
						|| ''''', '
						|| '_data_old.'
						|| _column_guia.column_name;

						IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
							_sql_update:= _sql_update
							||'::text';
						END IF;

						_sql_update:= _sql_update
						|| ', '''''
						|| _column_guia.column_name
						|| '_nuevo'
						|| ''''', _data_new.'
						|| _column_guia.column_name;

						IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
							_sql_update:= _sql_update
							||'::text';
						END IF;

						_sql_update:= _sql_update
						|| ')::text,'
				||'''''}{'''','''', '''');
			END IF;
';

				END IF;

			_count_key := 1;
			END LOOP;

			-- Se le agrega la parte final del procedured generico
			
			_sql:= _sql || _sql_insert || _sql_delete || _sql_update
			|| ' 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			''''' || TG_TABLE_NAME || ''''',
			''''' || TG_TABLE_SCHEMA || ''''',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;'''
|| '
LANGUAGE plpgsql;';

			-- Se genera la ejecución de _sql, es decir se crea el nuevo procedured de forma generica.
			EXECUTE _sql;

		-- Se realiza la invocación del procedured generado dinamivamente
			PERFORM seguridad.field_audit(_new_data, _old_data, TG_OP::character varying, _ip,_mac, _user_modif, _user_db , _pk, ''::text);

		END IF;

		RETURN NULL;

END;
$$;
 +   DROP FUNCTION seguridad.f_log_auditoria();
    	   seguridad       postgres    false    4    1            �	           0    0    FUNCTION f_log_auditoria()    COMMENT     �  COMMENT ON FUNCTION f_log_auditoria() IS '/**********************************************************************
FUNCTION: seguridad.f_log_auditoria()

DESCRIPCIÓN: Función que genera los logs de auditoria para la plataforma ultrack

PARAMETROS:
	
RETORNA: 

LENGUAJE: plpgsql

AUTOR: Ivan Monje

FECHA: 2015/07/04

************************************************************************/';
         	   seguridad       postgres    false    231                       1255    33830 �   field_audit(public.archivo, public.archivo, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION       CREATE FUNCTION field_audit(_data_new public.archivo, _data_old public.archivo, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_archivo;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_archivo_nuevo', _data_new.id_archivo);
				_datos := replace(_datos::text || json_build_object('nombre_nuevo', _data_new.nombre)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('anio_nuevo', _data_new.anio)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('sinopsis_nuevo', _data_new.sinopsis)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('num_pag_nuevo', _data_new.num_pag)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('imagen_portada_nuevo', _data_new.imagen_portada)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('url_nuevo', _data_new.url)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_usuario_nuevo', _data_new.id_usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_estado_nuevo', _data_new.id_estado)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_categoria_nuevo', _data_new.id_categoria)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('tags_nuevo', _data_new.tags)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_moderador_nuevo', _data_new.id_moderador)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('estado_mod_nuevo', _data_new.estado_mod)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_archivo_anterior', _data_old.id_archivo);
				_datos := replace(_datos::text || json_build_object('nombre_old', _data_old.nombre)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('anio_old', _data_old.anio)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('sinopsis_old', _data_old.sinopsis)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('num_pag_old', _data_old.num_pag)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('imagen_portada_old', _data_old.imagen_portada)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('url_old', _data_old.url)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_usuario_old', _data_old.id_usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_estado_old', _data_old.id_estado)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_categoria_old', _data_old.id_categoria)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('tags_old', _data_old.tags)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_moderador_old', _data_old.id_moderador)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('estado_mod_old', _data_old.estado_mod)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_archivo <> _data_new.id_archivo
				THEN _datos := json_build_object('id_archivo_anterior', _data_old.id_archivo, 'id_archivo_nuevo', _data_new.id_archivo);
			END IF;

			IF _data_old.nombre <> _data_new.nombre
				THEN _datos := replace(_datos::text || json_build_object('nombre_anterior', _data_old.nombre, 'nombre_nuevo', _data_new.nombre)::text,'}{',', ');
			END IF;

			IF _data_old.anio <> _data_new.anio
				THEN _datos := replace(_datos::text || json_build_object('anio_anterior', _data_old.anio, 'anio_nuevo', _data_new.anio)::text,'}{',', ');
			END IF;

			IF _data_old.sinopsis <> _data_new.sinopsis
				THEN _datos := replace(_datos::text || json_build_object('sinopsis_anterior', _data_old.sinopsis, 'sinopsis_nuevo', _data_new.sinopsis)::text,'}{',', ');
			END IF;

			IF _data_old.num_pag <> _data_new.num_pag
				THEN _datos := replace(_datos::text || json_build_object('num_pag_anterior', _data_old.num_pag, 'num_pag_nuevo', _data_new.num_pag)::text,'}{',', ');
			END IF;

			IF _data_old.imagen_portada <> _data_new.imagen_portada
				THEN _datos := replace(_datos::text || json_build_object('imagen_portada_anterior', _data_old.imagen_portada, 'imagen_portada_nuevo', _data_new.imagen_portada)::text,'}{',', ');
			END IF;

			IF _data_old.url <> _data_new.url
				THEN _datos := replace(_datos::text || json_build_object('url_anterior', _data_old.url, 'url_nuevo', _data_new.url)::text,'}{',', ');
			END IF;

			IF _data_old.id_usuario <> _data_new.id_usuario
				THEN _datos := replace(_datos::text || json_build_object('id_usuario_anterior', _data_old.id_usuario, 'id_usuario_nuevo', _data_new.id_usuario)::text,'}{',', ');
			END IF;

			IF _data_old.id_estado <> _data_new.id_estado
				THEN _datos := replace(_datos::text || json_build_object('id_estado_anterior', _data_old.id_estado, 'id_estado_nuevo', _data_new.id_estado)::text,'}{',', ');
			END IF;

			IF _data_old.id_categoria <> _data_new.id_categoria
				THEN _datos := replace(_datos::text || json_build_object('id_categoria_anterior', _data_old.id_categoria, 'id_categoria_nuevo', _data_new.id_categoria)::text,'}{',', ');
			END IF;

			IF _data_old.tags <> _data_new.tags
				THEN _datos := replace(_datos::text || json_build_object('tags_anterior', _data_old.tags, 'tags_nuevo', _data_new.tags)::text,'}{',', ');
			END IF;

			IF _data_old.id_moderador <> _data_new.id_moderador
				THEN _datos := replace(_datos::text || json_build_object('id_moderador_anterior', _data_old.id_moderador, 'id_moderador_nuevo', _data_new.id_moderador)::text,'}{',', ');
			END IF;

			IF _data_old.estado_mod <> _data_new.estado_mod
				THEN _datos := replace(_datos::text || json_build_object('estado_mod_anterior', _data_old.estado_mod, 'estado_mod_nuevo', _data_new.estado_mod)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'archivo',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.archivo, _data_old public.archivo, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    1    192    192    4            �            1259    25028    archivo_autor    TABLE     �   CREATE TABLE archivo_autor (
    id_archivo_autor integer NOT NULL,
    id_autor integer NOT NULL,
    id_archivo integer NOT NULL,
    modified_by integer
);
 !   DROP TABLE public.archivo_autor;
       public         postgres    false    3            �	           0    0    TABLE archivo_autor    COMMENT     g   COMMENT ON TABLE archivo_autor IS 'Tabla que contiene las asociaciones de las tablas archivo y autor';
            public       postgres    false    204            �	           0    0 %   COLUMN archivo_autor.id_archivo_autor    COMMENT     _   COMMENT ON COLUMN archivo_autor.id_archivo_autor IS 'representa el identificador de la tabla';
            public       postgres    false    204            �	           0    0    COLUMN archivo_autor.id_autor    COMMENT     U   COMMENT ON COLUMN archivo_autor.id_autor IS 'representa el identificador del autor';
            public       postgres    false    204            �	           0    0    COLUMN archivo_autor.id_archivo    COMMENT     Y   COMMENT ON COLUMN archivo_autor.id_archivo IS 'representa el identificador del archivo';
            public       postgres    false    204            �	           0    0     COLUMN archivo_autor.modified_by    COMMENT     p   COMMENT ON COLUMN archivo_autor.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    204                       1255    42055 �   field_audit(public.archivo_autor, public.archivo_autor, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     <
  CREATE FUNCTION field_audit(_data_new public.archivo_autor, _data_old public.archivo_autor, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_archivo_autor;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_archivo_autor_nuevo', _data_new.id_archivo_autor);
				_datos := replace(_datos::text || json_build_object('id_autor_nuevo', _data_new.id_autor)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_archivo_nuevo', _data_new.id_archivo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_archivo_autor_anterior', _data_old.id_archivo_autor);
				_datos := replace(_datos::text || json_build_object('id_autor_old', _data_old.id_autor)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_archivo_old', _data_old.id_archivo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_archivo_autor <> _data_new.id_archivo_autor
				THEN _datos := json_build_object('id_archivo_autor_anterior', _data_old.id_archivo_autor, 'id_archivo_autor_nuevo', _data_new.id_archivo_autor);
			END IF;

			IF _data_old.id_autor <> _data_new.id_autor
				THEN _datos := replace(_datos::text || json_build_object('id_autor_anterior', _data_old.id_autor, 'id_autor_nuevo', _data_new.id_autor)::text,'}{',', ');
			END IF;

			IF _data_old.id_archivo <> _data_new.id_archivo
				THEN _datos := replace(_datos::text || json_build_object('id_archivo_anterior', _data_old.id_archivo, 'id_archivo_nuevo', _data_new.id_archivo)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'archivo_autor',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.archivo_autor, _data_old public.archivo_autor, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    204    4    204    1                       1255    42056 �   field_audit(public.autor, public.autor, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     4  CREATE FUNCTION field_audit(_data_new public.autor, _data_old public.autor, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_autor;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_autor_nuevo', _data_new.id_autor);
				_datos := replace(_datos::text || json_build_object('nombre_nuevo', _data_new.nombre)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_nacimiento_nuevo', _data_new.fecha_nacimiento)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_muerte_nuevo', _data_new.fecha_muerte)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('foto_nuevo', _data_new.foto)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('descripcion_nuevo', _data_new.descripcion)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_nacionalidad_nuevo', _data_new.id_nacionalidad)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_autor_anterior', _data_old.id_autor);
				_datos := replace(_datos::text || json_build_object('nombre_old', _data_old.nombre)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_nacimiento_old', _data_old.fecha_nacimiento)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_muerte_old', _data_old.fecha_muerte)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('foto_old', _data_old.foto)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('descripcion_old', _data_old.descripcion)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_nacionalidad_old', _data_old.id_nacionalidad)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_autor <> _data_new.id_autor
				THEN _datos := json_build_object('id_autor_anterior', _data_old.id_autor, 'id_autor_nuevo', _data_new.id_autor);
			END IF;

			IF _data_old.nombre <> _data_new.nombre
				THEN _datos := replace(_datos::text || json_build_object('nombre_anterior', _data_old.nombre, 'nombre_nuevo', _data_new.nombre)::text,'}{',', ');
			END IF;

			IF _data_old.fecha_nacimiento <> _data_new.fecha_nacimiento
				THEN _datos := replace(_datos::text || json_build_object('fecha_nacimiento_anterior', _data_old.fecha_nacimiento, 'fecha_nacimiento_nuevo', _data_new.fecha_nacimiento)::text,'}{',', ');
			END IF;

			IF _data_old.fecha_muerte <> _data_new.fecha_muerte
				THEN _datos := replace(_datos::text || json_build_object('fecha_muerte_anterior', _data_old.fecha_muerte, 'fecha_muerte_nuevo', _data_new.fecha_muerte)::text,'}{',', ');
			END IF;

			IF _data_old.foto <> _data_new.foto
				THEN _datos := replace(_datos::text || json_build_object('foto_anterior', _data_old.foto, 'foto_nuevo', _data_new.foto)::text,'}{',', ');
			END IF;

			IF _data_old.descripcion <> _data_new.descripcion
				THEN _datos := replace(_datos::text || json_build_object('descripcion_anterior', _data_old.descripcion, 'descripcion_nuevo', _data_new.descripcion)::text,'}{',', ');
			END IF;

			IF _data_old.id_nacionalidad <> _data_new.id_nacionalidad
				THEN _datos := replace(_datos::text || json_build_object('id_nacionalidad_anterior', _data_old.id_nacionalidad, 'id_nacionalidad_nuevo', _data_new.id_nacionalidad)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'autor',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.autor, _data_old public.autor, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    206    1    4    206                       1255    33831 �   field_audit(public.categoria, public.categoria, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �	  CREATE FUNCTION field_audit(_data_new public.categoria, _data_old public.categoria, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_categoria;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_categoria_nuevo', _data_new.id_categoria);
				_datos := replace(_datos::text || json_build_object('categoria_nuevo', _data_new.categoria)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('precio_nuevo', _data_new.precio)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_categoria_anterior', _data_old.id_categoria);
				_datos := replace(_datos::text || json_build_object('categoria_old', _data_old.categoria)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('precio_old', _data_old.precio)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_categoria <> _data_new.id_categoria
				THEN _datos := json_build_object('id_categoria_anterior', _data_old.id_categoria, 'id_categoria_nuevo', _data_new.id_categoria);
			END IF;

			IF _data_old.categoria <> _data_new.categoria
				THEN _datos := replace(_datos::text || json_build_object('categoria_anterior', _data_old.categoria, 'categoria_nuevo', _data_new.categoria)::text,'}{',', ');
			END IF;

			IF _data_old.precio <> _data_new.precio
				THEN _datos := replace(_datos::text || json_build_object('precio_anterior', _data_old.precio, 'precio_nuevo', _data_new.precio)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'categoria',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.categoria, _data_old public.categoria, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    4    1    194    194            �            1259    25020 
   comentario    TABLE       CREATE TABLE comentario (
    id_comentario integer NOT NULL,
    id_usuario integer NOT NULL,
    id_archivo integer NOT NULL,
    comentario character varying(200) NOT NULL,
    fecha timestamp(6) without time zone DEFAULT now() NOT NULL,
    modified_by integer
);
    DROP TABLE public.comentario;
       public         postgres    false    3            �	           0    0    TABLE comentario    COMMENT     b   COMMENT ON TABLE comentario IS 'Tabla que contiene los comentarios de los users en cada archivo';
            public       postgres    false    202            �	           0    0    COLUMN comentario.id_comentario    COMMENT     Y   COMMENT ON COLUMN comentario.id_comentario IS 'representa el identificador de la tabla';
            public       postgres    false    202            �	           0    0    COLUMN comentario.id_usuario    COMMENT     b   COMMENT ON COLUMN comentario.id_usuario IS 'representa el identificador del usuario que comento';
            public       postgres    false    202            �	           0    0    COLUMN comentario.id_archivo    COMMENT     g   COMMENT ON COLUMN comentario.id_archivo IS 'representa el identificador del archivo donde se comento';
            public       postgres    false    202            �	           0    0    COLUMN comentario.comentario    COMMENT     N   COMMENT ON COLUMN comentario.comentario IS 'almacena el comentario del user';
            public       postgres    false    202            �	           0    0    COLUMN comentario.fecha    COMMENT     O   COMMENT ON COLUMN comentario.fecha IS 'representa la fecha en que se comento';
            public       postgres    false    202            �	           0    0    COLUMN comentario.modified_by    COMMENT     m   COMMENT ON COLUMN comentario.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    202                       1255    33832 �   field_audit(public.comentario, public.comentario, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �  CREATE FUNCTION field_audit(_data_new public.comentario, _data_old public.comentario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_comentario;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_comentario_nuevo', _data_new.id_comentario);
				_datos := replace(_datos::text || json_build_object('id_usuario_nuevo', _data_new.id_usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_archivo_nuevo', _data_new.id_archivo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('comentario_nuevo', _data_new.comentario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_nuevo', _data_new.fecha)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_comentario_anterior', _data_old.id_comentario);
				_datos := replace(_datos::text || json_build_object('id_usuario_old', _data_old.id_usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_archivo_old', _data_old.id_archivo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('comentario_old', _data_old.comentario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_old', _data_old.fecha)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_comentario <> _data_new.id_comentario
				THEN _datos := json_build_object('id_comentario_anterior', _data_old.id_comentario, 'id_comentario_nuevo', _data_new.id_comentario);
			END IF;

			IF _data_old.id_usuario <> _data_new.id_usuario
				THEN _datos := replace(_datos::text || json_build_object('id_usuario_anterior', _data_old.id_usuario, 'id_usuario_nuevo', _data_new.id_usuario)::text,'}{',', ');
			END IF;

			IF _data_old.id_archivo <> _data_new.id_archivo
				THEN _datos := replace(_datos::text || json_build_object('id_archivo_anterior', _data_old.id_archivo, 'id_archivo_nuevo', _data_new.id_archivo)::text,'}{',', ');
			END IF;

			IF _data_old.comentario <> _data_new.comentario
				THEN _datos := replace(_datos::text || json_build_object('comentario_anterior', _data_old.comentario, 'comentario_nuevo', _data_new.comentario)::text,'}{',', ');
			END IF;

			IF _data_old.fecha <> _data_new.fecha
				THEN _datos := replace(_datos::text || json_build_object('fecha_anterior', _data_old.fecha, 'fecha_nuevo', _data_new.fecha)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'comentario',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.comentario, _data_old public.comentario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    202    202    4    1            �            1259    25012    subir_descargar    TABLE       CREATE TABLE subir_descargar (
    id_subir_descargar integer NOT NULL,
    id_usuario integer NOT NULL,
    id_archivo integer NOT NULL,
    concepto character varying(30) NOT NULL,
    precio integer,
    fecha timestamp(6) without time zone DEFAULT now(),
    modified_by integer
);
 #   DROP TABLE public.subir_descargar;
       public         postgres    false    3             
           0    0    TABLE subir_descargar    COMMENT     �   COMMENT ON TABLE subir_descargar IS 'Tabla que contiene el historial de las transacciones sobre los archivos en el sistema (upload, download)';
            public       postgres    false    200            
           0    0 )   COLUMN subir_descargar.id_subir_descargar    COMMENT     c   COMMENT ON COLUMN subir_descargar.id_subir_descargar IS 'representa el identificador de la tabla';
            public       postgres    false    200            
           0    0 !   COLUMN subir_descargar.id_usuario    COMMENT     v   COMMENT ON COLUMN subir_descargar.id_usuario IS 'representa el identificador del user que subio/descargo el archivo';
            public       postgres    false    200            
           0    0 !   COLUMN subir_descargar.id_archivo    COMMENT     }   COMMENT ON COLUMN subir_descargar.id_archivo IS 'representa el identificador del archivo que se subio/descargo del sistema';
            public       postgres    false    200            
           0    0    COLUMN subir_descargar.concepto    COMMENT     l   COMMENT ON COLUMN subir_descargar.concepto IS 'representa el tipo de transaccion hecha (upload, download)';
            public       postgres    false    200            
           0    0    COLUMN subir_descargar.precio    COMMENT     �   COMMENT ON COLUMN subir_descargar.precio IS 'representa el precio del archivo: upload siempre es 0 porque el archivo no ha sido moderado, download ya posee el precio asignado en la moderacion';
            public       postgres    false    200            
           0    0    COLUMN subir_descargar.fecha    COMMENT     f   COMMENT ON COLUMN subir_descargar.fecha IS 'representa la fecha en que se subio/descargo el archivo';
            public       postgres    false    200            
           0    0 "   COLUMN subir_descargar.modified_by    COMMENT     r   COMMENT ON COLUMN subir_descargar.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    200                       1255    42054 �   field_audit(public.subir_descargar, public.subir_descargar, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     _  CREATE FUNCTION field_audit(_data_new public.subir_descargar, _data_old public.subir_descargar, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_subir_descargar;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_subir_descargar_nuevo', _data_new.id_subir_descargar);
				_datos := replace(_datos::text || json_build_object('id_usuario_nuevo', _data_new.id_usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_archivo_nuevo', _data_new.id_archivo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('concepto_nuevo', _data_new.concepto)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('precio_nuevo', _data_new.precio)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_nuevo', _data_new.fecha)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_subir_descargar_anterior', _data_old.id_subir_descargar);
				_datos := replace(_datos::text || json_build_object('id_usuario_old', _data_old.id_usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_archivo_old', _data_old.id_archivo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('concepto_old', _data_old.concepto)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('precio_old', _data_old.precio)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('fecha_old', _data_old.fecha)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_subir_descargar <> _data_new.id_subir_descargar
				THEN _datos := json_build_object('id_subir_descargar_anterior', _data_old.id_subir_descargar, 'id_subir_descargar_nuevo', _data_new.id_subir_descargar);
			END IF;

			IF _data_old.id_usuario <> _data_new.id_usuario
				THEN _datos := replace(_datos::text || json_build_object('id_usuario_anterior', _data_old.id_usuario, 'id_usuario_nuevo', _data_new.id_usuario)::text,'}{',', ');
			END IF;

			IF _data_old.id_archivo <> _data_new.id_archivo
				THEN _datos := replace(_datos::text || json_build_object('id_archivo_anterior', _data_old.id_archivo, 'id_archivo_nuevo', _data_new.id_archivo)::text,'}{',', ');
			END IF;

			IF _data_old.concepto <> _data_new.concepto
				THEN _datos := replace(_datos::text || json_build_object('concepto_anterior', _data_old.concepto, 'concepto_nuevo', _data_new.concepto)::text,'}{',', ');
			END IF;

			IF _data_old.precio <> _data_new.precio
				THEN _datos := replace(_datos::text || json_build_object('precio_anterior', _data_old.precio, 'precio_nuevo', _data_new.precio)::text,'}{',', ');
			END IF;

			IF _data_old.fecha <> _data_new.fecha
				THEN _datos := replace(_datos::text || json_build_object('fecha_anterior', _data_old.fecha, 'fecha_nuevo', _data_new.fecha)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'subir_descargar',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.subir_descargar, _data_old public.subir_descargar, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    1    200    4    200                       1255    42057 �   field_audit(public.tags, public.tags, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �  CREATE FUNCTION field_audit(_data_new public.tags, _data_old public.tags, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_tags;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_tags_nuevo', _data_new.id_tags);
				_datos := replace(_datos::text || json_build_object('tag_nuevo', _data_new.tag)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_tags_anterior', _data_old.id_tags);
				_datos := replace(_datos::text || json_build_object('tag_old', _data_old.tag)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_tags <> _data_new.id_tags
				THEN _datos := json_build_object('id_tags_anterior', _data_old.id_tags, 'id_tags_nuevo', _data_new.id_tags);
			END IF;

			IF _data_old.tag <> _data_new.tag
				THEN _datos := replace(_datos::text || json_build_object('tag_anterior', _data_old.tag, 'tag_nuevo', _data_new.tag)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'tags',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.tags, _data_old public.tags, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    198    4    198    1            +           1255    33817 �   field_audit(public.usuario, public.usuario, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     x  CREATE FUNCTION field_audit(_data_new public.usuario, _data_old public.usuario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos TEXT;
	 	
	BEGIN

		_column_data :=  _data_new.id_usuario;
		IF _accion = 'INSERT'
			THEN
				_datos := json_build_object('id_usuario_nuevo', _data_new.id_usuario);
				_datos := replace(_datos::text || json_build_object('nombre_nuevo', _data_new.nombre)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('apellido_nuevo', _data_new.apellido)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('documento_nuevo', _data_new.documento)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('telefono_nuevo', _data_new.telefono)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('correo_nuevo', _data_new.correo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('usuario_nuevo', _data_new.usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('clave_nuevo', _data_new.clave)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('dinero_nuevo', _data_new.dinero)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_rol_nuevo', _data_new.id_rol)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('ip_nuevo', _data_new.ip)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('mac_nuevo', _data_new.mac)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('control_sessiones_nuevo', _data_new.control_sessiones)::text,'}{',', ');

		ELSEIF _accion = 'DELETE'
			THEN
				_datos := json_build_object('id_usuario_anterior', _data_old.id_usuario);
				_datos := replace(_datos::text || json_build_object('nombre_old', _data_old.nombre)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('apellido_old', _data_old.apellido)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('documento_old', _data_old.documento)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('telefono_old', _data_old.telefono)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('correo_old', _data_old.correo)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('usuario_old', _data_old.usuario)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('clave_old', _data_old.clave)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('dinero_old', _data_old.dinero)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('id_rol_old', _data_old.id_rol)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('ip_old', _data_old.ip)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('mac_old', _data_old.mac)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('modified_by_old', _data_old.modified_by)::text,'}{',', ');
				_datos := replace(_datos::text || json_build_object('control_sessiones_old', _data_old.control_sessiones)::text,'}{',', ');

		ELSE
		_datos := _init;

			IF _data_old.id_usuario <> _data_new.id_usuario
				THEN _datos := json_build_object('id_usuario_anterior', _data_old.id_usuario, 'id_usuario_nuevo', _data_new.id_usuario);
			END IF;

			IF _data_old.nombre <> _data_new.nombre
				THEN _datos := replace(_datos::text || json_build_object('nombre_anterior', _data_old.nombre, 'nombre_nuevo', _data_new.nombre)::text,'}{',', ');
			END IF;

			IF _data_old.apellido <> _data_new.apellido
				THEN _datos := replace(_datos::text || json_build_object('apellido_anterior', _data_old.apellido, 'apellido_nuevo', _data_new.apellido)::text,'}{',', ');
			END IF;

			IF _data_old.documento <> _data_new.documento
				THEN _datos := replace(_datos::text || json_build_object('documento_anterior', _data_old.documento, 'documento_nuevo', _data_new.documento)::text,'}{',', ');
			END IF;

			IF _data_old.telefono <> _data_new.telefono
				THEN _datos := replace(_datos::text || json_build_object('telefono_anterior', _data_old.telefono, 'telefono_nuevo', _data_new.telefono)::text,'}{',', ');
			END IF;

			IF _data_old.correo <> _data_new.correo
				THEN _datos := replace(_datos::text || json_build_object('correo_anterior', _data_old.correo, 'correo_nuevo', _data_new.correo)::text,'}{',', ');
			END IF;

			IF _data_old.usuario <> _data_new.usuario
				THEN _datos := replace(_datos::text || json_build_object('usuario_anterior', _data_old.usuario, 'usuario_nuevo', _data_new.usuario)::text,'}{',', ');
			END IF;

			IF _data_old.clave <> _data_new.clave
				THEN _datos := replace(_datos::text || json_build_object('clave_anterior', _data_old.clave, 'clave_nuevo', _data_new.clave)::text,'}{',', ');
			END IF;

			IF _data_old.dinero <> _data_new.dinero
				THEN _datos := replace(_datos::text || json_build_object('dinero_anterior', _data_old.dinero, 'dinero_nuevo', _data_new.dinero)::text,'}{',', ');
			END IF;

			IF _data_old.id_rol <> _data_new.id_rol
				THEN _datos := replace(_datos::text || json_build_object('id_rol_anterior', _data_old.id_rol, 'id_rol_nuevo', _data_new.id_rol)::text,'}{',', ');
			END IF;

			IF _data_old.ip <> _data_new.ip
				THEN _datos := replace(_datos::text || json_build_object('ip_anterior', _data_old.ip, 'ip_nuevo', _data_new.ip)::text,'}{',', ');
			END IF;

			IF _data_old.mac <> _data_new.mac
				THEN _datos := replace(_datos::text || json_build_object('mac_anterior', _data_old.mac, 'mac_nuevo', _data_new.mac)::text,'}{',', ');
			END IF;

			IF _data_old.modified_by <> _data_new.modified_by
				THEN _datos := replace(_datos::text || json_build_object('modified_by_anterior', _data_old.modified_by, 'modified_by_nuevo', _data_new.modified_by)::text,'}{',', ');
			END IF;

			IF _data_old.control_sessiones <> _data_new.control_sessiones
				THEN _datos := replace(_datos::text || json_build_object('control_sessiones_anterior', _data_old.control_sessiones, 'control_sessiones_nuevo', _data_new.control_sessiones)::text,'}{',', ');
			END IF;
 
		END IF;

		INSERT INTO seguridad.auditoria(
			fecha, 
			nombre_tabla,
			nombre_schema,
			pk_tabla,
			user_id,
			user_db, 
			ip, 
			mac,
			data_json, 
			transaccion
		)
		VALUES 
		(
			CURRENT_TIMESTAMP,
			'usuario',
			'public',
			_table_pk,
			_user_name,
			_user_db,
			_ip,
			_mac,
			_datos,
			_accion
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION seguridad.field_audit(_data_new public.usuario, _data_old public.usuario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text);
    	   seguridad       postgres    false    1    4    190    190            �            1259    66940    control_formulario    TABLE     �   CREATE TABLE control_formulario (
    id_control_formualario bigint NOT NULL,
    id_formulario bigint NOT NULL,
    componente text
);
 ,   DROP TABLE multi_idioma.control_formulario;
       multi_idioma         postgres    false    6            
           0    0    TABLE control_formulario    COMMENT     j   COMMENT ON TABLE control_formulario IS 'Tabla que guarda todos los componentes que posee el formulario.';
            multi_idioma       postgres    false    223            �            1259    66938 -   control_formulario_id_control_formualario_seq    SEQUENCE     �   CREATE SEQUENCE control_formulario_id_control_formualario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE multi_idioma.control_formulario_id_control_formualario_seq;
       multi_idioma       postgres    false    223    6            	
           0    0 -   control_formulario_id_control_formualario_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE control_formulario_id_control_formualario_seq OWNED BY control_formulario.id_control_formualario;
            multi_idioma       postgres    false    222            �            1259    66951    control_idioma    TABLE     �   CREATE TABLE control_idioma (
    id_control_idioma bigint NOT NULL,
    id_control bigint NOT NULL,
    id_idioma bigint NOT NULL,
    texto text
);
 (   DROP TABLE multi_idioma.control_idioma;
       multi_idioma         postgres    false    6            

           0    0    TABLE control_idioma    COMMENT     p   COMMENT ON TABLE control_idioma IS 'Tabla que guarda el texto del componente, dependiendo idioma y formulario';
            multi_idioma       postgres    false    225            �            1259    66949 $   control_idioma_id_control_idioma_seq    SEQUENCE     �   CREATE SEQUENCE control_idioma_id_control_idioma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE multi_idioma.control_idioma_id_control_idioma_seq;
       multi_idioma       postgres    false    6    225            
           0    0 $   control_idioma_id_control_idioma_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE control_idioma_id_control_idioma_seq OWNED BY control_idioma.id_control_idioma;
            multi_idioma       postgres    false    224            �            1259    66929    formularios    TABLE     Q   CREATE TABLE formularios (
    id_formulario bigint NOT NULL,
    nombre text
);
 %   DROP TABLE multi_idioma.formularios;
       multi_idioma         postgres    false    6            
           0    0    TABLE formularios    COMMENT     \   COMMENT ON TABLE formularios IS 'Tabla que guarda los formularios que posee la aplicacion';
            multi_idioma       postgres    false    221            �            1259    66927    formularios_id_formulario_seq    SEQUENCE        CREATE SEQUENCE formularios_id_formulario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE multi_idioma.formularios_id_formulario_seq;
       multi_idioma       postgres    false    6    221            
           0    0    formularios_id_formulario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE formularios_id_formulario_seq OWNED BY formularios.id_formulario;
            multi_idioma       postgres    false    220            �            1259    25026 "   archivo_autor_id_archivo_autor_seq    SEQUENCE     �   CREATE SEQUENCE archivo_autor_id_archivo_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.archivo_autor_id_archivo_autor_seq;
       public       postgres    false    3    204            
           0    0 "   archivo_autor_id_archivo_autor_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE archivo_autor_id_archivo_autor_seq OWNED BY archivo_autor.id_archivo_autor;
            public       postgres    false    203            �            1259    24975    archivo_id_archivo_seq    SEQUENCE     x   CREATE SEQUENCE archivo_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.archivo_id_archivo_seq;
       public       postgres    false    3    192            
           0    0    archivo_id_archivo_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE archivo_id_archivo_seq OWNED BY archivo.id_archivo;
            public       postgres    false    191            �            1259    25034    autor_id_autor_seq    SEQUENCE     t   CREATE SEQUENCE autor_id_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.autor_id_autor_seq;
       public       postgres    false    3    206            
           0    0    autor_id_autor_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE autor_id_autor_seq OWNED BY autor.id_autor;
            public       postgres    false    205            �            1259    24986    categoria_id_categoria_seq    SEQUENCE     |   CREATE SEQUENCE categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categoria_id_categoria_seq;
       public       postgres    false    194    3            
           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE categoria_id_categoria_seq OWNED BY categoria.id_categoria;
            public       postgres    false    193            �            1259    25018    comentario_id_comentario_seq    SEQUENCE     ~   CREATE SEQUENCE comentario_id_comentario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.comentario_id_comentario_seq;
       public       postgres    false    3    202            
           0    0    comentario_id_comentario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE comentario_id_comentario_seq OWNED BY comentario.id_comentario;
            public       postgres    false    201            �            1259    24996    estado    TABLE     |   CREATE TABLE estado (
    id_estado integer NOT NULL,
    estado character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.estado;
       public         postgres    false    3            
           0    0    TABLE estado    COMMENT     a   COMMENT ON TABLE estado IS 'Tabla que contiene el estado (aprobado, no aprobado) de un archivo';
            public       postgres    false    196            
           0    0    COLUMN estado.id_estado    COMMENT     Q   COMMENT ON COLUMN estado.id_estado IS 'representa el identificador de la tabla';
            public       postgres    false    196            
           0    0    COLUMN estado.estado    COMMENT     m   COMMENT ON COLUMN estado.estado IS 'representa el nombre del estado, por defecto 2 (aprobado, no aprobado)';
            public       postgres    false    196            
           0    0    COLUMN estado.modified_by    COMMENT     i   COMMENT ON COLUMN estado.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    196            �            1259    24994    estado_id_estado_seq    SEQUENCE     v   CREATE SEQUENCE estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.estado_id_estado_seq;
       public       postgres    false    196    3            
           0    0    estado_id_estado_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE estado_id_estado_seq OWNED BY estado.id_estado;
            public       postgres    false    195            �            1259    25043     nacionalidad_id_nacionalidad_seq    SEQUENCE     �   CREATE SEQUENCE nacionalidad_id_nacionalidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.nacionalidad_id_nacionalidad_seq;
       public       postgres    false    208    3            
           0    0     nacionalidad_id_nacionalidad_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE nacionalidad_id_nacionalidad_seq OWNED BY pais.id_nacionalidad;
            public       postgres    false    207            �            1259    24961    rol    TABLE     s   CREATE TABLE rol (
    id_rol integer NOT NULL,
    rol character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.rol;
       public         postgres    false    3            
           0    0 	   TABLE rol    COMMENT     F   COMMENT ON TABLE rol IS 'Tabla que contiene los roles en el sistema';
            public       postgres    false    188            
           0    0    COLUMN rol.id_rol    COMMENT     K   COMMENT ON COLUMN rol.id_rol IS 'representa el identificador de la tabla';
            public       postgres    false    188            
           0    0    COLUMN rol.rol    COMMENT     _   COMMENT ON COLUMN rol.rol IS 'representa el nombre del rol, por defecto 3 (admin, mod, user)';
            public       postgres    false    188            
           0    0    COLUMN rol.modified_by    COMMENT     f   COMMENT ON COLUMN rol.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    188            �            1259    24959    rol_id_rol_seq    SEQUENCE     p   CREATE SEQUENCE rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.rol_id_rol_seq;
       public       postgres    false    188    3            
           0    0    rol_id_rol_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE rol_id_rol_seq OWNED BY rol.id_rol;
            public       postgres    false    187            �            1259    25010 &   subir_descargar_id_subir_descargar_seq    SEQUENCE     �   CREATE SEQUENCE subir_descargar_id_subir_descargar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.subir_descargar_id_subir_descargar_seq;
       public       postgres    false    3    200            
           0    0 &   subir_descargar_id_subir_descargar_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE subir_descargar_id_subir_descargar_seq OWNED BY subir_descargar.id_subir_descargar;
            public       postgres    false    199            �            1259    25002    tags_id_tags_seq    SEQUENCE     r   CREATE SEQUENCE tags_id_tags_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tags_id_tags_seq;
       public       postgres    false    198    3            
           0    0    tags_id_tags_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE tags_id_tags_seq OWNED BY tags.id_tags;
            public       postgres    false    197            �            1259    24967    usuario_id_usuario_seq    SEQUENCE     x   CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public       postgres    false    190    3             
           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;
            public       postgres    false    189            �            1259    25539 	   auditoria    TABLE     U  CREATE TABLE auditoria (
    id bigint NOT NULL,
    fecha timestamp with time zone,
    nombre_tabla text NOT NULL,
    nombre_schema text,
    pk_tabla text,
    user_id integer,
    user_db character varying(100),
    ip character varying(100),
    mac character varying(100),
    transaccion character varying(50),
    data_json text
);
     DROP TABLE seguridad.auditoria;
    	   seguridad         postgres    false    4            !
           0    0    TABLE auditoria    COMMENT     �   COMMENT ON TABLE auditoria IS 'Tabla que lleva el registro de tofdas las transacciones realziadas sobre las tablas de la base de datos.';
         	   seguridad       postgres    false    213            "
           0    0    COLUMN auditoria.id    COMMENT     :   COMMENT ON COLUMN auditoria.id IS 'Campo pk de la tabla';
         	   seguridad       postgres    false    213            #
           0    0    COLUMN auditoria.fecha    COMMENT     h   COMMENT ON COLUMN auditoria.fecha IS 'Almacena la fecha del momento en que se realzió la transaccion';
         	   seguridad       postgres    false    213            $
           0    0    COLUMN auditoria.nombre_tabla    COMMENT     ]   COMMENT ON COLUMN auditoria.nombre_tabla IS 'Almacena el nombre de la tabla que se altero.';
         	   seguridad       postgres    false    213            %
           0    0    COLUMN auditoria.nombre_schema    COMMENT     _   COMMENT ON COLUMN auditoria.nombre_schema IS 'Almacena el schema la cual pertenece la tabla.';
         	   seguridad       postgres    false    213            &
           0    0    COLUMN auditoria.pk_tabla    COMMENT     j   COMMENT ON COLUMN auditoria.pk_tabla IS 'Campo que lamacena la identifica del registró que se modifico';
         	   seguridad       postgres    false    213            '
           0    0    COLUMN auditoria.user_id    COMMENT     s   COMMENT ON COLUMN auditoria.user_id IS 'Id que identifica el usuario que generó el cambio desde la aplicación.';
         	   seguridad       postgres    false    213            (
           0    0    COLUMN auditoria.user_db    COMMENT     s   COMMENT ON COLUMN auditoria.user_db IS 'Almacena el usuario de la base de dtaos con el cual se generó el cambio';
         	   seguridad       postgres    false    213            )
           0    0    COLUMN auditoria.ip    COMMENT     X   COMMENT ON COLUMN auditoria.ip IS 'Captura la ip desde la cual se solicitó el cambio';
         	   seguridad       postgres    false    213            *
           0    0    COLUMN auditoria.mac    COMMENT     Y   COMMENT ON COLUMN auditoria.mac IS 'Almacena la mac desde la cual se generó el cambio';
         	   seguridad       postgres    false    213            +
           0    0    COLUMN auditoria.transaccion    COMMENT     a   COMMENT ON COLUMN auditoria.transaccion IS 'identifica el tipo de transacción que se realizó';
         	   seguridad       postgres    false    213            ,
           0    0    COLUMN auditoria.data_json    COMMENT     V   COMMENT ON COLUMN auditoria.data_json IS 'almacena el estado anterior de los datos.';
         	   seguridad       postgres    false    213            �            1259    25537    auditoria_id_seq    SEQUENCE     r   CREATE SEQUENCE auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE seguridad.auditoria_id_seq;
    	   seguridad       postgres    false    213    4            -
           0    0    auditoria_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auditoria_id_seq OWNED BY auditoria.id;
         	   seguridad       postgres    false    212            �            1259    25530    function_db_view    VIEW     u  CREATE VIEW function_db_view AS
 SELECT pp.proname AS b_function,
    oidvectortypes(pp.proargtypes) AS b_type_parameters
   FROM (pg_proc pp
     JOIN pg_namespace pn ON ((pn.oid = pp.pronamespace)))
  WHERE ((pn.nspname)::text <> ALL (ARRAY[('pg_catalog'::character varying)::text, ('information_schema'::character varying)::text, ('public'::character varying)::text]));
 &   DROP VIEW seguridad.function_db_view;
    	   seguridad       postgres    false    4            �           2604    66943 )   control_formulario id_control_formualario    DEFAULT     �   ALTER TABLE ONLY control_formulario ALTER COLUMN id_control_formualario SET DEFAULT nextval('control_formulario_id_control_formualario_seq'::regclass);
 ^   ALTER TABLE multi_idioma.control_formulario ALTER COLUMN id_control_formualario DROP DEFAULT;
       multi_idioma       postgres    false    223    222    223            �           2604    66954     control_idioma id_control_idioma    DEFAULT     �   ALTER TABLE ONLY control_idioma ALTER COLUMN id_control_idioma SET DEFAULT nextval('control_idioma_id_control_idioma_seq'::regclass);
 U   ALTER TABLE multi_idioma.control_idioma ALTER COLUMN id_control_idioma DROP DEFAULT;
       multi_idioma       postgres    false    224    225    225            �           2604    66932    formularios id_formulario    DEFAULT     x   ALTER TABLE ONLY formularios ALTER COLUMN id_formulario SET DEFAULT nextval('formularios_id_formulario_seq'::regclass);
 N   ALTER TABLE multi_idioma.formularios ALTER COLUMN id_formulario DROP DEFAULT;
       multi_idioma       postgres    false    220    221    221            �           2604    24980    archivo id_archivo    DEFAULT     j   ALTER TABLE ONLY archivo ALTER COLUMN id_archivo SET DEFAULT nextval('archivo_id_archivo_seq'::regclass);
 A   ALTER TABLE public.archivo ALTER COLUMN id_archivo DROP DEFAULT;
       public       postgres    false    192    191    192            �           2604    25031    archivo_autor id_archivo_autor    DEFAULT     �   ALTER TABLE ONLY archivo_autor ALTER COLUMN id_archivo_autor SET DEFAULT nextval('archivo_autor_id_archivo_autor_seq'::regclass);
 M   ALTER TABLE public.archivo_autor ALTER COLUMN id_archivo_autor DROP DEFAULT;
       public       postgres    false    203    204    204            �           2604    25039    autor id_autor    DEFAULT     b   ALTER TABLE ONLY autor ALTER COLUMN id_autor SET DEFAULT nextval('autor_id_autor_seq'::regclass);
 =   ALTER TABLE public.autor ALTER COLUMN id_autor DROP DEFAULT;
       public       postgres    false    205    206    206            �           2604    24991    categoria id_categoria    DEFAULT     r   ALTER TABLE ONLY categoria ALTER COLUMN id_categoria SET DEFAULT nextval('categoria_id_categoria_seq'::regclass);
 E   ALTER TABLE public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public       postgres    false    193    194    194            �           2604    25023    comentario id_comentario    DEFAULT     v   ALTER TABLE ONLY comentario ALTER COLUMN id_comentario SET DEFAULT nextval('comentario_id_comentario_seq'::regclass);
 G   ALTER TABLE public.comentario ALTER COLUMN id_comentario DROP DEFAULT;
       public       postgres    false    201    202    202            �           2604    24999    estado id_estado    DEFAULT     f   ALTER TABLE ONLY estado ALTER COLUMN id_estado SET DEFAULT nextval('estado_id_estado_seq'::regclass);
 ?   ALTER TABLE public.estado ALTER COLUMN id_estado DROP DEFAULT;
       public       postgres    false    196    195    196            �           2604    25048    pais id_nacionalidad    DEFAULT     v   ALTER TABLE ONLY pais ALTER COLUMN id_nacionalidad SET DEFAULT nextval('nacionalidad_id_nacionalidad_seq'::regclass);
 C   ALTER TABLE public.pais ALTER COLUMN id_nacionalidad DROP DEFAULT;
       public       postgres    false    207    208    208            �           2604    24964 
   rol id_rol    DEFAULT     Z   ALTER TABLE ONLY rol ALTER COLUMN id_rol SET DEFAULT nextval('rol_id_rol_seq'::regclass);
 9   ALTER TABLE public.rol ALTER COLUMN id_rol DROP DEFAULT;
       public       postgres    false    187    188    188            �           2604    25015 "   subir_descargar id_subir_descargar    DEFAULT     �   ALTER TABLE ONLY subir_descargar ALTER COLUMN id_subir_descargar SET DEFAULT nextval('subir_descargar_id_subir_descargar_seq'::regclass);
 Q   ALTER TABLE public.subir_descargar ALTER COLUMN id_subir_descargar DROP DEFAULT;
       public       postgres    false    199    200    200            �           2604    25007    tags id_tags    DEFAULT     ^   ALTER TABLE ONLY tags ALTER COLUMN id_tags SET DEFAULT nextval('tags_id_tags_seq'::regclass);
 ;   ALTER TABLE public.tags ALTER COLUMN id_tags DROP DEFAULT;
       public       postgres    false    198    197    198            �           2604    24972    usuario id_usuario    DEFAULT     j   ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    189    190    190            �           2604    25542    auditoria id    DEFAULT     ^   ALTER TABLE ONLY auditoria ALTER COLUMN id SET DEFAULT nextval('auditoria_id_seq'::regclass);
 >   ALTER TABLE seguridad.auditoria ALTER COLUMN id DROP DEFAULT;
    	   seguridad       postgres    false    213    212    213            w	          0    66940    control_formulario 
   TABLE DATA               X   COPY control_formulario (id_control_formualario, id_formulario, componente) FROM stdin;
    multi_idioma       postgres    false    223   H�      .
           0    0 -   control_formulario_id_control_formualario_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('control_formulario_id_control_formualario_seq', 293, true);
            multi_idioma       postgres    false    222            y	          0    66951    control_idioma 
   TABLE DATA               R   COPY control_idioma (id_control_idioma, id_control, id_idioma, texto) FROM stdin;
    multi_idioma       postgres    false    225   ��      /
           0    0 $   control_idioma_id_control_idioma_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('control_idioma_id_control_idioma_seq', 583, true);
            multi_idioma       postgres    false    224            u	          0    66929    formularios 
   TABLE DATA               5   COPY formularios (id_formulario, nombre) FROM stdin;
    multi_idioma       postgres    false    221   N�      0
           0    0    formularios_id_formulario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('formularios_id_formulario_seq', 23, true);
            multi_idioma       postgres    false    220            z	          0    67027    idiomas 
   TABLE DATA               ;   COPY idiomas (id_idiomas, nombre, terminacion) FROM stdin;
    multi_idioma       postgres    false    227   6�      1
           0    0    idiomas_id_idiomas_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('idiomas_id_idiomas_seq', 4, true);
            multi_idioma       postgres    false    228            a	          0    24977    archivo 
   TABLE DATA               �   COPY archivo (id_archivo, nombre, anio, sinopsis, num_pag, imagen_portada, url, id_usuario, id_estado, id_categoria, tags, id_moderador, estado_mod, modified_by) FROM stdin;
    public       postgres    false    192   ~�      m	          0    25028    archivo_autor 
   TABLE DATA               U   COPY archivo_autor (id_archivo_autor, id_autor, id_archivo, modified_by) FROM stdin;
    public       postgres    false    204   #�      2
           0    0 "   archivo_autor_id_archivo_autor_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('archivo_autor_id_archivo_autor_seq', 80, true);
            public       postgres    false    203            3
           0    0    archivo_id_archivo_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('archivo_id_archivo_seq', 44, true);
            public       postgres    false    191            o	          0    25036    autor 
   TABLE DATA               {   COPY autor (id_autor, nombre, fecha_nacimiento, fecha_muerte, foto, descripcion, id_nacionalidad, modified_by) FROM stdin;
    public       postgres    false    206   ��      4
           0    0    autor_id_autor_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('autor_id_autor_seq', 18, true);
            public       postgres    false    205            c	          0    24988 	   categoria 
   TABLE DATA               J   COPY categoria (id_categoria, categoria, precio, modified_by) FROM stdin;
    public       postgres    false    194   ��      5
           0    0    categoria_id_categoria_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('categoria_id_categoria_seq', 49, true);
            public       postgres    false    193            k	          0    25020 
   comentario 
   TABLE DATA               d   COPY comentario (id_comentario, id_usuario, id_archivo, comentario, fecha, modified_by) FROM stdin;
    public       postgres    false    202    �      6
           0    0    comentario_id_comentario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('comentario_id_comentario_seq', 28, true);
            public       postgres    false    201            e	          0    24996    estado 
   TABLE DATA               9   COPY estado (id_estado, estado, modified_by) FROM stdin;
    public       postgres    false    196   <�      7
           0    0    estado_id_estado_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('estado_id_estado_seq', 2, true);
            public       postgres    false    195            8
           0    0     nacionalidad_id_nacionalidad_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('nacionalidad_id_nacionalidad_seq', 68, true);
            public       postgres    false    207            q	          0    25045    pais 
   TABLE DATA               ;   COPY pais (id_nacionalidad, pais, modified_by) FROM stdin;
    public       postgres    false    208   n�      ]	          0    24961    rol 
   TABLE DATA               0   COPY rol (id_rol, rol, modified_by) FROM stdin;
    public       postgres    false    188   ��      9
           0    0    rol_id_rol_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('rol_id_rol_seq', 3, true);
            public       postgres    false    187            i	          0    25012    subir_descargar 
   TABLE DATA               t   COPY subir_descargar (id_subir_descargar, id_usuario, id_archivo, concepto, precio, fecha, modified_by) FROM stdin;
    public       postgres    false    200   ��      :
           0    0 &   subir_descargar_id_subir_descargar_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('subir_descargar_id_subir_descargar_seq', 46, true);
            public       postgres    false    199            g	          0    25004    tags 
   TABLE DATA               2   COPY tags (id_tags, tag, modified_by) FROM stdin;
    public       postgres    false    198   ��      ;
           0    0    tags_id_tags_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('tags_id_tags_seq', 40, true);
            public       postgres    false    197            _	          0    24969    usuario 
   TABLE DATA               �   COPY usuario (id_usuario, nombre, apellido, documento, telefono, correo, usuario, clave, dinero, id_rol, ip, mac, modified_by, control_sessiones) FROM stdin;
    public       postgres    false    190   ��      <
           0    0    usuario_id_usuario_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('usuario_id_usuario_seq', 18, true);
            public       postgres    false    189            s	          0    25539 	   auditoria 
   TABLE DATA               �   COPY auditoria (id, fecha, nombre_tabla, nombre_schema, pk_tabla, user_id, user_db, ip, mac, transaccion, data_json) FROM stdin;
 	   seguridad       postgres    false    213   
�      =
           0    0    auditoria_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auditoria_id_seq', 573, true);
         	   seguridad       postgres    false    212            �           2606    66948 (   control_formulario PK_control_formulario 
   CONSTRAINT     u   ALTER TABLE ONLY control_formulario
    ADD CONSTRAINT "PK_control_formulario" PRIMARY KEY (id_control_formualario);
 Z   ALTER TABLE ONLY multi_idioma.control_formulario DROP CONSTRAINT "PK_control_formulario";
       multi_idioma         postgres    false    223    223            �           2606    66959     control_idioma PK_control_idioma 
   CONSTRAINT     h   ALTER TABLE ONLY control_idioma
    ADD CONSTRAINT "PK_control_idioma" PRIMARY KEY (id_control_idioma);
 R   ALTER TABLE ONLY multi_idioma.control_idioma DROP CONSTRAINT "PK_control_idioma";
       multi_idioma         postgres    false    225    225            �           2606    66937    formularios PK_formularios 
   CONSTRAINT     ^   ALTER TABLE ONLY formularios
    ADD CONSTRAINT "PK_formularios" PRIMARY KEY (id_formulario);
 L   ALTER TABLE ONLY multi_idioma.formularios DROP CONSTRAINT "PK_formularios";
       multi_idioma         postgres    false    221    221            �           2606    67034    idiomas PK_idiomas 
   CONSTRAINT     S   ALTER TABLE ONLY idiomas
    ADD CONSTRAINT "PK_idiomas" PRIMARY KEY (id_idiomas);
 D   ALTER TABLE ONLY multi_idioma.idiomas DROP CONSTRAINT "PK_idiomas";
       multi_idioma         postgres    false    227    227            �           2606    24985    archivo PK_id_archivo 
   CONSTRAINT     V   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "PK_id_archivo" PRIMARY KEY (id_archivo);
 A   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "PK_id_archivo";
       public         postgres    false    192    192            �           2606    25033 !   archivo_autor PK_id_archivo_autor 
   CONSTRAINT     h   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "PK_id_archivo_autor" PRIMARY KEY (id_archivo_autor);
 M   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "PK_id_archivo_autor";
       public         postgres    false    204    204            �           2606    25041    autor PK_id_autor 
   CONSTRAINT     P   ALTER TABLE ONLY autor
    ADD CONSTRAINT "PK_id_autor" PRIMARY KEY (id_autor);
 =   ALTER TABLE ONLY public.autor DROP CONSTRAINT "PK_id_autor";
       public         postgres    false    206    206            �           2606    24993    categoria PK_id_categoria 
   CONSTRAINT     \   ALTER TABLE ONLY categoria
    ADD CONSTRAINT "PK_id_categoria" PRIMARY KEY (id_categoria);
 E   ALTER TABLE ONLY public.categoria DROP CONSTRAINT "PK_id_categoria";
       public         postgres    false    194    194            �           2606    25025    comentario PK_id_comentario 
   CONSTRAINT     _   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "PK_id_comentario" PRIMARY KEY (id_comentario);
 G   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "PK_id_comentario";
       public         postgres    false    202    202            �           2606    25001    estado PK_id_estado 
   CONSTRAINT     S   ALTER TABLE ONLY estado
    ADD CONSTRAINT "PK_id_estado" PRIMARY KEY (id_estado);
 ?   ALTER TABLE ONLY public.estado DROP CONSTRAINT "PK_id_estado";
       public         postgres    false    196    196            �           2606    25050    pais PK_id_nacionalidad 
   CONSTRAINT     ]   ALTER TABLE ONLY pais
    ADD CONSTRAINT "PK_id_nacionalidad" PRIMARY KEY (id_nacionalidad);
 C   ALTER TABLE ONLY public.pais DROP CONSTRAINT "PK_id_nacionalidad";
       public         postgres    false    208    208            �           2606    24966    rol PK_id_rol 
   CONSTRAINT     J   ALTER TABLE ONLY rol
    ADD CONSTRAINT "PK_id_rol" PRIMARY KEY (id_rol);
 9   ALTER TABLE ONLY public.rol DROP CONSTRAINT "PK_id_rol";
       public         postgres    false    188    188            �           2606    25017 %   subir_descargar PK_id_subir_descargar 
   CONSTRAINT     n   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "PK_id_subir_descargar" PRIMARY KEY (id_subir_descargar);
 Q   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "PK_id_subir_descargar";
       public         postgres    false    200    200            �           2606    25009    tags PK_id_tags 
   CONSTRAINT     M   ALTER TABLE ONLY tags
    ADD CONSTRAINT "PK_id_tags" PRIMARY KEY (id_tags);
 ;   ALTER TABLE ONLY public.tags DROP CONSTRAINT "PK_id_tags";
       public         postgres    false    198    198            �           2606    24974    usuario PK_id_usuario 
   CONSTRAINT     V   ALTER TABLE ONLY usuario
    ADD CONSTRAINT "PK_id_usuario" PRIMARY KEY (id_usuario);
 A   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "PK_id_usuario";
       public         postgres    false    190    190            �           2606    25547     auditoria pk_seguridad_auditoria 
   CONSTRAINT     W   ALTER TABLE ONLY auditoria
    ADD CONSTRAINT pk_seguridad_auditoria PRIMARY KEY (id);
 M   ALTER TABLE ONLY seguridad.auditoria DROP CONSTRAINT pk_seguridad_auditoria;
    	   seguridad         postgres    false    213    213            �           2620    33829    archivo tg_public_archivo    TRIGGER     �   CREATE TRIGGER tg_public_archivo AFTER INSERT OR DELETE OR UPDATE ON archivo FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 2   DROP TRIGGER tg_public_archivo ON public.archivo;
       public       postgres    false    192    231            �           2620    33828 %   archivo_autor tg_public_archivo_autor    TRIGGER     �   CREATE TRIGGER tg_public_archivo_autor AFTER INSERT OR DELETE OR UPDATE ON archivo_autor FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 >   DROP TRIGGER tg_public_archivo_autor ON public.archivo_autor;
       public       postgres    false    231    204            �           2620    33827    autor tg_public_autor    TRIGGER     �   CREATE TRIGGER tg_public_autor AFTER INSERT OR DELETE OR UPDATE ON autor FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 .   DROP TRIGGER tg_public_autor ON public.autor;
       public       postgres    false    231    206            �           2620    33826    categoria tg_public_categoria    TRIGGER     �   CREATE TRIGGER tg_public_categoria AFTER INSERT OR DELETE OR UPDATE ON categoria FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 6   DROP TRIGGER tg_public_categoria ON public.categoria;
       public       postgres    false    194    231            �           2620    33825    comentario tg_public_comentario    TRIGGER     �   CREATE TRIGGER tg_public_comentario AFTER INSERT OR DELETE OR UPDATE ON comentario FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 8   DROP TRIGGER tg_public_comentario ON public.comentario;
       public       postgres    false    231    202            �           2620    33824    estado tg_public_estado    TRIGGER     �   CREATE TRIGGER tg_public_estado AFTER INSERT OR DELETE OR UPDATE ON estado FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 0   DROP TRIGGER tg_public_estado ON public.estado;
       public       postgres    false    196    231            �           2620    33823    pais tg_public_pais    TRIGGER     �   CREATE TRIGGER tg_public_pais AFTER INSERT OR DELETE OR UPDATE ON pais FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 ,   DROP TRIGGER tg_public_pais ON public.pais;
       public       postgres    false    231    208            �           2620    33822    rol tg_public_rol    TRIGGER     �   CREATE TRIGGER tg_public_rol AFTER INSERT OR DELETE OR UPDATE ON rol FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 *   DROP TRIGGER tg_public_rol ON public.rol;
       public       postgres    false    231    188            �           2620    33821 )   subir_descargar tg_public_subir_descargar    TRIGGER     �   CREATE TRIGGER tg_public_subir_descargar AFTER INSERT OR DELETE OR UPDATE ON subir_descargar FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 B   DROP TRIGGER tg_public_subir_descargar ON public.subir_descargar;
       public       postgres    false    231    200            �           2620    33820    tags tg_public_tags    TRIGGER     �   CREATE TRIGGER tg_public_tags AFTER INSERT OR DELETE OR UPDATE ON tags FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 ,   DROP TRIGGER tg_public_tags ON public.tags;
       public       postgres    false    231    198            �           2620    33814    usuario tg_public_usuario    TRIGGER     �   CREATE TRIGGER tg_public_usuario AFTER INSERT OR DELETE OR UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 2   DROP TRIGGER tg_public_usuario ON public.usuario;
       public       postgres    false    190    231            �           2606    67068 $   control_idioma FK_control_formulario    FK CONSTRAINT     �   ALTER TABLE ONLY control_idioma
    ADD CONSTRAINT "FK_control_formulario" FOREIGN KEY (id_control) REFERENCES control_formulario(id_control_formualario) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY multi_idioma.control_idioma DROP CONSTRAINT "FK_control_formulario";
       multi_idioma       postgres    false    225    223    2247            �           2606    67056 #   control_formulario FK_id_formulario    FK CONSTRAINT     �   ALTER TABLE ONLY control_formulario
    ADD CONSTRAINT "FK_id_formulario" FOREIGN KEY (id_formulario) REFERENCES formularios(id_formulario) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY multi_idioma.control_formulario DROP CONSTRAINT "FK_id_formulario";
       multi_idioma       postgres    false    2245    221    223            �           2606    67080    control_idioma FK_idiomas    FK CONSTRAINT     x   ALTER TABLE ONLY control_idioma
    ADD CONSTRAINT "FK_idiomas" FOREIGN KEY (id_idioma) REFERENCES idiomas(id_idiomas);
 K   ALTER TABLE ONLY multi_idioma.control_idioma DROP CONSTRAINT "FK_idiomas";
       multi_idioma       postgres    false    225    2251    227            �           2606    25438    archivo_autor FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    204    2225    192            �           2606    25453    comentario FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    202    2225    192            �           2606    25463    subir_descargar FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    2225    200    192            �           2606    25433    archivo_autor FK_id_autor    FK CONSTRAINT     �   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "FK_id_autor" FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "FK_id_autor";
       public       postgres    false    204    2239    206            �           2606    25423    archivo FK_id_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_categoria" FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_categoria";
       public       postgres    false    192    2227    194            �           2606    25418    archivo FK_id_estado    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_estado" FOREIGN KEY (id_estado) REFERENCES estado(id_estado) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_estado";
       public       postgres    false    196    2229    192            �           2606    25428    archivo FK_id_moderador    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_moderador" FOREIGN KEY (id_moderador) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_moderador";
       public       postgres    false    192    190    2223            �           2606    25443    autor FK_id_nacionalidad    FK CONSTRAINT     �   ALTER TABLE ONLY autor
    ADD CONSTRAINT "FK_id_nacionalidad" FOREIGN KEY (id_nacionalidad) REFERENCES pais(id_nacionalidad) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.autor DROP CONSTRAINT "FK_id_nacionalidad";
       public       postgres    false    206    2241    208            �           2606    25468    usuario FK_id_rol    FK CONSTRAINT     �   ALTER TABLE ONLY usuario
    ADD CONSTRAINT "FK_id_rol" FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "FK_id_rol";
       public       postgres    false    2221    188    190            �           2606    25413    archivo FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    2223    192    190            �           2606    25448    comentario FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    2223    202    190            �           2606    25458    subir_descargar FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    200    190    2223            w	   ,  x��XKn�8]�����W�8�? ݋��^`(��Ƒ�0ǚ3���%R��vv�WEև�Qr#7�vM��N�(}���w�У��~:T�0�t۵�j섅|���뾯�o�04]+<��u{����P��d)d�;@r���A T�4�A�7!s�Z�ܻ�{7X��
"A����蟦�H� �dVV���� Oeh���'%W	cVS�Je &�����Sl`�� L���*7���}�ET��cZƱ��X����7�ǟx��c̵q��.�1��1���/�k�8&ad+a(��0*��0:��0&��06��0.�Ka|�U3;��&ϒ�M���}�����oX������g|IVoL0��o�,a;KX�͒�ϒ��%+\1KN8�����>H�(�I8�J8�Z8�F8�X��1��q�+��H�
�g�R�����5��o��OΥ>y�V��^:��O�R�)�" )�9we���(S�E�" #�YQ�ȉ2E@^�)*q�?YH��k���ձ~���.��p��#�$�o��ķk_W�����`0�ͻ�p�z�Ѳ�Kx�^k��v��X>����ׇ%^���Ǽ*�e �l����j���������r��M��|��t�$d'M�����Y�<��[��^�áy`�.�<t��s�Y�sձ>ԏ]˚2�컾������S�/n��z,%n��"�c�ϖgp�ۨ
�y�E�sӢeJ�T�����BƬ�s�
&�Os�TN63���jQ%'�%F��\�&��'�X$e&�ĸ�r��$Ƙ���2��ꥋ��qķ9��U���zD�<w@5�~d0V9��[�.�rYϫ�+zQt��z����@G��7B�K]�[�������=�����;�!ݟ�]���Q	c� �GCą����zbyJ9���t���}��K�H��
7[[��W�x��l°}���G�ǎO?�)0����*��A�4[.��u��{��tkc��P�>�����\�!��{���Οu�e�G^��IGQ��+)U\�WJ���M�8��I�~��1u@n���+�fq����iiY�
�HآVh������1��ʬ�`k�m��3���χ\��3��C���Y�>Y�E�e�	8�͟\UP�$"*�� �'����#�D���E��/�qv`'<�	8�p��E}�EA����D�H"��A�����5uZ����z���rx@�z��k^����Xar�\`5�T��<��
.P����U*B~�L2d���v.0I9闅$�N�9�R�FP� ^:0gPmiǥR�N�� �tCC_m�)���֔�9�Q�V̛Dr��BG�yiI���*�!�#~���o�(����"����5�3������>:X|�/ܫ6�ˏޫ6�_�Wm��No�hب7ll�66�������l�����5(�Pd��3y�y��%l-�.B;��E,�)�mA!�]j����,ú?Ε��gv݈cso!wfd׍��[F�s3{Vq�5QڳdM(�Dnϵ(����~�Q�~j"� �_.>��y��ub���S��o��X'�[nyY��f.23����Y�e�qE�AV�b���G8B̿|����O3��)b�X>e��ʧ_Č��?�<����ɏ���~�.�&P����-ĻMZ !�qS�XhC
㦞i�Y��%�+�;=�aDL��F>4�3�s/b��{�V��_`1J�|*��[2�b�����&kŊ�ﱑX*��v=
���m��V�D�L{>�e��abi��D�K��DՑ?�&�)00�$���w!�����      y	      x��|]o�H��3�+8��	�%�_jU�*��喝U[�J
�̔HI9��_�a����?�眈 )[����`�EwUYA2x�ƍ{Ͻq�����]�\]\-:Q����nq�\�u�`�������]x9���q�(��|����]�/:�`ğ�(�",M��YgL�Ww���2����/g��egL��w_��g�N��)��X?�Oy�?z�}��Ӈ<i�}��A����O�$���E�t����'����l�G������/)�/��˓h�J����~��iQ�/�1)Ҽ��W�� ��<�������3���(n�?�Q3�p��~�ě�����Y���Ȏ_�^K2����_��-j����KN.4�g�B� �v�w��Mm�Q���4�o�w&��;	�U���d�Ë<��u�wpm��^��f����Z���a_�-��E9�˫������㼟_�^���A0��n�m�%�U��M49����7��o�.���]ϰ(�+���_}������O�<䨯��`;2e���I�Ɇ�f�&���*&��X��1����IQ��.�	�Ɲ|2	wI�⮝٢��֝YW��ͪ�D�^?t ǐʞ�~��EfG�R�a�V)�6Yhv�7ߌ՛��H��	O�M��P����_�&|�Œf��]���C^��mq<h�i�|՟;��n�l����4��5�\����>-�y#;���]e�Ǻ�!\�)��1Y���!���$�����c	-PYm6�ٿӓ17z?V�
O���I�֬�e���]�����:	���v�e�h+� �%ޛb�f��tC;ʰ
c�N��]��\���ē �g�<;%�6�IQj=]i�43��U�V����^��Y�&��c�9g�#��B�@-�*+����ϴ�j�yp��f~��js��¼i���Q��uz��?�`�Pbm1���.�i�Cg�F\�׭y�$~�͡��A�WyEb�\'_�Y���2젷���lw�i���`�@q1��ƏѰV<�ˡ��3#���Tak4	F��_��q/���7���1'z�g�W7��	2�[랾�M=ilu�|0�nW��N���1Ȏ_��/�ʬ3��k����|�E	��ɬ��mS�.�ڔ˖�����FO��3ʁ�2]�����1�S���o^��l9Ԝ�m�޺I��Eε<�c��Ǒ��C��h/�K8r��݉/<�k�X�MQ����וּ��k�f5�P"��#�'�\����SM�/}�N�ve�)w�םZ�s��،G��$թK����6�䧼儒F7P\�iǷt��H��C2�WZWB��ƚ�5�J��2����|�	ϊ'�"�t`u3��]��)�Å���l�;T�5�M���wp*�7)���}5:�ѩ�}�ˢ;CT�J7{yv�fG-��v�(��L�z�(�]��h9��jg�Խ��6�m��Fp����Y=6#�Ёǎ�������|@E�Z+%�[K�W;��y�qjݸ|�
��ݵ�'���T�9ٰ������xS�Iy�[mhI@��+����߁���XK����F˷��i���R�[!}c-l�Jk�|���XSw�YSG���>:��Q��Ӳ�~��вB����J�EC?�Z1��`Hx�����e��n�T�u��o_.g�Z�Y�	������͗9�'�Y�Oa'q|�͜"0S�V�����4>� �n땸�m{>y�zҰB��y�|�`n� vH1� H=�5�"J��Q�i��~�� <�Jꆫ���.��D
F�7%�I��z}Ӕ�l}�Û���<x�����{���Į�,�;��i�=��M� {����4��������.N"��t�p�m<�z�
�����>T������ii��ߨ����;���\!�+�.�Bq^
�"&�M�q���z8bݯ��A<<��np:���R����8�p�!e�y��Jw��.�S5�>�?pq7�[�ŀV/���پ�#h�qv|t�K}'�dX�,������MƺgX$���J�%��6mA�p�x�[�b��i"H�1�����R�&m�3.��
�K�#��'ࡄ�n�T�ư�Lp�@@�&Q���pY�)�/9�͉�t�m��SU�nw
����>�J^��Wc5xDP<�&��8+%m�Э������-�íxO�F�	��+n$d�
'�Yd�!p�h�x�8��~=y��j���3��ɠ���MP��]��[�5~q�~ׁ����������4M�aP����`�HYH�q0��|B�»��g���t��0��+g�m;��V)�b.��4�Ҧvp=«����Z�ڗ�ʪd[vtKO���r��KM��
�M�߃f{*s m�>���^�ԃЂ�����.��~�&'+�?{���z����u��au�!�Y�t�}���v��Z#���&����[���Ю��_�����v�^��*�]�v��
g�fg�>t�S%�D ��h��:}��T�k@��E1.�\����ȝuQղ��@S^$�_�V[/{�+�G��O�5����U?{�[UI;��mQ��Sh�5�3O��9<�ZUWKV�������Q��&�:xCl���������	W�KhG,��o�2���dT�5pdeB��O�>�g{�S J�.!���R����r�^?�q5$�p�p��`<m;[�%U�h�L6�]�[AZQ��l��/��I.�h=��w�������8�w����ޅv�wC�/D[���pu(���t�`�sZz�k��P��bAV3`�g���3r3���I�K�i�r��M*nC��9�8J49Dn��%��m���Ɔ�P�[����ObUx�C�(d�����.��B_����&��O�`Q�R��C�33b��]���o����W��klg��qdVa��Rb�r��|BRI�n3���M�v�V�K���łx��D"�����N ��\űhW[�<�z��;���Yq.�.�gU�X�:�rg��Y=������G&ɓ��o/�5���Lq6{Q@���`2yY|��v�O�Gw/�ja��I0��Bº=+N)�jlN�@%Ǵ�u�U�	���ˍ*q� 	�pL{~'O�*���ǖW��r�!8_�9��w7tY
��3	���Н:�$~:?��p�g�1=2�i�Rɇ�4�`�d�>ȒW(�VAv*B�S��5|�iդ�~RQRy�D�t�.�UUغ�`QxR�8I����z
	���>�U1�]~Y�4K�x� ��q�u�
Y�K�tj��9�$�2?i�5�v_�%U�m,jgq�S�beXﬔyvE-����W��l�{(j�Jo��F7�m�3�CK��q6�?pY���F�bR�!GE=�`��1��W6�ԍ ���[ה�O�~:�LܕZܙ=�C��؍ÿ�^�J��������6Z�ڟҤmhv��ޮyL��-�o�El�-ˇ�8	����Nʇ]�o�w�9P��*���WIU&��v��������&�޴��ҙɏ��b
Hd����VP����-�>�L��-�ӧ�9 ��b�ŋ瀃����D�7=����8|�s�Qۍ7t�L7L`��m�T_:,�mq��hr�i�:���6��"�xt�-ț�矖s4@t�1�n���W�4�´�w����y~s�6�Jf�g��V�i�+��v�����}�-�؂Q�zq=�/c�0�;�7�%o����^]�}��F7�U٤��	6�[�����wH�q�va~�U�f�����	�>�>�oЀ�l�>M�	�n>.��k��q���5�ӌߘ5���g��g�<��7�<�.���t�Rф5܆a��V�xr��k�M� �>S�9��!�*P��K�E�pXZ/f����m�*��9I�	F9�Z����d��Z0$�����R貙B��ٴ�Hl�FZB�39���L�HЈ-�����`yb�o��^e �}�~qDw{k�1N��c�P丟}�/�M�f��������c�N����m	OV4���"U5^��Q�D�~��G�|��C���a��q���Op!��)    m&���|Eyg��h���[ԃ�Ta���q��4�#3mq�'G��,��;���Z��QY^����1�����WñC����i?[��;)������J��(��g%"ݧ΃D��D��@��@�9��� )B�b#v�:Hj3�J��y	��������� ��(�@U��.?`��.�=��T渜�],�nE���7E'�$`0*m`���'�������k	B�����.ن�Sm�� �*�c��U���P�P�^Z`CbF�B��P�q��ܮ�B}�.qƤm�S��$�C�=${k a��U3Α4[�u�0v*Fp�l��
El�l|n+�9�Z�Cd�ltn��)@���{�d�!BGq1&�!B�������;�o����b��I5j�1�ؖ�2�I 1Vm&ؚ�MS�b�n*��g[�b���#���Q���.rE#�ztb�#x��"G�vN�3� G�*���Q�=�H4��y��{�2㥈/O~O�NJ� �{Z�@{�N���A8濅����D������enU
A4 Ӹq �H��za`�Hx�:<�,DY�q��"��[x�Zфa
�\�[����0�q|�T�B��:�� ���N��]����k�9Бg�v"�h)�6̏~���U��J�{L��d��7��h��<��<(����C�A9f�� �Ơ}+7�ؗU�3Z���hLp_n�����+�NA�,�C��D���J6D������)c���?�kY�@��ؔN�%픫�ؔ�`FL�i��+�$���x@lpF�qA[�r�A�%�  a��< @�K�"���$�6�^�0��Kq�db��n�sB�'���~O��|��1=��`���=ٓ4�0�6��"�=#8�_�׋��Mr=�`�yvu��Cr=�K$	�3&�3
n?-n��9"�����5j�4&˓�}ͅ�/��� 3�Y=��nM�mK<+�����X�zd��l��|L
\�Yz�հ,��l���|g�Gd�!�d��6L�9��V,�������9z'�p,X1��9?��ӝ�V�0	"��;�gJ�@������U+c,�
�p�,Q��ŷm�|�rC���2%Sle(�Cs� d���Ϥ:t����1�'��XZa�5s�(}��&YE%Hd���,OD����dX`=^�p���JŘ��
\ߒ�q(q�~=����E�q����_?����_�����_�w�O���������_�pW�y���-�,-���|�<P�:��<jM�	0dk��a�*���F�p�)T�����YI-�6X���A�b�%2߭LK�1"������Rl�n��N6�_�J��'l@h������K�ڎ��!�D��z)7�a���v�?��4��9���O&3�v,RV	�{�lDZ���{���2�a=ɫ�:E?^\n��7�^i�'�G�c�ʬ�9B{Kk��#�h�ſ`��n�:���6iy�%�Ps��t���H
��
�us�N���S�; �ݦ��:<r��&���m,oC�9d)^v�����d��'�j�%�q�^���
�J�RYK�E�K��sR�����&����\�K~����?�>�Xn)pț�	I|r���P��5��d��M���ј(�_B�;r��;MΔlD�`������ ��ȴ^��Y*��x�6��dyN�R��`��[i�PPS�L�cmR���A�ōt��!i��7ˏYk�rX�O��9�����|�����������O�SiJ~d��`_M��'����0�1$Q�q���#�F�h9ڈ��?k\��U��,3��M���|��x]+�iiG�<�y�pϴ>�#��HE���<���	���v&y�S^��8�OdMK`�k��@AL;,��'�譫��s��<>M�Q�[�U��CM��!���p�wĤ��"/�U�����B��@O#A9��dZ~��I��#��� q�ܵ׈�����c�M/�g�$�pX��C66&Z^�`���Z��x<-��h�rI6����=yɺ:�5b[[����>�8��zIc�r���8y���҉Ӂ����^�Yo�X'T��t��t1}��#��5�pɔ�a���=U��d�&I�Z��CQ��X��{�D*�g��l����mo�`�_���*ϿqU�e����w��^�Ķ��N[��ɩ�E�)+Lz�IJ�N�#(fR�O4��ǽ7,T��	yj�qxҎ�{��V6�#[;	H�uZ�Y2�B��|�Em�����i��s�鼚*l�'?ݰQsR�Y�}I\ى3 Z���6�;kM��fN��<���W���#�(c�L�R��t:�����["�ʁ'�����	��X�dK&c�ā\�j)���(; �����E�.�3TJZL��ߌ9Գ"�>F��0^匜q�<�co׶n�6(����Ngj�(^��F�BQJS�r�+3r�q�s�AG�E��k�S�Lok�Qԁ��6!:�lv�Sz��p/��9�E�豤]r>����Vv`ף8����U�5t��0�s�|0�ر �X�rx䩰c��'u5�l>���D��W���Ԥؔm9!=f)OHڍ��s��-��6v��,G�ARw
K��F���,�d��0F����T*���]CnSsǜ@�dJ*a��m�^SD�x��\ X{�\+,c��	f�T�<����#�O�˛Hk�'��Ԁ�B�}��H��n�kມ{��'��d��/��'Q��]io�~�]�G���"e�u��J�0���E�����KTٹԻ�'�n�o�~M{������4Ā��N���RȢ��֮0�����M"՘g�<�J��'��|�w���ւ�Z5���;6�l+�O��nlj�8N��j�ub� ߷׷u�/q0^衦r!�I���Zg�*�Ic��(�tOrdyO�bL[j���ٓ��t��GܦmeXA�	�\(������vx[I���B� 6��Ә0��TŤ������T�C&9�r�G���6��v��(iw�
�.IG8�_@�� �j_V�:%OJ�L&Hf_� �?X�����	ɐ.IT�Nr��?Zd�4�6?�PE_\r�Ť�����]}���&Nl�l�d��&K��Lɉ�j� �x�����P�31�U�]jZ�aAD+p��T[Ҿv��|� ��LN���&[ٵS
����J�ڙ34��n2u�&�^#��Z�U�L�^��P�ƣG�<]rb�.��"�!������7ۗ���I���|�2��>��4~���Tn��ّuNi75H=���R�N�օ7�m�?�nL�8��aP��f['Cލ�^�Hs��b�m[��u(?m�Wj��w������\nNjdA��n[=*KB�<���?�U�e]$Ϳ[��ȏ�=�2�-\��	r�]	P��:V[��٦��
��bYBdy�}!�JJ+���~�^�����r;*�L���tK�2 E�$Ҝ0 +1 <6�(i*�����m#�/d�Y��8@f���s��س@L:�Q��9|�Klݺ����A��y'@�|Hm�Ο�O�S�*�)�J2!v�3RV �l�IZ*=<������$O�_i�����d�KB&$E�숊��~��㼱�"�-�����Q�lO�Fi)��(������Hg��`~�Sz��[��.���
�}{�݊Ű����aM:�4��cx�_��G:�,TU�8.�uʮU�����$��4Mu:Jo�ID�	"�����F�ٰ�!+Bc�3Q��v_Sf7�qm 2��P�J[���:,ŹlUe�?\�ԋk�H�qm�sR�+%£��q��RSҴMuX*�Ku�R֞��#� ~�uP
��0�ߑ�Iy呁�O�G
������`m��4m,כ�7�_�<ҩ*�U���'=M���7��QӾ�c)1>�_3ա�s:��M^?4$+-���P�3Ug�H����:Ru�X'��?4҉�3�u�*zq�jHb�������PYn�sJ��*�=�P$r���h(n1-L�h���X���+lLf��8�z/�p�}�6�8"�dH&�6��Z�݇7��s4N�-����6�ߴ����h�[�ԇd�i �  /�n��o�>藻�?�"����ݯ�%�N���?����{$Zq�i�C�ش�Fb*~ND*��lݑ��!yl�grNeH�vx��Y�r{~����e�(UCk��˸�8v�=$�M;?�=�F6ut9"!S�r��Y �md-�����/���oSq��8Ah�-�P��=:
=�s*td��!im*[_j7}q��T4F�?�6,���o	l*}�z(��̅����{���R��Spm"�3d>m����b��uSg&�+�3Z�":�y��Dr�VL2�J�4S"uM�����*$gM���$�ՔsZKB�X��Ɗ�NS~�uNb�䜇 Im� ]mr�C��6y�M��6���H>�45�7.�I@X��#Q����5��uN���i�C2�����/��ψI��`�1�D�S/�M�,�Ƶ���/�]o4���h�'��5)MQWG�5G�ݳ#�i$7����G��pe"bsۖh� Va4���/<X�GB����aX b��B�ë�v!�!�֐V!|���L�zͧ'b-������ب�3���M����p���<� :i�Q{#��@�sK�����i6Q���5�h;��4\��c��֦� ÷�@�?vbZ���%4ss�}�e�1H�C�&��hh
bZ���#�ޓ8�R,��^#&~�7������1�G�a2�4��&sL#vp�8��	2�TdK$*3�
�4Dd�]QLcR�W�i����e�n�a[����<\������o���F�D�e�E���U�����h=
�VG4E�F�4�;c�F^�/_�����,9Ĵ��<x�i$����U���(�.�	0M�D,e���*0��TL哸�R�/�cڋ�B;pǴ�؅���2j���2zee4���V�eT��d_��$�_1mF᜗�i?�s�i@��+�iB#�OcZ��B�Yc������i(�,����g�?L=Me<h��2����M��>����x���Y��Vb�qlpƸE����}���Clo+N߱�yC{$�!m^��5g?�����e9���}�����
?�V����K�|Tߞ�A��~�ԟd��|~M�/��<b�y�S����������w���ݎ'�0.}$�����0?t`�c{��%����ɗO���N��_,=�M/�F�Un�H����u6��d�?��|̠u��~�u��lL�_��w$۟���ݡk2�u����<�xa{��2v��{5s3��/��(|��=����,��P�5̕�"p�����!��
接{'l�������V�{���\m~7ĳ��[ଚ������.ݰ5��rz�UEw��i�F{�'h��H/π��#�?�?�Cfvf��!�!��	�ȵ�4}�FD�c���1r�~���I<��>�3b�'�`��4�'��ez�c�����W�fD�K����A��D�c�u���������X}y�%f�O�f'1#�r�kĞ#�c�o�N.s�'�K�Z7%�9�����Ld�����2b������"je�Gk大20h+#�Y$y���hO�]->�2�+ý��|��L'&�Q�]g���Sj��t[!_�D��m-����_�N����p�,1���z-(���O�7f�Paz�,e��L���z4�W��_�[����;t�(��P��*�4�o�j�i��������t��4i      u	   �   x�M�mn�0��p��N��#��"f�.R*�s���j�=�� Y�:<�d� �\)V�x�ȂG�E�	O^�T�3h.���F������,�������U%�5R;�$e�$�!x�h6Wju�ȡ�n����
�#X�c�h���'Xh�D{;��Y�.{|m�B�I˾o=�!Z�6�;l�&�S���R�n���D����_7��6���	&n�]      z	   8   x�3���K�I-�t���2�t-.H����Q�t��q�2�,(*MMJ�R\1z\\\ ��	      a	   �  x��UMs�0=� ���1�L;�$m9z&����ȕ�;�C{W��K�x��}zz+����$���|�0`�$>Ku���/~n���m�������N�8I2=�p�?��h�̳�����F4�؋�����(�Z�_���,���g�w�j;��R"��!1=����,�����jEaj�?WJ�5W�݉7�Q�r��M�?�z�hv����� /A�ҟ]Q� U�v=!L+!v�c*Ԧ*�c�A�;��
�1zi�F&�{�
agz�!��}b,M�h�K֪�nƈ1���h}��'��������08`��!�u���*�����J�a�+d���;Ȓ+,��(^Ħ^ftz�� ��������*�e�tӇ}���I!��m!��g��ܢ9��	h��UI���}E!d3�g9T���5��p$$�e,�1	J-�Q<4'�[�C�a,�����P-�7��=�<�rw�@��&�cd���3Oɹ20(���K�l����� �2��mb��$�Kn&g�5.:tj��Ǖ��:�&�wb������%]����2P�|��ئ��w�,��	(��BO���=��� �?���e+�k%�R�!O��� �
q��j�g�A��|�b�L�_��('�I�;Ɣ,��Cm�]�V����o7      m	   s   x�5���0D�o(�	�<l�
�w��8�x�M�bS�GmIn1���${?4�Nv^+:ZTd��\�'7���T`4l�978�8x�9l��!p�X�3��1�'�"~^��T���($      o	     x��U�n�0<�_��Qv"���A�=h�v��\��R���Q��?�Y�NӦ����ʚݝ��梋��hY	�\6�RE�U�ʢ\����{�s��_��j�)rf>������Z�uHV'�,���ڊ�X_N������W7�m}��;�u&�m/T�D妨J�3�9Tg��h������=�Tn'� ]2�ss.����u!��e�d�3�N�NF|��8ٻq�N��Zn�1��LTy�s�Zo�w�|�#�����}E�z��9s�D�>5�.c\�G��EU�<α�%�]�Z>�`(ZT���T�1��@�[B�'��Q3)� h*��B?�������;ٹ��r%Z�o�4�/�T˦��o<I��n��6�*�V��;'�>�g&^�2�}�s�V�����=Xo\�h�|5֔ɷ	�GzXD���u`�OMh�Ŵ��HSf��c�L�e�'�o=���!j$Z���%���L^�֣>ԥ���MD�t �X^9@�Ă�h�*��=��,a=��%O8��P�zD�4���񷨓|8h�(�H����,��`�l�����G~�'`��H�Q7<�F*ʊϓ�U�y!��Y�pg[���k��y���؋��t�?&K�b�H�W�:�?��ѩ�Av�a�Y� 6c��x�8�#�jH��y�A7��x3�D�b�fƵd+<�Τ</�[�S���{̼��v�^U�h��ԹPU	3�����{t,����c9��?��Z�OG6���}�N��l�,�w2�q;����+3vF�j��M&��Ôf�      c	   &  x�=��N�0�ϓ���8u���j)R�\{q7�H����=kGpܙ�ow�����1��)U�j�rF����\�OQf�����H-�ت�8)3GQ>ʓ&��	�������m�MR9�:��D�sc�7a�X�$&�	u�㨕�m�T�d��Z�/�������?*_5����:��{Q�;�e=>Ԣ�tX�'e�g�.��ڔR5'Vd��^���CO���^ZC���-�u�ۗ� *(�O�ĉ�o)7�pzr6,V��i��~G
O����#�w���Ɣ4K��kx�sN��(�_��|c      k	   ,  x�}S�n�0<S_�����=��(z̅�D�#�]���.� r���4��ٙ�ؖ�~<�i(r���t�7Y�R�@�N[>|J�i�<���? 򼻜�K�*��c�p�p�An�؟�aWd?���/�9�cY�} B�h]��o;�Y.=���<n�2�qEL�
��n��*�M�U�5�%�
�M�c���>��>K~��p���c@�[�^XF��Y�:M����~U!�Qށ�P�E�j�y��o�~��t�� c����J��ͼ�w�u�w��-bs����R�t���% �<e�N�i�2�,�P���b���j���|+�5p�(�<��� �2�;cT�hޔP�����ς���U�H���:mħǯ������ԑK'�U���V��R���	�N4c����TcYď㡬���&��3��jaݯ�ȍwڠXqT�&��a[sU�~�b���Ye�w�j/+y���_ӥ8Y��U|�R�u��2���!=O��/�_�&QP����q�����؂��`}�ivO��?BNT      e	   "   x�3�L,(�/KL����2���W@����� ΰ
M      q	   #  x�E��r� ����t,	!�h;N�L��$q�\�U���"H��U��/�`���o-�E�j9:���P�H����Ń��}/]�1�B;�V�𣳨��B�P��(�=,-�RM���38�9��>B��R���I�k�VF��!��QW�)��9]�sX�C�5�P�#��j�F��Ѧ���֝���P�փ<9 �������]�z<῿�e�KbG�1�kI�`d�Ѥ��4�Dn��'�)����B�'�u���;T"�,�pgEr�9�yt4(��{�N]½�"F#ҽ�񾲂��c
ĉE����6��w�ѢC+[ظ���d�ΰ���K�
x��
V£���1x��_�U�D��L'�֋.����$��li�϶�5tt�8���}�FV9�p|�� ������>H;Z��QUY�Wv^Xg��
�T5<��?(�&�1G�I�w����<��%J��9����xN ��.��5g^N�;>D����_>�*�w��s�[.���&���".o�M
G�O��m6���I�      ]	   2   x�3�tL����,.)JL�/���2���OI�s�9C�K�2�A�=... ��g      i	   �  x�}S9�1�ٯ���S�;v��&84���}�������*��qP�/���F���#J7d#rx��M �_g�؉�4T��.b�� �����Ԥˤ��Ӊ�B�qe]R�A��1\1�#��+�\�ق���I7�Vb�
.�h�(s.��|
��R	��6��-�)�@NVn�*�H�H�9C99���b4o���Ғ&W0?���Y¯��aֺ�N}N�(�7C�c,�U��A����af:Va�+�g��aHz�i���<aHpo�n���P���NrӵR	��
J~ݲ��4?Xw�	N�d�M˖5\%�k���m��b�d|1��y U�4��٘�^O��'�;cV�*"���;_���=��Y��1=om�K��'�N <�	��\����^۶m�����      g	   �   x�=��N�0���S�	I�n;�;��e^q�bp�J�=�a��/����Gޫ�nSy�K=~[�a������F�3�XR9j`��#i�9��	�y.`##E�KX���F���*6���R`��s�lvnXZ���6W��e{4�D�t�<�~P��7�&���9�ҧh��p�!��,�9���L'�{_�B�(-����lcQ�Ҁ��k��6q?؀JW������Th�      _	   t  x�}��N�0E׷_�T��KaR+�ʹ1��CB�=���G[�,"'7���a:Wi�G���|kMx�"/p�����><��0�W�oM�64=�L�iH���e�e����?��_�z��	*��Ňmt	��I����?�DɣK��dz�qݷ�;.�r�xދ!nKB��4t@�ζ
OJS]��Q�l�Ex{����L��)<��;j����O��T��n��'ǒ����X��,�(P�	4�����,9�m�E���[������.Lâ.��̦���Sw�4�|ǹ��.�RnUM�g��v�v�Ii��9�Q���N���ץEvT��Zկy����2J�L����|6�}v�ʖ      s	      x��}[od����W~��E/zr�xY$��o�{`����fz�rKJ�Xd��x�rN�<�i����{T�*�ƺ�o@H�^�{�n��{�U#���ç߼>��v�o�^�<�}#���߾y�>�|ڭ������������o������f�p��q���?��������f��}���������n㗯?ӟo��
n�j�p�ih�釿��x��q��{�������O�����}��_>��7=�_�_�o�^��_��IP�o��e�Y�>�~L�҈h�����v�ӗ᧾_m>m���W���e�����',�嗈���zw��(D�,���n�)����s��7�;����]�ӿ�Ꮑ劳\ݢk��Ϊ�<��������������O�*ª�������?��;����w���o���{;�:�=~����>��ğ�~���9�-����/$�>��UV�WYIV9Ƭ��{����ㇻ��vY��;O�3��Ly�ͭ�$���Z��~~��4=X?�������7�Ô��w������a������������O~S�ӏ������L;B��M�x��:H�_ֿ���=��w'9v��w�!���A�V����-ro<G��
�(�;	���3%@�a2���w*O���O�T¯�I��'��*!f�DA�����Q�Y��[y�{�?'k��!���)!E\�F���\�����;����PprD�J����9��U3�o��V�-�Fk���j�c�x�g�X��ȼ��A;SV�e%#J����B��8-�;�F\T�,G\�
�h�������x
=�x���v�Oj[��v)j�6RZ4gkǋʼ�c���
�����D
(\5�������] �#t�9�},���"xI� �߬dc5VybW�`5L��m�����1$��� :�g�근ǐ�.������)��T�X#s+m��v!��r��?ӵ��x�?Jgb	�K�0};}�a��>$'��NL����(���j�T%v5���	�]��V����y��׶�x��N=�DG��y�$��O��/V����K!}���q�u�w?wݿ!����Yv�D�����1U����o�'�Bcȫ�,����!8�R/)Z� Zj�h��?����>��?�����?0b�XdĢ����u���"N�~y+D# �>ۛ��xY�8FS��Q����K��YW�+��[���8��_�m�"E)g���ow�1o�n�Cl�^��ӢZ����-��E��q�84N�_5Ñ�moc���4o���lsr��60�l�sQ�[�xP*�qV�����KW��^���(�=CL���ꪕ

��
vS7!�@y�ZO��&�I����U<�e���L���"` �!b��h��k�@��7	Y������#|�(��Χ'��O{T��`WB��_����?��k�j�~w��5�>>�<����j�m���c	{�c���ƂQ�ԐZ��'q-�%�U@�t�o�g��PH����`�]|YI�ﶅ�m����)S}�ڻ��Ie#���n����V6�����9U�����,,?��X���`I�$�d��v�FH�b��O^�h�D�>��2J��0a!�$������j(����U���Q�BS�1����!�����Gũ֓~��a�����n������ṫ<�ǻ�SWu|����7��}�� 2`��N����c1h�"��k�<N%�*�j���>f�W�=I=�&<}n�������R���
_�����Ա���O�������}�]���?�o������-��C�?b���ST˻���?=�0t��on}���%�o��7��Z5����>����p��] ��C�>��d��9�l������˶���t�׾��}\J����)QYJ��m��u���"=]�_O%M0A����sˆඑ�.b�C|�H� ��Q6D)�&���%���0I��I�ƍ��ѻw����1��n���������}�6 .O���~}]���W7�� ����r�3��	�������������~�^@���1]���S����|�����z\߭oV7���^�o�כ�`I^�_W{JdnW��_uu����AQ���Lmb<gH�T]E�r~Օ�0'����Kt�*t��Uj�yRV�6҈����o��,�W)ׯc�r�ו�)�Rt�b;˽Ap�Pκ|������z��)�G�y�r/ )�,R�}�Ծ�4*[�@�N��T��#"��S��r_EQCa#���d�~����q��O�l�1�I�=��i���l��d+q�;�`Z����n{�]e,,��]7J۶�(�q�JMǓ������>��U ��Î_:��t������b���d�)��Þ{&��y{�3�q��6(�� +u+u�z4誊������d����9n�� >�:5�c�t�:������s�n+KuH�9T�I�;Ǎ����l9f�F��#:p��!:|Z���١�w�����2C���N���sO`:�Gcx�U��A���\�q�J\���%����=���һ�$P����S�O��;�5���$�*�ѻ�'}߳i&�e
:�G�3\�ǍF�4�qcR6l�<y�������Y�ς�Nr`�/�{�_]a�^����zS���H:�'i��m���$^e��q��hU!�2��w�{gC3c`S3�y��n�R֞I��>��ڳ��}���f�-`��$s�R��lu�Y�������Rs��?oW��><.h����<����-�p�Q٠)�1h��}Qd2H?�n6o��]o?����]H����	��e�Q�Q�X^���������~�ެ77�,b�$0R�F�4�L͞ܳb�(��a�Y`����a.`�P�J .8Bk�G��6TT`��(�ɨ��m!�/5�E�.�	�T�|RR�c�q$AJ����L��{K��|*�^����F�B�ߌ�:$�r*͒����7K{0qG9V�җ�l�L <' :��iY�ȸ�Z)#D�8#����+{v�B�(0�
)�+���唿�I@J�Ѱ���M
��mx!��/*�փМ�X>���B����(���C�݄�z�k=
���N��;!��D��@aFɵ
�!�7�/�5_����lG���[!'DRUUp�,����8
)S
4V4��� N���bi�;�~�m	Q)!*D8R�B�ε]o�7�>N(�&�l_�7��PJLa������1_ݍ3�֬�~W��T1	a�p��`PG�" �7 uJ�;�HW�:�R����M�wi��L���A�� T?�0��mc�LA�˪4��y�+Y3�c4	��l��w�?�~��#�~�)���Q�d�s�۷�I��d$�%:aea����$��uE\:f	i$
uI���R,6E�N6]=/*�F���̢kDve���V��������
�q������������E�~0��8��OV������U&���W��kd��{�:�r��Υd�����$��jG,�	9L���(P��80ᴕ`@u^g\�)ك��2�$���#&8	
8P{+�Bb�/���J�*�@���Q�j��^�� ����m����u�q��-U}�e㋆ktp�
C	�ԿV�N�D���H��l��I(!����O�WV��t�i����S���Ԃöq�EpAڹ6v��B|�;"�ߠW�>{>��[��%D垷���� Z2���F{�gw����c>X&�}�5r���=[��3XҠ�|�@�kfϑ�l���}�(��2�#���Hp�¸/�^�?1,�C�kRk��Xha��w�'uϮ�p�8������tٴ$��������ׇ�n5Qjڂ���2k��Π��P�t]TM�#e��Elg�{�ʡcAc���r���vw� ��ؖ�pqn4F��Es�Զ��`+�(�+cU�Ȭ �1�:�u���e�E�u���,�I����������[Z)���e�Wj@QpB�|Rdg`ٞO��������,��`�e�>F���Q��<�5���F���@ŐC����B��.��    K��K������"J����G��{�L��Ȃ�6K��R��6��B<x��-N���`J�	���M	��1ZC��_]�I8N���{AK��_%dxN����t���y]A4���s:���_�?�}2��m>ob�T0u`'f`��Ys��H^49�۶�%,Xrp���gD����ĻC�Ą���u��CӢp)1"K	�:2�k-��]J�B����v��EG'rK�ܢ�m^��j�	�]�TGH)�}Kh�0��J=b�2�x:��I�I<�8P� �JG��o1���+/��e�|2�L�x�,�۸�5q�����e���Zh>�z:����ɀ3�g�ksSM���-�FHY��x�/�B�D6�]�y���ht�掦��;���Øu�@i�`�&�����-�d��5Mt��;���F8+���k��;�<!�o���=��y�%'�is˝άe����$��i�	�I6؀���Kt��r�NU���U��fL���ش��o���7���FI��an}�V)5�)��z���%�O��f�α���7TKc��Z���ob��UXu��.g�Y���� �	Ҥ�Ҕ��Fnd^����C��7�vJ�q#��V��9顴�����~���'ǭ���w^/���
���4klq�vĝ�3�
O09����t��);�egݨ�@���0�0�]���q��4n���}��ɭ��T*C�+U�ifk�bűs4~Yzn�h|�	>����Q���a8�3���;�����ϟ���df�X<73��k��}�u��s��	���/YOR��h�����q+D[,��3*فK�g��;���?N%���b.e�Ρ��u���1.����1�pc�.�y��4Xܲ��R
�^i�����N����W�R�����#u���^�ׂC���''	OX���q݄��X�p��8DC�B&a\6@(�0�@��=/������;�+S��=�I�f�#� u���:���㺫���)�L55s���u�a(��Ud�|��2Ë�f�v�;^m�|߶���z��8hZ/n*Z�C�J��p}݁փ��Q��f�k��[U�����g���&Jj�Ӭ���U�BDnt�w4��.��o��V,�s�d5H�9��
���4�MwS�MAr=��\)���N�U6�.�����V��MM�P%R�[$	ArĹT�*����,��E�:�}�v�`$���X���L���)U���6!��
T��� 7�ho'��Y�"e�4V�k�I$6�Rc��qĮ�Cb*!�`?�C�q-=:��x�X�Ծ&�=@�%�B��g.q��H0�4�-��©.$�2���`��M��#5��BN����U����K
DI���I(�"��EB2��p�#JdP��~;� ���K��.̅��s�-ͦP��
e�ؗ
I�#��LD|ewJ �)Pjc�E���D�����dQ�'o@wЁ��,�V:�Q�;��@-�/Tau�;t� T����Lt�D�J�{�18���L
޾�I���v���x�F����2>�J���������u���D�F�Py<t��[VE;�t��)uWTC���J�!�3���(К��Ǫ	��j]�����2x�F%D��Ԇ��y@Pm��t�p�=%�OSz��;�N� ����eg6<M�wku�N����%�N~���a�����������_W�/뗇�OKv<Q�B۬Hh�d�O���:���>.���w���)�~�������Q� *��/B��R�(@����m�"@��r��0	2OZh��݁iD��V%y:�딳�EW �	R6AuP�B��?W���8�FL�)D�&�Z;F�g&&��*1��K�r�q�R��i,��+�������&���f��]����*��t%6qWknE��#�5�fr������.���sG�З��|���V�C}n���}�����X�[���}�W�Xo���p�p�&.�m�qNVGc�{2F������3�Q`.(b3���d��̘���1Y��KM�8������u�z�ݯ�a}���l?=,=���d��" ��v@�,1�¨��u�+-��EB�%�x�'Dg	�u�$b$Dʠ���E�,!�����i	�B�K�:1&/Z����� 8C�wJl���[��@-%6X��)�s������H�¡h������\Tji��rgo$9e��6��@+][`@��F'���[t�S�^-�Rfer�����g$���l��@䖱�u ��=���!>�w���=��{X����;����ː8�Xx����z~�UQ{�g���ܑ�F��҅z�.4Ѕ'�U�MB���������_6�t�3�
�lBhUA�M\�zLFS�������&��h0��� ��b0���Y	@����jr�Q7?/Z�.����l≐B�P��s�F���z>��G�F�c}?�č#�MNx�|����9�+�?q���=�s�jH��X,�98u���*�I3V��7��.�Z�1�������4vI����\�2�ֲ��hlK�"�vj�Rk]]�����
�eL�j����x�=�/�_��b�/�`�˜�s24�Ky'
�H'8��hGU2|�G�o���p�#e�l5��eN����߫��X
ӿ�n�3'\=��������)#�7���I�������_W���M��_��٬HD���\��)_WL!�A
xR���T���΢������ax
vO��J_������ʉ�A<O��$8i���.VL���0OǒY+F�`1���Mq3�0�v'�
h̅)��^奊ɼZ�Q��cc�c
7åd.�ܦ����l�<�6cY�.n֮�ԓ�,��wM�'��d^O;���r�d��������A���J)�!�����U��RC�'�����X8t�rD,b�X�w��vCKa�6���M	n7h��o� i+�#Г	P"v��[���T�(�R4�����dՙ�*i���B=OM
T���aU�_@-�n�;#kW���U4��0��Q��;-PZ�Xjk�Tgz����Ax(,���hg�54�NY�@����	Rڙ}s���"h�-�PRq���F�v�*�S�Z7t�m�@I�@]��&�Vo�W�p���f/��96u+nd�L��l�-�Cΰ�6EL�<�U����v�����H�A�]��A���sU�����&H*�a�3�p���OS�v�)$�����b����O��;�3PQ�3�纹�c#��iz�T���0h��3m����=(��$p�Ғ��ת��`Z��͂�%� J|`�eApCI+�UЌ��jK�P�Z4^�,�%����J	�$ P�	np;I���J���ܶ�#2����鏑LwF�0e�X�Ϝl�ȃ䬄�I~]�����(��J^�d�
A7W������пd��}���ʶ˜��e�JN���粒�y�o�<J)1¥��q�:cxnljQ�R2E>s }u ����P��7����J1AlP*���^�%�j2�U�RJ�p�j2�R�$�	�A���A�a��h@)��v$��R�Oa�M�Jh(�w�nkg���1Ԇ��@;Q��S0�(�{�Zj��Cu�):(�C���vB�7�kQ?u?��K�� �����M=�%a�#;b���6�su��3��Z*v
&��X��0 =h��V L/�4�TWo�Q��`-PE]o!S��B�Z������m<��-I�E���Bp_j̑>�������C�9�8b��)��{��&��ǩWG�Q���Y�ZuDu�)vP��ӂl��;~ژ���8�>:x?�,��ɖ�)[PH�f�q��<(\ǱUV�jt�J_-�!O�J�7&���.��~]?�LU�=�y��CJ\/��d��R����������m�d�v���T�qPU�1qn�����v̄�Ώ^^��P��r�tp(��$��`w����l�p
P���,�(i�0�x
OJ�R]!���S��u�V��)#z@���4�T���~�"P�����AU�o� �  m�؝���S��h�Q�T_(�9L�GbP�:� �P44
Z9iE��Á:�D�������/ƅx���2�S0=](�"O�Eu�G�����5�Qm�Aa�V�b�Ώ!.�Փӕ�)L.�����A��}�H=��5TpT��8�:Y�`�MHp��]��*�u��V���,p��g���E�٩q��i��<tSW���ۻWr:_PH�ެ?n��<�Z���v���?7���/"��7�mV�L���.�}Y�n�a�f��>�/�Z��?������s���u��cBvLq�Kc�Ͽ-����R8�/�s��s%�'���/���;�/�{R������2A�����t́1���i��_�ާ��:�AvO��O������U�An������9d=�G��{:�T�X��f��<����Á��@�o�tf���d���d�K�@���x""s$�;Ӄ�?�/�u$�w$���&sXw��2˖T���K�踒:�Ym���KY������j3�NJ�<m)>��9��jjZ�T����J��(�ʢ�?X�Ofsb���Ò��;���HI
���Zam�m�#n��yQ�a�R���j�����ZR�����+�c�qY�f��~�v�N�������@��~}]�^֙$�@�����Br��'��(߹{x����v��~�A ���>��[u_b��2VkjΛ3.^����B�p�db]�S��=�6�/��	�m���O���)���O/���ڊ��㘷��ւ�~��nߎx�۷�BçhH�h������x�$���Hv4�w0߉(/?Gz��<���N6y`@A���;o���2�������%Ы���8�Z���^��2���S.�'r���@V�V�����pmkQ�&�z��@��oh�YmR�;c���8O��3�d�O���Ń�h�D����j��*��z�4�?q�����o��Bi���y}���O��/ۯ��W����������҃�_Rk1u�z��E�+��d��?*�}	���؞�l_�2#6��\lU�͏�.-��Cޖ�� v]n>F~�ki��*O�������0f�4�d��%ܾ�R�-�4���V`����C�֡�r-0�$��C��lт�RZ�.F��-��ԓ'"��+e��Pf�/X�=T���v��/�5������)�R5VKU(֛ Rp�H���NUK��z�@��+<��V)P�-DoS5N�)��� ���~>�^�X�V�<��oPI�@6f'��8�}k��W��*x5M]G��4er��W�Υ%N�����r�l�[�O�Ա�����ύ��ouD?��o�~vR~�� ���d�_����z��t}7���n���eNb��65�d�{���&�D�����`��S��OC�.[{J�����.=p�}��4H�+ d��.�����kꋜ1��	��5����qc�P�0Z��K��������<�<�ֻ�N�ԥ�&#�:��}$���;|�:e�ƁR�ٿ�H@���B`�Uw
PÀ��~���^��e@i�4�V���`�3k@ycJrk��P'8ӽ9�⽀8c��V=�"�@)o(s�=�V����W ]�9ׇ�.РɬQۘ�*T�[M<k_���;��*��@@�uXМS�"
T��-.�����q��"1�2�g������؏%�qL}��иJ@�p��ZRO���w_�POo�4��i�k�����(;C������96��@%�o�s�R� �&�޿Ԫ4�_Z5VY(�e�Ts��W��"���[��� �ޕ���ޘhˁz��
��
�8�`�PG��ToK�g@ё1�J.��ؿO;Xh�]i����Äv�ePQ����c�zW;R�8PMe)A��B6~
P������?��"r�gxh'�;%5�/Tl�M�򌃲��C.��z������TN.T0yVT��_(2���c�F@L�i��
VKQ�٬�L�"6�04`��`@Qŗ(��W�'�R�����_]O���@}[]����z�a�`J&�N0nz�Z��*_�1)�Ax>���Ʀ@�iPAp��ﴉ.����ږ�K\_�����5!^�W�V0���*� ꂆ�����0�,8eLa������`��N�����V1��[o�g�6�.V�� ��r�ñZ�"�0D���][�@5�
���.H�ϒF��	r*P�C�E+�e�����������)�!l	��h�a����uK��Pt������d|���\�(�o �z�V
g�����=ˡ�t\�)lg��t\͝v�QB�(K:����t\���&-�.�D��X���@�緃�Y>g\�㳀����*��N�c�+�O�u
�Iц�*�wII��硒|��H��ya��{nI�v\��B.�?Pz�~\.�מ대Z
h\u���@y�L|X���x~�P��bDS��u������/�VL���@u����٬�(�m��P��E{�`R=�l��X�!��RˁZj�	G_��.����|�#�����  �rY�:3�H�"U��]7($JQ\R_�8�8PG�#Ry���b@��D ��S�?�'���brU�U�"
����8v�j��0�I/5��R���\Q�(
�&��# uh��F�U�D�{@�G�pN���M��h�Ӏ�Y��.(e�1��X�~YD	(�m_�la������
�gD�!h�hÍB,F�TTR9P=d�!�}����5)Z�3�{�K�~�5���\I�[��t3��C���0/-��D�e����=�t}zbi�w5��NB���Y`'�*���P\�_I� ���Ν��j�,����΅�P���H�%\;*z�j|PFn�\i
������!�����a%���s�c����	�#w����d�(E�TϐF���;AMVK3ԇ��ۉ�{��������;�%�����U*�]~p���F@g9&�v��KY�&��s3A�ld�<�%j��.X���柷�U�*<��3T-�����F�EFL��e��a��Ĉ����	��34U�TR=�S�j��{�c�
��@�L�� ��oB�^�ՓRK����\V=q�LQPJs��
��W���&����c2�K2�uIFl�2w��0-�X>�'�x:��PJ�M��hSDIMdjN�f���
��9����3�qF �z;�U�c-�x��7d'12UZ�P���d��߶7�� ��V���l?=l6������	lCϪ�|�l�>�7�	�AT٘~t�IH�߰8��Î��H�斍��
m�L��G/����B|�:�������Z��T]�p�u�r#Rq�u�3B�Z�K(�C�V0���/`G��r��HS]@��kw�:塰�{�o��m�9�������)(-�ާ,�YS��q権���j�@�.���R�d���ϫ_���M��榍�@6��4�;N�w�ϓf�ܡ{=c�T&�����;閄K�Xҥ��R����`ttb��FQ�M �$RE����ӱ���!�D&t.�,KE��LF��t4��0$�,G��y�tY/~:kd
�c��(-֝w>u0�Q~٨������;�㞮��M�諮�Lq��y��m��ǿBiM�ƁC'�#��i��U�;܋�HS�����"��܋�nQl�w��?��B�Ea�:�Ω���eZODeFjY��� �)P��[� �v#�6��)i�����J#��E�k�K��b��f#"���>��&���26M[jD7�k+li� ��V�=P������L�N�W4v͇kAU�6tZ��@�=1��5֢���5��xtz��tj�P�fmB��-C����c��I\/k۲P�բ	tF-_��Ml玍�����g@��C'i�vu5[�e
l�0
Ta���D�N��h,eԒ*Ϫ�B(�����L}�vz��@5<
�mu��?�w���_Q��!     