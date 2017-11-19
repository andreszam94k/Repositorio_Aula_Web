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
    public class Dao_Ingresar_idioma
    {
        //------------------------------------------------------------------------
        public DataTable consultar_idioma(string nombre)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_consulta_idioma", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_idioma", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = nombre;
                dataAdapter.SelectCommand.Parameters.Add("@nombre", SqlDbType.VarChar, 50).Value = nombre;

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
        public DataTable consultar_terminacion(string terminacion)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_consulta_terminacion", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_terminacion", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_terminacion", NpgsqlDbType.Text).Value = terminacion;
                dataAdapter.SelectCommand.Parameters.Add("@terminacion",SqlDbType.VarChar, 50).Value = terminacion;

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
        public void insertar_idioma(U_Ingresar_idioma idioma)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_insertar_idioma", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_idioma", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_idioma", NpgsqlDbType.Text).Value = idioma.Name_idioma;
                //dataAdapter.SelectCommand.Parameters.Add("_terminacion", NpgsqlDbType.Text).Value = idioma.Terminacion;
                dataAdapter.SelectCommand.Parameters.Add("@idioma", SqlDbType.Text).Value = idioma.Name_idioma;
                dataAdapter.SelectCommand.Parameters.Add("@terminacion", SqlDbType.Text).Value = idioma.Terminacion;

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
        public DataTable mostrar_idioma()
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_mostrar_idioma", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_mostrar_idioma", conection);
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



    }//clase

}//principal
