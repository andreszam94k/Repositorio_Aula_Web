using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_Registrar_moderador
    {
        //Contiene todos los componentes de la pagina que muestran texto y las urls de las imagenes
        private String tRegistroMod;

        public String TRegistroMod
        {
            get { return tRegistroMod; }
            set { tRegistroMod = value; }
        }

        //mensajes y urls

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

    }//U_Registrar_moderador

}//Principal
