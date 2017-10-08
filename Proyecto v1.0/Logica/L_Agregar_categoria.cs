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
    public class L_Agregar_categoria
    {
        //objeto de persistencia
        AulaWebContext_idioma.AulaWebDataContext_idioma operacion2 = new AulaWebContext_idioma.AulaWebDataContext_idioma();
        AulaWebContext_public.AulaWebDataContext_public operacion = new AulaWebContext_public.AulaWebDataContext_public();

        //----- verificar sesion .....
        public U_Agregar_categoria verificar(object user, object rol)
        {
            U_Agregar_categoria datos = new U_Agregar_categoria();

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

        //----- agregar categoria .....
        public U_Agregar_categoria agreggar_categoria(string categoria, string costo, string SrolID) 
        {
            

            U_Agregar_categoria accion = new U_Agregar_categoria();
            //Dao_Agregar_categoria datos = new Dao_Agregar_categoria();
            //DataTable informacion = datos.consultar_categoria(categoria);

            List<AulaWebContext_public.Categoria> datos = operacion.SpConsultaCategoria(categoria).ToList<AulaWebContext_public.Categoria>();
            DataTable informacion = ToDataTable(datos);

            
            //verificamos si la consulta trajo parametros
            if (informacion.Rows.Count == 0)
            {//datos no registrados usuario valido para insertar

                //encapsulamos datos
                E_categoria userCategoria = new E_categoria();
                userCategoria.Categoria = categoria;
                userCategoria.Precio = costo;
                userCategoria.UserCambio = SrolID;

                //mandamos al metodo de agregar usuarios
                try
                {
                    //datos.insertar_categoria(userCategoria);
                    operacion.SpInsertarCategoria(userCategoria.Categoria,Int32.Parse(userCategoria.Precio), Int32.Parse(userCategoria.UserCambio));

                    //confirmamos y redireccionamos
                    //Response.Write("<script type='text/javascript'>alert('Categoria registrada con exito');window.location=\"inicio.aspx\"</script>");
                    accion.Mensajes = "<script type='text/javascript'>alert('Categoria registrada con exito');window.location=\"inicio.aspx\"</script>";
                    return accion;
                }
                catch (Exception exc)
                {
                    throw exc;
                }
            }
            else
            {   //si trajo parametros el usuario esta en el sistema

                //Response.Write("<script type='text/javascript'>alert('La categoria ya se encuentra registrada');</script>");
                accion.Mensajes = "<script type='text/javascript'>alert('La categoria ya se encuentra registrada');</script>";
                return accion;

            }
        }

        //----- llenar gridview .....
        public DataTable llenar_gridview() 
        { 
            //Dao_Agregar_categoria accion = new Dao_Agregar_categoria();
            //DataTable info = accion.mostrar_categoria();

            List<AulaWebContext_public.Categoria> datos = operacion.SpMostrarCategoria().ToList<AulaWebContext_public.Categoria>();
            DataTable info = ToDataTable(datos);

            return info;
        }

        //----- eliminar categoria .....
        public void eliminar_categoria(string id, string SrolID)
        {
            //Dao_Agregar_categoria datos = new Dao_Agregar_categoria();
            //datos.eliminar_categoria(id, SrolID);

            operacion.SpEliminarCategoria(Int32.Parse(id), Int32.Parse(SrolID)).ToList<AulaWebContext_public.Categoria>();
        }

        //----- modificar categoria .....
        public void modificar_categoria(string id_categoria, string nom_categoria, string precio, string SrolID) 
        {
            //Dao_Agregar_categoria datos = new Dao_Agregar_categoria();
            E_categoria userCategoria = new E_categoria();

            userCategoria.IdCategoria = id_categoria;
            userCategoria.Categoria = nom_categoria;
            userCategoria.Precio = precio;
            userCategoria.UserCambio = SrolID;

            //datos.modificar_categoria(userCategoria);         

            operacion.SpModificarCategoria(Int32.Parse(userCategoria.IdCategoria), userCategoria.Categoria, Int32.Parse(userCategoria.Precio), Int32.Parse(userCategoria.UserCambio)).ToList<AulaWebContext_public.Categoria>();
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

    }//L_Agregar_categoria

}//Principal
