using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Insertar
/// </summary>
public class Insertar
{
	public Insertar()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_usuario(Encapsular_usuario user)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_usuario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = user.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Varchar, 30).Value = user.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_documento", NpgsqlDbType.Bigint, 10).Value = user.Documento;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Varchar, 10).Value = user.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 30).Value = user.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar, 30).Value = user.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar, 30).Value = user.Clave;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_ip_mac(Encapsular_loggin_user datos_loggin)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_ip_mac", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = datos_loggin.IdUser;
            dataAdapter.SelectCommand.Parameters.Add("_ip", NpgsqlDbType.Varchar, 50).Value = datos_loggin.Ip;
            dataAdapter.SelectCommand.Parameters.Add("_mac", NpgsqlDbType.Varchar, 50).Value = datos_loggin.Mac;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = datos_loggin.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_autor(Encapsular_autor autor)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_autor", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = autor.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_birth", NpgsqlDbType.Varchar, 30).Value = autor.FechaBirth;
            dataAdapter.SelectCommand.Parameters.Add("_fecha_death", NpgsqlDbType.Varchar, 30).Value = autor.FechaDeath;
            dataAdapter.SelectCommand.Parameters.Add("_foto", NpgsqlDbType.Text).Value = autor.Foto;
            dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Varchar, 200).Value = autor.Descripcion;
            dataAdapter.SelectCommand.Parameters.Add("_nacionalidad", NpgsqlDbType.Integer).Value = autor.Nacionalidad;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = autor.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_categoria(Encapsular_categoria categoria)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_categoria", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_categoria", NpgsqlDbType.Varchar, 30).Value = categoria.Categoria;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = categoria.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = categoria.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_tag(Encapsular_tag tag)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_tags", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_tag", NpgsqlDbType.Varchar, 30).Value = tag.Tag;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = tag.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_archivo(Encapsular_archivo archivo)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_archivo", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol", NpgsqlDbType.Integer).Value = archivo.IdMod;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = archivo.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_fecha", NpgsqlDbType.Varchar, 30).Value = archivo.Fecha;
            dataAdapter.SelectCommand.Parameters.Add("_sinopsis", NpgsqlDbType.Varchar, 1000).Value = archivo.Sinopsis;
            dataAdapter.SelectCommand.Parameters.Add("_num_pag", NpgsqlDbType.Integer).Value = archivo.NumPag;
            dataAdapter.SelectCommand.Parameters.Add("_foto", NpgsqlDbType.Text).Value = archivo.Foto;
            dataAdapter.SelectCommand.Parameters.Add("_link", NpgsqlDbType.Text).Value = archivo.Link;
            dataAdapter.SelectCommand.Parameters.Add("_id_user",NpgsqlDbType.Integer).Value = archivo.IdUser;
            dataAdapter.SelectCommand.Parameters.Add("_id_categoria", NpgsqlDbType.Integer).Value = archivo.IdCategoria;
            dataAdapter.SelectCommand.Parameters.Add("_tags", NpgsqlDbType.Varchar, 300).Value = archivo.Tags;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = archivo.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_archivo_autor(Encapsular_archivo_autor archivo_autor)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_archivo_autor", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = archivo_autor.NombreAutor;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = archivo_autor.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //0k
    public DataTable insertar_subir_descargar(Encapsular_subir_descargar subir_descargar)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_subir_descargar", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_user", NpgsqlDbType.Integer).Value = subir_descargar.IdUser;
            dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = subir_descargar.IdArchivo;
            dataAdapter.SelectCommand.Parameters.Add("_concepto", NpgsqlDbType.Varchar, 30).Value = subir_descargar.Concepto;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = subir_descargar.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = subir_descargar.UserCambio;

            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_descargar_archivo(Encapsular_descargar_archivo descargar)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_descargar_archivo", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = descargar.IdUser;
            dataAdapter.SelectCommand.Parameters.Add("_dinero", NpgsqlDbType.Integer).Value = descargar.Dinero;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = descargar.UserCambio;


            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable insertar_comentario(Encapsular_comentario comentario)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_comentario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = comentario.IdUser;
            dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = comentario.IdArchivo;
            dataAdapter.SelectCommand.Parameters.Add("_comentario", NpgsqlDbType.Varchar, 200).Value = comentario.Comentario;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = comentario.UserCambio;


            //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar).Value = user.UserName;
            //dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar).Value = user.Clave;



            conection.Open();
            dataAdapter.Fill(usuarios);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }
        return usuarios;
    }

}//principal