using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using System.Data;

public partial class Presentacion_Normas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        L_Normas contacto = new L_Normas();

        DataTable datos_idioma = new DataTable();
        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = contacto.idioma(idioma, 4);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = contacto.idioma(idioma, 4);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MN_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MN_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_MN_3.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_MN_4.Text = idioma_data.Rows[3]["Texto"].ToString();
        L_MN_5.Text = idioma_data.Rows[4]["Texto"].ToString();
        L_MN_6.Text = idioma_data.Rows[5]["Texto"].ToString();
        L_MN_7.Text = idioma_data.Rows[6]["Texto"].ToString();
        L_MN_8.Text = idioma_data.Rows[7]["Texto"].ToString();
        L_MN_9.Text = idioma_data.Rows[8]["Texto"].ToString();
        L_MN_10.Text = idioma_data.Rows[9]["Texto"].ToString();
        L_MN_11.Text = idioma_data.Rows[10]["Texto"].ToString();
        L_MN_12.Text = idioma_data.Rows[11]["Texto"].ToString();
        L_MN_13.Text = idioma_data.Rows[12]["Texto"].ToString();
        HyperLink1.Text = idioma_data.Rows[13]["Texto"].ToString();
        B_normas.Text = idioma_data.Rows[14]["Texto"].ToString();
    }

    protected void B_normas_Click(object sender, EventArgs e)
    {
        //cerrar ventana actual
        Response.Write("<script type='text/javascript'>window.close();</script>");
        //Response.Redirect("Registrar_usuario.aspx");
    }//boton

}//principal