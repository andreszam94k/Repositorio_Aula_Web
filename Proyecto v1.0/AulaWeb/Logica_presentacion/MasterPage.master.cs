using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Utilitarios;
using System.Data;

public partial class Presentacion_MasterPage : System.Web.UI.MasterPage
{
    DataTable datos_idioma = new DataTable();

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
        DDL_idiomas.Visible = datos.Ddl_idiomas;
        B_idioma.Visible = datos.B_idiomas;

        //habilitamos menus
        Menu1.Visible = datos.Menu_1;
        Menu2.Visible = datos.Menu_2;
        Menu3.Visible = datos.Menu_3;
        Menu4.Visible = datos.Menu_4;

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = master.idioma(idioma, 1);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = master.idioma(idioma, 1);
            llenar_componentes(datos_idioma);
        }

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
        Session["idioma"] = null;

        LB_cerrarSession.Visible = false;
        Response.Redirect("inicio.aspx");
    }

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        HL_inicio.Text = idioma_data.Rows[0]["Texto"].ToString();
        HL_Nosotros.Text = idioma_data.Rows[1]["Texto"].ToString();
        HL_Reglas.Text = idioma_data.Rows[2]["Texto"].ToString();
        HL_Contacto.Text = idioma_data.Rows[3]["Texto"].ToString();
        LB_cerrarSession.Text = idioma_data.Rows[4]["Texto"].ToString();
        B_idioma.Text = idioma_data.Rows[35]["Texto"].ToString();

        //menu1
        Menu1.Items[0].Text = idioma_data.Rows[5]["Texto"].ToString();
        Menu1.Items[1].Text = idioma_data.Rows[6]["Texto"].ToString();
        Menu1.Items[1].ChildItems[0].Text = idioma_data.Rows[7]["Texto"].ToString();
        Menu1.Items[1].ChildItems[1].Text = idioma_data.Rows[8]["Texto"].ToString();
        Menu1.Items[2].Text = idioma_data.Rows[9]["Texto"].ToString();
        Menu1.Items[2].ChildItems[0].Text = idioma_data.Rows[10]["Texto"].ToString();
        Menu1.Items[2].ChildItems[1].Text = idioma_data.Rows[11]["Texto"].ToString();
        Menu1.Items[2].ChildItems[2].Text = idioma_data.Rows[12]["Texto"].ToString();
        Menu1.Items[3].Text = idioma_data.Rows[13]["Texto"].ToString();
        Menu1.Items[4].Text = idioma_data.Rows[14]["Texto"].ToString();
        Menu1.Items[5].Text = idioma_data.Rows[15]["Texto"].ToString();
        Menu1.Items[5].ChildItems[0].Text = idioma_data.Rows[16]["Texto"].ToString();
        Menu1.Items[5].ChildItems[1].Text = idioma_data.Rows[17]["Texto"].ToString();
        Menu1.Items[5].ChildItems[2].Text = idioma_data.Rows[18]["Texto"].ToString();

        //menu2
        Menu2.Items[0].Text = idioma_data.Rows[19]["Texto"].ToString();
        Menu2.Items[0].ChildItems[0].Text = idioma_data.Rows[20]["Texto"].ToString();
        Menu2.Items[0].ChildItems[1].Text = idioma_data.Rows[21]["Texto"].ToString();
        Menu2.Items[1].Text = idioma_data.Rows[22]["Texto"].ToString();
        Menu2.Items[2].Text = idioma_data.Rows[23]["Texto"].ToString();
        Menu2.Items[3].Text = idioma_data.Rows[24]["Texto"].ToString();
        Menu2.Items[4].Text = idioma_data.Rows[25]["Texto"].ToString();
        Menu2.Items[4].ChildItems[0].Text = idioma_data.Rows[26]["Texto"].ToString();
        Menu2.Items[4].ChildItems[1].Text = idioma_data.Rows[27]["Texto"].ToString();

        //menu3
        Menu3.Items[0].Text = idioma_data.Rows[28]["Texto"].ToString();
        Menu3.Items[1].Text = idioma_data.Rows[29]["Texto"].ToString();
        Menu3.Items[2].Text = idioma_data.Rows[30]["Texto"].ToString();

        //menu4
        Menu4.Items[0].Text = idioma_data.Rows[31]["Texto"].ToString();
        Menu4.Items[1].Text = idioma_data.Rows[32]["Texto"].ToString();
        Menu4.Items[2].Text = idioma_data.Rows[33]["Texto"].ToString();
        Menu4.Items[3].Text = idioma_data.Rows[34]["Texto"].ToString();

    }//componentes


    protected void B_idioma_Click(object sender, EventArgs e)
    {
        L_master master = new L_master();

        DataTable datos_idioma = new DataTable();
        Int64 idioma;
        //idioma
        Session["idioma"] = DDL_idiomas.SelectedValue.ToString();
        idioma = Int64.Parse(Session["idioma"].ToString());
        datos_idioma = master.idioma(idioma, 1);
        llenar_componentes(datos_idioma);
    }

}//principal
