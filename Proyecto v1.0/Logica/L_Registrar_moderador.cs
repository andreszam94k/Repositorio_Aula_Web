using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Data;
using Utilitarios;
using Data.SQL_Entity;
using System.Reflection;

namespace Logica
{
    public class L_Registrar_moderador
    {
        //objeto de persistencia
        Aula_Web_SQLEntities operacion_n = new Aula_Web_SQLEntities();

        //----- verificar sesion .....
        public U_Registrar_moderador verificar(object user, object rol)
        {
            U_Registrar_moderador datos = new U_Registrar_moderador();

            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse((String)rol) != 1)
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

        //----- obtener rol .....
        public U_Registrar_moderador obtener_rol(string valor_rol) 
        {

            U_Registrar_moderador mensaje = new U_Registrar_moderador();
            
            if (int.Parse(valor_rol).Equals(0))
            {
                mensaje.Mensajes = "<script type='text/javascript'>alert('Elija un rol');</script>";

            }
            else
            {
                //Dao_Registrar_moderador operacion = new Dao_Registrar_moderador();
                //operacion.consultar_rol(valor_rol);

                List<sp_consulta_rol_Result> datos = operacion_n.sp_consulta_rol(Int32.Parse(valor_rol)).ToList<sp_consulta_rol_Result>();
                
            }

            return mensaje;
        }


        //----- Actuaizar grillas .....
        public DataTable actualizar_grillas(string rol) 
        { 
            //Dao_Registrar_moderador operacion = new Dao_Registrar_moderador();
            //DataTable informacion_rol = operacion.consultar_rol(rol);

            List<sp_consulta_rol_Result> datos = operacion_n.sp_consulta_rol(Int32.Parse(rol)).ToList<sp_consulta_rol_Result>();
            DataTable informacion_rol = ToDataTable(datos);

            return informacion_rol;
        }

        //----- Registrar moderador .....
        public void registra_mod(E_moderador datos)
        {
            //Dao_Registrar_moderador operacion = new Dao_Registrar_moderador();
            //operacion.modificar_rol(datos);

            operacion_n.sp_cambiar_rol(Int32.Parse(datos.IdUser), datos.Nombre, datos.Apellido, Int64.Parse(datos.Documento), datos.Telefono, datos.Correo, datos.UserName, datos.Clave, Int32.Parse(datos.Dinero), Int32.Parse(datos.IdRol), Int32.Parse(datos.UserCambio));
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


    }//L_Registrar_moderador

}//Principal
