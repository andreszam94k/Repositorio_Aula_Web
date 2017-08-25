using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class E_loggin_user
    {
        private string idUser;

        public string IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }

        private string user;

        public string User
        {
            get { return user; }
            set { user = value; }
        }

        private string clave;

        public string Clave
        {
            get { return clave; }
            set { clave = value; }
        }

        private string ip;

        public string Ip
        {
            get { return ip; }
            set { ip = value; }
        }

        private string mac;

        public string Mac
        {
            get { return mac; }
            set { mac = value; }
        }

        private string userCambio;

        public string UserCambio
        {
            get { return userCambio; }
            set { userCambio = value; }
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


    }//E_loggin_usser

}//principal
