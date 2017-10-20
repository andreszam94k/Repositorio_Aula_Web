using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class U_master
    {
        //Contiene todos los componentes de la pagina que muestran texto y las urls de las imagenes

        private String bienvenido;

        public String Bienvenido
        {
            get { return bienvenido; }
            set { bienvenido = value; }
        }

        private String nomUser;

        public String NomUser
        {
            get { return nomUser; }
            set { nomUser = value; }
        }

        private String rolUser;

        public String RolUser
        {
            get { return rolUser; }
            set { rolUser = value; }
        }

        private String dinero;

        public String Dinero
        {
            get { return dinero; }
            set { dinero = value; }
        }

        private String uImgUser;

        public String UImgUser
        {
            get { return uImgUser; }
            set { uImgUser = value; }
        }


        //boleanos para cada componente
        private Boolean lBienvenido;

        public Boolean LBienvenido
        {
            get { return lBienvenido; }
            set { lBienvenido = value; }
        }

        private Boolean imgUser;

        public Boolean ImgUser
        {
            get { return imgUser; }
            set { imgUser = value; }
        }

        private Boolean lNomUser;

        public Boolean LNomUser
        {
            get { return lNomUser; }
            set { lNomUser = value; }
        }

        private Boolean lRolUser;

        public Boolean LRolUser
        {
            get { return lRolUser; }
            set { lRolUser = value; }
        }

        private Boolean imgMoney;

        public Boolean ImgMoney
        {
            get { return imgMoney; }
            set { imgMoney = value; }
        }

        private Boolean lDinero;

        public Boolean LDinero
        {
            get { return lDinero; }
            set { lDinero = value; }
        }

        private Boolean lbCerrarSession;

        public Boolean LbCerrarSession
        {
            get { return lbCerrarSession; }
            set { lbCerrarSession = value; }
        }

        private Boolean menu_1;

        public Boolean Menu_1
        {
            get { return menu_1; }
            set { menu_1 = value; }
        }

        private Boolean menu_2;

        public Boolean Menu_2
        {
            get { return menu_2; }
            set { menu_2 = value; }
        }

        private Boolean menu_3;

        public Boolean Menu_3
        {
            get { return menu_3; }
            set { menu_3 = value; }
        }

        private Boolean menu_4;

        public Boolean Menu_4
        {
            get { return menu_4; }
            set { menu_4 = value; }
        }

        private Boolean ddl_idiomas;

        public Boolean Ddl_idiomas
        {
            get { return ddl_idiomas; }
            set { ddl_idiomas = value; }
        }

        private Boolean b_idiomas;

        public Boolean B_idiomas
        {
            get { return b_idiomas; }
            set { b_idiomas = value; }
        }


    }//U_master
}//principal
