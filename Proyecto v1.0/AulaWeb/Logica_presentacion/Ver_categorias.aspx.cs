using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Utilitarios;
using Data;

public partial class Presentacion_Ver_categorias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Ver_categorias operacion = new L_Ver_categorias();
            U_Ver_categoria datos = new U_Ver_categoria();
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);
        }

    }//page_load

    protected void B_ver_categorias_Click(object sender, EventArgs e)
    {
        //cerrar ventana actual
        Response.Write("<script type='text/javascript'>window.close();</script>");
    }

}//principal