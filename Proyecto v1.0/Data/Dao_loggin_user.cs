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
    public class Dao_loggin_user
    {
        //----------------------------------------------------------------------
        public DataTable loggin_user(E_loggin_user datos_loggin)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);
            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_loggin_usuario", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_loggin_usuario", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_user", NpgsqlDbType.Varchar, 30).Value = datos_loggin.User;
                //dataAdapter.SelectCommand.Parameters.Add("_password", NpgsqlDbType.Varchar, 30).Value = datos_loggin.Clave;
                dataAdapter.SelectCommand.Parameters.Add("@_user", SqlDbType.VarChar, 50).Value = datos_loggin.User;
                dataAdapter.SelectCommand.Parameters.Add("@_password", SqlDbType.VarChar, 50).Value = datos_loggin.Clave;

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
        public DataTable cerrar_session(string id_user, string user_cambio)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_cerrar_session", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_cerrar_session", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id_user;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user_cambio;
                dataAdapter.SelectCommand.Parameters.Add("@_id", SqlDbType.Int).Value = id_user;
                dataAdapter.SelectCommand.Parameters.Add("@_user_cambio", SqlDbType.Int).Value = user_cambio;

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
        public void insertar_ip_mac(E_loggin_user datos_loggin)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_ip_mac", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_ip_mac", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = datos_loggin.IdUser;
                //dataAdapter.SelectCommand.Parameters.Add("_ip", NpgsqlDbType.Varchar, 50).Value = datos_loggin.Ip;
                //dataAdapter.SelectCommand.Parameters.Add("_mac", NpgsqlDbType.Varchar, 50).Value = datos_loggin.Mac;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = datos_loggin.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@_id", SqlDbType.Int).Value = datos_loggin.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@_ip", SqlDbType.VarChar, 50).Value = datos_loggin.Ip;
                dataAdapter.SelectCommand.Parameters.Add("@_mac", SqlDbType.VarChar, 50).Value = datos_loggin.Mac;
                dataAdapter.SelectCommand.Parameters.Add("@_user_cambio", SqlDbType.Int).Value = datos_loggin.UserCambio;


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
            //return usuarios;
        }


    }//Dao


}//principal
