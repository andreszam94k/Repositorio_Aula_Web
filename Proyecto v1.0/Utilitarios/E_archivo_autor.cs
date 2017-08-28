using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class E_archivo_autor
    {
        private string idArcAut;

        public string IdArcAut
        {
            get { return idArcAut; }
            set { idArcAut = value; }
        }

        private string nombreAutor;

        public string NombreAutor
        {
            get { return nombreAutor; }
            set { nombreAutor = value; }
        }

        private string userCambio;

        public string UserCambio
        {
            get { return userCambio; }
            set { userCambio = value; }
        }

    }//E_archivo_autor

}//principal
