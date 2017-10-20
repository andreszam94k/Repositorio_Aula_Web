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

        //llamamos la logica y el metodo
        L_Ver_categorias operacion = new L_Ver_categorias();
        U_Ver_categoria datos = new U_Ver_categoria();

        DataTable datos_idioma = new DataTable();
        Int64 idioma;

        if (!IsPostBack)
        {
            datos = operacion.verificar(Session["user"], Session["rolUser"]);
            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);
        }

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 7);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 7);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MVC_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        B_ver_categorias.Text = idioma_data.Rows[1]["Texto"].ToString();
    }

    protected void B_ver_categorias_Click(object sender, EventArgs e)
    {
        //cerrar ventana actual
        Response.Write("<script type='text/javascript'>window.close();</script>");
    }

}//principal