using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_Validar_archivos
    {
       
        //mensajes y urls y objetos

        private String mensajes;

        public String Mensajes
        {
            get { return mensajes; }
            set { mensajes = value; }
        }

        private String url_pag;

        public String Url_pag
        {
            get { return url_pag; }
            set { url_pag = value; }
        }

        private DataTable datos_grillas;

        public DataTable Datos_grillas
        {
            get { return datos_grillas; }
            set { datos_grillas = value; }
        }

    }//U_Validar_archivos

}//principal
