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
    public class Dao_Ingresar_autor
    {
        //------------------------------------------------------------------------
        //ok
        public DataTable mostrar_pais()
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_mostrar_pais", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_mostrar_pais", conection);
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
        public DataTable consultar_autor(string nom_autor)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_autor", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_autor", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_nom_autor", NpgsqlDbType.Varchar, 30).Value = nom_autor;
                dataAdapter.SelectCommand.Parameters.Add("@_nom_autor", SqlDbType.VarChar, 50).Value = nom_autor;

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
        public void insertar_autor(E_autor autor)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_autor", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_autor", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = autor.Nombre;
                //dataAdapter.SelectCommand.Parameters.Add("_fecha_birth", NpgsqlDbType.Varchar, 30).Value = autor.FechaBirth;
                //dataAdapter.SelectCommand.Parameters.Add("_fecha_death", NpgsqlDbType.Varchar, 30).Value = autor.FechaDeath;
                //dataAdapter.SelectCommand.Parameters.Add("_foto", NpgsqlDbType.Text).Value = autor.Foto;
                //dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Varchar, 200).Value = autor.Descripcion;
                //dataAdapter.SelectCommand.Parameters.Add("_nacionalidad", NpgsqlDbType.Integer).Value = autor.Nacionalidad;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = autor.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@_nombre", SqlDbType.VarChar, 50).Value = autor.Nombre;
                dataAdapter.SelectCommand.Parameters.Add("@_fecha_birth", SqlDbType.VarChar, 50).Value = autor.FechaBirth;
                dataAdapter.SelectCommand.Parameters.Add("@_fecha_death", SqlDbType.VarChar, 50).Value = autor.FechaDeath;
                dataAdapter.SelectCommand.Parameters.Add("@_foto", SqlDbType.Text).Value = autor.Foto;
                dataAdapter.SelectCommand.Parameters.Add("@_descripcion", SqlDbType.VarChar, 200).Value = autor.Descripcion;
                dataAdapter.SelectCommand.Parameters.Add("@_nacionalidad", SqlDbType.Int).Value = autor.Nacionalidad;
                dataAdapter.SelectCommand.Parameters.Add("@_user_cambio", SqlDbType.Int).Value = autor.UserCambio;


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


    }//Dao_Ingresar_autor

}//Principal
