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
    public class L_Registrar_usuario
    {
        //objeto de persistencia
        Aula_Web_SQLEntities operacion_n = new Aula_Web_SQLEntities();

        //----- verificar sesion .....
        public U_Registrar_usuario verificar(object user)
        {
            U_Registrar_usuario datos = new U_Registrar_usuario();

            if (user != null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
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

        //----- verificar_user .....
        public DataTable verif_user(string usuario)
        {
            //Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
            //DataTable informacion_user = operacion.consultar_usuario(usuario);

            List<sp_consulta_usuario_Result> datos = operacion_n.sp_consulta_usuario(usuario).ToList<sp_consulta_usuario_Result>();
            DataTable informacion_user = ToDataTable(datos);

            return informacion_user;     
        }

        //----- verificar_documento .....
        public DataTable verif_doc(string documento)
        {
            //Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
            //DataTable informacion_documento = operacion.consultar_documento(documento);

            List<sp_consulta_documento_Result> datos = operacion_n.sp_consulta_documento(Int64.Parse(documento)).ToList<sp_consulta_documento_Result>();
            DataTable informacion_documento = ToDataTable(datos);

            return informacion_documento;
        }

        //----- verificar_correo .....
        public DataTable verif_correo(string correo)
        {
            //Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
            //DataTable informacion_correo = operacion.consultar_correo(correo);

            List<sp_consulta_correo_Result> datos = operacion_n.sp_consulta_correo(correo).ToList<sp_consulta_correo_Result>();
            DataTable informacion_correo = ToDataTable(datos);

            return informacion_correo;
        }


        //----- Registrar usuario .....
        public E_usuario registrar(DataTable informacion_user, DataTable informacion_documento, DataTable informacion_correo,
                                   string nombre, string apellido, string documento, string telefono, string correo, string usuario, string clave,
                                   Boolean terminos) 
        {
            //llamamos metodo encapsular
            E_usuario user = new E_usuario();

            //verificamos si la consulta trajo parametros
            if (informacion_user.Rows.Count == 0 && informacion_documento.Rows.Count == 0 && informacion_correo.Rows.Count == 0)
            {//datos no registrados usuario valido para insertar

                //encapsulamos datos
                user.Nombre = nombre;
                user.Apellido = apellido;
                user.Documento = documento;
                user.Telefono = telefono;
                user.Correo = correo;
                user.UserName = usuario;
                user.Clave = clave;
                user.UserCambio = "1";

                //Verficamos los terminos y condiciones
                if (terminos == false)
                {
                    //Response.Write("<script type='text/javascript'>alert('No ha aceptado los Terminos y Condiciones');return;</script>");
                    //return;
                    user.Mensajes = "<script type='text/javascript'>alert('No ha aceptado los Terminos y Condiciones');</script>";

                }
                else
                {

                    if (terminos == true)
                    {
                        try
                        {
                            //mandamos al metodo de agregar usuarios
                            //Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
                            //operacion.insertar_usuario(user);
                            operacion_n.sp_insertar_usuario(user.Nombre, user.Apellido, Int64.Parse(user.Documento), user.Telefono, user.Correo, user.UserName, user.Clave, Int32.Parse(user.UserCambio));

                            //confirmamos y redireccionamos
                            user.Mensajes = "<script type='text/javascript'>alert('Usuario registrado con exito');window.location=\"inicio.aspx\"</script>";
                            //Response.Redirect("inicio.aspx");  
                        }
                        catch (Exception exc)
                        {
                            throw exc;
                        }

                    }
                }


            }
            else
            { //si trajo parametros el usuario esta en el sistema

                if (informacion_user.Rows.Count != 0)
                {
                    user.Mensajes = "<script type='text/javascript'>alert('El usuario(nickname) ya se encuentra registrado');</script>";
                }
                else
                {
                    if (informacion_documento.Rows.Count != 0)
                    {
                        user.Mensajes = "<script type='text/javascript'>alert('El documento ya se encuentra registrado');</script>";
                    }
                    else
                    {
                        if (informacion_correo.Rows.Count != 0)
                        {
                            user.Mensajes = "<script type='text/javascript'>alert('El correo ya esta vinculado a otra cuenta');</script>";
                        }
                    }
                }

            }//else principal

            return user;
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


    }//L_Registrar_usuario


}//Principal
