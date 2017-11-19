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
    public class Dao_Registrar_usuario
    {
        //------------------------------------------------------------------------
        public DataTable consultar_usuario(string usuario)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_usuario", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_usuario", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_usuario", NpgsqlDbType.Varchar, 30).Value = usuario;
                dataAdapter.SelectCommand.Parameters.Add("@usuario", SqlDbType.VarChar, 50).Value = usuario;

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
        public DataTable consultar_documento(String documento)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_documento", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_documento", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_documento", NpgsqlDbType.Bigint, 10).Value = documento;
                dataAdapter.SelectCommand.Parameters.Add("@documento", SqlDbType.BigInt).Value = documento;

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
        public DataTable consultar_correo(string correo)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_correo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_correo", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 30).Value = correo;
                dataAdapter.SelectCommand.Parameters.Add("@correo", SqlDbType.VarChar, 50).Value = correo;

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
        public void insertar_usuario(E_usuario user)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_usuario", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_usuario", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                /*
                dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = user.Nombre;
                dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Varchar, 30).Value = user.Apellido;
                dataAdapter.SelectCommand.Parameters.Add("_documento", NpgsqlDbType.Bigint, 10).Value = user.Documento;
                dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Varchar, 10).Value = user.Telefono;
                dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Varchar, 30).Value = user.Correo;
                dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar, 30).Value = user.UserName;
                dataAdapter.SelectCommand.Parameters.Add("_clave", NpgsqlDbType.Varchar, 30).Value = user.Clave;
                dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user.UserCambio;
                 */
                dataAdapter.SelectCommand.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = user.Nombre;
                dataAdapter.SelectCommand.Parameters.Add("@apellido", SqlDbType.VarChar, 50).Value = user.Apellido;
                dataAdapter.SelectCommand.Parameters.Add("@documento", SqlDbType.BigInt).Value = user.Documento;
                dataAdapter.SelectCommand.Parameters.Add("@telefono", SqlDbType.VarChar, 10).Value = user.Telefono;
                dataAdapter.SelectCommand.Parameters.Add("@correo", SqlDbType.VarChar, 50).Value = user.Correo;
                dataAdapter.SelectCommand.Parameters.Add("@user", SqlDbType.VarChar, 50).Value = user.UserName;
                dataAdapter.SelectCommand.Parameters.Add("@clave", SqlDbType.VarChar, 50).Value = user.Clave;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = user.UserCambio;


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
           // return usuarios;
        }

    }//Dao_Registrar_usuario

}//Principal
