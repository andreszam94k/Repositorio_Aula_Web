using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_Registrar_usuario
    {
        //Contiene todos los componentes de la pagina que muestran texto y las urls de las imagenes

        private String tRegistroNombre;

        public String TRegistroNombre
        {
            get { return tRegistroNombre; }
            set { tRegistroNombre = value; }
        }

        private String tRegistroApellido;

        public String TRegistroApellido
        {
            get { return tRegistroApellido; }
            set { tRegistroApellido = value; }
        }

        private String tRegistroDocumento;

        public String TRegistroDocumento
        {
            get { return tRegistroDocumento; }
            set { tRegistroDocumento = value; }
        }

        private String tRegistroTelefono;

        public String TRegistroTelefono
        {
            get { return tRegistroTelefono; }
            set { tRegistroTelefono = value; }
        }

        private String tRegistroCorreo;

        public String TRegistroCorreo
        {
            get { return tRegistroCorreo; }
            set { tRegistroCorreo = value; }
        }

        private String tRegistroUser;

        public String TRegistroUser
        {
            get { return tRegistroUser; }
            set { tRegistroUser = value; }
        }

        private String tRegistroClave;

        public String TRegistroClave
        {
            get { return tRegistroClave; }
            set { tRegistroClave = value; }
        }

        private String tRegistroConfirmar;

        public String TRegistroConfirmar
        {
            get { return tRegistroConfirmar; }
            set { tRegistroConfirmar = value; }
        }

        private String tRegistrar;

        public String TRegistrar
        {
            get { return tRegistrar; }
            set { tRegistrar = value; }
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

    }//U_Registrar_usuario

}//Principal
