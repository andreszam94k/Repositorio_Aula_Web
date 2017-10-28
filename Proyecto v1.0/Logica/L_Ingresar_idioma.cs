using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;
using Data;
using System.Data;

namespace Logica
{
    public class L_Ingresar_idioma
    {
        //----- verificar sesion .....
        public U_Ingresar_idioma verificar(object user, object rol)
        {
            U_Ingresar_idioma datos = new U_Ingresar_idioma();

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

            Dao_idioma operacion = new Dao_idioma();
            idioma = operacion.idioma(idiomaId, formularioId);

            return idioma;
        }

        //----- agregar categoria .....
        public U_Ingresar_idioma ingresar_idioma(string idioma, string terminacion)
        {
            U_Ingresar_idioma accion = new U_Ingresar_idioma();
            Dao_Ingresar_idioma datos = new Dao_Ingresar_idioma();
            DataTable informacion = datos.consultar_idioma(idioma);
            DataTable informacion2 = datos.consultar_terminacion(terminacion);

            //verificamos si la consulta trajo parametros
            if (informacion.Rows.Count == 0)
            {//datos no registrados nombre valido

                if (informacion2.Rows.Count == 0)
                {//datos no registrados terminacion valida

                    //encapsulamos datos
                    U_Ingresar_idioma var = new U_Ingresar_idioma();
                    var.Name_idioma = idioma;
                    var.Terminacion = terminacion;
                    
                    //mandamos al metodo de agregar usuarios
                    try
                    {
                        datos.insertar_idioma(var);
                        //confirmamos y redireccionamos
                        //Response.Write("<script type='text/javascript'>alert('Categoria registrada con exito');window.location=\"inicio.aspx\"</script>");
                        accion.Mensajes = "<script type='text/javascript'>alert('Idioma registrado con exito');window.location=\"inicio.aspx\"</script>";
                        return accion;
                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }
                }
                else
                { //si trajo parametros el usuario esta en el sistema

                    accion.Mensajes = "<script type='text/javascript'>alert('La terminacion de idioma ya se encuentra registrada');</script>";
                    return accion;
                }
            }
            else
            {   //si trajo parametros el usuario esta en el sistema

                //Response.Write("<script type='text/javascript'>alert('La categoria ya se encuentra registrada');</script>");
                accion.Mensajes = "<script type='text/javascript'>alert('El idioma ya se encuentra registrado');</script>";
                return accion;

            }
        }


    }//clase

}//principal
