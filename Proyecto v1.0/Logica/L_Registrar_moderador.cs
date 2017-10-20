using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Data;
using Utilitarios;

namespace Logica
{
    public class L_Registrar_moderador
    {
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

            Dao_idioma operacion = new Dao_idioma();
            idioma = operacion.idioma(idiomaId, formularioId);

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
                Dao_Registrar_moderador operacion = new Dao_Registrar_moderador();
                operacion.consultar_rol(valor_rol);
                
            }

            return mensaje;
        }


        //----- Actuaizar grillas .....
        public DataTable actualizar_grillas(string rol) 
        { 
            Dao_Registrar_moderador operacion = new Dao_Registrar_moderador();
            DataTable informacion_rol = operacion.consultar_rol(rol);

            return informacion_rol;
        }

        //----- Registrar moderador .....
        public void registra_mod(E_moderador datos)
        {
            Dao_Registrar_moderador operacion = new Dao_Registrar_moderador();
            operacion.modificar_rol(datos);
        }



    }//L_Registrar_moderador

}//Principal
