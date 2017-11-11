using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Data
{
    public class Dao_idioma
    {
        //obtener_idioma
        public DataTable idioma(Int64 idiomaId, Int64 formularioId)
        {
            DataTable idioma = new DataTable();
            //NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);
            SqlConnection conection = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConexion2"].ConnectionString);

            try
            {
                //NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_consultar_idioma", conection);
                SqlDataAdapter dataAdapter = new SqlDataAdapter("sp_consultar_idioma", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                //dataAdapter.SelectCommand.Parameters.Add("_idioma", NpgsqlDbType.Integer).Value = idiomaId;
                //dataAdapter.SelectCommand.Parameters.Add("_formulario", NpgsqlDbType.Integer).Value = formularioId;
                dataAdapter.SelectCommand.Parameters.Add("@_idioma", SqlDbType.BigInt).Value = idiomaId;
                dataAdapter.SelectCommand.Parameters.Add("@_formulario", SqlDbType.BigInt).Value = formularioId;

                conection.Open();
                dataAdapter.Fill(idioma);
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

            return idioma;

        }

    }//clase

}//Principal

