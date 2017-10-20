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
    public class L_Normas
    {
        //-----Idioma...............
        public DataTable idioma(Int64 idiomaId, Int64 formularioId)
        {
            DataTable idioma = new DataTable();

            Dao_idioma operacion = new Dao_idioma();
            idioma = operacion.idioma(idiomaId, formularioId);

            return idioma;
        }

    }//clase

}//principal
