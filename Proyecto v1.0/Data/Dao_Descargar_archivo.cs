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
    public class Dao_Descargar_archivo
    {
        //------------------------------------------------------------------------
        public DataTable ver_archivo(string id_archivo)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_ver_archivo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_ver_archivo", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = id_archivo;
                dataAdapter.SelectCommand.Parameters.Add("@id_archivo", SqlDbType.Int).Value = id_archivo;

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
        public DataTable consultar_comentarios(string id_archivo)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consultar_comentarios", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consultar_comentarios", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = id_archivo;
                dataAdapter.SelectCommand.Parameters.Add("@id_archivo", SqlDbType.Int).Value = id_archivo;

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
        public void insertar_descargar_archivo(E_descargar_archivo descargar)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_descargar_archivo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_descargar_archivo", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = descargar.IdUser;
                //dataAdapter.SelectCommand.Parameters.Add("_dinero", NpgsqlDbType.Integer).Value = descargar.Dinero;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = descargar.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = descargar.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@dinero", SqlDbType.Int).Value = descargar.Dinero;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = descargar.UserCambio;


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
        //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
        public void insertar_subir_descargar(E_subir_descargar subir_descargar)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_subir_descargar", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_subir_descargar", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id_user", NpgsqlDbType.Integer).Value = subir_descargar.IdUser;
                //dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = subir_descargar.IdArchivo;
                //dataAdapter.SelectCommand.Parameters.Add("_concepto", NpgsqlDbType.Varchar, 30).Value = subir_descargar.Concepto;
                //dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = subir_descargar.Precio;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = subir_descargar.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@id_user", SqlDbType.Int).Value = subir_descargar.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@id_archivo", SqlDbType.Int).Value = subir_descargar.IdArchivo;
                dataAdapter.SelectCommand.Parameters.Add("@concepto", SqlDbType.VarChar, 50).Value = subir_descargar.Concepto;
                dataAdapter.SelectCommand.Parameters.Add("@precio", SqlDbType.Int).Value = subir_descargar.Precio;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = subir_descargar.UserCambio;



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
        //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
        public void insertar_comentario(E_comentario comentario)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_comentario", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_comentario", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = comentario.IdUser;
                //dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = comentario.IdArchivo;
                //dataAdapter.SelectCommand.Parameters.Add("_comentario", NpgsqlDbType.Varchar, 200).Value = comentario.Comentario;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = comentario.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = comentario.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@id_archivo", SqlDbType.Int).Value = comentario.IdArchivo;
                dataAdapter.SelectCommand.Parameters.Add("@comentario", SqlDbType.VarChar, 200).Value = comentario.Comentario;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = comentario.UserCambio;


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

    }//Dao_Descargar_archivo

}//principal
