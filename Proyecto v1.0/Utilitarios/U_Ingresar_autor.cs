using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_Ingresar_autor
    {
        //Contiene todos los componentes de la pagina que muestran texto y las urls 

        private String tAutorNombre;

        public String TAutorNombre
        {
            get { return tAutorNombre; }
            set { tAutorNombre = value; }
        }

        private String tAutorBirth;

        public String TAutorBirth
        {
            get { return tAutorBirth; }
            set { tAutorBirth = value; }
        }

        private String tAutorDeath;

        public String TAutorDeath
        {
            get { return tAutorDeath; }
            set { tAutorDeath = value; }
        }

        private String tAutorNacionalidad;

        public String TAutorNacionalidad
        {
            get { return tAutorNacionalidad; }
            set { tAutorNacionalidad = value; }
        }

        private String tAutorDescripcion;

        public String TAutorDescripcion
        {
            get { return tAutorDescripcion; }
            set { tAutorDescripcion = value; }
        }

        private String tAutorFoto;

        public String TAutorFoto
        {
            get { return tAutorFoto; }
            set { tAutorFoto = value; }
        }

        private String tIngresarAutor;

        public String TIngresarAutor
        {
            get { return tIngresarAutor; }
            set { tIngresarAutor = value; }
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

        private Object session_fotos;

        public Object Session_fotos
        {
            get { return session_fotos; }
            set { session_fotos = value; }
        }

        private Object imagen_datos;

        public Object Imagen_datos
        {
            get { return imagen_datos; }
            set { imagen_datos = value; }
        }

        private Boolean guardar;

        public Boolean Guardar
        {
            get { return guardar; }
            set { guardar = value; }
        } 

    }//U_Ingresar_autor

}//Principal
