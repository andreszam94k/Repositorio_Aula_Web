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
    public class L_Ver_categorias
    {
        //----- verificar sesion .....
        public U_Ver_categoria verificar(object user, object rol)
        {
            U_Ver_categoria datos = new U_Ver_categoria();

            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse((String)rol) != 1 && int.Parse((String)rol) != 2)
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

    }//L_Ver_categorias

}//principal
