using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentacion_Normas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void B_normas_Click(object sender, EventArgs e)
    {
        //cerrar ventana actual
        Response.Write("<script type='text/javascript'>window.close();</script>");
        //Response.Redirect("Registrar_usuario.aspx");
    }
}