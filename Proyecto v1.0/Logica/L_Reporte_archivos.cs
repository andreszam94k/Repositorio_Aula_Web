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
    public class L_Reporte_archivos
    {
        AulaWebContext_public.AulaWebDataContext_public operacion = new AulaWebContext_public.AulaWebDataContext_public();

        //----- verificar sesion .....
        public U_Reporte_archivos verificar(object user, object rol)
        {
            U_Reporte_archivos datos = new U_Reporte_archivos();

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
            personaInformacion = datos.Tables["DT_archivos"];

            //hacemos una consulta para obtener los datos en otro datatable que servira de intermedio
            //Dao_Ver_Reportes dao = new Dao_Ver_Reportes();
            //DataTable Intermedio = dao.consultar_reporte_archivos();

            List<AulaWebContext_public.SpReporteArchivoResult> datos2 = operacion.SpReporteArchivo().ToList<AulaWebContext_public.SpReporteArchivoResult>();
            DataTable Intermedio = ToDataTable(datos2);

            //recorremos el datatable intermedio
            for (int i = 0; i < Intermedio.Rows.Count; i++)
            {
                //definimos una nueva fila para agregar los datos del datatable intermedio
                fila = personaInformacion.NewRow();

                //agregamos las campos y los llenamos con los datos del datatable intermedio
                fila["id_archivo"] = int.Parse(Intermedio.Rows[i]["IdArchivo"].ToString());
                fila["nombre"] = Intermedio.Rows[i]["Nombre"].ToString();
                fila["anio"] = Intermedio.Rows[i]["Anio"].ToString();
                fila["sinopsis"] = Intermedio.Rows[i]["Sinopsis"].ToString();
                fila["num_pag"] = int.Parse(Intermedio.Rows[i]["NumPag"].ToString());
                fila["url"] = Intermedio.Rows[i]["Url"].ToString();
                fila["id_usuario"] = int.Parse(Intermedio.Rows[i]["IdUsuario"].ToString());
                fila["id_estado"] = int.Parse(Intermedio.Rows[i]["IdEstado"].ToString());
                fila["id_categoria"] = int.Parse(Intermedio.Rows[i]["IdCategoria"].ToString());
                fila["tags"] = Intermedio.Rows[i]["Tags"].ToString();
                fila["id_moderador"] = int.Parse(Intermedio.Rows[i]["IdModerador"].ToString());
                fila["estado_mod"] = int.Parse(Intermedio.Rows[i]["EstadoMod"].ToString());
                fila["user_name"] = Intermedio.Rows[i]["UserName"].ToString();
                fila["categoria"] = Intermedio.Rows[i]["Categoria"].ToString();
                fila["precio"] = int.Parse(Intermedio.Rows[i]["Precio"].ToString());
                //para la imagen se utiliza un metodo
                fila["imagen_portada"] = obtenerImagen(Intermedio.Rows[i]["ImagenPortada"].ToString(), saveLocation, url_defecto);

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
            string nombre = url.Substring(28);
            String urlImagen = saveLocation + nombre;
            //String urlImagen = url;

            //preguntamos si no existe la imagen en el servidor 
            if (!System.IO.File.Exists(urlImagen))
            {
                //si no existe dejamos una por defecto
                //urlImagen = Server.MapPath("~\\Imagenes\\" + "archivo-PDF.png");
                urlImagen = url_defecto + "archivo-PDF.png";
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


    }//L_Reporte_archivos

}//Principal
