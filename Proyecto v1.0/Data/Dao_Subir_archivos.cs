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
    public class Dao_Subir_archivos
    {

        //------------------------------------------------------------------------
        public DataTable mostrar_archivo()
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_mostrar_archivo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_mostrar_archivo", conection);
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
        public DataTable mostrar_categoria_archivo()
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_mostrar_categoria_archivo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_mostrar_categoria_archivo", conection);
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
        public DataTable mostrar_autor()
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_mostrar_autor", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_mostrar_autor", conection);
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
        public DataTable consultar_archivo_nombre(string nombre)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_archivo_nombre", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_archivo_nombre", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = nombre;
                dataAdapter.SelectCommand.Parameters.Add("@_nombre", SqlDbType.VarChar, 50).Value = nombre;

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
        public DataTable consultar_categoria(string categoria)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_categoria", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_categoria", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_categoria", NpgsqlDbType.Varchar, 30).Value = categoria;
                dataAdapter.SelectCommand.Parameters.Add("@_categoria", SqlDbType.VarChar, 50).Value = categoria;

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
        public void insertar_archivo(E_archivo archivo)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_archivo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_archivo", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                /*
                dataAdapter.SelectCommand.Parameters.Add("_id_rol", NpgsqlDbType.Integer).Value = archivo.IdMod;
                dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = archivo.Nombre;
                dataAdapter.SelectCommand.Parameters.Add("_fecha", NpgsqlDbType.Varchar, 30).Value = archivo.Fecha;
                dataAdapter.SelectCommand.Parameters.Add("_sinopsis", NpgsqlDbType.Varchar, 1000).Value = archivo.Sinopsis;
                dataAdapter.SelectCommand.Parameters.Add("_num_pag", NpgsqlDbType.Integer).Value = archivo.NumPag;
                dataAdapter.SelectCommand.Parameters.Add("_foto", NpgsqlDbType.Text).Value = archivo.Foto;
                dataAdapter.SelectCommand.Parameters.Add("_link", NpgsqlDbType.Text).Value = archivo.Link;
                dataAdapter.SelectCommand.Parameters.Add("_id_user", NpgsqlDbType.Integer).Value = archivo.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("_id_categoria", NpgsqlDbType.Integer).Value = archivo.IdCategoria;
                dataAdapter.SelectCommand.Parameters.Add("_tags", NpgsqlDbType.Varchar, 300).Value = archivo.Tags;
                dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = archivo.UserCambio;
                */
                dataAdapter.SelectCommand.Parameters.Add("@_id_rol", SqlDbType.Int).Value = archivo.IdMod;
                dataAdapter.SelectCommand.Parameters.Add("@_nombre", SqlDbType.VarChar, 50).Value = archivo.Nombre;
                dataAdapter.SelectCommand.Parameters.Add("@_fecha", SqlDbType.VarChar, 50).Value = archivo.Fecha;
                dataAdapter.SelectCommand.Parameters.Add("@_sinopsis", SqlDbType.VarChar, 50).Value = archivo.Sinopsis;
                dataAdapter.SelectCommand.Parameters.Add("@_num_pag", SqlDbType.Int).Value = archivo.NumPag;
                dataAdapter.SelectCommand.Parameters.Add("@_foto", SqlDbType.Text).Value = archivo.Foto;
                dataAdapter.SelectCommand.Parameters.Add("@_link", SqlDbType.Text).Value = archivo.Link;
                dataAdapter.SelectCommand.Parameters.Add("@_tags", SqlDbType.VarChar, 800).Value = archivo.Tags;
                dataAdapter.SelectCommand.Parameters.Add("@_id_user", SqlDbType.Int).Value = archivo.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@_id_categoria", SqlDbType.Int).Value = archivo.IdCategoria;
                dataAdapter.SelectCommand.Parameters.Add("@_user_cambio", SqlDbType.Int).Value = archivo.UserCambio;



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
        public void insertar_archivo_autor(E_archivo_autor archivo_autor)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_insertar_archivo_autor", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_archivo_autor", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Varchar, 30).Value = archivo_autor.NombreAutor;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = archivo_autor.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@_nombre", SqlDbType.VarChar, 50).Value = archivo_autor.NombreAutor;
                dataAdapter.SelectCommand.Parameters.Add("@_user_cambio", SqlDbType.Int).Value = archivo_autor.UserCambio;



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
                /*
                dataAdapter.SelectCommand.Parameters.Add("_id_user", NpgsqlDbType.Integer).Value = subir_descargar.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = subir_descargar.IdArchivo;
                dataAdapter.SelectCommand.Parameters.Add("_concepto", NpgsqlDbType.Varchar, 30).Value = subir_descargar.Concepto;
                dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = subir_descargar.Precio;
                dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = subir_descargar.UserCambio;
                */
                dataAdapter.SelectCommand.Parameters.Add("@_id_user", SqlDbType.Int).Value = subir_descargar.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@_id_archivo", SqlDbType.Int).Value = subir_descargar.IdArchivo;
                dataAdapter.SelectCommand.Parameters.Add("@_concepto", SqlDbType.VarChar, 50).Value = subir_descargar.Concepto;
                dataAdapter.SelectCommand.Parameters.Add("@_precio", SqlDbType.Int).Value = subir_descargar.Precio;
                dataAdapter.SelectCommand.Parameters.Add("@_user_cambio", SqlDbType.Int).Value = subir_descargar.UserCambio;


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

    }//Dao_Subir_archivos

}//principal
