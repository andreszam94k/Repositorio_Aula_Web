using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilitarios;
using Logica;

public partial class Presentacion_Idioma_formularios : System.Web.UI.Page
{
    DataTable datos_idioma = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        //llamamos la logica y el metodo
        L_Idioma_formularios operacion = new L_Idioma_formularios();
        U_Idioma_formularios datos = new U_Idioma_formularios();

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 23);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 23);
            llenar_componentes(datos_idioma);
        }

        if (!IsPostBack)
        {
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_IF_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_IF_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        Label1.Text = idioma_data.Rows[2]["Texto"].ToString();
        B_agregar_datos.Text = idioma_data.Rows[3]["Texto"].ToString();

        //errores

    }


    protected void B_agregar_datos_Click(object sender, EventArgs e)
    {
        int n = 0;

    }


}//principal