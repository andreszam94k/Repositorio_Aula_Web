using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using System.Data;
using Utilitarios;

public partial class Presentacion_Ingresar_idioma : System.Web.UI.Page
{
    DataTable datos_idioma = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

        Response.Cache.SetNoStore();
        //llamamos la logica y el metodo
        L_Ingresar_idioma operacion = new L_Ingresar_idioma();
        U_Ingresar_idioma datos = new U_Ingresar_idioma();

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 22);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 22);
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
        L_II_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_II_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_idioma.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_terminacion.Text = idioma_data.Rows[3]["Texto"].ToString();
        B_ingresar_idioma.Text = idioma_data.Rows[4]["Texto"].ToString();

        //errores
        RFV_idioma.ErrorMessage = idioma_data.Rows[5]["Texto"].ToString();
        REV_idioma.ErrorMessage = idioma_data.Rows[6]["Texto"].ToString();
        RFV_terminacion.ErrorMessage = idioma_data.Rows[5]["Texto"].ToString();
        REV_terminacion.ErrorMessage = idioma_data.Rows[6]["Texto"].ToString();

    }

    protected void B_ingresar_idioma_Click(object sender, EventArgs e)
    {
        //obtenemos los datos en variables
        string nombre_idioma = TB_idioma.Text.ToString();
        string terminacion_idioma = TB_terminacion.Text.ToString();


        L_Ingresar_idioma operacion = new L_Ingresar_idioma();
        U_Ingresar_idioma info = operacion.ingresar_idioma(nombre_idioma, terminacion_idioma);

        //mandamos script desde la logica
        Response.Write(info.Mensajes);
    }

}//principal