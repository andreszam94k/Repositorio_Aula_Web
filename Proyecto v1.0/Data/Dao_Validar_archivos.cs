﻿using Npgsql;
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
    public class Dao_Validar_archivos
    {
        //------------------------------------------------------------------------
        public DataTable Consultar_archivo_datos(string id_rol)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_consulta_archivo_datos", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consulta_archivo_datos", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id_rol", NpgsqlDbType.Integer).Value = id_rol;
                dataAdapter.SelectCommand.Parameters.Add("@id_rol", SqlDbType.Int).Value = id_rol;

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
                dataAdapter.SelectCommand.Parameters.Add("@categoria", SqlDbType.VarChar, 50).Value = categoria;

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
        //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
        public DataTable modificar_archivo(E_Aprobar_archivo archivo)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_aprobar_archivo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_aprobar_archivo", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                /*
                dataAdapter.SelectCommand.Parameters.Add("_id_archivo", NpgsqlDbType.Integer).Value = archivo.IdArchivo;
                dataAdapter.SelectCommand.Parameters.Add("_id_categoria", NpgsqlDbType.Integer).Value = archivo.IdCategoria;
                dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = archivo.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("_dinero", NpgsqlDbType.Integer).Value = archivo.Precio;
                dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = archivo.UserCambio;
                */
                dataAdapter.SelectCommand.Parameters.Add("@id_archivo", SqlDbType.Int).Value = archivo.IdArchivo;
                dataAdapter.SelectCommand.Parameters.Add("@id_categoria", SqlDbType.Int).Value = archivo.IdCategoria;
                dataAdapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = archivo.IdUser;
                dataAdapter.SelectCommand.Parameters.Add("@dinero", SqlDbType.Int).Value = archivo.Precio;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = archivo.UserCambio;


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
        public DataTable eliminar_archivo(String id, String user_cambio)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_eliminar_archivo", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_eliminar_archivo", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                /*
                dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = id;
                dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = user_cambio;
                 */
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

    }//Dao_Validar_archivos

}//principal
