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
    public class Dao_Agregar_tag
    {
        //------------------------------------------------------------------------
        public DataTable consultar_tag(string tag)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_tags", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_tags", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_tag", NpgsqlDbType.Varchar, 30).Value = tag;
                dataAdapter.SelectCommand.Parameters.Add("@tag", SqlDbType.VarChar, 50).Value = tag;

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
        public void insertar_tag(E_tag tag)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_tags", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_tags", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_tag", NpgsqlDbType.Varchar, 30).Value = tag.Tag;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = tag.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@tag", SqlDbType.VarChar, 50).Value = tag.Tag;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = tag.UserCambio;



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

        //------------------------------------------------------------------------
        public DataTable mostrar_tags()
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_mostrar_tags", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_mostrar_tags", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

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
        public DataTable eliminar_tag(String id, String user_cambio)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_eliminar_tags", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_eliminar_tags", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user_cambio;
                dataAdapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = id;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = user_cambio;

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


    }//Dao_Agregar_tag

}//principal
