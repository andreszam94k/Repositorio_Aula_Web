using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using System.Data;

namespace Logica
{
    public class L_Agregar_categoria
    {
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

        //----- agregar categoria .....
        public U_Agregar_categoria agreggar_categoria(string categoria, string costo, string SrolID) 
        {
            U_Agregar_categoria accion = new U_Agregar_categoria();
            Dao_Agregar_categoria datos = new Dao_Agregar_categoria();
            DataTable informacion = datos.consultar_categoria(categoria);
            
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
                    datos.insertar_categoria(userCategoria);
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
            Dao_Agregar_categoria accion = new Dao_Agregar_categoria();
            DataTable info = accion.mostrar_categoria();

            return info;
        }

        //----- eliminar categoria .....
        public void eliminar_categoria(string id, string SrolID)
        {
            Dao_Agregar_categoria datos = new Dao_Agregar_categoria();
            datos.eliminar_categoria(id, SrolID);
        }

        //----- modificar categoria .....
        public void modificar_categoria(string id_categoria, string nom_categoria, string precio, string SrolID) 
        {
            Dao_Agregar_categoria datos = new Dao_Agregar_categoria();
            E_categoria userCategoria = new E_categoria();

            userCategoria.IdCategoria = id_categoria;
            userCategoria.Categoria = nom_categoria;
            userCategoria.Precio = precio;
            userCategoria.UserCambio = SrolID;

            datos.modificar_categoria(userCategoria);         
        }

    }//L_Agregar_categoria

}//Principal
