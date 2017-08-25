PGDMP     )                    u            Aula_Web    9.6.2    9.6.2 B   A	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            B	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            C	           1262    24958    Aula_Web    DATABASE     �   CREATE DATABASE "Aula_Web" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "Aula_Web";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            D	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        2615    25529 	   seguridad    SCHEMA        CREATE SCHEMA seguridad;
    DROP SCHEMA seguridad;
             postgres    false            E	           0    0    SCHEMA seguridad    COMMENT     q   COMMENT ON SCHEMA seguridad IS 'Schema que almacenara la informaicón relevante a seguridad de la aplicación.';
                  postgres    false    4                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            F	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
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
       public       postgres    false    3            G	           0    0    TYPE consultar_archivos_type    COMMENT     �   COMMENT ON TYPE consultar_archivos_type IS 'almacena los tipo de datos necesarios para sp_consultar_archivos, sp_mostrar_archivos';
            public       postgres    false    693            �           1247    25572    consultar_comentarios_type    TYPE     �   CREATE TYPE consultar_comentarios_type AS (
	id_comentario integer,
	id_usuario integer,
	id_archivo integer,
	comentario character varying(200),
	fecha timestamp without time zone,
	modified_by integer,
	usuario character varying(30)
);
 -   DROP TYPE public.consultar_comentarios_type;
       public       postgres    false    3            H	           0    0    TYPE consultar_comentarios_type    COMMENT     m   COMMENT ON TYPE consultar_comentarios_type IS 'almacena los datos necesarios para sp_consultar_comentarios';
            public       postgres    false    707            �           1247    25507    datos_archivos_type    TYPE     ?  CREATE TYPE datos_archivos_type AS (
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
       public       postgres    false    3            I	           0    0    TYPE datos_archivos_type    COMMENT     g   COMMENT ON TYPE datos_archivos_type IS 'almacena los datos necesarios para sp_consulta_archivo_datos';
            public       postgres    false    690            �           1247    33790    reporte_archivos_type    TYPE     �  CREATE TYPE reporte_archivos_type AS (
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
       public       postgres    false    3            J	           0    0    TYPE reporte_archivos_type    COMMENT     c   COMMENT ON TYPE reporte_archivos_type IS 'almacena los datos necesarios para sp_reporte_archivos';
            public       postgres    false    719            �           1247    33794    reporte_autores_type    TYPE        CREATE TYPE reporte_autores_type AS (
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
       public       postgres    false    3            K	           0    0    TYPE reporte_autores_type    COMMENT     a   COMMENT ON TYPE reporte_autores_type IS 'almacena los datos necesarios para sp_reporte_autores';
            public       postgres    false    722            �           1247    25601    reporte_usuarios_type    TYPE     �  CREATE TYPE reporte_usuarios_type AS (
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
	ip character varying(50),
	mac character varying(50),
	modified_by integer,
	rol character varying(30)
);
 (   DROP TYPE public.reporte_usuarios_type;
       public       postgres    false    3            L	           0    0    TYPE reporte_usuarios_type    COMMENT     c   COMMENT ON TYPE reporte_usuarios_type IS 'almacena los datos necesarios para sp_reporte_usuarios';
            public       postgres    false    716            �           1247    25588    ver_archivo_autor_type    TYPE     �   CREATE TYPE ver_archivo_autor_type AS (
	id_archivo integer,
	nombre_archivo character varying(30),
	sinopsis character varying(1000),
	imagen_portada text,
	nombre_autor character varying(30)
);
 )   DROP TYPE public.ver_archivo_autor_type;
       public       postgres    false    3            M	           0    0    TYPE ver_archivo_autor_type    COMMENT     e   COMMENT ON TYPE ver_archivo_autor_type IS 'almacena los datos necesarios para sp_ver_archivo_autor';
            public       postgres    false    713            �           1247    25565    ver_archivo_type    TYPE     �  CREATE TYPE ver_archivo_type AS (
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
       public       postgres    false    3            N	           0    0    TYPE ver_archivo_type    COMMENT     Y   COMMENT ON TYPE ver_archivo_type IS 'almacena los datos necesarios para sp_ver_archivo';
            public       postgres    false    704            �           1247    25582    ver_autor_type    TYPE     (  CREATE TYPE ver_autor_type AS (
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
       public       postgres    false    3            O	           0    0    TYPE ver_autor_type    COMMENT     U   COMMENT ON TYPE ver_autor_type IS 'almacena los datos necesarios para sp_ver_autor';
            public       postgres    false    710                       1255    42035 '   prueba_resta(integer, integer, integer)    FUNCTION     �   CREATE FUNCTION prueba_resta(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

update public.usuario
set dinero = dinero - _dinero, modified_by = _user_cambio
where id_usuario = _id;

END;

$$;
 W   DROP FUNCTION public.prueba_resta(_id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    1    3                       1255    42036 &   prueba_suma(integer, integer, integer)    FUNCTION     �   CREATE FUNCTION prueba_suma(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
    LANGUAGE plpgsql
    AS $$

BEGIN

update public.usuario
set dinero = dinero + _dinero, modified_by = _user_cambio
where id_usuario = _id;

END;

$$;
 V   DROP FUNCTION public.prueba_suma(_id integer, _dinero integer, _user_cambio integer);
       public       postgres    false    3    1                       1255    42037 ?   sp_aprobar_archivo(integer, integer, integer, integer, integer)    FUNCTION     :  CREATE FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
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
       public       postgres    false    3    1            P	           0    0 {   FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_aprobar_archivo(_id_archivo integer, _id_categoria integer, _id integer, _dinero integer, _user_cambio integer) IS 'Funcion que cambia el estado, categoria de un archivo y agrega dinero a la cuenta del user';
            public       postgres    false    263            �            1259    24969    usuario    TABLE     �  CREATE TABLE usuario (
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
    modified_by integer
);
    DROP TABLE public.usuario;
       public         postgres    false    3            Q	           0    0    TABLE usuario    COMMENT     U   COMMENT ON TABLE usuario IS 'Tabla que contiene los datos de los users registrados';
            public       postgres    false    189            R	           0    0    COLUMN usuario.id_usuario    COMMENT     S   COMMENT ON COLUMN usuario.id_usuario IS 'representa el identificador de la tabla';
            public       postgres    false    189            S	           0    0    COLUMN usuario.nombre    COMMENT     E   COMMENT ON COLUMN usuario.nombre IS 'representa el nombre del user';
            public       postgres    false    189            T	           0    0    COLUMN usuario.apellido    COMMENT     I   COMMENT ON COLUMN usuario.apellido IS 'representa el apellido del user';
            public       postgres    false    189            U	           0    0    COLUMN usuario.documento    COMMENT     K   COMMENT ON COLUMN usuario.documento IS 'representa el documento del user';
            public       postgres    false    189            V	           0    0    COLUMN usuario.telefono    COMMENT     S   COMMENT ON COLUMN usuario.telefono IS 'representa el numero de contacto del user';
            public       postgres    false    189            W	           0    0    COLUMN usuario.correo    COMMENT     Q   COMMENT ON COLUMN usuario.correo IS 'representa el e-mail de contacto del user';
            public       postgres    false    189            X	           0    0    COLUMN usuario.usuario    COMMENT     Y   COMMENT ON COLUMN usuario.usuario IS 'representa el nickname del usuario en el sistema';
            public       postgres    false    189            Y	           0    0    COLUMN usuario.clave    COMMENT     O   COMMENT ON COLUMN usuario.clave IS 'representa la clave de acceso al sistema';
            public       postgres    false    189            Z	           0    0    COLUMN usuario.dinero    COMMENT     Z   COMMENT ON COLUMN usuario.dinero IS 'representa la cantidad de dinero que posee el user';
            public       postgres    false    189            [	           0    0    COLUMN usuario.id_rol    COMMENT     T   COMMENT ON COLUMN usuario.id_rol IS 'representa el identificador del rol del user';
            public       postgres    false    189            \	           0    0    COLUMN usuario.ip    COMMENT     s   COMMENT ON COLUMN usuario.ip IS 'representa la ip desde la cual se accedio al sistema, valor por defecto: sin IP';
            public       postgres    false    189            ]	           0    0    COLUMN usuario.mac    COMMENT     t   COMMENT ON COLUMN usuario.mac IS 'representa la mac desde donde se accedio al sistema, valor por defecto: sin MAC';
            public       postgres    false    189            ^	           0    0    COLUMN usuario.modified_by    COMMENT     j   COMMENT ON COLUMN usuario.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    189                       1255    42038 �   sp_cambiar_rol(integer, character varying, character varying, bigint, character varying, character varying, character varying, character varying, integer, integer, integer)    FUNCTION       CREATE FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer) RETURNS SETOF usuario
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
       public       postgres    false    189    3    1            _	           0    0   FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer)    COMMENT     I  COMMENT ON FUNCTION sp_cambiar_rol(_id integer, _nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _dinero integer, _id_rol integer, _user_cambio integer) IS 'Funcion que cambia el rol de un user';
            public       postgres    false    264                       1255    42039 #   sp_cerrar_session(integer, integer)    FUNCTION     �   CREATE FUNCTION sp_cerrar_session(_id integer, _user_cambio integer) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.usuario
    SET ip='sin IP', mac='sin MAC', modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 K   DROP FUNCTION public.sp_cerrar_session(_id integer, _user_cambio integer);
       public       postgres    false    189    1    3            `	           0    0 =   FUNCTION sp_cerrar_session(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_cerrar_session(_id integer, _user_cambio integer) IS 'Funcion que modifica la IP/MAC cuando el usuario cierra session';
            public       postgres    false    262            �            1255    25508 "   sp_consulta_archivo_datos(integer)    FUNCTION     �  CREATE FUNCTION sp_consulta_archivo_datos(_id_rol integer) RETURNS SETOF datos_archivos_type
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
       public       postgres    false    1    690    3            a	           0    0 3   FUNCTION sp_consulta_archivo_datos(_id_rol integer)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_archivo_datos(_id_rol integer) IS 'Funcion que retorna los archivos no aprobados y dependiendo el rol';
            public       postgres    false    250            �            1259    24977    archivo    TABLE     �  CREATE TABLE archivo (
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
       public         postgres    false    3            b	           0    0    TABLE archivo    COMMENT     ]   COMMENT ON TABLE archivo IS 'Tabla que almacena la info de los archivos subidos al sistema';
            public       postgres    false    191            c	           0    0    COLUMN archivo.id_archivo    COMMENT     S   COMMENT ON COLUMN archivo.id_archivo IS 'representa el identificador de la tabla';
            public       postgres    false    191            d	           0    0    COLUMN archivo.nombre    COMMENT     H   COMMENT ON COLUMN archivo.nombre IS 'representa el nombre del archivo';
            public       postgres    false    191            e	           0    0    COLUMN archivo.anio    COMMENT     S   COMMENT ON COLUMN archivo.anio IS 'representa el anio de publicacion del archivo';
            public       postgres    false    191            f	           0    0    COLUMN archivo.sinopsis    COMMENT     e   COMMENT ON COLUMN archivo.sinopsis IS 'representa la descripcion general del contenido del archivo';
            public       postgres    false    191            g	           0    0    COLUMN archivo.num_pag    COMMENT     ]   COMMENT ON COLUMN archivo.num_pag IS 'representa la cantidad de hojas que tiene el archivo';
            public       postgres    false    191            h	           0    0    COLUMN archivo.imagen_portada    COMMENT     n   COMMENT ON COLUMN archivo.imagen_portada IS 'almacena la url de la imagen de portada alojada en el servidor';
            public       postgres    false    191            i	           0    0    COLUMN archivo.url    COMMENT     W   COMMENT ON COLUMN archivo.url IS 'almacena la url del archivo alojado en el servidor';
            public       postgres    false    191            j	           0    0    COLUMN archivo.id_usuario    COMMENT     ]   COMMENT ON COLUMN archivo.id_usuario IS 'representa el id del usuario que subio el archivo';
            public       postgres    false    191            k	           0    0    COLUMN archivo.id_estado    COMMENT     v   COMMENT ON COLUMN archivo.id_estado IS 'representa el estado (aprobado, no aprobado) en que se encuentra el archivo';
            public       postgres    false    191            l	           0    0    COLUMN archivo.id_categoria    COMMENT     Y   COMMENT ON COLUMN archivo.id_categoria IS 'representa la categoria asociada al archivo';
            public       postgres    false    191            m	           0    0    COLUMN archivo.tags    COMMENT     O   COMMENT ON COLUMN archivo.tags IS 'representa los index que posee el archivo';
            public       postgres    false    191            n	           0    0    COLUMN archivo.id_moderador    COMMENT     n   COMMENT ON COLUMN archivo.id_moderador IS 'representa el id del moderador del sistema, por defecto 1=>Admin';
            public       postgres    false    191            o	           0    0    COLUMN archivo.estado_mod    COMMENT     �   COMMENT ON COLUMN archivo.estado_mod IS 'permite saber si el archivo esta moderado o no (1,2) con el fin de evitar moderar un mismo archivo al mismo tiempo';
            public       postgres    false    191            p	           0    0    COLUMN archivo.modified_by    COMMENT     j   COMMENT ON COLUMN archivo.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    191            �            1255    25373 -   sp_consulta_archivo_nombre(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_archivo_nombre(_nombre character varying) RETURNS SETOF archivo
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
       public       postgres    false    3    1    191            q	           0    0 >   FUNCTION sp_consulta_archivo_nombre(_nombre character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_archivo_nombre(_nombre character varying) IS 'Funcion que retorna los datos del archivo dependiendo el nombre';
            public       postgres    false    242            �            1259    25036    autor    TABLE     =  CREATE TABLE autor (
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
       public         postgres    false    3            r	           0    0    TABLE autor    COMMENT     B   COMMENT ON TABLE autor IS 'Tabla que contiene la info del autor';
            public       postgres    false    205            s	           0    0    COLUMN autor.id_autor    COMMENT     O   COMMENT ON COLUMN autor.id_autor IS 'representa el identificador de la tabla';
            public       postgres    false    205            t	           0    0    COLUMN autor.nombre    COMMENT     D   COMMENT ON COLUMN autor.nombre IS 'representa el nombre del autor';
            public       postgres    false    205            u	           0    0    COLUMN autor.fecha_nacimiento    COMMENT     [   COMMENT ON COLUMN autor.fecha_nacimiento IS 'representa la fecha de nacimiento del autor';
            public       postgres    false    205            v	           0    0    COLUMN autor.fecha_muerte    COMMENT     _   COMMENT ON COLUMN autor.fecha_muerte IS 'representa la fecha de muerte del autor (si aplica)';
            public       postgres    false    205            w	           0    0    COLUMN autor.foto    COMMENT     ^   COMMENT ON COLUMN autor.foto IS 'almacena la url de la foto de autor alojada en el servidor';
            public       postgres    false    205            x	           0    0    COLUMN autor.descripcion    COMMENT     T   COMMENT ON COLUMN autor.descripcion IS 'representa una breve descipcion del autor';
            public       postgres    false    205            y	           0    0    COLUMN autor.id_nacionalidad    COMMENT     g   COMMENT ON COLUMN autor.id_nacionalidad IS 'representa el identificador de la nacionalidad del autor';
            public       postgres    false    205            z	           0    0    COLUMN autor.modified_by    COMMENT     h   COMMENT ON COLUMN autor.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    205            �            1255    25483 $   sp_consulta_autor(character varying)    FUNCTION        CREATE FUNCTION sp_consulta_autor(_nom_autor character varying) RETURNS SETOF autor
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
       public       postgres    false    3    1    205            {	           0    0 8   FUNCTION sp_consulta_autor(_nom_autor character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_autor(_nom_autor character varying) IS 'Funcion que retorna los datos del autor dependiendo el nombre';
            public       postgres    false    245            �            1259    24988 	   categoria    TABLE     �   CREATE TABLE categoria (
    id_categoria integer NOT NULL,
    categoria character varying(30) NOT NULL,
    precio integer,
    modified_by integer
);
    DROP TABLE public.categoria;
       public         postgres    false    3            |	           0    0    TABLE categoria    COMMENT     \   COMMENT ON TABLE categoria IS 'Tabla que contiene la info de la categoria de cada archivo';
            public       postgres    false    193            }	           0    0    COLUMN categoria.id_categoria    COMMENT     W   COMMENT ON COLUMN categoria.id_categoria IS 'representa el identificador de la tabla';
            public       postgres    false    193            ~	           0    0    COLUMN categoria.categoria    COMMENT     Q   COMMENT ON COLUMN categoria.categoria IS 'representa el nombre de la categoria';
            public       postgres    false    193            	           0    0    COLUMN categoria.precio    COMMENT     U   COMMENT ON COLUMN categoria.precio IS 'representa el precio que posee la categoria';
            public       postgres    false    193            �	           0    0    COLUMN categoria.modified_by    COMMENT     l   COMMENT ON COLUMN categoria.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    193            �            1255    25346 (   sp_consulta_categoria(character varying)    FUNCTION       CREATE FUNCTION sp_consulta_categoria(_categoria character varying) RETURNS SETOF categoria
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
       public       postgres    false    193    3    1            �	           0    0 <   FUNCTION sp_consulta_categoria(_categoria character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_categoria(_categoria character varying) IS 'Funcion que retorna los datos de la categoria dependiendo el nombre';
            public       postgres    false    224            �            1255    25222 %   sp_consulta_correo(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_correo(_correo character varying) RETURNS SETOF usuario
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
       public       postgres    false    3    1    189            �	           0    0 6   FUNCTION sp_consulta_correo(_correo character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_correo(_correo character varying) IS 'Funcion que retorna los datos del usuario dependiendo el correo';
            public       postgres    false    222            �            1255    25229    sp_consulta_documento(bigint)    FUNCTION     �   CREATE FUNCTION sp_consulta_documento(_documento bigint) RETURNS SETOF usuario
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
       public       postgres    false    189    1    3            �	           0    0 1   FUNCTION sp_consulta_documento(_documento bigint)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_documento(_documento bigint) IS 'Funcion que retorna los datos del usuario dependiendo el documento';
            public       postgres    false    223            �            1255    25323    sp_consulta_rol(integer)    FUNCTION     �   CREATE FUNCTION sp_consulta_rol(_rol integer) RETURNS SETOF usuario
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
       public       postgres    false    3    1    189            �	           0    0 &   FUNCTION sp_consulta_rol(_rol integer)    COMMENT     l   COMMENT ON FUNCTION sp_consulta_rol(_rol integer) IS 'Funcion que retorna los usuarios asociados a un rol';
            public       postgres    false    226            �            1259    25004    tags    TABLE     u   CREATE TABLE tags (
    id_tags integer NOT NULL,
    tag character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.tags;
       public         postgres    false    3            �	           0    0 
   TABLE tags    COMMENT     K   COMMENT ON TABLE tags IS 'Tabla que contiene los index para cada archivo';
            public       postgres    false    197            �	           0    0    COLUMN tags.id_tags    COMMENT     M   COMMENT ON COLUMN tags.id_tags IS 'representa el identificador de la tabla';
            public       postgres    false    197            �	           0    0    COLUMN tags.tag    COMMENT     @   COMMENT ON COLUMN tags.tag IS 'representa el nombre del index';
            public       postgres    false    197            �	           0    0    COLUMN tags.modified_by    COMMENT     g   COMMENT ON COLUMN tags.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    197            �            1255    25355 #   sp_consulta_tags(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_tags(_tag character varying) RETURNS SETOF tags
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
       public       postgres    false    3    197    1            �	           0    0 1   FUNCTION sp_consulta_tags(_tag character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_tags(_tag character varying) IS 'Funcion que retorna los datos de un tag dependiendo el nombre';
            public       postgres    false    246            �            1255    25220 &   sp_consulta_usuario(character varying)    FUNCTION     �   CREATE FUNCTION sp_consulta_usuario(_usuario character varying) RETURNS SETOF usuario
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
       public       postgres    false    1    189    3            �	           0    0 8   FUNCTION sp_consulta_usuario(_usuario character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consulta_usuario(_usuario character varying) IS 'Funcion que retorna los datos del usuario dependiendo el username';
            public       postgres    false    220            �            1255    25527 (   sp_consultar_archivos(character varying)    FUNCTION     �  CREATE FUNCTION sp_consultar_archivos(_parametro character varying) RETURNS SETOF consultar_archivos_type
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
            a.id_estado = '2' AND a.nombre ILIKE('%'||_parametro||'%') OR a.tags ILIKE('%'||_parametro||'%') OR c.categoria ILIKE('%'||_parametro||'%')
        ORDER BY a.nombre asc;

END;
$$;
 J   DROP FUNCTION public.sp_consultar_archivos(_parametro character varying);
       public       postgres    false    1    3    693            �	           0    0 <   FUNCTION sp_consultar_archivos(_parametro character varying)    COMMENT     �   COMMENT ON FUNCTION sp_consultar_archivos(_parametro character varying) IS 'Funcion que retorna un archivo dependiendo un parametro y que este aprobado (2)';
            public       postgres    false    247            �            1255    25573 !   sp_consultar_comentarios(integer)    FUNCTION     ^  CREATE FUNCTION sp_consultar_comentarios(_id_archivo integer) RETURNS SETOF consultar_comentarios_type
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
       public       postgres    false    707    1    3            �	           0    0 6   FUNCTION sp_consultar_comentarios(_id_archivo integer)    COMMENT     z   COMMENT ON FUNCTION sp_consultar_comentarios(_id_archivo integer) IS 'Funcion que retorna los comentarios de un archivo';
            public       postgres    false    252            	           1255    42040 /   sp_descargar_archivo(integer, integer, integer)    FUNCTION     B  CREATE FUNCTION sp_descargar_archivo(_id integer, _dinero integer, _user_cambio integer) RETURNS SETOF void
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
            public       postgres    false    265                       1255    42041 %   sp_eliminar_archivo(integer, integer)    FUNCTION     V  CREATE FUNCTION sp_eliminar_archivo(_id integer, _user_cambio integer) RETURNS SETOF void
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
            public       postgres    false    259                       1255    42042 '   sp_eliminar_categoria(integer, integer)    FUNCTION     �  CREATE FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer) RETURNS SETOF categoria
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
       public       postgres    false    1    3    193            �	           0    0 A   FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_eliminar_categoria(_id integer, _user_cambio integer) IS 'Funcion que elimina una categoria y la relacion con archivo actualizando estado';
            public       postgres    false    277            
           1255    42043 "   sp_eliminar_tags(integer, integer)    FUNCTION     X  CREATE FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer) RETURNS SETOF tags
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
       public       postgres    false    3    197    1            �	           0    0 <   FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer)    COMMENT     i   COMMENT ON FUNCTION sp_eliminar_tags(_id integer, _user_cambio integer) IS 'Funcion que elimina un tag';
            public       postgres    false    266                       1255    42044 �   sp_insertar_archivo(integer, character varying, character varying, character varying, integer, text, text, integer, integer, character varying, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer) RETURNS SETOF archivo
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
       public       postgres    false    3    191    1            �	           0    0   FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer)    COMMENT     R  COMMENT ON FUNCTION sp_insertar_archivo(_id_rol integer, _nombre character varying, _fecha character varying, _sinopsis character varying, _num_pag integer, _foto text, _link text, _id_user integer, _id_categoria integer, _tags character varying, _user_cambio integer) IS 'Funcion que inserta un archivo y asigna estado dependiendo rol';
            public       postgres    false    267            �            1259    25028    archivo_autor    TABLE     �   CREATE TABLE archivo_autor (
    id_archivo_autor integer NOT NULL,
    id_autor integer NOT NULL,
    id_archivo integer NOT NULL,
    modified_by integer
);
 !   DROP TABLE public.archivo_autor;
       public         postgres    false    3            �	           0    0    TABLE archivo_autor    COMMENT     g   COMMENT ON TABLE archivo_autor IS 'Tabla que contiene las asociaciones de las tablas archivo y autor';
            public       postgres    false    203            �	           0    0 %   COLUMN archivo_autor.id_archivo_autor    COMMENT     _   COMMENT ON COLUMN archivo_autor.id_archivo_autor IS 'representa el identificador de la tabla';
            public       postgres    false    203            �	           0    0    COLUMN archivo_autor.id_autor    COMMENT     U   COMMENT ON COLUMN archivo_autor.id_autor IS 'representa el identificador del autor';
            public       postgres    false    203            �	           0    0    COLUMN archivo_autor.id_archivo    COMMENT     Y   COMMENT ON COLUMN archivo_autor.id_archivo IS 'representa el identificador del archivo';
            public       postgres    false    203            �	           0    0     COLUMN archivo_autor.modified_by    COMMENT     p   COMMENT ON COLUMN archivo_autor.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    203                       1255    42045 5   sp_insertar_archivo_autor(character varying, integer)    FUNCTION     8  CREATE FUNCTION sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer) RETURNS SETOF archivo_autor
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
       public       postgres    false    3    203    1            �	           0    0 S   FUNCTION sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_archivo_autor(_nombre character varying, _user_cambio integer) IS 'Funcion que crear la relacion entre un archivo y autor';
            public       postgres    false    268                       1255    42046 u   sp_insertar_autor(character varying, character varying, character varying, text, character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer) RETURNS SETOF autor
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.autor(
	nombre, fecha_nacimiento, fecha_muerte, foto, descripcion, id_nacionalidad, modified_by)
	VALUES (_nombre, _fecha_birth, _fecha_death, _foto, _descripcion, _nacionalidad, _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer);
       public       postgres    false    3    1    205            �	           0    0 �   FUNCTION sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_autor(_nombre character varying, _fecha_birth character varying, _fecha_death character varying, _foto text, _descripcion character varying, _nacionalidad integer, _user_cambio integer) IS 'Funcion que inserta un autor';
            public       postgres    false    269                       1255    42047 :   sp_insertar_categoria(character varying, integer, integer)    FUNCTION     '  CREATE FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer) RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.categoria(
    categoria, precio, modified_by)
    VALUES(_categoria, _precio, _user_cambio);

END;

$$;
 q   DROP FUNCTION public.sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer);
       public       postgres    false    3    193    1            �	           0    0 c   FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_categoria(_categoria character varying, _precio integer, _user_cambio integer) IS 'Funcion que inserta una categoria';
            public       postgres    false    270            �            1259    25020 
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
            public       postgres    false    201            �	           0    0    COLUMN comentario.id_comentario    COMMENT     Y   COMMENT ON COLUMN comentario.id_comentario IS 'representa el identificador de la tabla';
            public       postgres    false    201            �	           0    0    COLUMN comentario.id_usuario    COMMENT     b   COMMENT ON COLUMN comentario.id_usuario IS 'representa el identificador del usuario que comento';
            public       postgres    false    201            �	           0    0    COLUMN comentario.id_archivo    COMMENT     g   COMMENT ON COLUMN comentario.id_archivo IS 'representa el identificador del archivo donde se comento';
            public       postgres    false    201            �	           0    0    COLUMN comentario.comentario    COMMENT     N   COMMENT ON COLUMN comentario.comentario IS 'almacena el comentario del user';
            public       postgres    false    201            �	           0    0    COLUMN comentario.fecha    COMMENT     O   COMMENT ON COLUMN comentario.fecha IS 'representa la fecha en que se comento';
            public       postgres    false    201            �	           0    0    COLUMN comentario.modified_by    COMMENT     m   COMMENT ON COLUMN comentario.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    201                       1255    42048 D   sp_insertar_comentario(integer, integer, character varying, integer)    FUNCTION     R  CREATE FUNCTION sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer) RETURNS SETOF comentario
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.comentario(
	id_usuario, id_archivo, comentario, modified_by)
	VALUES (_id, _id_archivo, _comentario, _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer);
       public       postgres    false    3    1    201            �	           0    0 v   FUNCTION sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_comentario(_id integer, _id_archivo integer, _comentario character varying, _user_cambio integer) IS 'Funcion que inserta el comentario de un usuario en un archivo';
            public       postgres    false    271                       1255    42049 J   sp_insertar_ip_mac(integer, character varying, character varying, integer)    FUNCTION     %  CREATE FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.usuario
    SET ip=_ip, mac=_mac, modified_by = _user_cambio
    WHERE id_usuario = _id;

END;

$$;
 {   DROP FUNCTION public.sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer);
       public       postgres    false    1    3    189            �	           0    0 m   FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_ip_mac(_id integer, _ip character varying, _mac character varying, _user_cambio integer) IS 'Funcion que inserta la IP/MAC cuando el usuario inicia session';
            public       postgres    false    272            �            1259    25012    subir_descargar    TABLE       CREATE TABLE subir_descargar (
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
            public       postgres    false    199            �	           0    0 )   COLUMN subir_descargar.id_subir_descargar    COMMENT     c   COMMENT ON COLUMN subir_descargar.id_subir_descargar IS 'representa el identificador de la tabla';
            public       postgres    false    199            �	           0    0 !   COLUMN subir_descargar.id_usuario    COMMENT     v   COMMENT ON COLUMN subir_descargar.id_usuario IS 'representa el identificador del user que subio/descargo el archivo';
            public       postgres    false    199            �	           0    0 !   COLUMN subir_descargar.id_archivo    COMMENT     }   COMMENT ON COLUMN subir_descargar.id_archivo IS 'representa el identificador del archivo que se subio/descargo del sistema';
            public       postgres    false    199            �	           0    0    COLUMN subir_descargar.concepto    COMMENT     l   COMMENT ON COLUMN subir_descargar.concepto IS 'representa el tipo de transaccion hecha (upload, download)';
            public       postgres    false    199            �	           0    0    COLUMN subir_descargar.precio    COMMENT     �   COMMENT ON COLUMN subir_descargar.precio IS 'representa el precio del archivo: upload siempre es 0 porque el archivo no ha sido moderado, download ya posee el precio asignado en la moderacion';
            public       postgres    false    199            �	           0    0    COLUMN subir_descargar.fecha    COMMENT     f   COMMENT ON COLUMN subir_descargar.fecha IS 'representa la fecha en que se subio/descargo el archivo';
            public       postgres    false    199            �	           0    0 "   COLUMN subir_descargar.modified_by    COMMENT     r   COMMENT ON COLUMN subir_descargar.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    199                       1255    42050 R   sp_insertar_subir_descargar(integer, integer, character varying, integer, integer)    FUNCTION     �  CREATE FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer) RETURNS SETOF subir_descargar
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.subir_descargar(
    id_usuario, id_archivo, concepto, precio, modified_by)
    VALUES(_id_user, _id_archivo, _concepto, _precio, _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer);
       public       postgres    false    3    199    1            �	           0    0 �   FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_insertar_subir_descargar(_id_user integer, _id_archivo integer, _concepto character varying, _precio integer, _user_cambio integer) IS 'Funcion que inserta la transaccion realizada sobre un archivo Upload/Download';
            public       postgres    false    273                       1255    42051 ,   sp_insertar_tags(character varying, integer)    FUNCTION     �   CREATE FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer) RETURNS SETOF tags
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.tags(
    tag, modified_by)
    VALUES(_tag, _user_cambio);

END;

$$;
 U   DROP FUNCTION public.sp_insertar_tags(_tag character varying, _user_cambio integer);
       public       postgres    false    3    197    1            �	           0    0 G   FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer)    COMMENT     t   COMMENT ON FUNCTION sp_insertar_tags(_tag character varying, _user_cambio integer) IS 'Funcion que inserta un tag';
            public       postgres    false    274                       1255    42052 �   sp_insertar_usuario(character varying, character varying, bigint, character varying, character varying, character varying, character varying, integer)    FUNCTION     3  CREATE FUNCTION sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer) RETURNS SETOF usuario
    LANGUAGE plpgsql
    AS $$

BEGIN

	INSERT INTO public.usuario(
	nombre, apellido, documento, telefono, correo, usuario, clave, dinero, id_rol, ip, mac, modified_by)
	VALUES (_nombre, _apellido, _documento, _telefono, _correo, _user, _clave, 500, 3, 'sin IP', 'sin MAC', _user_cambio);

END;

$$;
 �   DROP FUNCTION public.sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer);
       public       postgres    false    189    1    3            �	           0    0 �   FUNCTION sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer)    COMMENT       COMMENT ON FUNCTION sp_insertar_usuario(_nombre character varying, _apellido character varying, _documento bigint, _telefono character varying, _correo character varying, _user character varying, _clave character varying, _user_cambio integer) IS 'Funcion que inserta un usuario';
            public       postgres    false    275            �            1255    25231 7   sp_loggin_usuario(character varying, character varying)    FUNCTION       CREATE FUNCTION sp_loggin_usuario(_user character varying, _password character varying) RETURNS SETOF usuario
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
       public       postgres    false    189    3    1            �	           0    0 P   FUNCTION sp_loggin_usuario(_user character varying, _password character varying)    COMMENT     �   COMMENT ON FUNCTION sp_loggin_usuario(_user character varying, _password character varying) IS 'Funcion que retorna los datos de usuario dependiendo user y clave';
            public       postgres    false    225                       1255    42053 D   sp_modificar_categoria(integer, character varying, integer, integer)    FUNCTION     C  CREATE FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer) RETURNS SETOF categoria
    LANGUAGE plpgsql
    AS $$

BEGIN

	UPDATE public.categoria
    SET categoria=_categoria, precio=_precio, modified_by = _user_cambio
    WHERE id_categoria = _id;

END;

$$;
    DROP FUNCTION public.sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer);
       public       postgres    false    193    1    3            �	           0    0 q   FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer)    COMMENT     �   COMMENT ON FUNCTION sp_modificar_categoria(_id integer, _categoria character varying, _precio integer, _user_cambio integer) IS 'Funcion que modifica el precio de una categoria';
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
       public       postgres    false    1    3    191            �	           0    0    FUNCTION sp_mostrar_archivo()    COMMENT     V   COMMENT ON FUNCTION sp_mostrar_archivo() IS 'Funcion que retorna todos los archivos';
            public       postgres    false    243            �            1255    25528    sp_mostrar_archivos()    FUNCTION     [  CREATE FUNCTION sp_mostrar_archivos() RETURNS SETOF consultar_archivos_type
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
       public       postgres    false    1    3    693            �	           0    0    FUNCTION sp_mostrar_archivos()    COMMENT     �   COMMENT ON FUNCTION sp_mostrar_archivos() IS 'Funcion que retorna todos los archivos y la categoria dependiendo si estan aprobados (2)';
            public       postgres    false    248            �            1255    25372    sp_mostrar_autor()    FUNCTION     �   CREATE FUNCTION sp_mostrar_autor() RETURNS SETOF autor
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
       public       postgres    false    205    3    1            �	           0    0    FUNCTION sp_mostrar_autor()    COMMENT     S   COMMENT ON FUNCTION sp_mostrar_autor() IS 'Funcion que retorna todos los autores';
            public       postgres    false    241            �            1255    25351    sp_mostrar_categoria()    FUNCTION     +  CREATE FUNCTION sp_mostrar_categoria() RETURNS SETOF categoria
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
       public       postgres    false    193    3    1            �	           0    0    FUNCTION sp_mostrar_categoria()    COMMENT     T   COMMENT ON FUNCTION sp_mostrar_categoria() IS 'Funcion que retorna las categorias';
            public       postgres    false    249            �            1255    25484    sp_mostrar_categoria_archivo()    FUNCTION     �   CREATE FUNCTION sp_mostrar_categoria_archivo() RETURNS SETOF categoria
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
       public       postgres    false    1    3    193            �	           0    0 '   FUNCTION sp_mostrar_categoria_archivo()    COMMENT     b   COMMENT ON FUNCTION sp_mostrar_categoria_archivo() IS 'Funcion que retorna todas las categorias';
            public       postgres    false    244            �            1259    25045    pais    TABLE     ~   CREATE TABLE pais (
    id_nacionalidad integer NOT NULL,
    pais character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.pais;
       public         postgres    false    3            �	           0    0 
   TABLE pais    COMMENT     I   COMMENT ON TABLE pais IS 'Tabla que contiene la nacionalidad del autor';
            public       postgres    false    207            �	           0    0    COLUMN pais.id_nacionalidad    COMMENT     U   COMMENT ON COLUMN pais.id_nacionalidad IS 'representa el identificador de la tabla';
            public       postgres    false    207            �	           0    0    COLUMN pais.pais    COMMENT     @   COMMENT ON COLUMN pais.pais IS 'representa el nombre del pais';
            public       postgres    false    207            �	           0    0    COLUMN pais.modified_by    COMMENT     g   COMMENT ON COLUMN pais.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    207            �            1255    25341    sp_mostrar_pais()    FUNCTION     �   CREATE FUNCTION sp_mostrar_pais() RETURNS SETOF pais
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
       public       postgres    false    3    1    207            �	           0    0    FUNCTION sp_mostrar_pais()    COMMENT     Q   COMMENT ON FUNCTION sp_mostrar_pais() IS 'Funcion que retorna todos los paises';
            public       postgres    false    239            �            1255    25352    sp_mostrar_tags()    FUNCTION     �   CREATE FUNCTION sp_mostrar_tags() RETURNS SETOF tags
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
       public       postgres    false    197    1    3            �	           0    0    FUNCTION sp_mostrar_tags()    COMMENT     O   COMMENT ON FUNCTION sp_mostrar_tags() IS 'Funcion que retorna todos los tags';
            public       postgres    false    240                        1255    33791    sp_reporte_archivos()    FUNCTION     �  CREATE FUNCTION sp_reporte_archivos() RETURNS SETOF reporte_archivos_type
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
       public       postgres    false    719    1    3            �	           0    0    FUNCTION sp_reporte_archivos()    COMMENT     |   COMMENT ON FUNCTION sp_reporte_archivos() IS 'Funcion que retorna los datos del archivo, con categoria, precio y username';
            public       postgres    false    256                       1255    33795    sp_reporte_autores()    FUNCTION     8  CREATE FUNCTION sp_reporte_autores() RETURNS SETOF reporte_autores_type
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
       public       postgres    false    722    1    3            �	           0    0    FUNCTION sp_reporte_autores()    COMMENT     i   COMMENT ON FUNCTION sp_reporte_autores() IS 'Funcion que retorna los datos del autor, con nacionalidad';
            public       postgres    false    257            �            1255    25604    sp_reporte_usuarios()    FUNCTION       CREATE FUNCTION sp_reporte_usuarios() RETURNS SETOF reporte_usuarios_type
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
		SELECT 
            u.*, r.rol 
        FROM 
        	usuario u
        JOIN rol r ON r.id_rol = u.id_rol
        ORDER BY id_usuario ASC;
        
END;
$$;
 ,   DROP FUNCTION public.sp_reporte_usuarios();
       public       postgres    false    3    716    1            �	           0    0    FUNCTION sp_reporte_usuarios()    COMMENT     e   COMMENT ON FUNCTION sp_reporte_usuarios() IS 'Funcion que retorna los datos del usuario con el rol';
            public       postgres    false    255            �            1255    25566    sp_ver_archivo(integer)    FUNCTION     �  CREATE FUNCTION sp_ver_archivo(_id_archivo integer) RETURNS SETOF ver_archivo_type
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
       public       postgres    false    3    704    1            �	           0    0 ,   FUNCTION sp_ver_archivo(_id_archivo integer)    COMMENT     �   COMMENT ON FUNCTION sp_ver_archivo(_id_archivo integer) IS 'Funcion que retorna los datos del archivo, con categoria, precio y autores';
            public       postgres    false    251            �            1255    25589    sp_ver_archivo_autor(integer)    FUNCTION     �  CREATE FUNCTION sp_ver_archivo_autor(_id_autor integer) RETURNS SETOF ver_archivo_autor_type
    LANGUAGE plpgsql
    AS $$
BEGIN

RETURN QUERY
        SELECT
			a.id_archivo, a.nombre, a.sinopsis, a.imagen_portada, u.nombre
        FROM
	    	archivo a 
		JOIN archivo_autor au ON au.id_archivo = a.id_archivo
		JOIN autor u ON u.id_autor = au.id_autor
        WHERE 
            u.id_autor = _id_autor
        ORDER BY u.id_autor ASC;

END;
$$;
 >   DROP FUNCTION public.sp_ver_archivo_autor(_id_autor integer);
       public       postgres    false    1    3    713            �	           0    0 0   FUNCTION sp_ver_archivo_autor(_id_autor integer)    COMMENT     x   COMMENT ON FUNCTION sp_ver_archivo_autor(_id_autor integer) IS 'Funcion que retorna los archivos asociados a un autor';
            public       postgres    false    254            �            1255    25585    sp_ver_autor(integer)    FUNCTION     T  CREATE FUNCTION sp_ver_autor(_id_autor integer) RETURNS SETOF ver_autor_type
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
       public       postgres    false    3    710    1            �	           0    0 (   FUNCTION sp_ver_autor(_id_autor integer)    COMMENT     t   COMMENT ON FUNCTION sp_ver_autor(_id_autor integer) IS 'Funcion que retorna los datos del autor y la nacionalidad';
            public       postgres    false    253            �            1255    33808    f_log_auditoria()    FUNCTION     #  CREATE FUNCTION f_log_auditoria() RETURNS trigger
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
         	   seguridad       postgres    false    221                       1255    33830 �   field_audit(public.archivo, public.archivo, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION       CREATE FUNCTION field_audit(_data_new public.archivo, _data_old public.archivo, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    4    191    191    1                       1255    42055 �   field_audit(public.archivo_autor, public.archivo_autor, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     <
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
    	   seguridad       postgres    false    203    4    1    203                       1255    42056 �   field_audit(public.autor, public.autor, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     4  CREATE FUNCTION field_audit(_data_new public.autor, _data_old public.autor, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    205    4    1    205                       1255    33831 �   field_audit(public.categoria, public.categoria, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �	  CREATE FUNCTION field_audit(_data_new public.categoria, _data_old public.categoria, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    193    193    4    1                       1255    33832 �   field_audit(public.comentario, public.comentario, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �  CREATE FUNCTION field_audit(_data_new public.comentario, _data_old public.comentario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    201    201    4    1                       1255    42054 �   field_audit(public.subir_descargar, public.subir_descargar, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     _  CREATE FUNCTION field_audit(_data_new public.subir_descargar, _data_old public.subir_descargar, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    1    199    199    4                       1255    42057 �   field_audit(public.tags, public.tags, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     �  CREATE FUNCTION field_audit(_data_new public.tags, _data_old public.tags, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    197    4    197    1                       1255    33817 �   field_audit(public.usuario, public.usuario, character varying, character varying, character varying, integer, character varying, text, text)    FUNCTION     g  CREATE FUNCTION field_audit(_data_new public.usuario, _data_old public.usuario, _accion character varying, _ip character varying, _mac character varying, _user_name integer, _user_db character varying, _table_pk text, _init text) RETURNS text
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
    	   seguridad       postgres    false    189    189    1    4            �            1259    25026 "   archivo_autor_id_archivo_autor_seq    SEQUENCE     �   CREATE SEQUENCE archivo_autor_id_archivo_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.archivo_autor_id_archivo_autor_seq;
       public       postgres    false    3    203            �	           0    0 "   archivo_autor_id_archivo_autor_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE archivo_autor_id_archivo_autor_seq OWNED BY archivo_autor.id_archivo_autor;
            public       postgres    false    202            �            1259    24975    archivo_id_archivo_seq    SEQUENCE     x   CREATE SEQUENCE archivo_id_archivo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.archivo_id_archivo_seq;
       public       postgres    false    191    3            �	           0    0    archivo_id_archivo_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE archivo_id_archivo_seq OWNED BY archivo.id_archivo;
            public       postgres    false    190            �            1259    25034    autor_id_autor_seq    SEQUENCE     t   CREATE SEQUENCE autor_id_autor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.autor_id_autor_seq;
       public       postgres    false    205    3            �	           0    0    autor_id_autor_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE autor_id_autor_seq OWNED BY autor.id_autor;
            public       postgres    false    204            �            1259    24986    categoria_id_categoria_seq    SEQUENCE     |   CREATE SEQUENCE categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categoria_id_categoria_seq;
       public       postgres    false    3    193            �	           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE categoria_id_categoria_seq OWNED BY categoria.id_categoria;
            public       postgres    false    192            �            1259    25018    comentario_id_comentario_seq    SEQUENCE     ~   CREATE SEQUENCE comentario_id_comentario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.comentario_id_comentario_seq;
       public       postgres    false    3    201            �	           0    0    comentario_id_comentario_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE comentario_id_comentario_seq OWNED BY comentario.id_comentario;
            public       postgres    false    200            �            1259    24996    estado    TABLE     |   CREATE TABLE estado (
    id_estado integer NOT NULL,
    estado character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.estado;
       public         postgres    false    3            �	           0    0    TABLE estado    COMMENT     a   COMMENT ON TABLE estado IS 'Tabla que contiene el estado (aprobado, no aprobado) de un archivo';
            public       postgres    false    195            �	           0    0    COLUMN estado.id_estado    COMMENT     Q   COMMENT ON COLUMN estado.id_estado IS 'representa el identificador de la tabla';
            public       postgres    false    195            �	           0    0    COLUMN estado.estado    COMMENT     m   COMMENT ON COLUMN estado.estado IS 'representa el nombre del estado, por defecto 2 (aprobado, no aprobado)';
            public       postgres    false    195            �	           0    0    COLUMN estado.modified_by    COMMENT     i   COMMENT ON COLUMN estado.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    195            �            1259    24994    estado_id_estado_seq    SEQUENCE     v   CREATE SEQUENCE estado_id_estado_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.estado_id_estado_seq;
       public       postgres    false    3    195            �	           0    0    estado_id_estado_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE estado_id_estado_seq OWNED BY estado.id_estado;
            public       postgres    false    194            �            1259    25043     nacionalidad_id_nacionalidad_seq    SEQUENCE     �   CREATE SEQUENCE nacionalidad_id_nacionalidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.nacionalidad_id_nacionalidad_seq;
       public       postgres    false    3    207            �	           0    0     nacionalidad_id_nacionalidad_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE nacionalidad_id_nacionalidad_seq OWNED BY pais.id_nacionalidad;
            public       postgres    false    206            �            1259    24961    rol    TABLE     s   CREATE TABLE rol (
    id_rol integer NOT NULL,
    rol character varying(30) NOT NULL,
    modified_by integer
);
    DROP TABLE public.rol;
       public         postgres    false    3            �	           0    0 	   TABLE rol    COMMENT     F   COMMENT ON TABLE rol IS 'Tabla que contiene los roles en el sistema';
            public       postgres    false    187            �	           0    0    COLUMN rol.id_rol    COMMENT     K   COMMENT ON COLUMN rol.id_rol IS 'representa el identificador de la tabla';
            public       postgres    false    187            �	           0    0    COLUMN rol.rol    COMMENT     _   COMMENT ON COLUMN rol.rol IS 'representa el nombre del rol, por defecto 3 (admin, mod, user)';
            public       postgres    false    187            �	           0    0    COLUMN rol.modified_by    COMMENT     f   COMMENT ON COLUMN rol.modified_by IS 'Almacena el id del usuario que genera un cambio sobre la fila';
            public       postgres    false    187            �            1259    24959    rol_id_rol_seq    SEQUENCE     p   CREATE SEQUENCE rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.rol_id_rol_seq;
       public       postgres    false    3    187            �	           0    0    rol_id_rol_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE rol_id_rol_seq OWNED BY rol.id_rol;
            public       postgres    false    186            �            1259    25010 &   subir_descargar_id_subir_descargar_seq    SEQUENCE     �   CREATE SEQUENCE subir_descargar_id_subir_descargar_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.subir_descargar_id_subir_descargar_seq;
       public       postgres    false    3    199            �	           0    0 &   subir_descargar_id_subir_descargar_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE subir_descargar_id_subir_descargar_seq OWNED BY subir_descargar.id_subir_descargar;
            public       postgres    false    198            �            1259    25002    tags_id_tags_seq    SEQUENCE     r   CREATE SEQUENCE tags_id_tags_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tags_id_tags_seq;
       public       postgres    false    197    3            �	           0    0    tags_id_tags_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE tags_id_tags_seq OWNED BY tags.id_tags;
            public       postgres    false    196            �            1259    24967    usuario_id_usuario_seq    SEQUENCE     x   CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public       postgres    false    189    3            �	           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;
            public       postgres    false    188            �            1259    25539 	   auditoria    TABLE     U  CREATE TABLE auditoria (
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
    	   seguridad         postgres    false    4            �	           0    0    TABLE auditoria    COMMENT     �   COMMENT ON TABLE auditoria IS 'Tabla que lleva el registro de tofdas las transacciones realziadas sobre las tablas de la base de datos.';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.id    COMMENT     :   COMMENT ON COLUMN auditoria.id IS 'Campo pk de la tabla';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.fecha    COMMENT     h   COMMENT ON COLUMN auditoria.fecha IS 'Almacena la fecha del momento en que se realzió la transaccion';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.nombre_tabla    COMMENT     ]   COMMENT ON COLUMN auditoria.nombre_tabla IS 'Almacena el nombre de la tabla que se altero.';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.nombre_schema    COMMENT     _   COMMENT ON COLUMN auditoria.nombre_schema IS 'Almacena el schema la cual pertenece la tabla.';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.pk_tabla    COMMENT     j   COMMENT ON COLUMN auditoria.pk_tabla IS 'Campo que lamacena la identifica del registró que se modifico';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.user_id    COMMENT     s   COMMENT ON COLUMN auditoria.user_id IS 'Id que identifica el usuario que generó el cambio desde la aplicación.';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.user_db    COMMENT     s   COMMENT ON COLUMN auditoria.user_db IS 'Almacena el usuario de la base de dtaos con el cual se generó el cambio';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.ip    COMMENT     X   COMMENT ON COLUMN auditoria.ip IS 'Captura la ip desde la cual se solicitó el cambio';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.mac    COMMENT     Y   COMMENT ON COLUMN auditoria.mac IS 'Almacena la mac desde la cual se generó el cambio';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.transaccion    COMMENT     a   COMMENT ON COLUMN auditoria.transaccion IS 'identifica el tipo de transacción que se realizó';
         	   seguridad       postgres    false    212            �	           0    0    COLUMN auditoria.data_json    COMMENT     V   COMMENT ON COLUMN auditoria.data_json IS 'almacena el estado anterior de los datos.';
         	   seguridad       postgres    false    212            �            1259    25537    auditoria_id_seq    SEQUENCE     r   CREATE SEQUENCE auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE seguridad.auditoria_id_seq;
    	   seguridad       postgres    false    212    4            �	           0    0    auditoria_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE auditoria_id_seq OWNED BY auditoria.id;
         	   seguridad       postgres    false    211            �            1259    25530    function_db_view    VIEW     u  CREATE VIEW function_db_view AS
 SELECT pp.proname AS b_function,
    oidvectortypes(pp.proargtypes) AS b_type_parameters
   FROM (pg_proc pp
     JOIN pg_namespace pn ON ((pn.oid = pp.pronamespace)))
  WHERE ((pn.nspname)::text <> ALL (ARRAY[('pg_catalog'::character varying)::text, ('information_schema'::character varying)::text, ('public'::character varying)::text]));
 &   DROP VIEW seguridad.function_db_view;
    	   seguridad       postgres    false    4            v           2604    24980    archivo id_archivo    DEFAULT     j   ALTER TABLE ONLY archivo ALTER COLUMN id_archivo SET DEFAULT nextval('archivo_id_archivo_seq'::regclass);
 A   ALTER TABLE public.archivo ALTER COLUMN id_archivo DROP DEFAULT;
       public       postgres    false    190    191    191            ~           2604    25031    archivo_autor id_archivo_autor    DEFAULT     �   ALTER TABLE ONLY archivo_autor ALTER COLUMN id_archivo_autor SET DEFAULT nextval('archivo_autor_id_archivo_autor_seq'::regclass);
 M   ALTER TABLE public.archivo_autor ALTER COLUMN id_archivo_autor DROP DEFAULT;
       public       postgres    false    203    202    203                       2604    25039    autor id_autor    DEFAULT     b   ALTER TABLE ONLY autor ALTER COLUMN id_autor SET DEFAULT nextval('autor_id_autor_seq'::regclass);
 =   ALTER TABLE public.autor ALTER COLUMN id_autor DROP DEFAULT;
       public       postgres    false    205    204    205            w           2604    24991    categoria id_categoria    DEFAULT     r   ALTER TABLE ONLY categoria ALTER COLUMN id_categoria SET DEFAULT nextval('categoria_id_categoria_seq'::regclass);
 E   ALTER TABLE public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public       postgres    false    192    193    193            |           2604    25023    comentario id_comentario    DEFAULT     v   ALTER TABLE ONLY comentario ALTER COLUMN id_comentario SET DEFAULT nextval('comentario_id_comentario_seq'::regclass);
 G   ALTER TABLE public.comentario ALTER COLUMN id_comentario DROP DEFAULT;
       public       postgres    false    201    200    201            x           2604    24999    estado id_estado    DEFAULT     f   ALTER TABLE ONLY estado ALTER COLUMN id_estado SET DEFAULT nextval('estado_id_estado_seq'::regclass);
 ?   ALTER TABLE public.estado ALTER COLUMN id_estado DROP DEFAULT;
       public       postgres    false    194    195    195            �           2604    25048    pais id_nacionalidad    DEFAULT     v   ALTER TABLE ONLY pais ALTER COLUMN id_nacionalidad SET DEFAULT nextval('nacionalidad_id_nacionalidad_seq'::regclass);
 C   ALTER TABLE public.pais ALTER COLUMN id_nacionalidad DROP DEFAULT;
       public       postgres    false    206    207    207            t           2604    24964 
   rol id_rol    DEFAULT     Z   ALTER TABLE ONLY rol ALTER COLUMN id_rol SET DEFAULT nextval('rol_id_rol_seq'::regclass);
 9   ALTER TABLE public.rol ALTER COLUMN id_rol DROP DEFAULT;
       public       postgres    false    186    187    187            z           2604    25015 "   subir_descargar id_subir_descargar    DEFAULT     �   ALTER TABLE ONLY subir_descargar ALTER COLUMN id_subir_descargar SET DEFAULT nextval('subir_descargar_id_subir_descargar_seq'::regclass);
 Q   ALTER TABLE public.subir_descargar ALTER COLUMN id_subir_descargar DROP DEFAULT;
       public       postgres    false    198    199    199            y           2604    25007    tags id_tags    DEFAULT     ^   ALTER TABLE ONLY tags ALTER COLUMN id_tags SET DEFAULT nextval('tags_id_tags_seq'::regclass);
 ;   ALTER TABLE public.tags ALTER COLUMN id_tags DROP DEFAULT;
       public       postgres    false    196    197    197            u           2604    24972    usuario id_usuario    DEFAULT     j   ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public       postgres    false    188    189    189            �           2604    25542    auditoria id    DEFAULT     ^   ALTER TABLE ONLY auditoria ALTER COLUMN id SET DEFAULT nextval('auditoria_id_seq'::regclass);
 >   ALTER TABLE seguridad.auditoria ALTER COLUMN id DROP DEFAULT;
    	   seguridad       postgres    false    211    212    212            ,	          0    24977    archivo 
   TABLE DATA               �   COPY archivo (id_archivo, nombre, anio, sinopsis, num_pag, imagen_portada, url, id_usuario, id_estado, id_categoria, tags, id_moderador, estado_mod, modified_by) FROM stdin;
    public       postgres    false    191   YX      8	          0    25028    archivo_autor 
   TABLE DATA               U   COPY archivo_autor (id_archivo_autor, id_autor, id_archivo, modified_by) FROM stdin;
    public       postgres    false    203   �Z      �	           0    0 "   archivo_autor_id_archivo_autor_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('archivo_autor_id_archivo_autor_seq', 58, true);
            public       postgres    false    202            �	           0    0    archivo_id_archivo_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('archivo_id_archivo_seq', 33, true);
            public       postgres    false    190            :	          0    25036    autor 
   TABLE DATA               {   COPY autor (id_autor, nombre, fecha_nacimiento, fecha_muerte, foto, descripcion, id_nacionalidad, modified_by) FROM stdin;
    public       postgres    false    205   �[      �	           0    0    autor_id_autor_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('autor_id_autor_seq', 12, true);
            public       postgres    false    204            .	          0    24988 	   categoria 
   TABLE DATA               J   COPY categoria (id_categoria, categoria, precio, modified_by) FROM stdin;
    public       postgres    false    193   v^      �	           0    0    categoria_id_categoria_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('categoria_id_categoria_seq', 26, true);
            public       postgres    false    192            6	          0    25020 
   comentario 
   TABLE DATA               d   COPY comentario (id_comentario, id_usuario, id_archivo, comentario, fecha, modified_by) FROM stdin;
    public       postgres    false    201   �_      �	           0    0    comentario_id_comentario_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('comentario_id_comentario_seq', 17, true);
            public       postgres    false    200            0	          0    24996    estado 
   TABLE DATA               9   COPY estado (id_estado, estado, modified_by) FROM stdin;
    public       postgres    false    195   Va      �	           0    0    estado_id_estado_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('estado_id_estado_seq', 2, true);
            public       postgres    false    194            �	           0    0     nacionalidad_id_nacionalidad_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('nacionalidad_id_nacionalidad_seq', 68, true);
            public       postgres    false    206            <	          0    25045    pais 
   TABLE DATA               ;   COPY pais (id_nacionalidad, pais, modified_by) FROM stdin;
    public       postgres    false    207   �a      (	          0    24961    rol 
   TABLE DATA               0   COPY rol (id_rol, rol, modified_by) FROM stdin;
    public       postgres    false    187   �c      �	           0    0    rol_id_rol_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('rol_id_rol_seq', 3, true);
            public       postgres    false    186            4	          0    25012    subir_descargar 
   TABLE DATA               t   COPY subir_descargar (id_subir_descargar, id_usuario, id_archivo, concepto, precio, fecha, modified_by) FROM stdin;
    public       postgres    false    199   �c      �	           0    0 &   subir_descargar_id_subir_descargar_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('subir_descargar_id_subir_descargar_seq', 30, true);
            public       postgres    false    198            2	          0    25004    tags 
   TABLE DATA               2   COPY tags (id_tags, tag, modified_by) FROM stdin;
    public       postgres    false    197   Je      �	           0    0    tags_id_tags_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('tags_id_tags_seq', 27, true);
            public       postgres    false    196            *	          0    24969    usuario 
   TABLE DATA               �   COPY usuario (id_usuario, nombre, apellido, documento, telefono, correo, usuario, clave, dinero, id_rol, ip, mac, modified_by) FROM stdin;
    public       postgres    false    189   Ff      �	           0    0    usuario_id_usuario_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('usuario_id_usuario_seq', 11, true);
            public       postgres    false    188            >	          0    25539 	   auditoria 
   TABLE DATA               �   COPY auditoria (id, fecha, nombre_tabla, nombre_schema, pk_tabla, user_id, user_db, ip, mac, transaccion, data_json) FROM stdin;
 	   seguridad       postgres    false    212   �g      �	           0    0    auditoria_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('auditoria_id_seq', 183, true);
         	   seguridad       postgres    false    211            �           2606    24985    archivo PK_id_archivo 
   CONSTRAINT     V   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "PK_id_archivo" PRIMARY KEY (id_archivo);
 A   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "PK_id_archivo";
       public         postgres    false    191    191            �           2606    25033 !   archivo_autor PK_id_archivo_autor 
   CONSTRAINT     h   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "PK_id_archivo_autor" PRIMARY KEY (id_archivo_autor);
 M   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "PK_id_archivo_autor";
       public         postgres    false    203    203            �           2606    25041    autor PK_id_autor 
   CONSTRAINT     P   ALTER TABLE ONLY autor
    ADD CONSTRAINT "PK_id_autor" PRIMARY KEY (id_autor);
 =   ALTER TABLE ONLY public.autor DROP CONSTRAINT "PK_id_autor";
       public         postgres    false    205    205            �           2606    24993    categoria PK_id_categoria 
   CONSTRAINT     \   ALTER TABLE ONLY categoria
    ADD CONSTRAINT "PK_id_categoria" PRIMARY KEY (id_categoria);
 E   ALTER TABLE ONLY public.categoria DROP CONSTRAINT "PK_id_categoria";
       public         postgres    false    193    193            �           2606    25025    comentario PK_id_comentario 
   CONSTRAINT     _   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "PK_id_comentario" PRIMARY KEY (id_comentario);
 G   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "PK_id_comentario";
       public         postgres    false    201    201            �           2606    25001    estado PK_id_estado 
   CONSTRAINT     S   ALTER TABLE ONLY estado
    ADD CONSTRAINT "PK_id_estado" PRIMARY KEY (id_estado);
 ?   ALTER TABLE ONLY public.estado DROP CONSTRAINT "PK_id_estado";
       public         postgres    false    195    195            �           2606    25050    pais PK_id_nacionalidad 
   CONSTRAINT     ]   ALTER TABLE ONLY pais
    ADD CONSTRAINT "PK_id_nacionalidad" PRIMARY KEY (id_nacionalidad);
 C   ALTER TABLE ONLY public.pais DROP CONSTRAINT "PK_id_nacionalidad";
       public         postgres    false    207    207            �           2606    24966    rol PK_id_rol 
   CONSTRAINT     J   ALTER TABLE ONLY rol
    ADD CONSTRAINT "PK_id_rol" PRIMARY KEY (id_rol);
 9   ALTER TABLE ONLY public.rol DROP CONSTRAINT "PK_id_rol";
       public         postgres    false    187    187            �           2606    25017 %   subir_descargar PK_id_subir_descargar 
   CONSTRAINT     n   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "PK_id_subir_descargar" PRIMARY KEY (id_subir_descargar);
 Q   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "PK_id_subir_descargar";
       public         postgres    false    199    199            �           2606    25009    tags PK_id_tags 
   CONSTRAINT     M   ALTER TABLE ONLY tags
    ADD CONSTRAINT "PK_id_tags" PRIMARY KEY (id_tags);
 ;   ALTER TABLE ONLY public.tags DROP CONSTRAINT "PK_id_tags";
       public         postgres    false    197    197            �           2606    24974    usuario PK_id_usuario 
   CONSTRAINT     V   ALTER TABLE ONLY usuario
    ADD CONSTRAINT "PK_id_usuario" PRIMARY KEY (id_usuario);
 A   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "PK_id_usuario";
       public         postgres    false    189    189            �           2606    25547     auditoria pk_seguridad_auditoria 
   CONSTRAINT     W   ALTER TABLE ONLY auditoria
    ADD CONSTRAINT pk_seguridad_auditoria PRIMARY KEY (id);
 M   ALTER TABLE ONLY seguridad.auditoria DROP CONSTRAINT pk_seguridad_auditoria;
    	   seguridad         postgres    false    212    212            �           2620    33829    archivo tg_public_archivo    TRIGGER     �   CREATE TRIGGER tg_public_archivo AFTER INSERT OR DELETE OR UPDATE ON archivo FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 2   DROP TRIGGER tg_public_archivo ON public.archivo;
       public       postgres    false    191    221            �           2620    33828 %   archivo_autor tg_public_archivo_autor    TRIGGER     �   CREATE TRIGGER tg_public_archivo_autor AFTER INSERT OR DELETE OR UPDATE ON archivo_autor FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 >   DROP TRIGGER tg_public_archivo_autor ON public.archivo_autor;
       public       postgres    false    221    203            �           2620    33827    autor tg_public_autor    TRIGGER     �   CREATE TRIGGER tg_public_autor AFTER INSERT OR DELETE OR UPDATE ON autor FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 .   DROP TRIGGER tg_public_autor ON public.autor;
       public       postgres    false    221    205            �           2620    33826    categoria tg_public_categoria    TRIGGER     �   CREATE TRIGGER tg_public_categoria AFTER INSERT OR DELETE OR UPDATE ON categoria FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 6   DROP TRIGGER tg_public_categoria ON public.categoria;
       public       postgres    false    193    221            �           2620    33825    comentario tg_public_comentario    TRIGGER     �   CREATE TRIGGER tg_public_comentario AFTER INSERT OR DELETE OR UPDATE ON comentario FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 8   DROP TRIGGER tg_public_comentario ON public.comentario;
       public       postgres    false    221    201            �           2620    33824    estado tg_public_estado    TRIGGER     �   CREATE TRIGGER tg_public_estado AFTER INSERT OR DELETE OR UPDATE ON estado FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 0   DROP TRIGGER tg_public_estado ON public.estado;
       public       postgres    false    195    221            �           2620    33823    pais tg_public_pais    TRIGGER     �   CREATE TRIGGER tg_public_pais AFTER INSERT OR DELETE OR UPDATE ON pais FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 ,   DROP TRIGGER tg_public_pais ON public.pais;
       public       postgres    false    221    207            �           2620    33822    rol tg_public_rol    TRIGGER     �   CREATE TRIGGER tg_public_rol AFTER INSERT OR DELETE OR UPDATE ON rol FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 *   DROP TRIGGER tg_public_rol ON public.rol;
       public       postgres    false    187    221            �           2620    33821 )   subir_descargar tg_public_subir_descargar    TRIGGER     �   CREATE TRIGGER tg_public_subir_descargar AFTER INSERT OR DELETE OR UPDATE ON subir_descargar FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 B   DROP TRIGGER tg_public_subir_descargar ON public.subir_descargar;
       public       postgres    false    221    199            �           2620    33820    tags tg_public_tags    TRIGGER     �   CREATE TRIGGER tg_public_tags AFTER INSERT OR DELETE OR UPDATE ON tags FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 ,   DROP TRIGGER tg_public_tags ON public.tags;
       public       postgres    false    221    197            �           2620    33814    usuario tg_public_usuario    TRIGGER     �   CREATE TRIGGER tg_public_usuario AFTER INSERT OR DELETE OR UPDATE ON usuario FOR EACH ROW EXECUTE PROCEDURE seguridad.f_log_auditoria();
 2   DROP TRIGGER tg_public_usuario ON public.usuario;
       public       postgres    false    221    189            �           2606    25438    archivo_autor FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    191    2183    203            �           2606    25453    comentario FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    201    2183    191            �           2606    25463    subir_descargar FK_id_archivo    FK CONSTRAINT     �   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "FK_id_archivo" FOREIGN KEY (id_archivo) REFERENCES archivo(id_archivo) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "FK_id_archivo";
       public       postgres    false    191    199    2183            �           2606    25433    archivo_autor FK_id_autor    FK CONSTRAINT     �   ALTER TABLE ONLY archivo_autor
    ADD CONSTRAINT "FK_id_autor" FOREIGN KEY (id_autor) REFERENCES autor(id_autor) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.archivo_autor DROP CONSTRAINT "FK_id_autor";
       public       postgres    false    205    2197    203            �           2606    25423    archivo FK_id_categoria    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_categoria" FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_categoria";
       public       postgres    false    2185    191    193            �           2606    25418    archivo FK_id_estado    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_estado" FOREIGN KEY (id_estado) REFERENCES estado(id_estado) ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_estado";
       public       postgres    false    191    195    2187            �           2606    25428    archivo FK_id_moderador    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_moderador" FOREIGN KEY (id_moderador) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_moderador";
       public       postgres    false    191    189    2181            �           2606    25443    autor FK_id_nacionalidad    FK CONSTRAINT     �   ALTER TABLE ONLY autor
    ADD CONSTRAINT "FK_id_nacionalidad" FOREIGN KEY (id_nacionalidad) REFERENCES pais(id_nacionalidad) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.autor DROP CONSTRAINT "FK_id_nacionalidad";
       public       postgres    false    2199    205    207            �           2606    25468    usuario FK_id_rol    FK CONSTRAINT     �   ALTER TABLE ONLY usuario
    ADD CONSTRAINT "FK_id_rol" FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON UPDATE CASCADE ON DELETE CASCADE;
 =   ALTER TABLE ONLY public.usuario DROP CONSTRAINT "FK_id_rol";
       public       postgres    false    2179    187    189            �           2606    25413    archivo FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY archivo
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.archivo DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    2181    189    191            �           2606    25448    comentario FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY comentario
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.comentario DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    201    2181    189            �           2606    25458    subir_descargar FK_id_usuario    FK CONSTRAINT     �   ALTER TABLE ONLY subir_descargar
    ADD CONSTRAINT "FK_id_usuario" FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.subir_descargar DROP CONSTRAINT "FK_id_usuario";
       public       postgres    false    2181    189    199            ,	   �  x��UMs�0=� ���1�L;�$m9z&����ȕ�;�C{W ���x��}zz+����W|���X�A������D;�?`a��ۇ�x����r��J�$��Y��w6nt^��@��^�o#_���F��U@-��o��,���g�w;jk�{)���-DȃEL��-��Jb�dp�ZQ�Z�ϕu͕w�Mk�_��)|�O��y+��o�n�^P��I�Ϯ(d��r�]OH�J�]��
��J�tgDY����*�?���'r9��7���8���1|�,������C?cĘ�]V��Eޓ[��\D�N����Mc"̌.�܀Oh�E3Z�LQQ�=�(YH��)����t� t/��
�:%p-��CW�+d���;Ȓ+,��(^��^f�ޔ%~Bx��`��lղz��Av4�0�/�����f�6�h��lZ��xU��\�����ʳ*^������2܂�$��8͉�V��0��@FLd����뻐� ����2�l��!g��yJ�� &����<ﱄ��#4���5�-�z�٦!ww��p���(��Eg`�5:\�
�A�$�^��{�2�0}I��}�:v�
T4���q]��N�uJ +��ӂ.u���g������e+�k%u��C�x����o��v�Z�� Ro7      8	   s   x�5���0D�o(�	�<l�
�w��8�x�M�bS�GmIn1���${?4�Nv^+:ZTd��\�'7���T`4l�978�8x�9l��!p�X�3��1�'�"~^��T���($      :	   �  x��TKn�0]ӧ�,��KZ��4Ax����&���QH)���z�^�3���u7( ���f��{��.v�x�d]W����Y!����}��ت�z_����C��,���,/�a��Q�DC!}�2l1c����_U0|u���u�_���A��LV5V��B`?��Byv���p\ԩ�g�)�,<�QG���+�w��h�����ϴ*���C�doC��;����)~�v�sV�I�\m��-?W��Q�q�߰�{�ebA\��,O��$���q;/�J�j\B��U��{�������-Π��v0��{�G�LG
4�z���f���К��w680��-l7Ny��G�e]Ƞv����bt�2�H+�%����E���Hk����H]�@�2yR{?x�M�����5E�"��^�Km�,��&��i=L1�a\��$B�F�p��֡4T?���G״�onr�6����.�ÿo֌{B��ՁEȜ͉��-=��&�@��î�x�CT�<E�ˠ��։��}C�$S�b�Vf�7y��(���������s} �QV4&)�''@�j�B:������d-h�.e��f�5['��	;*�@=D�r���f� ����Q1kPv��y�_� mFN�񈶸�$�!
����=��6SL�`63�%Y��P&�y�e�0%�{�L[��i��UTG�&�Θ�Ȃ�A���C<����qYˉn��:�L&� �1      .	     x�=��N�@E��W��L�sI��"�
��wb"K�L;$��y K_��z���ނG�F/ړ��A�5�O����0�o�a��<Z�rk��T6���� �8�Aʢ4p$���#G6�`� [x�f�x-��KjN�g�4yp�W�W�q&Qs�09h��O!X���|ъNd�B}�����?j[4	v�XN�=���:C����Ƥ<�Ð�&��hl�k��Ӓ�P�t���8��1��:�)����}��UU� եq�      6	   �  x�uS�n�0������r���E��@���ăy�EA��|}��]�$TH3�Y�0��X_�xIs���|������Զ�����E�N�4�!{~��,-�����F;�Y����2������O~����.*/�7��F��N��7�?]�c�cwtPQ)Zi��n6���7
{�����-�ؒ�i)���٧�aV�Q[��u���f��<��%�oy'� �΂6���Ml)7�C���QF���z ���JM���K�[P��׏i!�k�T^�
������
2�9qJ2�Ǘ��N�צ8u�h�C�
�V8K	�C)�e �1);��WA�O��:5�O��ֆ���T�Dp
�
�-i�>=}yx�v���ӆ\��Z���c%FWE��:�?XEN�9����OvЂ�!�OC�AF��whE53ݳ��7�_�(      0	   "   x�3�L,(�/KL����2���W@����� ΰ
M      <	   #  x�E��r� ����t,	!�h;N�L��$q�\�U���"H��U��/�`���o-�E�j9:���P�H����Ń��}/]�1�B;�V�𣳨��B�P��(�=,-�RM���38�9��>B��R���I�k�VF��!��QW�)��9]�sX�C�5�P�#��j�F��Ѧ���֝���P�փ<9 �������]�z<῿�e�KbG�1�kI�`d�Ѥ��4�Dn��'�)����B�'�u���;T"�,�pgEr�9�yt4(��{�N]½�"F#ҽ�񾲂��c
ĉE����6��w�ѢC+[ظ���d�ΰ���K�
x��
V£���1x��_�U�D��L'�֋.����$��li�϶�5tt�8���}�FV9�p|�� ������>H;Z��QUY�Wv^Xg��
�T5<��?(�&�1G�I�w����<��%J��9����xN ��.��5g^N�;>D����_>�*�w��s�[.���&���".o�M
G�O��m6���I�      (	   2   x�3�tL����,.)JL�/���2���OI�s�9C�K�2�A�=... ��g      4	   =  x�}�;N1D�S�����l$BĒq}�^$��F�WVUu9(P������ 0R�P7�)PB� ���y�@�_{��DA��{�AS@�ϗ=��T�4�|:�3�h<.���
10��!Xɕ'�`�r��yɜ��m��3\�����>�xW�m�+���5'�QӶ��&n3*�H�H�9K�%}�6j4/�X���!g1O���) �+�af�z#��d�k��Py1��ڔ��%����`�3m�`\GGW
��aiH�SS�6�s���Z�T��a�N����J%p�TP��g��v���u��hp�&���,��,�7t�1      2	   �   x�=��N�0���S�	I�n;�;��e^q�bp�J�=�a��/����Gޫ�nSy�K=~[�a������F�3�XR9j`��#i�9��	�y.`##E�KX���F���*6���R`��s�lvnXZ���6W��e{4�D�t�<�~P��7�&���9�ҧh��p�!��,�9���L'�{_�B�(-����lcQ�Ҁ��k��6q?؀JW������Th�      *	   \  x�u��N�0E��_�T�#I�KaR�b3m}�1�!��3q��h�����93���Mh-��������$��j��������y�v[_\��c���
Kj�s�m�7C*W�u�(�$)�S�Ģ��������I�e�牆��yƘ\nmkj>�/7��u����UX��H�=tԢ�np2��O�P��� R&��\J���튦#r2�ϣ@�5�/;��6m�>=��B�r�o����:\�mG��w������^����0�:6ֹ��и
��H��QR�B_�=*q����	����!-އY�ӝJ�b��u0?*�rx��Ui�I���/����q���      >	      x��]Ko�F>ۿB�sLtU�uJ��!@^؝��v4�E�de,f�v�$��"��z��� �VUuu�W��E�B��P S�SF"@sf�^m7�r=��Vۏ���
�~��jUo�����o�~��o>�����rU-���\>U����t�n�(����W���r[�Y������/��Aq
��D�+����������=B��`Y?~\W����}���a[-<�����[w�l�X-���R�g�=U��^6�Q��s.�������jn���.u1����-rv�����?vt̗���ÜsͰ���k�^Y=?��/'��b},g����ֈ��"�S�
)��t�̿�����������F�̈́�E(}Q?ߠm)7瞀[���׳P����j�ۺ�n������F�=F�-�7	��m�|Y(_6EQH����i�t�T�2��4��<��)��yb}��N(m[�i�m��\���0a�Ĕj����*׳���S��j�T�
w���<O&�.�ʧ�^�K���]��X��]�M�[�#_��������/�8:�nn4��ʩ�j]�=V�˵
�bʱ��?A��dV�hd�C��r���� �@�ټ�8�cX����2V���4IӖ4.)!Gc"c�<4�8eϋL�p�{�ǭ��\!7�����1�
�T�s������1y���S�؃Q�w�8%8EV0��P��8�	7���Y �3��2��g�1od cdа)B6�	p
�Sg��U,Φ
�(�8�<��yJ���Ɔ��zq߲���k�UL����l���:�C¹чB�ؑ��I<�pU�]�4��s�B�������W�D�!��L������F+`�����e	B��1�]�`��"��~�u��������zM���7S����t�$hi���#��?�g�	>/��~��^���tk;rubʰ�L���ȯ���P�Q�m9JiQ��Hwx����cҩ�-���a���>��_X-�\&/����~m~-w����6�k��3b��ܲ� J��]�:Ƥ-G�'DO���Ņ��,��&&8��.�Z,�Z�h��������|�s�v�3�Y0����)Hǭ^�M�M�Ô�� ;M��zɀp�\����㕸�	�&��G�S����!)�\��73�m�a��AH��"����-pG�WB3>�(�1��Xq�����g��D�X(bd>j��na��rt��U��]NN ����>/*qn��.�$d�8���p��)=����G��P��ڨpN��d�	<8�ڪ��q"N����f8����_��HPj�CP�`"�H�i�FW[���6C���А�.��tz�7���j?���!��x���������_Q��}���YH�� !� ���œ��y1vP�sԣ����3^H4����}��9�1G>5�6�;��X��t{�*w߹������T�ՙ�;�N��;L�ޕ_G���7��wu��]٘����slxssf.d8X��@�IҪd�]y=}� k�T��E����n%�Q�@o��g2L@�N1�^/ʮ�⇀��>X��P"tJ��>F��tG(��m9F)��IQt��7ۏ���]����r}�ôd�N���Z�Mǻ��-uy��$p虽����J�m�ǐ�m:NR����Xݹlz��4�@���Y��j3ߴ>�+E�8S��>ޮʇ�Ǵ2,����^?�wmq��7��[m���~���]DyˋO�g�׋���G�y���=7�y�mf�����w�����?�?���Lp�6C����o���I}P�Rٮm�-�O����������\�f!��&9�
v�/n�������r�`�h��,��4�m)��!�f�(xȁ��JQ�t��#�%���0�B�����`��2�;a%Ϙ���W����q�#[C812����1K���T�������X!�����[Jw��wU��yX�˻�`�Z:sl��z�2�a��`�'���de	ZV�j9)'sq���]��O�T=�{j٬����e�V���J�H�-��.S9�#4����<��J�8d����Jt�*��!�Y-Y� &,?5&M�%C�js��BS��]���E7�#��!DeJPI�ζ��2bI$�L�>����D%�YnC����T�S��@���U{���6U'C�B��$;����e�tOR׫:utI2D�~&
��tzc�쉴� ��^׳���X�P[w]P&w�Eq�3*3�f�X3}��G �� ���KN�b9�@�T�l���d��A�n�ȵ|����6o��:`J��
Rs�"
}R��ŏ=��>d�{}�BO|��T���X6�P�����k�m*m(��yq�B'y��m�<g�N��#:H���f�C�AE?;�����:-3�=ݗ:̜�jM��0����jX>��tka��TI��ޕ
 vr�]D�w�$P��{���j���j� I@�I��[э��|�H�u���@��M��P���Fk6#HcP6�c>�4�g�t���E�ς��r`��G<��������g�_���u��I�$f����t �G��R!����\�LFe(�*Dg����P�n�S��v^)�� o�_ҟ��;��fR]���A�,� ^��,���Ӻ�Lljns�.?o���6��Z�X/�
