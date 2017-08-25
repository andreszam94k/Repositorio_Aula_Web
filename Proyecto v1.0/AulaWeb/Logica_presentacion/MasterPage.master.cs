using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Utilitarios;

public partial class Presentacion_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        //verificar si hay sesiones iniciadas para mostrar los componentes
        L_master master = new L_master();
        U_master datos = master.verificar_session(Session["rolID"], Session["nomUser"], Session["user"], Session["dinero"], Session["rolUser"]);
        

        //componentes
        L_Bienvenido.Text = datos.Bienvenido;
        L_Bienvenido.Visible = datos.LBienvenido;
        Img_user.ImageUrl = datos.UImgUser;
        Img_user.Visible = datos.ImgUser;
        L_NomUser.Text = datos.NomUser;
        L_NomUser.Visible = datos.LNomUser;
        L_rol.Text = datos.RolUser;
        L_rol.Visible = datos.LRolUser;
        Img_money.Visible = datos.ImgMoney;
        L_Dinero.Text = datos.Dinero;
        L_Dinero.Visible = datos.LDinero;
        LB_cerrarSession.Visible = datos.LbCerrarSession;

        //habilitamos menus
        Menu1.Visible = datos.Menu_1;
        Menu2.Visible = datos.Menu_2;
        Menu3.Visible = datos.Menu_3;
        Menu4.Visible = datos.Menu_4;

    }//page_load

    protected void LB_cerrarSession_Click(object sender, EventArgs e)
    {
        //obtenemos el id del usuario
        string id_user = Session["rolID"].ToString();
        string user_cambio = Session["rolID"].ToString();
        //cerrarmos la session para reestablecer la ip y la mac
        L_loggin_user cerrar = new L_loggin_user();
        cerrar.close_session(id_user, user_cambio);

        //al cerrar session se reinician variables de session
        Session["rolID"] = null;
        Session["nomUser"] = null;
        Session["docUser"] = null;
        Session["user"] = null;
        Session["dinero"] = null;
        Session["rolUser"] = null;
        Session["fotos"] = null;
        Session["foto"] = null;
        Session["archivo"] = null;
        Session["tags"] = null;
        Session["autor"] = null;
        Session["archivoID"] = null;

        LB_cerrarSession.Visible = false;
        Response.Redirect("inicio.aspx");
    }
}
