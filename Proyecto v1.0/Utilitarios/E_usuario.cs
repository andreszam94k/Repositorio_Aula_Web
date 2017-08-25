using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class E_usuario
    {
        private string idRol;

        public string IdRol
        {
            get { return idRol; }
            set { idRol = value; }
        }
        
        private string idUser;

        public string IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }

        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        private string apellido;

        public string Apellido
        {
            get { return apellido; }
            set { apellido = value; }
        }

        private string documento;

        public string Documento
        {
            get { return documento; }
            set { documento = value; }
        }

        private string telefono;

        public string Telefono
        {
            get { return telefono; }
            set { telefono = value; }
        }

        private string correo;

        public string Correo
        {
            get { return correo; }
            set { correo = value; }
        }

        private string userName;

        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        private string clave;

        public string Clave
        {
            get { return clave; }
            set { clave = value; }
        }

        private string dinero;

        public string Dinero
        {
            get { return dinero; }
            set { dinero = value; }
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

    }//E_usuario

}//principipal
