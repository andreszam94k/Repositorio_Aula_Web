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
    public class L_Consultar_archivos
    {
        //----- mostrar archivos .....
        public DataTable mostrar_archivos() 
        {
            Dao_Consultar_archivo operacion = new Dao_Consultar_archivo();

            DataTable informacion = operacion.mostrar_archivos();

            return informacion;

        }

        //----- consultar archivos .....
        public DataTable consultar_archivos(string dato) 
        {
            Dao_Consultar_archivo operacion = new Dao_Consultar_archivo();
            DataTable info = operacion.consultar_archivos(dato);

            return info;
        }


    }//L_Consultar_archivos

}//principal
