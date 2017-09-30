using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Data;
using Utilitarios;
using System.Reflection;

namespace Logica
{
    public class L_Consultar_archivos
    {
        AulaWebContext_public.AulaWebDataContext_public operacion = new AulaWebContext_public.AulaWebDataContext_public();

        //----- mostrar archivos .....
        public DataTable mostrar_archivos() 
        {
            //Dao_Consultar_archivo operacion = new Dao_Consultar_archivo();
            //DataTable informacion = operacion.mostrar_archivos();

            List<AulaWebContext_public.SpConsultarArchivoResult> datos = operacion.SpMostrarArchivo1().ToList<AulaWebContext_public.SpConsultarArchivoResult>();
            DataTable informacion = ToDataTable(datos);

            return informacion;

        }

        //----- consultar archivos .....
        public DataTable consultar_archivos(string dato) 
        {
            //Dao_Consultar_archivo operacion = new Dao_Consultar_archivo();
            //DataTable info = operacion.consultar_archivos(dato);

            List<AulaWebContext_public.SpConsultarArchivoResult> datos = operacion.SpConsultarArchivo(dato).ToList<AulaWebContext_public.SpConsultarArchivoResult>();
            DataTable info = ToDataTable(datos);

            return info;
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



    }//L_Consultar_archivos

}//principal
