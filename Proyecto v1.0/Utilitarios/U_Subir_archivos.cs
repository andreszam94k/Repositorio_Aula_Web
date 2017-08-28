using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_Subir_archivos
    {

        private string tArchivoNombre;

        public string TArchivoNombre
        {
            get { return tArchivoNombre; }
            set { tArchivoNombre = value; }
        }

        private string tArchivoFecha;

        public string TArchivoFecha
        {
            get { return tArchivoFecha; }
            set { tArchivoFecha = value; }
        }

        private string tArchivoSinopsis;

        public string TArchivoSinopsis
        {
            get { return tArchivoSinopsis; }
            set { tArchivoSinopsis = value; }
        }

        private string tArchivoPaginas;

        public string TArchivoPaginas
        {
            get { return tArchivoPaginas; }
            set { tArchivoPaginas = value; }
        }

        private string tArchivoCategoria;

        public string TArchivoCategoria
        {
            get { return tArchivoCategoria; }
            set { tArchivoCategoria = value; }
        }

        private string tArchivoAutores;

        public string TArchivoAutores
        {
            get { return tArchivoAutores; }
            set { tArchivoAutores = value; }
        }

        private string tArchivoTags;

        public string TArchivoTags
        {
            get { return tArchivoTags; }
            set { tArchivoTags = value; }
        }

        private string tArchivoFoto;

        public string TArchivoFoto
        {
            get { return tArchivoFoto; }
            set { tArchivoFoto = value; }
        }

        private string tArchivoFile;

        public string TArchivoFile
        {
            get { return tArchivoFile; }
            set { tArchivoFile = value; }
        }

        private string tArchivoSubir;

        public string TArchivoSubir
        {
            get { return tArchivoSubir; }
            set { tArchivoSubir = value; }
        }
        
        
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

        private Boolean guardar;

        public Boolean Guardar
        {
            get { return guardar; }
            set { guardar = value; }
        }

        private Object session_fotos;

        public Object Session_fotos
        {
            get { return session_fotos; }
            set { session_fotos = value; }
        }

        private Object session_archivo;

        public Object Session_archivo
        {
            get { return session_archivo; }
            set { session_archivo = value; }
        }


    }//U_Subir_archivos

}//principal
