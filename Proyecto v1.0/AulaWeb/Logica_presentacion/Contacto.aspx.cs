using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;

public partial class Presentacion_Contacto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        L_Contacto contacto = new L_Contacto();

        DataTable datos_idioma = new DataTable();
        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = contacto.idioma(idioma, 2);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = contacto.idioma(idioma, 2);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MC_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MC_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_MC_3.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_MC_4.Text = idioma_data.Rows[3]["Texto"].ToString();
        L_MC_5.Text = idioma_data.Rows[4]["Texto"].ToString();

    }

}//principal