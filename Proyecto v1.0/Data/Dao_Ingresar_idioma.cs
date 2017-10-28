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

namespace Data
{
    public class Dao_Ingresar_idioma
    {
        //------------------------------------------------------------------------
        public DataTable consultar_idioma(string nombre)
        {
            DataTable usuarios = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_consulta_idioma", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = nombre;

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
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_consulta_terminacion", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_terminacion", NpgsqlDbType.Text).Value = terminacion;

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
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_insertar_idioma", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_idioma", NpgsqlDbType.Text).Value = idioma.Name_idioma;
                dataAdapter.SelectCommand.Parameters.Add("_terminacion", NpgsqlDbType.Text).Value = idioma.Terminacion;
                
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
            //return usuarios;
        }

        //------------------------------------------------------------------------
        public DataTable mostrar_idioma()
        {
            DataTable usuarios = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_mostrar_idioma", conection);
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
