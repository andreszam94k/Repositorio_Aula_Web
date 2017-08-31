using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_Consultar_archivo
    {

        private string tConsultarArchivos;

        public string TConsultarArchivos
        {
            get { return tConsultarArchivos; }
            set { tConsultarArchivos = value; }
        }

        private string tMostrarArchivos;

        public string TMostrarArchivos
        {
            get { return tMostrarArchivos; }
            set { tMostrarArchivos = value; }
        }

        private string tConsultaArchivo;

        public string TConsultaArchivo
        {
            get { return tConsultaArchivo; }
            set { tConsultaArchivo = value; }
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

    }//U_Consultar_archivo

}//principal
