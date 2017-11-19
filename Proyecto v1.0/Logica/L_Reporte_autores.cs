using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;
using Data;
using System.Data;
using Data.SQL_Entity;
using System.Reflection;

namespace Logica
{
    public class L_Reporte_autores
    {
        //objeto de persistencia
        Aula_Web_SQLEntities operacion_n = new Aula_Web_SQLEntities();

        //----- verificar sesion .....
        public U_Reporte_autores verificar(object user, object rol)
        {
            U_Reporte_autores datos = new U_Reporte_autores();

            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse((String)rol) != 1 && int.Parse((String)rol) != 2)
                {
                    datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
                }
            }

            return datos;
        }

        //metodo para llenar informe principal
        //NOTA: el subinforme obtiene los datos de esta consulta, si falta alguno no lo muestra
        public Data_Reportes ObtenerInforme(string saveLocation, string url_defecto)
        {
            //definimos la fila la cual contendra los datos del datatable intermedio
            DataRow fila;  //dr
            //definimos un datatable principal y llamamos al dataset
            DataTable personaInformacion = new DataTable(); //dt
            Data_Reportes datos = new Data_Reportes();

            //llenamos el datatable principal con la info del data set
            personaInformacion = datos.Tables["DT_autores"];

            //hacemos una consulta para obtener los datos en otro datatable que servira de intermedio
            //Dao_Ver_Reportes dao = new Dao_Ver_Reportes();
            //DataTable Intermedio = dao.consultar_reporte_autores();

            List<sp_reporte_autores_Result> datos2 = operacion_n.sp_reporte_autores().ToList<sp_reporte_autores_Result>();
            DataTable Intermedio = ToDataTable(datos2);

            //recorremos el datatable intermedio
            for (int i = 0; i < Intermedio.Rows.Count; i++)
            {
                //definimos una nueva fila para agregar los datos del datatable intermedio
                fila = personaInformacion.NewRow();

                //agregamos las campos y los llenamos con los datos del datatable intermedio
                fila["id_autor"] = int.Parse(Intermedio.Rows[i]["id_autor"].ToString());
                fila["nombre"] = Intermedio.Rows[i]["nombre_autor"].ToString();
                fila["fecha_birth"] = Intermedio.Rows[i]["fecha_nacimiento"].ToString();
                fila["fecha_death"] = Intermedio.Rows[i]["fecha_muerte"].ToString();
                fila["descripcion"] = Intermedio.Rows[i]["descripcion_autor"].ToString();
                fila["id_nacionalidad"] = int.Parse(Intermedio.Rows[i]["id_nacionalidad"].ToString());
                fila["pais"] = Intermedio.Rows[i]["pais"].ToString();
                //para la imagen se utiliza un metodo
                fila["foto"] = obtenerImagen(Intermedio.Rows[i]["foto"].ToString(), saveLocation, url_defecto);

                //finalmente ya con los datos, agregamos la fila al datatable principal
                personaInformacion.Rows.Add(fila);
            }

            return datos;
        }

        //metodo obtener imagen que convierte la ruta en un conjunto de datos binarios
        //NOTA:para hacer la conversion la imagen debe definirse como .Byte[] en el dataset
        protected byte[] obtenerImagen(String url, String saveLocation, String url_defecto)
        {
            //definimos la ruta fisica de la imagen
            string nombre = url.Substring(27);
            String urlImagen = saveLocation + nombre;
            //String urlImagen = url;

            //preguntamos si no existe la imagen en el servidor 
            if (!System.IO.File.Exists(urlImagen))
            {
                //si no existe dejamos una por defecto
                urlImagen = url_defecto + "autor.png";
            }

            // FileStream stream = File.OpenRead(@""+ urlImagen);

            //este metodo hace la conversion binaria de la imagen
            byte[] fileBytes = System.IO.File.ReadAllBytes(urlImagen);

            return fileBytes;

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

    }//L_Reporte_autores

}//principal
