using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class E_comentario
    {
        private string idUser;

        public string IdUser
        {
            get { return idUser; }
            set { idUser = value; }
        }

        private string idArchivo;

        public string IdArchivo
        {
            get { return idArchivo; }
            set { idArchivo = value; }
        }

        private string comentario;

        public string Comentario
        {
            get { return comentario; }
            set { comentario = value; }
        }

        private string userCambio;

        public string UserCambio
        {
            get { return userCambio; }
            set { userCambio = value; }
        }

    }
}
