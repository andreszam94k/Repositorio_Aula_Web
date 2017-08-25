using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Descripción breve de Modificar
/// </summary>
public class Modificar
{
	public Modificar()
	{
		//
		// TODO: Agregar aquí la lógica del constructor
		//
	}

    //------------------------------------------------------------------------
    //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
    //ok
    public DataTable cerrar_session(string id_user, string user_cambio)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_cerrar_session", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id_user;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user_cambio;

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
    public DataTable modificar_rol(Encapsular_moderador user)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_cambiar_rol", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = user.IdUser;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = user.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Varchar, 30).Value = user.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_documento", NpgsqlDbType.Bigint, 10).Value = user.Documento;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Varchar, 10).Value = user.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 30).Value = user.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar, 30).Value = user.UserName;
            dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar, 30).Value = user.Clave;
            dataAdapter.SelectCommand.Parameters.Add("_dinero", NpgsqlDbType.Integer).Value = user.Dinero;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol",NpgsqlDbType.Integer).Value = user.IdRol;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user.UserCambio;


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
    public DataTable modificar_categoria(Encapsular_categoria categoria)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_modificar_categoria", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = categoria.IdCategoria;
            dataAdapter.SelectCommand.Parameters.Add("_categoria", NpgsqlDbType.Varchar, 30).Value = categoria.Categoria;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = categoria.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = categoria.UserCambio;


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
    public DataTable modificar_archivo(Encapsular_aprobar_archivo archivo)
    {
        DataTable usuarios = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

        try
        {
            //conexion y mandamos los parametros
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_aprobar_archivo", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
            dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = archivo.IdArchivo;
            dataAdapter.SelectCommand.Parameters.Add("_id_categoria", NpgsqlDbType.Integer).Value = archivo.IdCategoria;
            dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = archivo.IdUser;
            dataAdapter.SelectCommand.Parameters.Add("_dinero", NpgsqlDbType.Integer).Value = archivo.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = archivo.UserCambio;


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