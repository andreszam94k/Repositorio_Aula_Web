using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class E_autor
    {
        
        private string nombre;

        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        private string fechaBirth;

        public string FechaBirth
        {
            get { return fechaBirth; }
            set { fechaBirth = value; }
        }

        private string fechaDeath;

        public string FechaDeath
        {
            get { return fechaDeath; }
            set { fechaDeath = value; }
        }

        private string foto;

        public string Foto
        {
            get { return foto; }
            set { foto = value; }
        }

        private string descripcion;

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        private string nacionalidad;

        public string Nacionalidad
        {
            get { return nacionalidad; }
            set { nacionalidad = value; }
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

    }//E_autor

}//Principal
