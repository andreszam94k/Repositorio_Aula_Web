using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_inicio_sesion
    {
        //Contiene todos los componentes de la pagina que muestran texto y las urls de las imagenes

        private String tInicioUsuario;

        public String TInicioUsuario
        {
            get { return tInicioUsuario; }
            set { tInicioUsuario = value; }
        }

        private String tInicioClave;

        public String TInicioClave
        {
            get { return tInicioClave; }
            set { tInicioClave = value; }
        }

        private String tIniciarSession;

        public String TIniciarSession
        {
            get { return tIniciarSession; }
            set { tIniciarSession = value; }
        }

        private String tCancelarSession;

        public String TCancelarSession
        {
            get { return tCancelarSession; }
            set { tCancelarSession = value; }
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

    }//U_inicio_sesion

}//principal
