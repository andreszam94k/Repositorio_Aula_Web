using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using Data.SQL_Entity;
using System.Reflection;

namespace Logica
{
    public class L_loggin_user
    {
        //objeto de persistencia
        Aula_Web_SQLEntities operacion_n = new Aula_Web_SQLEntities();

        public void close_session(string id_user, string user_cambio) 
        {
            //Dao_loggin_user operacion = new Dao_loggin_user();
            //operacion.cerrar_session(id_user, user_cambio);

            operacion_n.sp_cerrar_session(Int32.Parse(id_user), Int32.Parse(user_cambio));

        }//close_session


    }//L_loggin_user

}//principal
