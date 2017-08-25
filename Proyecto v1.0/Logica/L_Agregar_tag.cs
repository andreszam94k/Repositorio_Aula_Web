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
    public class L_Agregar_tag
    {
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

        //----- insertar tag .....
        public U_Agregar_tag agregar_tag(string tag, string SrolID) 
        {
            U_Agregar_tag accion = new U_Agregar_tag();
            Dao_Agregar_tag datos = new Dao_Agregar_tag();
            DataTable informacion = datos.consultar_tag(tag);

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
                    datos.insertar_tag(userTag);
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
            Dao_Agregar_tag accion = new Dao_Agregar_tag();
            DataTable info = accion.mostrar_tags();

            return info;
        }

        //----- eliminar tag .....
        public void eliminar_tag(string id, string SrolID)
        {
            Dao_Agregar_tag datos = new Dao_Agregar_tag();
            datos.eliminar_tag(id, SrolID);
        }

    }//L_Agregar_tag

}//princicpal
