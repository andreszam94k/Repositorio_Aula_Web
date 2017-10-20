using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Data
{
    public class Dao_idioma
    {
        //obtener_idioma
        public DataTable idioma(Int64 idiomaId, Int64 formularioId)
        {
            DataTable idioma = new DataTable();
            NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["MyConexion"].ConnectionString);

            try
            {
                NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("multi_idioma.sp_consultar_idioma", conection);
                dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                dataAdapter.SelectCommand.Parameters.Add("_idioma", NpgsqlDbType.Integer).Value = idiomaId;
                dataAdapter.SelectCommand.Parameters.Add("_formulario", NpgsqlDbType.Integer).Value = formularioId;

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

