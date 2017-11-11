using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;
using System.Data.SqlClient;

namespace Data
{
    public class Dao_Registrar_moderador
    {
        //------------------------------------------------------------------------
        public DataTable consultar_rol(string rol)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_rol", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_rol", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_rol", NpgsqlDbType.Integer).Value = rol;
                dataAdapter.SelectCommand.Parameters.Add("@_rol", SqlDbType.Int).Value = rol;

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
        public DataTable modificar_rol(E_moderador user)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_cambiar_rol", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_cambiar_rol", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                /*
                dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = user.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = user.Nombre;
                dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Varchar, 30).Value = user.Apellido;
                dataAdapter.SelectCommand.Parameters.Add("_documento", NpgsqlDbType.Bigint, 10).Value = user.Documento;
                dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Varchar, 10).Value = user.Telefono;
                dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 30).Value = user.Correo;
                dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar, 30).Value = user.UserName;
                dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar, 30).Value = user.Clave;
                dataAdapter.SelectCommand.Parameters.Add("_dinero", NpgsqlDbType.Integer).Value = user.Dinero;
                dataAdapter.SelectCommand.Parameters.Add("_id_rol", NpgsqlDbType.Integer).Value = user.IdRol;
                dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user.UserCambio;
                */
                dataAdapter.SelectCommand.Parameters.Add("@_id", SqlDbType.Int).Value = user.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@_nombre", SqlDbType.VarChar, 50).Value = user.Nombre;
                dataAdapter.SelectCommand.Parameters.Add("@_apellido", SqlDbType.VarChar, 50).Value = user.Apellido;
                dataAdapter.SelectCommand.Parameters.Add("@_documento", SqlDbType.BigInt).Value = user.Documento;
                dataAdapter.SelectCommand.Parameters.Add("@_telefono", SqlDbType.VarChar, 10).Value = user.Telefono;
                dataAdapter.SelectCommand.Parameters.Add("@_correo", SqlDbType.VarChar, 50).Value = user.Correo;
                dataAdapter.SelectCommand.Parameters.Add("@_user", SqlDbType.VarChar, 50).Value = user.UserName;
                dataAdapter.SelectCommand.Parameters.Add("@_clave", SqlDbType.VarChar, 50).Value = user.Clave;
                dataAdapter.SelectCommand.Parameters.Add("@_dinero", SqlDbType.Int).Value = user.Dinero;
                dataAdapter.SelectCommand.Parameters.Add("@_id_rol", SqlDbType.Int).Value = user.IdRol;
                dataAdapter.SelectCommand.Parameters.Add("@_user_cambio", SqlDbType.Int).Value = user.UserCambio;



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

    }//Dao_Registrar_moderador

}//Principal
