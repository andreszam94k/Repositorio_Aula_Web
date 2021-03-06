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
    public class Dao_Agregar_categoria
    {
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
        //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
        public void insertar_categoria(E_categoria categoria)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("public.sp_insertar_categoria", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_insertar_categoria", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_categoria", NpgsqlDbType.Varchar, 30).Value = categoria.Categoria;
                //dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = categoria.Precio;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = categoria.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@categoria", SqlDbType.VarChar, 50).Value = categoria.Categoria;
                dataAdapter.SelectCommand.Parameters.Add("@precio", SqlDbType.Int).Value = categoria.Precio;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = categoria.UserCambio;


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
        public DataTable mostrar_categoria()
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_mostrar_categoria", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_mostrar_categoria", conection);
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
        public DataTable eliminar_categoria(String id, String user_cambio)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_eliminar_categoria", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_eliminar_categoria", conection);
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

        //------------------------------------------------------------------------
        //en este caso mandamos un objeto de tipo user que contiene los datos para la clase Encapsular
        public DataTable modificar_categoria(E_categoria categoria)
        {
            DataTable usuarios = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //conexion y mandamos los parametros
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("sp_modificar_categoria", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_modificar_categoria", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_id", NpgsqlDbType.Integer).Value = categoria.IdCategoria;
                //dataAdapter.SelectCommand.Parameters.Add("_categoria", NpgsqlDbType.Varchar, 30).Value = categoria.Categoria;
                //dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = categoria.Precio;
                //dataAdapter.SelectCommand.Parameters.Add("_user_cambio", NpgsqlDbType.Integer).Value = categoria.UserCambio;
                dataAdapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int).Value = categoria.IdCategoria;
                dataAdapter.SelectCommand.Parameters.Add("@categoria", SqlDbType.VarChar, 50).Value = categoria.Categoria;
                dataAdapter.SelectCommand.Parameters.Add("@precio", SqlDbType.Int).Value = categoria.Precio;
                dataAdapter.SelectCommand.Parameters.Add("@user_cambio", SqlDbType.Int).Value = categoria.UserCambio;


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

    }//Dao_Agregar_categoria

}//principal
