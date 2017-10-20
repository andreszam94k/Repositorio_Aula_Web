using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using System.Data;

public partial class Presentacion_Reglas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        L_Reglas reglas = new L_Reglas();

        DataTable datos_idioma = new DataTable();
        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = reglas.idioma(idioma, 6);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = reglas.idioma(idioma, 6);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        Label1.Text = idioma_data.Rows[0]["Texto"].ToString();
        Label2.Text = idioma_data.Rows[1]["Texto"].ToString();
        Label3.Text = idioma_data.Rows[2]["Texto"].ToString();
        Label4.Text = idioma_data.Rows[3]["Texto"].ToString();
        Label5.Text = idioma_data.Rows[4]["Texto"].ToString();
        Label6.Text = idioma_data.Rows[5]["Texto"].ToString();
        Label7.Text = idioma_data.Rows[6]["Texto"].ToString();
        Label8.Text = idioma_data.Rows[7]["Texto"].ToString();
        Label9.Text = idioma_data.Rows[8]["Texto"].ToString();
        Label10.Text = idioma_data.Rows[9]["Texto"].ToString();
        Label11.Text = idioma_data.Rows[10]["Texto"].ToString();
        Label12.Text = idioma_data.Rows[11]["Texto"].ToString();
        Label13.Text = idioma_data.Rows[12]["Texto"].ToString();
        Label14.Text = idioma_data.Rows[13]["Texto"].ToString();
        Label15.Text = idioma_data.Rows[14]["Texto"].ToString();
        Label16.Text = idioma_data.Rows[15]["Texto"].ToString();
        Label17.Text = idioma_data.Rows[16]["Texto"].ToString();
        Label18.Text = idioma_data.Rows[17]["Texto"].ToString();
        Label19.Text = idioma_data.Rows[18]["Texto"].ToString();
        Label20.Text = idioma_data.Rows[19]["Texto"].ToString();
        Label21.Text = idioma_data.Rows[20]["Texto"].ToString();
        Label22.Text = idioma_data.Rows[21]["Texto"].ToString();
        Label23.Text = idioma_data.Rows[22]["Texto"].ToString();
        Label24.Text = idioma_data.Rows[23]["Texto"].ToString();
        Label25.Text = idioma_data.Rows[24]["Texto"].ToString();
        Label26.Text = idioma_data.Rows[25]["Texto"].ToString();
        Label27.Text = idioma_data.Rows[26]["Texto"].ToString();
        Label28.Text = idioma_data.Rows[27]["Texto"].ToString();
        Label29.Text = idioma_data.Rows[28]["Texto"].ToString();

    }

}//Principal