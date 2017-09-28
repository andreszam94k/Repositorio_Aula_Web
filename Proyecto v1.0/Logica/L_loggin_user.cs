using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;

namespace Logica
{
    public class L_loggin_user
    {
        AulaWebContext_public.AulaWebDataContext_public operacion = new AulaWebContext_public.AulaWebDataContext_public();

        public void close_session(string id_user, string user_cambio) 
        {
            //Dao_loggin_user operacion = new Dao_loggin_user();
            //operacion.cerrar_session(id_user, user_cambio);
            operacion.SpCerrarSession(Int32.Parse(id_user), Int32.Parse(user_cambio)).ToList<AulaWebContext_public.Usuario>();

        }//close_session


    }//L_loggin_user

}//principal
