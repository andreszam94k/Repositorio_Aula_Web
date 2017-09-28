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
    public class L_inicio_sesion
    {
        AulaWebContext_public.AulaWebDataContext_public operacion = new AulaWebContext_public.AulaWebDataContext_public();

        //----- verificar sesion .....
        public U_inicio_sesion verificar(object user) 
        {
            U_inicio_sesion datos = new U_inicio_sesion();

            if (user != null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
                //datos.Url_pag = "<script type='text/javascript'>window.open('" + ruta +"','_blank')";
            }

            return datos;
        }

        //----- iniciar sesion .....
        public E_usuario open_session(E_loggin_user datos_loggin) 
        {
            //Dao_loggin_user operacion = new Dao_loggin_user();
            //DataTable informacion = operacion.loggin_user(datos_loggin);

            
            List<AulaWebContext_public.Usuario> datos = operacion.SpLogginUsuario(datos_loggin.User, datos_loggin.Clave).ToList<AulaWebContext_public.Usuario>();
            DataTable informacion = ToDataTable(datos);

            E_usuario datos1 = new E_usuario();

            //verificamos si la consulta trajo parametros
            if (informacion.Rows.Count == 0)
            {//datos no validos

                datos1.Mensajes = "<script type='text/javascript'>alert('Usuario o Contraseña incorrectos');window.location=\"inicio_sesion.aspx\"</script>";
            }
            else
            {

                /*
                //insertamos la ip y la mac
                datos_loggin.IdUser = informacion.Rows[0]["id_usuario"].ToString();
                string ipAddress = HttpContext.Current.Request.UserHostAddress;
                datos_loggin.Ip = ipAddress;
                datos_loggin.Mac = Utilidades.Mac.GetMAC(ref ipAddress);
                datos_loggin.UserCambio = informacion.Rows[0]["id_usuario"].ToString();

                Insertar datos_user_loggin = new Insertar();
                */

                try
                {
                    //datos_user_loggin.insertar_ip_mac(datos_loggin);

                    datos1.IdUser = informacion.Rows[0]["IdUsuario"].ToString();
                    datos1.Nombre = informacion.Rows[0]["Nombre"].ToString() + " " + informacion.Rows[0]["Apellido"].ToString();
                    datos1.Documento =  informacion.Rows[0]["Documento"].ToString();
                    datos1.UserName = informacion.Rows[0]["Usuario1"].ToString();
                    datos1.Dinero = informacion.Rows[0]["Dinero"].ToString();
                    datos1.IdRol = informacion.Rows[0]["IdRol"].ToString();

                    datos1.Mensajes = "<script type='text/javascript'>alert('Bienvenido a Aula Web');window.location=\"inicio.aspx\"</script>";
                }
                catch (Exception exc)
                {
                    throw exc;
                }

            }

            return datos1;
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


    }//L_inicio_sesion

}//Principal
