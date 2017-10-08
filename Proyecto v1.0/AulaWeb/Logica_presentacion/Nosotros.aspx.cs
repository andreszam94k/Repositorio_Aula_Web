using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using System.Data;

public partial class Presentacion_Nosotros : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        L_Nosotros contacto = new L_Nosotros();

        DataTable datos_idioma = new DataTable();
        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = contacto.idioma(idioma, 5);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = contacto.idioma(idioma, 5);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MNos_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MNos_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_MNos_3.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_MNos_4.Text = idioma_data.Rows[3]["Texto"].ToString();
        L_MNos_5.Text = idioma_data.Rows[4]["Texto"].ToString();
        L_MNos_6.Text = idioma_data.Rows[5]["Texto"].ToString();
        L_MNos_7.Text = idioma_data.Rows[6]["Texto"].ToString();
    }

}//principal