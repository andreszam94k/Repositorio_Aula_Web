using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentacion_Ver_categorias : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("inicio.aspx");
            }
            else
            {
                if (int.Parse(Session["rolUser"].ToString()) != 1 && int.Parse(Session["rolUser"].ToString()) != 2)
                {
                    Response.Redirect("inicio.aspx");
                }
            }
        }
    }//page_load

    protected void B_ver_categorias_Click(object sender, EventArgs e)
    {
        //cerrar ventana actual
        Response.Write("<script type='text/javascript'>window.close();</script>");
    }

}//principal