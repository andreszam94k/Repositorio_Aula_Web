using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using System.Data;
using System.Reflection;

namespace Logica
{
    public class L_Reglas
    {
        //objeto de persistencia
        AulaWebContext_idioma.AulaWebDataContext_idioma operacion2 = new AulaWebContext_idioma.AulaWebDataContext_idioma();

        public DataTable idioma(Int64 idiomaId, Int64 formularioId)
        {
            DataTable idioma = new DataTable();

            List<AulaWebContext_idioma.SpConsultarIdiomaResult> datos_idioma = operacion2.SpConsultarIdioma(idiomaId, formularioId).ToList<AulaWebContext_idioma.SpConsultarIdiomaResult>();
            idioma = ToDataTable(datos_idioma);

            return idioma;
        }


        //convierte en datatable
        private DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Defining type of data column gives proper data table 
                var type = (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>) ? Nullable.GetUnderlyingType(prop.PropertyType) : prop.PropertyType);
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name, type);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }

    }//clase

}//principal
