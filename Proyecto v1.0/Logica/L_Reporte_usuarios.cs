using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;

namespace Logica
{
    public class L_Reporte_usuarios
    {
        //----- verificar sesion .....
        public U_Reporte_usuarios verificar(object user, object rol)
        {
            U_Reporte_usuarios datos = new U_Reporte_usuarios();

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


    }//L_Reporte_usuarios

}//principal
