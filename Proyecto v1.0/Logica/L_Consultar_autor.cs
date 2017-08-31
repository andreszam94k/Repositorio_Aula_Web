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
    public class L_Consultar_autor
    {
        //----- mostrar datos autor .....
        public DataTable consultar_autor_datos(string id_autor) 
        {
            Dao_Consultar_autor operacion = new Dao_Consultar_autor();
            DataTable informacion = operacion.consultar_autor_datos(id_autor);

            return informacion;
        }

        //----- grilla archivos del autor .....
        public DataTable consultar_autor_archivos(string id) 
        {
            Dao_Consultar_autor operacion = new Dao_Consultar_autor();
            DataTable info = operacion.consultar_autor_archivos(id);

            return info;
        }

    }//L_Consultar_autor

}//principal
