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
    public class L_Agregar_tag
    {
        //objeto de persistencia
        AulaWebContext_idioma.AulaWebDataContext_idioma operacion2 = new AulaWebContext_idioma.AulaWebDataContext_idioma();
        AulaWebContext_public.AulaWebDataContext_public operacion = new AulaWebContext_public.AulaWebDataContext_public();

        //----- verificar sesion .....
        public U_Agregar_tag verificar(object user, object rol)
        {
            U_Agregar_tag datos = new U_Agregar_tag();

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

            List<AulaWebContext_idioma.SpConsultarIdiomaResult> datos_idioma = operacion2.SpConsultarIdioma(idiomaId, formularioId).ToList<AulaWebContext_idioma.SpConsultarIdiomaResult>();
            idioma = ToDataTable(datos_idioma);

            return idioma;
        }

        //----- insertar tag .....
        public U_Agregar_tag agregar_tag(string tag, string SrolID) 
        {
            U_Agregar_tag accion = new U_Agregar_tag();
            //Dao_Agregar_tag datos = new Dao_Agregar_tag();
            //DataTable informacion = datos.consultar_tag(tag);

            List<AulaWebContext_public.Tag> datos = operacion.SpConsultaTag(tag).ToList<AulaWebContext_public.Tag>();
            DataTable informacion = ToDataTable(datos);

            //verificamos si la consulta trajo parametros
            if (informacion.Rows.Count == 0)
            {//datos no registrados usuario valido para insertar

                //encapsulamos datos
                E_tag userTag = new E_tag();
                userTag.Tag = tag;
                userTag.UserCambio = SrolID;

                try
                {
                    //mandamos al metodo de agregar usuarios
                    //datos.insertar_tag(userTag);
                    operacion.SpInsertarTag(userTag.Tag,Int32.Parse(userTag.UserCambio));

                    //confirmamos y redireccionamos
                    accion.Mensajes = "<script type='text/javascript'>alert('Tag registrado con exito');window.location=\"inicio.aspx\"</script>";
                    return accion;
                }
                catch (Exception exc)
                {
                    throw exc;
                }

            }
            else
            {   //si trajo parametros el usuario esta en el sistema

                accion.Mensajes = "<script type='text/javascript'>alert('El Tag ya se encuentra registrado');</script>";
                return accion;

            }
            
        }

        //----- llenar gridview .....
        public DataTable llenar_gridview()
        {
            //Dao_Agregar_tag accion = new Dao_Agregar_tag();
            //DataTable info = accion.mostrar_tags();

            List<AulaWebContext_public.Tag> datos = operacion.SpMostrarTag().ToList<AulaWebContext_public.Tag>();
            DataTable info = ToDataTable(datos);

            return info;
        }

        //----- eliminar tag .....
        public void eliminar_tag(string id, string SrolID)
        {
            //Dao_Agregar_tag datos = new Dao_Agregar_tag();
            //datos.eliminar_tag(id, SrolID);

            operacion.SpEliminarTag(Int32.Parse(id), Int32.Parse(SrolID)).ToList<AulaWebContext_public.Tag>();
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

    }//L_Agregar_tag

}//princicpal