�g�>}�whT%&m�S����ba�Q�ӭ;��C�=�� ׫����$'<�U�������m��'�b�0�	� ��Ѧl��*�j���U ��+�I���d:&���=�b�3@�0FY�XB�Ʃ-���!fդ�H���2���9x���0���\e�|k�B�fۑ-�u:3�Z�5!�>`*ut�� y�T����+-C.��%���^-I���D��(�cUt��fd
�C�֊A�D�87h��� ��Yљ&#�vbJ�����rʿi&0�L4,ɛ�ڀА~w�D������:,dĕ�PM0s�gtS�=�3D�6�L��X�BČp�&��'�Ȑg�A��(��P	Ft�t�\���ﳕ�� DF�֪ 2���@'�{]�(� ��Ɗ�M��P{��Pg��.#4f��@f�wƶ��w��u(���l�i�7x���c[�τ��i݊��I!���<���%!Da�_fj�T�A=�֜���\��4L�=Rf��F޹��(E��#u�UfPBt��}l�J�>�������U�&���N�_%��iu�}�U�Y��"�lOJx�l����G� !�����������--��mK{J��%�b�!���$v�;xI8���
�F�UA
�0&��.`U�Ŭ��i���	>��e,=6�
���6|��A|����|p"�5�JoPfO��U�%qҩa�T��%��'���ȚY�$�K���v�961e�-�:��D3��l�mJ�A�k^'��D��O��$$Hy�F 	�A��x���ƃRb���L�^`e����<1��v��+1uغ0����?&XJ}�%ݎ�*��z��#��T��A;#���fČ������&B	���}����J�S:Tt����i�F±��ka Ȯ��O˥�B<���{&���Y9{ms(�I�ۗ�ϼ�|�}' �@�̄Ţ`���O���'|'�݉y㙄֙���k�y��N�I�Uӻ°f��LƜ�z5P+�wh���vb�*$�neܗh��'�����0��ZHA��|v�y~�6Gr�[�6@4eˆ%)BuI�_�m�����Z��fWp���L��ө8�u�	��n��o�)��`�&�M��'��2��`P�
_�T�{��0�L�psMPRg�7M=�b��sZuH��/h$�A楘#uT���8����˞���p��������qHP�*�>;��g��xفۥ����T����N�ݜ� N�8��Ć�'��[$<�H�?�?RK�2ڹB8����[�P( c���19�9`�W�L�5� ���j�o�� ��q3 ��af{��t&T�����>'��Hw?,   ��cvI��ξXF5��&����ޏc���(m�2�񢄳�c}kѪ��kp�Y6��uRA*����	Oa��&a,�$�f�+ˉ IN�1�=���%� ��n]H�s��X���Y����lc4Mt�(:����s`�k�fd��`D۩x#��"B^�q�@�+�)n �S�W������c�1ko��T#��}�DrS����@�}��@%2��c��"Bw|�IA �]G��"�:��w�`�o����w·c[����/#���1 #`p��t����}R�d��g�
he3d�V���~�iU��m 0؜2�2�<�%;}uYs��PX�uG{��#Ŕ�ԄH�R��&��D��-2t�z�U�Rz^/G3v�y����a�|�~�|�82�������+�
�;��.�����;�Q���Q�+A� ��������(��
�n(���IE>���&�Ԧh���"��֧���U����o�����s3     