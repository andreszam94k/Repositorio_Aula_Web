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

public partial class Presentacion_Agregar_tag : System.Web.UI.Page
{
    DataTable datos_idioma = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        //llamamos la logica y el metodo
        L_Agregar_tag operacion = new L_Agregar_tag();
        U_Agregar_tag datos = new U_Agregar_tag();

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 13);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 13);
            llenar_componentes(datos_idioma);
        }

        if (!IsPostBack)
        {
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            llenar_grilla();
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MAT_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MAT_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_tag.Text = idioma_data.Rows[2]["Texto"].ToString();
        B_agregar_tag.Text = idioma_data.Rows[3]["Texto"].ToString();
        //Gridview
        GV_tags.Columns[0].HeaderText = idioma_data.Rows[4]["Texto"].ToString();
        GV_tags.Columns[1].HeaderText = idioma_data.Rows[5]["Texto"].ToString();

        //errores
        RFV_tag.ErrorMessage = idioma_data.Rows[7]["Texto"].ToString();
        REV_tag.ErrorMessage = idioma_data.Rows[8]["Texto"].ToString();
    }

    protected void B_agregar_tag_Click(object sender, EventArgs e)
    {
        //obtenemos los datos en variables
        string tag = TB_tag.Text.ToString();

        L_Agregar_tag operacion = new L_Agregar_tag();
        U_Agregar_tag info = operacion.agregar_tag(tag, Session["rolID"].ToString());

        //mandamos script desde la logica
        Response.Write(info.Mensajes);

    }//boton

    protected void llenar_grilla() 
    {
        L_Agregar_tag operacion = new L_Agregar_tag();
        DataTable informacion = operacion.llenar_gridview();

        GV_tags.DataSource = informacion;
        GV_tags.DataBind();

    }

    protected void GV_tags_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //llamamos metodo
        L_Agregar_tag operacion = new L_Agregar_tag();
        //obetenemos la fila
        GridViewRow fila = GV_tags.Rows[e.RowIndex];

        try
        {
            string id = (fila.FindControl("Label2") as Label).Text.ToString();
            operacion.eliminar_tag(id, Session["rolID"].ToString());

            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tag eliminado');</script>");
            llenar_grilla();
        }
        catch(Exception exc)
        {
            throw exc;
        }
    }

    protected void GV_tags_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //definimos fila
        GridViewRow fila = e.Row;

        //Buscamos controles
        if (fila.FindControl("LinkButton1") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton1")).Text = datos_idioma.Rows[6]["Texto"].ToString();
        }
    }

}//principal