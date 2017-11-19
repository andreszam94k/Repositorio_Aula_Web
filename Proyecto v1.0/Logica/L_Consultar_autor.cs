using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using System.Data;
using Data.SQL_Entity;
using System.Reflection;

namespace Logica
{
    public class L_Consultar_autor
    {
        //objeto de persistencia
        Aula_Web_SQLEntities operacion_n = new Aula_Web_SQLEntities();

        //-----Idioma...............
        public DataTable idioma(Int64 idiomaId, Int64 formularioId)
        {
            DataTable idioma = new DataTable();

            //Dao_idioma operacion = new Dao_idioma();
            //idioma = operacion.idioma(idiomaId, formularioId);

            List<sp_consultar_idioma_Result> datos_idioma = operacion_n.sp_consultar_idioma(idiomaId, formularioId).ToList<sp_consultar_idioma_Result>();
            idioma = ToDataTable(datos_idioma);

            return idioma;
        }

        //----- mostrar datos autor .....
        public DataTable consultar_autor_datos(string id_autor) 
        {
            //Dao_Consultar_autor operacion = new Dao_Consultar_autor();
            //DataTable informacion = operacion.consultar_autor_datos(id_autor);

            List<sp_ver_autor_Result> datos = operacion_n.sp_ver_autor(Int32.Parse(id_autor)).ToList<sp_ver_autor_Result>();
            DataTable informacion = ToDataTable(datos);

            return informacion;
        }

        //----- grilla archivos del autor .....
        public DataTable consultar_autor_archivos(string id) 
        {
            //Dao_Consultar_autor operacion = new Dao_Consultar_autor();
            //DataTable info = operacion.consultar_autor_archivos(id);

            List<sp_ver_archivo_autor_Result> datos = operacion_n.sp_ver_archivo_autor(Int32.Parse(id)).ToList<sp_ver_archivo_autor_Result>();
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

    }//L_Consultar_autor

}//principal
