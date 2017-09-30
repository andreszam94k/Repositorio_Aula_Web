PGDMP     3                    u            Aula_Web    9.6.2    9.6.2 d   q	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            r	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            s	           1262    24958    Aula_Web    DATABASE     �   CREATE DATABASE "Aula_Web" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "Aula_Web";
             postgres    false                        2615    66926    multi_idioma    SCHEMA        CREATE SCHEMA multi_idioma;
    DROP SCHEMA multi_idioma;
             postgres    false            t	           0    0    SCHEMA multi_idioma    COMMENT     w   COMMENT ON SCHEMA multi_idioma IS 'schema que guarda las tabals ncesarias para el control de idioma de la aplicacion';
                  postgres    false    6                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            u	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        2615    25529 	   seguridad    SCHEMA        CREATE SCHEMA seguridad;
    DROP SCHEMA seguridad;
             postgres    false            v	           0    0    SCHEMA seguridad    COMMENT     q   COMMENT ON SCHEMA seguridad IS 'Schema que almacenara la informaicón relevante a seguridad de la aplicación.';
                  postgres    false    4                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            w	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �           1247    25526    consultar_archivos_type    TYPE     �  CREATE TYPE consultar_archivos_type AS (
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
       public       postgres    false    3            x	           0    0    TYPE consultar_archivos_type    COMMENT     �   COMMENT ON TYPE consultar_archivos_type IS 'almacena los tipo de datos necesarios para sp_consultar_archivos, sp_mostrar_archivos';
            public       postgres    false    701            �           1247    25572    consultar_comentarios_type    TYPE     �   CREATE TYPE consultar_comentarios_type AS (
	id_comentario integer,
	id_usuario integer,
	id_archivo integer,
	comentario character varying(200),
	fecha timestamp without time zone,
	modified_by integer,
	usuario character varying(30)
);
 -   DROP TYPE public.consultar_comentarios_type;
       public       postgres    false    3            y	           0    0    TYPE consultar_comentarios_type    COMMENT     m   COMMENT ON TYPE consultar_comentarios_type IS 'almacena los datos necesarios para sp_consultar_comentarios';
            public       postgres    false    715            �           1247    25507    datos_archivos_type    TYPE     ?  CREATE TYPE datos_archivos_type AS (
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
       public       postgres    false    3            z	           0    0    TYPE datos_archivos_type    COMMENT     g   COMMENT ON TYPE datos_archivos_type IS 'almacena los datos necesarios para sp_consulta_archivo_datos';
            public       postgres    false    698            �           1247    33790    reporte_archivos_type    TYPE     �  CREATE TYPE reporte_archivos_type AS (
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
       public       postgres    false    3            {	           0    0    TYPE reporte_archivos_type    COMMENT     c   COMMENT ON TYPE reporte_archivos_type IS 'almacena los datos necesarios para sp_reporte_archivos';
            public       postgres    false    724            �           1247    33794    reporte_autores_type    TYPE        CREATE TYPE reporte_autores_type AS (
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
       public       postgres    false    3            |	           0    0    TYPE reporte_autores_type    COMMENT     a   COMMENT ON TYPE reporte_autores_type IS 'almacena los datos necesarios para sp_reporte_autores';
            public       postgres    false    727            �           1247    67010    reporte_usuarios_type    TYPE     M  CREATE TYPE reporte_usuarios_type AS (
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
       public       postgres    false    3            }	           0    0    TYPE reporte_usuarios_type    COMMENT     c   COMMENT ON TYPE reporte_usuarios_type IS 'almacena los datos necesarios para sp_reporte_usuarios';
            public       postgres    false    749            �           1247    25588    ver_archivo_autor_type    TYPE     �   CREATE TYPE ver_archivo_autor_type AS (
	id_archivo integer,
	nombre_archivo character varying(30),
	sinopsis character varying(1000),
	imagen_portada text,
	nombre_autor character varying(30),
	id_estado integer
);
 )   DROP TYPE public.ver_archivo_autor_type;
       public       postgres    false    3            ~	           0    0    TYPE ver_archivo_autor_type    COMMENT     e   COMMENT ON TYPE ver_archivo_autor_type IS 'almacena los datos necesarios para sp_ver_archivo_autor';
            public       postgres    false    721            �           1247    25565    ver_archivo_type    TYPE     �  CREATE TYPE ver_archivo_type AS (
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
       public       postgres    false    3            	           0    0    TYPE ver_archivo_type    COMMENT     Y   COMMENT ON TYPE ver_archivo_type IS 'almacena los datos necesarios para sp_ver_archivo';
            public       postgres    false    712            �           1247    25582    ver_autor_type    TYPE     (  CREATE TYPE ver_autor_type AS (
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
            public       postgres    false    718                       1255    42035 '   prueba_resta(integer, integer, integer)    FUNCTION     �   CREATE FUNCTION prueba_resta(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

update public.usuario
set dinero = dinero - _dinero, modified_by = _user_cambio
where id_usuario = _id;

END;

$$;
 W   DROP FUNCTION public.prueba_resta(_id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    1    3                       1255    42036 &   prueba_suma(integer, integer, integer)    FUNCTION     �   CREATE FUNCTION prueba_suma(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

update public.usuario
set dinero = dinero + _dinero, modified_by = _user_cambio
where id_usuario = _id;

END;

$$;
 V   DROP FUNCTION public.prueba_suma(_id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    3    1                       1255    42037 ?   sp_aprobar_archivo(integer, integer, integer, integer, integer)    FUNCTION     :  CREATE FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
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
       public       postgres    false    1    3            �	           0    0 {   FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer) IS 'Funcion que cambia el estado, categoria de un archivo y agrega dinero a la cuenta del user';
            public       postgres    false    270            �            1259    24969    usuario    TABLE       CREATE TABLE usuario (
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
            public       postgres    false    190                       1255    42038 �   sp_cambiar_rol(integer, character varying, character varying, bigint, character varying, character varying, character varying, character varying, integer, integer, integer)    FUNCTION       CREATE FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer) RETURNS SETOF usuario
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
       public       postgres    false    1    190    3            �	           0    0   FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer)    COMMENT     I  COMMENT ON FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer) IS 'Funcion que cambia el rol de un user';
            public       postgres    false    271                       1255    42039 #   sp_cerrar_session(integer, integer)    FUNCTION     �   CREATE FUNCTION sp_cerrar_session(_id integer, _user_cambio integer) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.usuario
    SET ip='sin IP', mac='sin MAC', modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 K   DROP FUNCTION public.sp_cerrar_session(_id integer, _user_cambio integer);
       public       postgres    false    3    1    190            �	           0    0 =   FUNCTION sp_cerrar_session(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_cerrar_session(_id integer, _user_cambio integer) IS 'Funcion que modifica la IP/MAC cuando el usuario cierra session';
            public       postgres    false    269                       1255    25508 "   sp_consulta_archivo_datos(integer)    FUNCTION     �  CREATE FUNCTION sp_consulta_archivo_datos(_id_rol integer) RETURNS SETOF datos_archivos_type
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
       public       postgres    false    698    3    1            �	           0    0 3   FUNCTION sp_consulta_archivo_datos(_id_rol integer)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_archivo_datos(_id_rol integer) IS 'Funcion que retorna los archivos no aprobados y dependiendo el rol';
            public       postgres    false    258            �            1259    24977    archivo    TABLE     �  CREATE TABLE archivo (
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
       public       postgres    false    192    3    1            �	           0    0 >   FUNCTION sp_consulta_archivo_nombre(_nombre character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_archivo_nombre(_nombre character varying) IS 'Funcion que retorna los datos del archivo dependiendo el nombre';
            public       postgres    false    250            �            1259    25036    autor    TABLE     =  CREATE TABLE autor (
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
       public       postgres    false    206    3    1            �	           0    0 8   FUNCTION sp_consulta_autor(_nom_autor character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_autor(_nom_autor character varying) IS 'Funcion que retorna los datos del autor dependiendo el nombre';
            public       postgres    false    253            �            1259    24988 	   categoria    TABLE     �   CREATE TABLE categoria (
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
       public       postgres    false    3    1    194            �	           0    0 <   FUNCTION sp_consulta_categoria(_categoria character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_categoria(_categoria character varying) IS 'Funcion que retorna los datos de la categoria dependiendo el nombre';
            public       postgres    false    232            �            1255    25222 %   sp_consulta_correo(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_correo(_correo character varying) RETURNS SETOF usuario
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
       public       postgres    false    1    190    3            �	           0    0 6   FUNCTION sp_consulta_correo(_correo character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_correo(_correo character varying) IS 'Funcion que retorna los datos del usuario dependiendo el correo';
            public       postgres    false    230            �            1255    25229    sp_consulta_documento(bigint)    FUNCTION     �   CREATE FUNCTION sp_consulta_documento(_documento bigint) RETURNS SETOF usuario
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
       public       postgres    false    190    3    1            �	           0    0 1   FUNCTION sp_consulta_documento(_documento bigint)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_documento(_documento bigint) IS 'Funcion que retorna los datos del usuario dependiendo el documento';
            public       postgres    false    231            �            1255    25323    sp_consulta_rol(integer)    FUNCTION     �   CREATE FUNCTION sp_consulta_rol(_rol integer) RETURNS SETOF usuario
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
       public       postgres    false    3    190    1            �	           0    0 &   FUNCTION sp_consulta_rol(_rol integer)    COMMENT     l   COMMENT ON FUNCTION sp_consulta_rol(_rol integer) IS 'Funcion que retorna los usuarios asociados a un rol';
            public       postgres    false    234            �            1259    25004    tags    TABLE     u   CREATE TABLE tags (
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
            public       postgres    false    198            �            1255    25355 #   sp_consulta_tags(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_tags(_tag character varying) RETURNS SETOF tags
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
       public       postgres    false    198    3    1            �	           0    0 1   FUNCTION sp_consulta_tags(_tag character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_tags(_tag character varying) IS 'Funcion que retorna los datos de un tag dependiendo el nombre';
            public       postgres    false    254            �            1255    25220 &   sp_consulta_usuario(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_usuario(_usuario character varying) RETURNS SETOF usuario
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
       public       postgres    false    190    3    1            �	           0    0 8   FUNCTION sp_consulta_usuario(_usuario character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_usuario(_usuario character varying) IS 'Funcion que retorna los datos del usuario dependiendo el username';
            public       postgres    false    228                       1255    25527 (   sp_consultar_archivos(character varying)    FUNCTION     9  CREATE FUNCTION sp_consultar_archivos(_parametro character varying) RETURNS SETOF consultar_archivos_type
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
       public       postgres    false    701    1    3            �	           0    0 <   FUNCTION sp_consultar_archivos(_parametro character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consultar_archivos(_parametro character varying) IS 'Funcion que retorna un archivo dependiendo un parametro y que este aprobado (2)';
            public       postgres    false    257                       1255    25573 !   sp_consultar_comentarios(integer)    FUNCTION     ^  CREATE FUNCTION sp_consultar_comentarios(_id_archivo integer) RETURNS SETOF consultar_comentarios_type
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
       public       postgres    false    715    3    1            �	           0    0 6   FUNCTION sp_consultar_comentarios(_id_archivo integer)    COMMENT     z   COMMENT ON FUNCTION sp_consultar_comentarios(_id_archivo integer) IS 'Funcion que retorna los comentarios de un archivo';
            public       postgres    false    260                       1255    42040 /   sp_descargar_archivo(integer, integer, integer)    FUNCTION     B  CREATE FUNCTION sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
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
       public       postgres    false    1    3            �	           0    0 Q   FUNCTION sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer) IS 'Funcion que actualiza el saldo del usuario cuando descarga un archivo';
            public       postgres    false    272            
           1255    42041 %   sp_eliminar_archivo(integer, integer)    FUNCTION     V  CREATE FUNCTION sp_eliminar_archivo(_id integer, _user_cambio integer) RETURNS SETOF void
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
       public       postgres    false    3    1            �	           0    0 ?   FUNCTION sp_eliminar_archivo(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_eliminar_archivo(_id integer, _user_cambio integer) IS 'Funcion que elimina un archivo y su relacion con autor';
            public       postgres    false    266                       1255    42042 '   sp_eliminar_categoria(integer, integer)    FUNCTION     �  CREATE FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer) RETURNS SETOF categoria
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
       public       postgres    false    194    3    1            �	           0    0 A   FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer) IS 'Funcion que elimina una categoria y la relacion con archivo actualizando estado';
            public       postgres    false    275                       1255    42043 "   sp_eliminar_tags(integer, integer)    FUNCTION     X  CREATE FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer) RETURNS SETOF tags
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
       public       postgres    false    198    1    3            �	           0    0 <   FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer)    COMMENT     i   COMMENT ON FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer) IS 'Funcion que elimina un tag';
            public       postgres    false    273                       1255    66985 �   sp_insertar_archivo(integer, character varying, character varying, character varying, integer, text, text, integer, integer, character varying, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer) RETURNS void
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
       public       postgres    false    3    1            �	           0    0   FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer)    COMMENT     R  COMMENT ON FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer) IS 'Funcion que inserta un archivo y asigna estado dependiendo rol';
            public       postgres    false    285                       1255    66986 5   sp_insertar_archivo_autor(character varying, integer)    FUNCTION     *  CREATE FUNCTION sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer) RETURNS void
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
            public       postgres    false    286                       1255    66987 u   sp_insertar_autor(character varying, character varying, character varying, text, character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer) RETURNS void
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
            public       postgres    false    282                       1255    66988 :   sp_insertar_categoria(character varying, integer, integer)    FUNCTION       CREATE FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.categoria(
    categoria, precio, modified_by)
    VALUES(_categoria, _precio, _user_cambio);

END;

$$;
 q   DROP FUNCTION public.sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 c   FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer) IS 'Funcion que inserta una categoria';
            public       postgres    false    283                       1255    66989 D   sp_insertar_comentario(integer, integer, character varying, integer)    FUNCTION     F  CREATE FUNCTION sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer) RETURNS void
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
            public       postgres    false    284                       1255    66990 J   sp_insertar_ip_mac(integer, character varying, character varying, integer)    FUNCTION       CREATE FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.usuario
    SET ip=_ip, mac=_mac, modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 {   DROP FUNCTION public.sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer);
       public       postgres    false    1    3            �	           0    0 m   FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer) IS 'Funcion que inserta la IP/MAC cuando el usuario inicia session';
            public       postgres    false    287                        1255    66991 R   sp_insertar_subir_descargar(integer, integer, character varying, integer, integer)    FUNCTION     {  CREATE FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.subir_descargar(
    id_usuario, id_archivo, concepto, precio, modified_by)
    VALUES(_id_user, _id_archivo, _concepto, _precio, _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer);
       public       postgres    false    3    1            �	           0    0 �   FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer) IS 'Funcion que inserta la transaccion realizada sobre un archivo Upload/Download';
            public       postgres    false    288            !           1255    66992 ,   sp_insertar_tags(character varying, integer)    FUNCTION     �   CREATE FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer) RETURNS void
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.tags(
    tag, modified_by)
    VALUES(_tag, _user_cambio);

END;

$$;
 U   DROP FUNCTION public.sp_insertar_tags(_tag character varying, _user_cambio integer);
       public       postgres    false    1    3            �	           0    0 G   FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer)    COMMENT     t   COMMENT ON FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer) IS 'Funcion que inserta un tag';
            public       postgres    false    289            "           1255    66993 �   sp_insertar_usuario(character varying, character varying, bigint, character varying, character varying, character varying, character varying, integer)    FUNCTION     *  CREATE FUNCTION sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer) RETURNS void
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
            public       postgres    false    290            �            1255    25231 7   sp_loggin_usuario(character varying, character varying)    FUNCTION       CREATE FUNCTION sp_loggin_usuario(_user character varying, _password character varying) RETURNS SETOF usuario
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
       public       postgres    false    3    190    1            �	           0    0 P   FUNCTION sp_loggin_usuario(_user character varying, _password character varying)    COMMENT     �   COMMENT ON FUNCTION sp_loggin_usuario(_user character varying, _password character varying) IS 'Funcion que retorna los datos de usuario dependiendo user y clave';
            public       postgres    false    233                       1255    42053 D   sp_modificar_categoria(integer, character varying, integer, integer)    FUNCTION     C  CREATE FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer) RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.categoria
    SET categoria=_categoria, precio=_precio, modified_by = _user_cambio
    WHERE id_categoria = _id;

END;

$$;
    DROP FUNCTION public.sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer);
       public       postgres    false    3    1    194            �	           0    0 q   FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer) IS 'Funcion que modifica el precio de una categoria';
            public       postgres    false    274            �            1255    25377    sp_mostrar_archivo()    FUNCTION     �   CREATE FUNCTION sp_mostrar_archivo() RETURNS SETOF archivo
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
       public       postgres    false    192    3    1            �	           0    0    FUNCTION sp_mostrar_archivo()    COMMENT     V   COMMENT ON FUNCTION sp_mostrar_archivo() IS 'Funcion que retorna todos los archivos';
            public       postgres    false    251            �            1255    25528    sp_mostrar_archivos()    FUNCTION     [  CREATE FUNCTION sp_mostrar_archivos() RETURNS SETOF consultar_archivos_type
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
       public       postgres    false    3    701    1            �	           0    0    FUNCTION sp_mostrar_archivos()    COMMENT     �   COMMENT ON FUNCTION sp_mostrar_archivos() IS 'Funcion que retorna todos los archivos y la categoria dependiendo si estan aprobados (2)';
            public       postgres    false    255            �            1255    25372    sp_mostrar_autor()    FUNCTION     �   CREATE FUNCTION sp_mostrar_autor() RETURNS SETOF autor
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
       public       postgres    false    206    1    3            �	           0    0    FUNCTION sp_mostrar_autor()    COMMENT     S   COMMENT ON FUNCTION sp_mostrar_autor() IS 'Funcion que retorna todos los autores';
            public       postgres    false    249                        1255    25351    sp_mostrar_categoria()    FUNCTION     +  CREATE FUNCTION sp_mostrar_categoria() RETURNS SETOF categoria
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
            public       postgres    false    256            �            1255    25484    sp_mostrar_categoria_archivo()    FUNCTION     �   CREATE FUNCTION sp_mostrar_categoria_archivo() RETURNS SETOF categoria
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
       public       postgres    false    3    1    194            �	           0    0 '   FUNCTION sp_mostrar_categoria_archivo()    COMMENT     b   COMMENT ON FUNCTION sp_mostrar_categoria_archivo() IS 'Funcion que retorna todas las categorias';
            public       postgres    false    252            �            1259    25045    pais    TABLE     ~   CREATE TABLE pais (
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
       public       postgres    false    1    3    208            �	           0    0    FUNCTION sp_mostrar_pais()    COMMENT     Q   COMMENT ON FUNCTION sp_mostrar_pais() IS 'Funcion que retorna todos los paises';
            public       postgres    false    247            �            1255    25352    sp_mostrar_tags()    FUNCTION     �   CREATE FUNCTION sp_mostrar_tags() RETURNS SETOF tags
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
            public       postgres    false    248                       1255    33791    sp_reporte_archivos()    FUNCTION     �  CREATE FUNCTION sp_reporte_archivos() RETURNS SETOF reporte_archivos_type
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
       public       postgres    false    1    3    724            �	           0    0    FUNCTION sp_reporte_archivos()    COMMENT     |   COMMENT ON FUNCTION sp_reporte_archivos() IS 'Funcion que retorna los datos del archivo, con categoria, precio y username';
            public       postgres    false    262                       1255    33795    sp_reporte_autores()    FUNCTION     8  CREATE FUNCTION sp_reporte_autores() RETURNS SETOF reporte_autores_type
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
       public       postgres    false    3    727    1            �	           0    0    FUNCTION sp_reporte_autores()    COMMENT     i   COMMENT ON FUNCTION sp_reporte_autores() IS 'Funcion que retorna los datos del autor, con nacionalidad';
            public       postgres    false    263            #           1255    67011    sp_reporte_usuarios()    FUNCTION     �  CREATE FUNCTION sp_reporte_usuarios() RETURNS SETOF reporte_usuarios_type
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
       public       postgres    false    749    1    3            �	           0    0    FUNCTION sp_reporte_usuarios()    COMMENT     e   COMMENT ON FUNCTION sp_reporte_usuarios() IS 'Funcion que retorna los datos del usuario con el rol';
            public       postgres    false    291                       1255    25566    sp_ver_archivo(integer)    FUNCTION     �  CREATE FUNCTION sp_ver_archivo(_id_archivo integer) RETURNS SETOF ver_archivo_type
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
       public       postgres    false    712    3    1            �	           0    0 ,   FUNCTION sp_ver_archivo(_id_archivo integer)    COMMENT     �   COMMENT ON FUNCTION sp_ver_archivo(_id_archivo integer) IS 'Funcion que retorna los datos del archivo, con categoria, precio y autores';
            public       postgres    false    259                       1255    25589    sp_ver_archivo_autor(integer)    FUNCTION     �  CREATE FUNCTION sp_ver_archivo_autor(_id_autor integer) RETURNS SETOF ver_archivo_autor_type
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
       public       postgres    false    721    3    1            �	           0    0 0   FUNCTION sp_ver_archivo_autor(_id_autor integer)    COMMENT     x   COMMENT ON FUNCTION sp_ver_archivo_autor(_id_autor integer) IS 'Funcion que retorna los archivos asociados a un autor';
            public       postgres    false    264                       1255    25585    sp_ver_autor(integer)    FUNCTION     T  CREATE FUNCTION sp_ver_autor(_id_autor integer) RETURNS SETOF ver_autor_type
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
       public       postgres    false    3    1    718            �	           0    0 (   FUNCTION sp_ver_autor(_id_autor integer)    COMMENT     t   COMMENT ON FUNCTION sp_ver_autor(_id_autor integer) IS 'Funcion que retorna los datos del autor y la nacionalidad';
            public       postgres    false    261            �            1255    33808    f_log_auditoria()    FUNCTION     #  CREATE FUNCTION f_log_auditoria() RETURNS trigger
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
    	   seguridad       postgres    false    1    4            �	           0    0    FUNCTION f_log_auditoria()    COMMENT     �  COMMENT ON FUNCTION f_log_auditoria() IS '/**********************************************************************
FUNCTION: seguridad.f_log_auditoria()

DESCRIPCIÓN: Función que genera los logs de auditoria para la plataforma ultrack

PARAMETROS:
	
RETORNA: 

LENGUAJE: plpgsql

AUTOR: Ivan Monje

FECHA: 2015/07/04

************************************************************************/';
         	   seguridad       postgres    false    229                       1255    33830 �   field_audit(public.archivo, public.archivo, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION       CREATE FUNCTION field_audit(_data_new public.archivo, _data_old public.archivo, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    1    192    4    192            �            1259    25028    archivo_autor    TABLE     �   CREATE TABLE archivo_autor (
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
            public       postgres    false    204                       1255    42055 �   field_audit(public.archivo_autor, public.archivo_autor, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     <
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
    	   seguridad       postgres    false    204    4    1    204                       1255    42056 �   field_audit(public.autor, public.autor, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     4  CREATE FUNCTION field_audit(_data_new public.autor, _data_old public.autor, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    206    1    4    206            	           1255    33831 �   field_audit(public.categoria, public.categoria, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �	  CREATE FUNCTION field_audit(_data_new public.categoria, _data_old public.categoria, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    4    194    1    194            �            1259    25020 
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
            public       postgres    false    202                       1255    33832 �   field_audit(public.comentario, public.comentario, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �  CREATE FUNCTION field_audit(_data_new public.comentario, _data_old public.comentario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    1    4    202    202            �            1259    25012    subir_descargar    TABLE       CREATE TABLE subir_descargar (
    id_subir_descargar integer NOT NULL,
    id_usuario integer NOT NULL,
    id_archivo integer NOT NULL,
    concepto character varying(30) NOT NULL,
    precio integer,
    fecha timestamp(6) without time zone DEFAULT now(),
    modified_by integer
);
 #   DROP TABLE public.subir_descargar;
       public         postgres    false    3            �	           0    0    TABLE subir_descargar    COMMENT     �   COMMENT ON TABLE subir_descargar IS 'Tabla que contiene el historial de las transacciones sobre los archivos en el sistema (upload, download)';
            public       postgres    false    200            �	           0    0 )   COLUMN subir_descargar.id_subir_descargar    COMMENT     c   COMMENT ON COLUMN subir_descargar.id_subir_descargar IS 'representa el identificador de la tabla';
            public       postgres    false    200            �	           0    0 !   COLUMN subir_descargar.id_usuario    COMMENT     v   COMMENT ON COLUMN subir_descargar.id_usuario IS 'representa el identificador del user que subio/descargo el archivo';
            public       postgres    false    200            �	           0    0 !   COLUMN subir_descargar.id_archivo    COMMENT     }   COMMENT ON COLUMN subir_descargar.id_archivo IS 'representa el identificador del archivo que se subio/descargo del sistema';
            public       postgres    false    200            �	           0    0    COLUMN subir_descargar.concepto    COMMENT     l   COMMENT ON COLUMN subir_descargar.concepto IS 'representa el tipo de transaccion hecha (upload, download)';
            public       postgres    false    200            �	           0    0    COLUMN subir_descargar.precio    COMMENT     �   COMMENT ON COLUMN subir_descargar.precio IS 'representa el precio del archivo: upload siempre es 0 porque el archivo no ha sido moderado, download ya posee el precio asignado en la moderacion';
            public       postgres    false    200            �	           0    0    COLUMN subir_descargar.fecha    COMMENT     f   COMMENT ON COLUMN subir_descargar.fecha IS 'representa la fecha en que se subio/descargo el archivo';
            public       postgres    false    200            �	           0    0 "   COLUMN subir_descargar.modified_by    COMMENT     r   COMMENT ON COLUMN subir_descargar.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    200                       1255    42054 �   field_audit(public.subir_descargar, public.subir_descargar, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     _  CREATE FUNCTION field_audit(_data_new public.subir_descargar, _data_old public.subir_descargar, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    1    4    200    200                       1255    42057 �   field_audit(public.tags, public.tags, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �  CREATE FUNCTION field_audit(_data_new public.tags, _data_old public.tags, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    198    1    4    198            $           1255    33817 �   field_audit(public.usuario, public.usuario, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     x  CREATE FUNCTION field_audit(_data_new public.usuario, _data_old public.usuario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    190    4    1    190            �            1259    66940    control_formulario    TABLE     �   CREATE TABLE control_formulario (
    id_control_formualario bigint NOT NULL,
    id_formulario integer,
    componente text
);
 ,   DROP TABLE multi_idioma.control_formulario;
       multi_idioma         postgres    false    6            �	           0    0    TABLE control_formulario    COMMENT     j   COMMENT ON TABLE control_formulario IS 'Tabla que guarda todos los componentes que posee el formulario.';
            multi_idioma       postgres    false    223            �            1259    66938 -   control_formulario_id_control_formualario_seq    SEQUENCE     �   CREATE SEQUENCE control_formulario_id_control_formualario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE multi_idioma.control_formulario_id_control_formualario_seq;
       multi_idioma       postgres    false    223    6            �	           0    0 -   control_formulario_id_control_formualario_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE control_formulario_id_control_formualario_seq OWNED BY control_formulario.id_control_formualario;
            multi_idioma       postgres    false    222            �            1259    66951    control_idioma    TABLE     �   CREATE TABLE control_idioma (
    id_control_idioma bigint NOT NULL,
    id_control integer,
    id_idioma integer,
    texto text
);
 (   DROP TABLE multi_idioma.control_idioma;
       multi_idioma         postgres    false    6            �	           0    0    TABLE control_idioma    COMMENT     p   COMMENT ON TABLE control_idioma IS 'Tabla que guarda el texto del componente, dependiendo idioma y formulario';
            multi_idioma       postgres    false    225            �            1259    66949 $   control_idioma_id_control_idioma_seq    SEQUENCE     �   CREATE SEQUENCE control_idioma_id_control_idioma_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE multi_idioma.control_idioma_id_control_idioma_seq;
       multi_idioma       postgres    false    225    6            �	           0    0 $   control_idioma_id_control_idioma_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE control_idioma_id_control_idioma_seq OWNED BY control_idioma.id_control_idioma;
            multi_idioma       postgres    false    224            �            1259    66929    formularios    TABLE     Q   CREATE TABLE formularios (
    id_formulario bigint NOT NULL,
    nombre text
);
 %   DROP TABLE multi_idioma.formularios;
       multi_idioma         postgres    false    6            �	           0    0    TABLE formularios    COMMENT     \   COMMENT ON TABLE formularios IS 'Tabla que guarda los formularios que posee la aplicacion';
            multi_idioma       postgres    false    221            �            1259    66927    formularios_id_formulario_seq    SEQUENCE        CREATE SEQUENCE formularios_id_formulario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE multi_idioma.formularios_id_formulario_seq;
       multi_idioma       postgres    false    221    6            �	           0    0    formularios_id_formulario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE formularios_id_formulario_seq OWNED BY formularios.id_formulario;
            multi_idioma       postgres    false    220            �            1259    66960    idioma    TABLE     ^   CREATE TABLE idioma (
    id_idioma bigint NOT NULL,
    nombre text,
    terminacion text
);
     DROP TABLE multi_idioma.idioma;
       multi_idioma         postgres    false    6            �	           0    0    TABLE idioma    COMMENT     R   COMMENT ON TABLE idioma IS 'Tabla que guarda lo idiomas que posee la plataforma';
            multi_idioma       postgres    false    226            �            1259    25026 "   archivo_autor_id_archivo_autor_seq    SEQUENCE     �   CREATE SEQUENCE archivo_autor_id_archivo_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.archivo_autor_id_archivo_autor_seq;
       public       postgres    false    3    204            �	           0    0 "   archivo_autor_id_archivo_autor_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE archivo_autor_id_archivo_autor_seq OWNED BY archivo_autor.id_archivo_autor;
            public       postgres    false    203            �            1259    24975    archivo_id_archivo_seq    SEQUENCE     x   CREATE SEQUENCE archivo_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.archivo_id_archivo_seq;
       public       postgres    false    192    3            �	           0    0    archivo_id_archivo_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE archivo_id_archivo_seq OWNED BY archivo.id_archivo;
            public       postgres    false    191            �            1259    25034    autor_id_autor_seq    SEQUENCE     t   CREATE SEQUENCE autor_id_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.autor_id_autor_seq;
       public       postgres    false    206    3            �	           0    0    autor_id_autor_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE autor_id_autor_seq OWNED BY autor.id_autor;
            public       postgres    false    205            �            1259    24986    categoria_id_categoria_seq    SEQUENCE     |   CREATE SEQUENCE categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categoria_id_categoria_seq;
       public       postgres    false    194    3            �	           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE categoria_id_categoria_seq OWNED BY categoria.id_categoria;
            public       postgres    false    193            �            1259    25018    comentario_id_comentario_seq    SEQUENCE     ~   CREATE SEQUENCE comentario_id_comentario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.comentario_id_comentario_seq;
       public       postgres    false    3    202            �	           0    0    comentario_id_comentario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE comentario_id_comentario_seq OWNED BY comentario.id_comentario;
            public       postgres    false    201            �            1259    24996    estado    TABLE     |   CREATE TABLE estado (
    id_estado integer NOT NULL,
    estado character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.estado;
       public         postgres    false    3             
           0    0    TABLE estado    COMMENT     a   COMMENT ON TABLE estado IS 'Tabla que contiene el estado (aprobado, no aprobado) de un archivo';
            public       postgres    false    196            
           0    0    COLUMN estado.id_estado    COMMENT     Q   COMMENT ON COLUMN estado.id_estado IS 'representa el identificador de la tabla';
            public       postgres    false    196            
           0    0    COLUMN estado.estado    COMMENT     m   COMMENT ON COLUMN estado.estado IS 'representa el nombre del estado, por defecto 2 (aprobado, no aprobado)';
            public       postgres    false    196            
           0    0    COLUMN estado.modified_by    COMMENT     i   COMMENT ON COLUMN estado.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    196            �            1259    24994    estado_id_estado_seq    SEQUENCE     v   CREATE SEQUENCE estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.estado_id_estado_seq;
       public       postgres    false    196    3            
           0    0    estado_id_estado_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE estado_id_estado_seq OWNED BY estado.id_estado;
            public       postgres    false    195            �            1259    25043     nacionalidad_id_nacionalidad_seq    SEQUENCE     �   CREATE SEQUENCE nacionalidad_id_nacionalidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.nacionalidad_id_nacionalidad_seq;
       public       postgres    false    3    208            
           0    0     nacionalidad_id_nacionalidad_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE nacionalidad_id_nacionalidad_seq OWNED BY pais.id_nacionalidad;
            public       postgres    false    207            �            1259    24961    rol    TABLE     s   CREATE TABLE rol (
    id_rol integer NOT NULL,
    rol character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.rol;
       public         postgres    false    3            
           0    0 	   TABLE rol    COMMENT     F   COMMENT ON TABLE rol IS 'Tabla que contiene los roles en el sistema';
            public       postgres    false    188            
           0    0    COLUMN rol.id_rol    COMMENT     K   COMMENT ON COLUMN rol.id_rol IS 'representa el identificador de la tabla';
            public       postgres    false    188            
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
       public       postgres    false    3    188            

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
       public       postgres    false    3    198            
           0    0    tags_id_tags_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE tags_id_tags_seq OWNED BY tags.id_tags;
            public       postgres    false    197            �            1259    24967    usuario_id_usuario_seq    SEQUENCE     x   CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public       postgres    false    3    190            
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
    	   seguridad         postgres    false    4            
           0    0    TABLE auditoria    COMMENT     �   COMMENT ON TABLE auditoria IS 'Tabla que lleva el registro de tofdas las transacciones realziadas sobre las tablas de la base de datos.';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.id    COMMENT     :   COMMENT ON COLUMN auditoria.id IS 'Campo pk de la tabla';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.fecha    COMMENT     h   COMMENT ON COLUMN auditoria.fecha IS 'Almacena la fecha del momento en que se realzió la transaccion';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.nombre_tabla    COMMENT     ]   COMMENT ON COLUMN auditoria.nombre_tabla IS 'Almacena el nombre de la tabla que se altero.';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.nombre_schema    COMMENT     _   COMMENT ON COLUMN auditoria.nombre_schema IS 'Almacena el schema la cual pertenece la tabla.';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.pk_tabla    COMMENT     j   COMMENT ON COLUMN auditoria.pk_tabla IS 'Campo que lamacena la identifica del registró que se modifico';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.user_id    COMMENT     s   COMMENT ON COLUMN auditoria.user_id IS 'Id que identifica el usuario que generó el cambio desde la aplicación.';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.user_db    COMMENT     s   COMMENT ON COLUMN auditoria.user_db IS 'Almacena el usuario de la base de dtaos con el cual se generó el cambio';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.ip    COMMENT     X   COMMENT ON COLUMN auditoria.ip IS 'Captura la ip desde la cual se solicitó el cambio';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.mac    COMMENT     Y   COMMENT ON COLUMN auditoria.mac IS 'Almacena la mac desde la cual se generó el cambio';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.transaccion    COMMENT     a   COMMENT ON COLUMN auditoria.transaccion IS 'identifica el tipo de transacción que se realizó';
         	   seguridad       postgres    false    213            
           0    0    COLUMN auditoria.data_json    COMMENT     V   COMMENT ON COLUMN auditoria.data_json IS 'almacena el estado anterior de los datos.';
         	   seguridad       postgres    false    213            �            1259    25537    auditoria_id_seq    SEQUENCE     r   CREATE SEQUENCE auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE seguridad.auditoria_id_seq;
    	   seguridad       postgres    false    213    4            
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
       multi_idioma       postgres    false    222    223    223            �           2604    66954     control_idioma id_control_idioma    DEFAULT     �   ALTER TABLE ONLY control_idioma ALTER COLUMN id_control_idioma SET DEFAULT nextval('control_idioma_id_control_idioma_seq'::regclass);
 U   ALTER TABLE multi_idioma.control_idioma ALTER COLUMN id_control_idioma DROP DEFAULT;
       multi_idioma       postgres    false    224    225    225            �           2604    66932    formularios id_formulario    DEFAULT     x   ALTER TABLE ONLY formularios ALTER COLUMN id_formulario SET DEFAULT nextval('formularios_id_formulario_seq'::regclass);
 N   ALTER TABLE multi_idioma.formularios ALTER COLUMN id_formulario DROP DEFAULT;
       multi_idioma       postgres    false    220    221    221            �           2604    24980    archivo id_archivo    DEFAULT     j   ALTER TABLE ONLY archivo ALTER COLUMN id_archivo SET DEFAULT nextval('archivo_id_archivo_seq'::regclass);
 A   ALTER TABLE public.archivo ALTER COLUMN id_archivo DROP DEFAULT;
       public       postgres    false    192    191    192            �           2604    25031    archivo_autor id_archivo_autor    DEFAULT     �   ALTER TABLE ONLY archivo_autor ALTER COLUMN id_archivo_autor SET DEFAULT nextval('archivo_autor_id_archivo_autor_seq'::regclass);
 M   ALTER TABLE public.archivo_autor ALTER COLUMN id_archivo_autor DROP DEFAULT;
       public       postgres    false    204    203    204            �           2604    25039    autor id_autor    DEFAULT     b   ALTER TABLE ONLY autor ALTER COLUMN id_autor SET DEFAULT nextval('autor_id_autor_seq'::regclass);
 =   ALTER TABLE public.autor ALTER COLUMN id_autor DROP DEFAULT;
       public       postgres    false    205    206    206            �           2604    24991    categoria id_categoria    DEFAULT     r   ALTER TABLE ONLY categoria ALTER COLUMN id_categoria SET DEFAULT nextval('categoria_id_categoria_seq'::regclass);
 E   ALTER TABLE public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public       postgres    false    193    194    194            �           2604    25023    comentario id_comentario    DEFAULT     v   ALTER TABLE ONLY comentario ALTER COLUMN id_comentario SET DEFAULT nextval('comentario_id_comentario_seq'::regclass);
 G   ALTER TABLE public.comentario ALTER COLUMN id_comentario DROP DEFAULT;
       public       postgres    false    202    201    202            �           2604    24999    estado id_estado    DEFAULT     f   ALTER TABLE ONLY estado ALTER COLUMN id_estado SET DEFAULT nextval('estado_id_estado_seq'::regclass);
 ?   ALTER TABLE public.estado ALTER COLUMN id_estado DROP DEFAULT;
       public       postgres    false    195    196    196            �           2604    25048    pais id_nacionalidad    DEFAULT     v   ALTER TABLE ONLY pais ALTER COLUMN id_nacionalidad SET DEFAULT nextval('nacionalidad_id_nacionalidad_seq'::regclass);
 C   ALTER TABLE public.pais ALTER COLUMN id_nacionalidad DROP DEFAULT;
       public       postgres    false    208    207    208            �           2604    24964 
   rol id_rol    DEFAULT     Z   ALTER TABLE ONLY rol ALTER COLUMN id_rol SET DEFAULT nextval('rol_id_rol_seq'::regclass);
 9   ALTER TABLE public.rol ALTER COLUMN id_rol DROP DEFAULT;
       public       postgres    false    188    187    188            �           2604    25015 "   subir_descargar id_subir_descargar    DEFAULT     �   ALTER TABLE ONLY subir_descargar ALTER COLUMN id_subir_descargar SET DEFAULT nextval('subir_descargar_id_subir_descargar_seq'::regclass);
 Q   ALTER TABLE public.subir_descargar ALTER COLUMN id_subir_descargar DROP DEFAULT;
       public       postgres    false    200    199    200            �           2604    25007    tags id_tags    DEFAULT     ^   ALTER TABLE ONLY tags ALTER COLUMN id_tags SET DEFAULT nextval('tags_id_tags_seq'::regclass);
 ;   ALTER TABLE public.tags ALTER COLUMN id_tags DROP DEFAULT;
       public       postgres    false    197    198    198            �           2604    24972    usuario id_usuario    DEFAULT     j   ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    190    189    190            �           2604    25542    auditoria id    DEFAULT     ^   ALTER TABLE ONLY auditoria ALTER COLUMN id SET DEFAULT nextval('auditoria_id_seq'::regclass);
 >   ALTER TABLE seguridad.auditoria ALTER COLUMN id DROP DEFAULT;
    	   seguridad       postgres    false    213    212    213            k	          0    66940    control_formulario 
   TABLE DATA               X   COPY control_formulario (id_control_formualario, id_formulario, componente) FROM stdin;
    multi_idioma       postgres    false    223   ��      
           0    0 -   control_formulario_id_control_formualario_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('control_formulario_id_control_formualario_seq', 1, false);
            multi_idioma       postgres    false    222            m	          0    66951    control_idioma 
   TABLE DATA               R   COPY control_idioma (id_control_idioma, id_control, id_idioma, texto) FROM stdin;
    multi_idioma       postgres    false    225   �      
           0    0 $   control_idioma_id_control_idioma_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('control_idioma_id_control_idioma_seq', 1, false);
            multi_idioma       postgres    false    224            i	          0    66929    formularios 
   TABLE DATA               5   COPY formularios (id_formulario, nombre) FROM stdin;
    multi_idioma       postgres    false    221   2�      
           0    0    formularios_id_formulario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('formularios_id_formulario_seq', 1, false);
            multi_idioma       postgres    false    220            n	          0    66960    idioma 
   TABLE DATA               9   COPY idioma (id_idioma, nombre, terminacion) FROM stdin;
    multi_idioma       postgres    false    226   O�      U	          0    24977    archivo 
   TABLE DATA               �   COPY archivo (id_archivo, nombre, anio, sinopsis, num_pag, imagen_portada, url, id_usuario, id_estado, id_categoria, tags, id_moderador, estado_mod, modified_by) FROM stdin;
    public       postgres    false    192   l�      a	          0    25028    archivo_autor 
   TABLE DATA               U   COPY archivo_autor (id_archivo_autor, id_autor, id_archivo, modified_by) FROM stdin;
    public       postgres    false    204   �      
           0    0 "   archivo_autor_id_archivo_autor_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('archivo_autor_id_archivo_autor_seq', 79, true);
            public       postgres    false    203            
           0    0    archivo_id_archivo_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('archivo_id_archivo_seq', 43, true);
            public       postgres    false    191            c	          0    25036    autor 
   TABLE DATA               {   COPY autor (id_autor, nombre, fecha_nacimiento, fecha_muerte, foto, descripcion, id_nacionalidad, modified_by) FROM stdin;
    public       postgres    false    206   ��       
           0    0    autor_id_autor_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('autor_id_autor_seq', 17, true);
            public       postgres    false    205            W	          0    24988 	   categoria 
   TABLE DATA               J   COPY categoria (id_categoria, categoria, precio, modified_by) FROM stdin;
    public       postgres    false    194   ��      !
           0    0    categoria_id_categoria_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('categoria_id_categoria_seq', 40, true);
            public       postgres    false    193            _	          0    25020 
   comentario 
   TABLE DATA               d   COPY comentario (id_comentario, id_usuario, id_archivo, comentario, fecha, modified_by) FROM stdin;
    public       postgres    false    202   Ċ      "
           0    0    comentario_id_comentario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('comentario_id_comentario_seq', 25, true);
            public       postgres    false    201            Y	          0    24996    estado 
   TABLE DATA               9   COPY estado (id_estado, estado, modified_by) FROM stdin;
    public       postgres    false    196   Ό      #
           0    0    estado_id_estado_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('estado_id_estado_seq', 2, true);
            public       postgres    false    195            $
           0    0     nacionalidad_id_nacionalidad_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('nacionalidad_id_nacionalidad_seq', 68, true);
            public       postgres    false    207            e	          0    25045    pais 
   TABLE DATA               ;   COPY pais (id_nacionalidad, pais, modified_by) FROM stdin;
    public       postgres    false    208    �      Q	          0    24961    rol 
   TABLE DATA               0   COPY rol (id_rol, rol, modified_by) FROM stdin;
    public       postgres    false    188   3�      %
           0    0    rol_id_rol_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('rol_id_rol_seq', 3, true);
            public       postgres    false    187            ]	          0    25012    subir_descargar 
   TABLE DATA               t   COPY subir_descargar (id_subir_descargar, id_usuario, id_archivo, concepto, precio, fecha, modified_by) FROM stdin;
    public       postgres    false    200   u�      &
           0    0 &   subir_descargar_id_subir_descargar_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('subir_descargar_id_subir_descargar_seq', 44, true);
            public       postgres    false    199            [	          0    25004    tags 
   TABLE DATA               2   COPY tags (id_tags, tag, modified_by) FROM stdin;
    public       postgres    false    198   �      '
           0    0    tags_id_tags_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('tags_id_tags_seq', 37, true);
            public       postgres    false    197            S	          0    24969    usuario 
   TABLE DATA               �   COPY usuario (id_usuario, nombre, apellido, documento, telefono, correo, usuario, clave, dinero, id_rol, ip, mac, modified_by, control_sessiones) FROM stdin;
    public       postgres    false    190   �      (
           0    0    usuario_id_usuario_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('usuario_id_usuario_seq', 18, true);
            public       postgres    false    189            g	          0    25539 	   auditoria 
   TABLE DATA               �   COPY auditoria (id, fecha, nombre_tabla, nombre_schema, pk_tabla, user_id, user_db, ip, mac, transaccion, data_json) FROM stdin;
 	   seguridad       postgres    false    213   ��      )
           0    0    auditoria_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auditoria_id_seq', 428, true);
         	   seguridad       postgres    false    212            �           2606    66948 (   control_formulario PK_control_formulario 
   CONSTRAINT     u   ALTER TABLE ONLY control_formulario
    ADD CONSTRAINT "PK_control_formulario" PRIMARY KEY (id_control_formualario);
 Z   ALTER TABLE ONLY multi_idioma.control_formulario DROP CONSTRAINT "PK_control_formulario";
       multi_idioma         postgres    false    223    223            �           2606    66959     control_idioma PK_control_idioma 
   CONSTRAINT     h   ALTER TABLE ONLY control_idioma
    ADD CONSTRAINT "PK_control_idioma" PRIMARY KEY (id_control_idioma);
 R   ALTER TABLE ONLY multi_idioma.control_idioma DROP CONSTRAINT "PK_control_idioma";
       multi_idioma         postgres    false    225    225            �           2606    66937    formularios formularios_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY formularios
    ADD CONSTRAINT formularios_pkey PRIMARY KEY (id_formulario);
 L   ALTER TABLE ONLY multi_idioma.formularios DROP CONSTRAINT formularios_pkey;
       multi_idioma         postgres    false    221    221            �           2606    66967    idioma idioma_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY idioma
    ADD CONSTRAINT idioma_pkey PRIMARY KEY (id_idioma);
 B   ALTER TABLE ONLY multi_idioma.idioma DROP CONSTRAINT idioma_pkey;
       multi_idioma         postgres    false    226    226            �           2606    24985    archivo PK_id_archivo 
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
       public       postgres    false    229    192            �           2620    33828 %   archivo_autor tg_public_archivo_autor    TRIGGER     �   CREATE TRIGGER tg_public_archivo_autor AFTER INSERT OR DELETE OR UPDATE ON archivo_autor FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 >   DROP TRIGGER tg_public_archivo_autor ON public.archivo_autor;
       public       postgres    false    229    204            �           2620    33827    autor tg_public_autor    TRIGGER     �   CREATE TRIGGER tg_public_autor AFTER INSERT OR DELETE OR UPDATE ON autor FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 .   DROP TRIGGER tg_public_autor ON public.autor;
       public       postgres    false    229    206            �           2620    33826    categoria tg_public_categoria    TRIGGER     �   CREATE TRIGGER tg_public_categoria AFTER INSERT OR DELETE OR UPDATE ON categoria FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 6   DROP TRIGGER tg_public_categoria ON public.categoria;
       public       postgres    false    194    229            �           2620    33825    comentario tg_public_comentario    TRIGGER     �   CREATE TRIGGER tg_public_comentario AFTER INSERT OR DELETE OR UPDATE ON comentario FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 8   DROP TRIGGER tg_public_comentario ON public.comentario;
       public       postgres    false    202    229            �           2620    33824    estado tg_public_estado    TRIGGER     �   CREATE TRIGGER tg_public_estado AFTER INSERT OR DELETE OR UPDATE ON estado FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 0   DROP TRIGGER tg_public_estado ON public.estado;
       public       postgres    false    229    196            �           2620    33823    pais tg_public_pais    TRIGGER     �   CREATE TRIGGER tg_public_pais AFTER INSERT OR DELETE OR UPDATE ON pais FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 ,   DROP TRIGGER tg_public_pais ON public.pais;
       public       postgres    false    229    208            �           2620    33822    rol tg_public_rol    TRIGGER     �   CREATE TRIGGER tg_public_rol AFTER INSERT OR DELETE OR UPDATE ON rol FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 *   DROP TRIGGER tg_public_rol ON public.rol;
       public       postgres    false    229    188            �           2620    33821 )   subir_descargar tg_public_subir_descargar    TRIGGER     �   CREATE TRIGGER tg_public_subir_descargar AFTER INSERT OR DELETE OR UPDATE ON subir_descargar FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 B   DROP TRIGGER tg_public_subir_descargar ON public.subir_descargar;
       public       postgres    false    229    200            �           2620    33820    tags tg_public_tags    TRIGGER     �   CREATE TRIGGER tg_public_tags AFTER INSERT OR DELETE OR UPDATE ON tags FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 ,   DROP TRIGGER tg_public_tags ON public.tags;
       public       postgres    false    198    229            �           2620    33814    usuario tg_public_usuario    TRIGGER     �   CREATE TRIGGER tg_public_usuario AFTER INSERT OR DELETE OR UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 2   DROP TRIGGER tg_public_usuario ON public.usuario;
       public       postgres    false    190    229            �           2606    66973 $   control_idioma FK_control_formulario    FK CONSTRAINT     �   ALTER TABLE ONLY control_idioma
    ADD CONSTRAINT "FK_control_formulario" FOREIGN KEY (id_control) REFERENCES control_formulario(id_control_formualario) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY multi_idioma.control_idioma DROP CONSTRAINT "FK_control_formulario";
       multi_idioma       postgres    false    223    225    2235            �           2606    66968 #   control_formulario FK_id_formulario    FK CONSTRAINT     �   ALTER TABLE ONLY control_formulario
    ADD CONSTRAINT "FK_id_formulario" FOREIGN KEY (id_formulario) REFERENCES formularios(id_formulario) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY multi_idioma.control_formulario DROP CONSTRAINT "FK_id_formulario";
       multi_idioma       postgres    false    221    223    2233            �           2606    66978    control_idioma FK_idioma    FK CONSTRAINT     u   ALTER TABLE ONLY control_idioma
    ADD CONSTRAINT "FK_idioma" FOREIGN KEY (id_idioma) REFERENCES idioma(id_idioma);
 J   ALTER TABLE ONLY multi_idioma.control_idioma DROP CONSTRAINT "FK_idioma";
       multi_idioma       postgres    false    225    2239    226            �           2606    25438    archivo_autor FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    204    192    2213            �           2606    25453    comentario FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    202    192    2213            �           2606    25463    subir_descargar FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    200    2213    192            �           2606    25433    archivo_autor FK_id_autor    FK CONSTRAINT     �   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "FK_id_autor" FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "FK_id_autor";
       public       postgres    false    2227    204    206            �           2606    25423    archivo FK_id_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_categoria" FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_categoria";
       public       postgres    false    2215    194    192            �           2606    25418    archivo FK_id_estado    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_estado" FOREIGN KEY (id_estado) REFERENCES estado(id_estado) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_estado";
       public       postgres    false    192    196    2217            �           2606    25428    archivo FK_id_moderador    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_moderador" FOREIGN KEY (id_moderador) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_moderador";
       public       postgres    false    2211    190    192            �           2606    25443    autor FK_id_nacionalidad    FK CONSTRAINT     �   ALTER TABLE ONLY autor
    ADD CONSTRAINT "FK_id_nacionalidad" FOREIGN KEY (id_nacionalidad) REFERENCES pais(id_nacionalidad) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.autor DROP CONSTRAINT "FK_id_nacionalidad";
       public       postgres    false    208    2229    206            �           2606    25468    usuario FK_id_rol    FK CONSTRAINT     �   ALTER TABLE ONLY usuario
    ADD CONSTRAINT "FK_id_rol" FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "FK_id_rol";
       public       postgres    false    2209    190    188            �           2606    25413    archivo FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    192    2211    190            �           2606    25448    comentario FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    202    190    2211            �           2606    25458    subir_descargar FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    2211    190    200            k	      x������ � �      m	      x������ � �      i	      x������ � �      n	      x������ � �      U	   �  x��UMs�0=� ���1�L;�$m9z&����ȕ�;�C{W��K�x��}zz+����$���|�0`�$>Ku���/~n���m�������N�8I2=�p�?��h�̳�����F4�؋�����(�Z�_���,���g�w�j;��R"��!1=����,�����jEaj�?WJ�5W�݉7�Q�r��M�?�z�hv����� /A�ҟ]Q� U�v=!L+!v�c*Ԧ*�c�A�;��
�1zi�F&�{�
agz�!��}b,M�h�K֪�nƈ1���h}��'��������08`��!�u���*�����J�a�+d���;Ȓ+,��(^Ħ^ftz�� ��������*�e�tӇ}���I!��m!��g��ܢ9��	h��UI���}E!d3�g9T���5��p$$�e,�1	J-�Q<4'�[�C�a,�����P-�7��=�<�rw�@��&�cd���3Oɹ20(���K�l����� �2��mb��$�Kn&g�5.:tj��Ǖ��:�&�wb������%]����2P�|��ئ��w�,��	(��BO���=��� �?���e+�k%�R�!O��� �
q��j�g�A��|�b�L�_��('�I�;Ɣ,��Cm�]�V����o7      a	   s   x�5���0D�o(�	�<l�
�w��8�x�M�bS�GmIn1���${?4�Nv^+:ZTd��\�'7���T`4l�978�8x�9l��!p�X�3��1�'�"~^��T���($      c	   �  x��TKn�0]S��,A�?���/M�^fa �IFa*sRJ�.z����e�i]�
��xd��y�����H^0Q�U*D�׬�E��3|ط��r+�L��-�<e��c�0$ey��k�:h
�C?�f�)[�$s��H���������g���j�\�E��LK
��\��x^�v�p~?>8n��3��g�q�L�-k��ie�;��@��x��w\Y㔕��*e�e���,؅�xkZ~!=��$��`�b��>M�qID��<7F1�#�ݬ�e�P�
���Z�߂S�5V����oq�Հ���[<�f2R`��	W�q�6<�FGw�3ނ�$�ha���A��;.�@��X�Xt���ؘ��HZɮ�7�_6�7Z{�>C�򖊳����i�L�h���%�)(�����_*�l��?5!�-N�`�i����X&�I6
�����!��KL�<ئ~{��հi-�Gu��}�f�
$�BflF\Tl��-�<��z��<:�Ն5�� G�H�ҫ��u�u{mĐ!�T�ػ��Y�M�����wq�w��D����(+�����'g@���B:����[�b�"^P��%[g�g;HgA>�j���f+�����!mPv��Y�^� mFN��2��(�!���	=��6S$"g63�%Z��P&�y�e�0�;bƭ����*��]�S�L$�`j���`�Gt\�+;.�S9�͟��Z��6���1�Ή4�,�u]$�,I��w�JG      W	     x�=P�N�0<o�"_��s�UK�J������F+R�@��Y;��g�;;;=���3�lMI�	�P�\���)ꬂj3�z�1�J�L'2s��<�`�a\�^���W��Ml[N�-�T�� /h".<�D^���ze���.%e�����}��5z��Ml�smVN��}��S�'�߹ɦj�7ZxN��!15<�@��	T��\��AC�g��)5��-�{Z8�b���r�*Z�kk$�4�	��Xie Ž�'	��2�t0��5,VK)�<E�lv       _	   �  x�}S�n�0<S_�����V=��(z̅�hD�#�]���.� v���4��ٙ����2��4T�y��e��~������#�'�^��Γx~�P�"����I�d�"k<��'Qr[�r���2���O�9����>aP!X����˷�,�=�rw�C�&DMXn���M�M�5�%�
��F�41�}��}����p���c@��f����w��u����ۿ�*���(��XhŢp��<��7CY+&�,*��� ZxQ5��f�ϽlF�޻El�U��\
�AZܶ�1OY��yھ?�<�c�u�%g���'��8��M���y ؘ�1*`4oJ��ӈi������d(�x=.`Ӝ6��ӗO��>|��t�G�#�NF�"�c!X��b�K=�w,r'�:ьk,�OwЌeߏ���ZJ�x;r�lǫ�m��#7>hXŊ�"4����E1�Q�Q�w*F�9�:�U�xר����1��-]�����U�u�#��      Y	   "   x�3�L,(�/KL����2���W@����� ΰ
M      e	   #  x�E��r� ����t,	!�h;N�L��$q�\�U���"H��U��/�`���o-�E�j9:���P�H����Ń��}/]�1�B;�V�𣳨��B�P��(�=,-�RM���38�9��>B��R���I�k�VF��!��QW�)��9]�sX�C�5�P�#��j�F��Ѧ���֝���P�փ<9 �������]�z<῿�e�KbG�1�kI�`d�Ѥ��4�Dn��'�)����B�'�u���;T"�,�pgEr�9�yt4(��{�N]½�"F#ҽ�񾲂��c
ĉE����6��w�ѢC+[ظ���d�ΰ���K�
x��
V£���1x��_�U�D��L'�֋.����$��li�϶�5tt�8���}�FV9�p|�� ������>H;Z��QUY�Wv^Xg��
�T5<��?(�&�1G�I�w����<��%J��9����xN ��.��5g^N�;>D����_>�*�w��s�[.���&���".o�M
G�O��m6���I�      Q	   2   x�3�tL����,.)JL�/���2���OI�s�9C�K�2�A�=... ��g      ]	   �  x�}��n1Ek�W����D�N�Ν.�8�ߤ�@b��v�=އ�ux�����
�4ԃyG�(S�!����-� ��c'��S��w+5� (���e�LM�-u>��+�Q=.���b`�/׉8�#��+�\��&yK�A�ӭ��+��TQ"�<����y�����6��-�y�����ܖU�"�#�b�������Ѽ�b��4������g�ߑ>�Y�>HV8i�1�(o���X�U����ga����U���!98lI�b0j?�ܛ���"jtz�In�V*k����nYCv��;EJ'�o2˦e�����'��mxH#�o&�R�Mc�5�>
�����	�IDE�"�ې-���Qqp��FMJGx��=�m�>s��e      [	   �   x�=��N�0���S�	I�n;�;��e^q�bp�J�=�a��/����Gޫ�nSy�K=~[�a������F�3�XR9j`��#i�9��	�y.`##E�KX���F���*6���R`��s�lvnXZ���6W��e{4�D�t�<�~P��7�&���9�ҧh��p�!��,�9���L'�{_�B�(-����lcQ�Ҁ��k��6q?؀JW������Th�      S	   w  x�u��N�0E׷_� ?�<vV �H,P7��ЂCB�=c�)��;�����f2ܓ�����,��Zf;��O���'�5������mZ��.�ay��%���������k4�Bo�`�͖P�%ga]7��s�R��,��:�!1P���JgU9B���8A��J�x�F��yI��E�=���Ž6�ɟ)O��y��˛�α��|��5�Y
�#����?�
D�TG���
�Ա}w��.@~[��ի��)5~�B�2��U�G��Mg{<�_u�2VZ�E!�(F�|��k�R�Ye��&����4�sf������H��!�^ڽ;�c�<�.�l�#��mʽ���ɵ�<�1<
F��h"qy�X,� q��E      g	      x��=�r����W��w�]Osj���l���n��T�[�(��ٞ�S[�߾$[�n����(��R�� n@x��5��`��-P/��+�{����e�]�o_>m�7o��?���~z�ۮ��������?}����[>�6��m�q��rھ�Z\��l��ӻ�W��/�_����g�����H�� ^Yfܓqh������X�~��y�0x��?mW��m������j�Am�j��{u[߼ܯ�� y�u�W������1�\H)�R��7�v�:�t��n������޿�c�B���f�����/���X?���?���g��m��?�����sO뇫��_�t���O�;�s�r����Z�G��ǿ����������#Ï��²��������e��-y��������������m����n����x�B�i����'�_A�+�*���v&���L/��LJ2O��L�n���w�nB�fiZh��<>�̔f�B��^X=������u��r����DQa����a1�y|�|^��������m�s;X��m�M�WǏ��V�� S�y������㫽D�e��*���vus�c#kbR-$V����`���D�KQ�f+.�?N0z{� �'s&	x��}Y}Z�"�ޡ5�Q��36�'r����rǊ,��{џ{k�Ʈ��NGƈ�@r�N�{�`鮃�������#<�[:��p�.��]���V(s��1�NR�r`&;i-��v&��J2J����]�S��9yG�U�4E\,T�pfq�zl{�)�bG71��7�[���+n�&t��:Y;�U�-E\:y�4SBLܬo�ŰЇ��5���ퟲ�0@������f����3�JY�],�y?�'��P+��1�]��`J���~�}���R���MOY��R����ʂz&�.r�#�?ѵ��x��3���ιb�����0�JaoG�N-V\X���KydW]�-+h�E�mJ��"��7�Z�oSҩ�O��n���2����nc�,���һ���[���������	��%���e�(�vu�1&oZ{��[/YRi�pђ%������Ĝ�%2��'�����������e?b<��+���9S�/[�Tq��cCq�7uV��qL�������q#.]8�9^th�mo�&Ye8���m�`1���.Z�
�x�B����q�!{����<F\8-��:]T��qA�.��0��f��x+��RL��i�Wex�l699U�v?�����"��f��`abĹ����t���qKG<,e�h�"A�;�)*xH�h�"����ɉ����)8�K&ÿD����a�18C��M�58"�x�&"���k3�������H�L���O�TovK0���!�����v�y�����(��~w�8��>�0�<����b�u��=���谗1�BVϤ����?�k}̡����~�=�qZ�b&�>(ʽ�w�d%���3�wu��΋S����w���F���N�ݵ+�uw]�+��Z�[M��9�n-�Y��(�W^OC���Z���*R4(���03L2�a69��s�Y�%�?����9b)G��	_}�&m�&��c9�*��Q1���^>��oWO7���r[�@L��p�nV�m�����?6��6YI0�zG�{O�X�4s�!y�4�S����z����CGR��1�_��]?>��ZД�]U��r��qyײ����˻����z���m������ޮ���������GY}y�jy���o�遆��<s���]�ؿտ�6��?�<5���������7�^m�mB��W0)�p�۵M�/�u�� i�]m'y�K���(�IJ�������N����.��ǜ&��D��A��]p[�E.2��_3RT�R`|6�s�*���%���0�Ce@4q#�x�Dt�]wc%{L~�֏��,o���g�g�������/+��:��j���$����i��uL���6�ַ�����v�p��fX=>u��v����C�^#_��z�=�nVW˫�{��������Y����r�@=���ҹ�˶�4=A���0r_���&S�	�
UW���^u��L�>a���
��{�+5�<}VKW���Kc���Y���>�/*�,7�ӕ�)�\t�{b;M�A4���6�l�I)#���a�)�E�y�R/ *��RK}��}��u�i<�;S�I���3�Su��*�7V�E9&C���K]?�ɨ����{p�U9��� 7ޓ-Ľ��j������^�e,4�������MyQ�\��+5UM�	�}^ͫ  ��/<:��:t��)���l����s��=�D��K��θ�i�gj�9_��Pi+�Y��bt��Gj�)�'�뷆Z�9���NM�X��N%2���[C�6׾	���4�xk��<t�-�L@�ȷrD{�t3D����P�Q��ڽK���*�u>=�گ\7+�Z����c���q��֧[kX�"�$��}� �b'�=D���n'	��s?~j����_��KB�/��}�����k���h��)�A�~�h�V3r�7Fe�z֓��:J��J�%�,؞�(�{��ӓ�j�z�/qv��U����@�P?I���JYk1HʋL~��H�P�y&�2����z'C2c�c3��~Z5V)i� ��oҞ-�n�oi3�9S��YLA���If������ʧ枮���_^�3�6��[K}��(P���}�7h�$&u_��/��Ûzyg�ێ6�xS��=�c��5Iiy�������oW�^V��js��`�3�|�O��M����A=+�)��I��4gzs����8✣���b�-�a��Xq&�b2��C}�	�sMa��K��_����6U� �+)��q$NJ�B��Č��{M���}*s|7� e%L��oB���)�ϒ��J��$��ab(&��X��+��0�����d[# ӑq���!X���vtf�ǅ;�j����2P����Z	�� k�MDm�8�?�Ṩ��tQ�.�����nf�.n)d����ѕ�M2S��K�bB��
�a'�iJA�N�!ff�\��0	Blhl����E�f�΃���v0J��*�:i9h�.b) b
������@J�-Š�9�~�u	�1!�E8 :S�si��fۆ	eX9�m3#�F���w���2����� BÚV��7�@Ǡ"IU����:�hǸ�W�~|�T`2S[�P�r��͜�)vt?�P]�2f����m�'
j�����O��Pɚh���'�Ǭ���{��#������v��N����[� ����D�4d&��%1��+��2KҏD�]ҼB�!������@���K&97�Z,:�h*V��A���͠UPĤ5u�<3~�@�S�ϣ��h��iz��Wn�K��FF�@� \��
�[Tw�
�U�Wd�DQ�0B��{�:�|��睉�t;_�f8'��jG�#S
�clc�]4Ñ������� ax�F4�ġS. �$d�eFG�p8R�z�z2㗍���@9sB�yfxڠ
p@�Ư�`�������"�֕��0�������D�T¹z���_sMq+�~E,ӧ���mld���q�f��罟�������b`s�'�.�[���a��sA��63v˥�B�����+�=�y�-r��|�[�V�;��JX)N�z��'�FĆ�yg�������{Vtl	�NgI�V��!��=E*�1�c�8R*A�H��#�H�
$�~aܕh/�O��e_�Ay
-�b�`~zRt��Ʒj�є.���⒜�p����^m�#��)�?�.�z���
�5<a�E^p��!��lf�f{�zʡCAc���|��|�=L�NWl�PT����%�7��
B�9�lE�X�4/��T�����v�QR�wa8K�G�ހux%��^=e)��_ɴ��e�j@%�������y{>�{���y�y՛Y����V\�]�8���I�p��8P��)�[:Cr��D?������mh���&���_S[�޻C��aý`�2� ��.͒    KS |m�ҙx�B[�(!�̍'�4$uL �J	��c~�+a(!�O�sZl�e���9]<�'�-~z�u9�gSO񼮧�~��h`W�2|��.�8v`%�����v}�h��MKX0��.��6) ���{�hwH��й]��nh��,%�%)�N�L�DKvpg���&g��]���欣�1���6�l�j��]_UG+�)��-I���]�+� ����Fj`U�y���
e�t�B�9`������j��̅%��z�?��6\�9y�Y���R��^��_=���ɓ�^$�Fe��/�MU�w'�U ;}�B7^䅄�l���̓�#F��^�m�h�Һ9:�Y��93@1Ѧ�8�o�&��q*�����1��YY1�a8���]��c��'���\�oaPdȃ�9��O�k�Pf�k�v�'�GF뱡���FVh]�=�]�m�Լ���P���i3&ljyl��t�jϕoT�����aj}�_�T�e���z���9����j�N����5TJc5�i���XuqV�P�K�u�4��&� }�4��4E�`���S��<E��î���]�R5�Hq\ ����۫ˏ!��cH�?b1Ԫ�݌qc����&�����Y��C��Ԟ�Fx��Qz2�ǍEM�I`G�(=iG���OԀ�`��)�܇���q�>��]Mj��5��B_५��ш�����`����Ӕ�9�.�H?��(Q����%�S��󗟿�7��[K͌G�TZ��}�e��R���̦7YGR�h~�َ�G�`�)����s�f��=;�����f��1��1R�PM�Bȟ׶�C;2;�ѹ�uj�H%�������Oi�	�������H�H�+��z1O����Q��Ec������IONb�c1\V�XiF��L�"���8`�Cp0d2	ò�����q�����p�2��x��N]�̝�#�K�}DF�"Z���b��j*�,�lL@>Q�`F�ܮ>'w�.�Q�pG[9��U�E=h�j;�V�=�6-y����^VRJl���h�*�R���u{Z�j.EiK��f�����_��~;��@՛�()|�fq?UW�ѹ�M�Q_�:��B�����9��T�R.�t+pHG'��:J܍=7E�z^6s�q[ڝ�@U�]�3ao[�&7%IBI��$D�6�r��UD���$�#�EL:�]۶�`D���X��㙔����������I^�9�"R��ue*3�]$oB�F��S�"���hߘ��8bSd�1� ��M��f�1Ҹ�.`�Z,KjW� �j;�ә'g���U����U��Jq��3	/D»����@�1R~I�ɩ=�_�J7`u31bN�p�Ih����_$��D��-��,�RI�ہH�1D�\""3j�֮�~6W~;I�u��\!i{���	��-�Nq@eԷ��ኇ,HE@J�S� gQ�'o`{Ё�,p�������P���:/���F{��(�f��r3ў6�r��++��_8�$���t����o�v�]1�����>�ϸ���o=�4>��:��������xl��7�
v�'v�S�.��EW*?*�A���͌Y��z�+��Y,�բ��L(�7�o�kH�(P�52_�>1���䏁�Ƨ1=O�;�������F�;�:���o�����Ǉ�N�כ����y}����r�u��~����ɧ/�N��`-��x�&�թs)��qF���&M���+�A�bI
t6I��\5��P I
L�%)Pd�;�� �0�O�I���uYw`yw �UI���:��Bl�lM�B	6Su6�ϔ� W���q�6<��x�P��0���e$�qfd"��AEr�R��q�v�]�4f�����Mm#/�;����M2��w���.Wf��+��w����#�p��&�L�ܽ�]S��Kq:��y-�!����>�B^}L�OM���B�/0c/֣��vǮ�+�Xo��kqGQ�&\�[YeGc�z�j+�������(d*(sb��9��d��ĘLۑ1Y��sM�8\�����e��n߯�au�Po����(PQo���.��=Ze�y��O��9�4[��<��e�8;!"I�(#$r! N�E��"���2B"o�!D3��=�D��h�2J"�'P�h,���Y(�iJ
wI�5�hgeF��O��'f�93��m�{�Ҷ�r�ZP�ǽ�\��IF�Z�Iu\��;p�P��IYf���f݇���^���R)����H�63��9��ا:��H�CŹ|�����^�AV7��տ�o����]�ȑo��raϮ��#���#�=�	ё��B��|�L�PLՅ���Hr�*�Q(�>h+Z�ob~��ӕ�bf� MF���-*�ԑ�Z��`
���T�u�(� �B�i�n �� �ð}�>)H���WI.0A�槅�G���s:AW�M4�i
� r�_	}�@_LG?��_	}�@�NG?r�_	}�6�ȳ|%�u
��\ �Ae��\&�S)"f�e�N-�ȯ
cҔ��ZZy-�Z�V��g_�D��lm*j�fkI̒5���es;6R)��&��~vc
&�53}�a%<����/b�~Q��|0�fN�9)?�[�2���(0ԟ�W�{&�oe�*��a��"e=o5�NeN�M�����S,����n�'�/��]��O�:f�fւ�};i�⿬?m��.^����?s5��I�PR�N��uL�j�l
Y�R@��^5�>��$
t�.���'��`w$(���
�t�.���%�҄oC���lu�b2ٿ�t̙�"���Y�l
7c0�e����"ra\
�i��\�d�χɠ۲1�1���R2�vnc�w�R�e�{��,Y7iWJ�Ɏe�]��Ii1���~�z�T1Y&��*��[�Ǡ�S�d�F��o�J����r)�>�#G���r,ٷ�RD�bX�#w8�vC��@((mv��?��V�!���H�h8tv!u��19E@�Gq?�E���dޚ�
�&:\c9OU�㩋�
�_t@5�n�=�W�8���~����RW����4@%���KuicoM���TA30����G ښ}�*?��k߁"�mq#��5�� S�M*Q`iyN�jQ�LAi�/��_H
ԄiiL��[�9(
������>��n��S�6�M����c�QU��N̊z����~�K�$�E�Ĩs��R�t�
K��k��+�S����O&�}S�*��Z�����NK?��L�@�O\?�΅QG��8��|�����1SgZ�ك��@�*	�Y�K{
�eA��,��3��Bl_�#5���r�4#3Pl)�JT�ʂ��X�:���GL���5�M@j'}���U�x�lGj[�LִT���H��[�i�2���gJ�f�@rR�樀�_W�~37������3�F�L�M�n+6F��ϙ8P}K��a�����m3��ti�z'T����\�<�W�<�s6����qf�14J���آ�!F�sQ��@�#��A����,�y�����$/��i	.�z�q.�T4�s9'��A�u��}�x�����x�D��1��1P�����mm�1�Bm��2�w�� ��=A%�d|��C���ct��g���rk\�y[Y+X��}�;B��7Z�n�,i	sk�si+��:g�Z��<P틝�ɓ�YxC���B-�1؟p���F~� ����`��iP+����8K�A%��K�Y���Lp�k������Y���=��}�9�0b��)����̇6�^���！�Ӫ� �P�c.�b��-�ӎ�P�q�0N���p�O3��l�e&�fG���p����ت�$���J[,�!O{���3&CCs�G}�zx�;���Cr\ϥ��z����|����oC%K?��������Z�	sk-�̏a&d�Lh'n���+�nʗP�@�\��b+)U�������u�pP���-X��13�xO�1�Yi2!����s��Ѻ�\�+�*����\)�����(��%���|�h��n�΍��@Î 2  U����0�+�\��1U� �ʏ��4+�}�(P�5������Bu7��yL������������j��8"cg� ����T\K�9PA�f�2L�..����\C��Mj�)nj����0PﯿU��(3Iq�vҜ��~4h���<O��!
g)�� "�eqX���~6.��\HN�71.W�ͺ��j���7/�9h��!��j��\?��<�Z����U�w_*�^��N�7��:�ٕlWָ�7���w�ǽ���A�>{�O���u�Ow�^6�L�,S��R�N�-�����Y���u
��%W��w_�+�5�R_/w�Y)>��������=c:;;�,��R��ǅڷA�Wi����t�x��:����~Y�8��g{iڽp��Ou���4�(���xIv/����0j�	���$���&�krA���",�$�=Ӂ�]����$��$j�ax��_w8�2K�T=g��s�蘜:Im���s^�=�����j3KV�+�y�Թ�l��f*|Ӫ��^-��� @�UY��O�,�'�9�fY�b����E�A�2�$��ƾ�����$��z%,q��<�1�1�څ��.N�����2���hw��e�s�2.��l��k�J;-o�����?f����_V��U� t�\w ���x$W�yf?O��;��G_?ӂ��2؍3pzd뇥�a��Il��Ղ����ꄍ�rx쮐�m<pA�)>
4�T��EQfdS?>�Q������s*/,�nE��P̛^I�Qi'o�xķo����� �FLg�a],���q$Y���Y����)�GZH`�|�B'�,���t�;햻�����޹̯�>+���H��Д�E�cr+f���ߞ��*��SR��7ID(��ۮ.�Å����97�뱚E��X�/>+MJYC��P�,'�c0��7Ŏ���ҋ�
�(�p�Qrw =W��Io�����bo���<�o�������(n�ۻ��s}��y�ϯןV˛���"�/���ޢs��
�>1�0���>�}yshϞ��B0H����BPg��H��D�.�}ޖ`�� t�o>Fz�k�«
x��w�J���̘�ܐ�D�4�J�s���܈��Yy��L�-��]Z����	&�j>�ŝ-�Q[�gg�F�T��`][j�'�d巔.nC�\>c�w_y�`f��36�� CVǣoc�WZ �덐 `�����K��zgG �C���K`���(7��E�S5�I��<)�m��cည���m�=�}0�����$cv"p�1Oz��ڷ��ٮ���W��u���S&�x}��\�8����+5�6}�[�i;��?�Ԩ���n��Gv���O�AJ���?���3��QW�����敶Ӎp��̉�p�M�(?oر��1a~n������8՟����d���ehU�^��҃g����M#PΘP .�:g���]S��2֎`G��~v e�72�3��ʺ�j�l�׉��C O���9�H���d`Y'���]z��YČ�P�<3�wD�� �Í�!d�TwPE����>���^��&@��/�Pj�����c���}�[Hk3u�Ø��z����-bL�     