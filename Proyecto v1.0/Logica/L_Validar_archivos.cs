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
    public class L_Validar_archivos
    {
        //objeto de persistencia
        Aula_Web_SQLEntities operacion_n = new Aula_Web_SQLEntities();

        //----- verificar sesion .....
        public U_Validar_archivos verificar(object user, object rol)
        {
            U_Validar_archivos datos = new U_Validar_archivos();
            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse(rol.ToString()) != 1 && int.Parse(rol.ToString()) != 2)
                {
                    datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
                }
            }

            return datos;
        }

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

        //----- mostrar grilla .....
        public DataTable mostrar_grilla(object rol_user) 
        {
            DataTable informacion = new DataTable();
            //Dao_Validar_archivos mostrar = new Dao_Validar_archivos();
            
            //Dependiendo el rol llenamos el gridview
            string roles = "0";

                if (int.Parse(rol_user.ToString()) == 1)
                {
                    //si es Admin ve los archivos de los Mod
                    roles = "2";

                }
                else
                {
                    if (int.Parse(rol_user.ToString()) == 2)
                    {
                        //si es Mod ve los archivos de los Users
                        roles = "3";
                    }
                }

            //informacion = mostrar.Consultar_archivo_datos(roles); 
            List<sp_consulta_archivo_datos_Result> datos = operacion_n.sp_consulta_archivo_datos(Int32.Parse(roles)).ToList<sp_consulta_archivo_datos_Result>();
            informacion = ToDataTable(datos);

            return informacion;   
        }

        //----- rechazar_archivo .....
        public U_Validar_archivos eliminar_archivo(string nombre_archivo, string id, string imagen_saveLocation, string archivo_saveLocation, string rol_user) 
        {
            //llamamos metodos
            U_Validar_archivos accion = new U_Validar_archivos();
            //Dao_Validar_archivos archivoDatos = new Dao_Validar_archivos();
            //DataTable estado = archivoDatos.consultar_archivo_nombre(nombre_archivo);

            List<sp_consulta_archivo_nombre_Result> datos = operacion_n.sp_consulta_archivo_nombre(nombre_archivo).ToList<sp_consulta_archivo_nombre_Result>();
            DataTable estado = ToDataTable(datos);

            //preguntamos si el archivo ya ha sido moderado
            if (estado.Rows.Count == 0)
            { //si no trajo parametros el archivo fue moderado pero fue rechazado

                accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                return accion;

            }
            else
            {// si trajo parametros el archivo esta en el sistema

                //preguntamos si el archivo ya fue aprobado
                if (int.Parse(estado.Rows[0]["estado_mod"].ToString()) == 2)
                {//Si entra, el archivo ya fue moderado y fue aprobado

                    accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                    return accion;

                }
                else
                {//en caso contrario el archivo no ha sido moderado

                    try
                    {
                        //eliminamos desde BD y  servidor
                        //archivoDatos.eliminar_archivo(id, rol_user);
                        operacion_n.sp_eliminar_archivo(Int32.Parse(id), Int32.Parse(rol_user));

                        System.IO.File.Delete(imagen_saveLocation);
                        System.IO.File.Delete(archivo_saveLocation);

                        accion.Mensajes = "<script type='text/javascript'>alert('El archivo ha sido Eliminado del sistema');</script>";
                        return accion;

                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }

                }//else

            }//fin else moderado

        }

        //----- aprobar_archivo .....
        public U_Validar_archivos aprobar_archivo(string nombre_archivo, string dinero, string id, string idCategoria, string nomCategoria, string idUser, string rol_user) 
        {
            //llamamos metodos
            U_Validar_archivos accion = new U_Validar_archivos();
            E_Aprobar_archivo archivos = new E_Aprobar_archivo();
            //Dao_Validar_archivos archivoDatos = new Dao_Validar_archivos();
            //DataTable estado = archivoDatos.consultar_archivo_nombre(nombre_archivo);

            List<sp_consulta_archivo_nombre_Result> datos2 = operacion_n.sp_consulta_archivo_nombre(nombre_archivo).ToList<sp_consulta_archivo_nombre_Result>();
            DataTable estado = ToDataTable(datos2);

            
            //preguntamos si el archivo ya ha sido moderado
            if (estado.Rows.Count == 0)
            { //si no trajo parametros el archivo fue moderado pero fue rechazado

                accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                return accion;
            }
            else
            {// si trajo parametros el archivo esta en el sistema

                //preguntamos si el archivo ya fue aprobado
                if (int.Parse(estado.Rows[0]["estado_mod"].ToString()) == 2)
                {//Si entra, el archivo ya fue moderado y fue aprobado

                    accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                    return accion;

                }
                else
                {//en caso contrario el archivo no ha sido moderado

                    //preguntamos si no hay categorias seleccionadas
                    if (int.Parse(idCategoria) == 1)
                    {
                        accion.Mensajes = "<script type='text/javascript'>alert('Debe seleccionar una categoria');</script>";
                        return accion;
                    }
                    else
                    { //en caso contrario obtenemos el precio de la categoria

                        DataTable info = new DataTable();
                        //info = archivoDatos.consultar_categoria(nomCategoria);
                        List<sp_consulta_categoria_Result> datos3 = operacion_n.sp_consulta_categoria(nomCategoria).ToList<sp_consulta_categoria_Result>();
                        info = ToDataTable(datos3);
                        dinero = info.Rows[0]["precio_categoria"].ToString();
                    }

                    //encapsulamos datos
                    archivos.IdArchivo = id;
                    archivos.IdCategoria = idCategoria;
                    archivos.IdUser = idUser;
                    archivos.Precio = dinero;
                    archivos.UserCambio = rol_user;

                    try
                    {
                        //archivoDatos.modificar_archivo(archivos);
                        operacion_n.sp_aprobar_archivo(Int32.Parse(archivos.IdArchivo), Int32.Parse(archivos.IdCategoria), Int32.Parse(archivos.IdUser), Int32.Parse(archivos.Precio), Int32.Parse(archivos.UserCambio));

                        accion.Mensajes = "<script type='text/javascript'>alert('Archivo aprobado con exito');</script>";
                        return accion;
                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }

                }//else

            }//fin else moderado
            
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


    }//L_Validar_archivos

}//principal
