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
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if(!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Agregar_tag operacion = new L_Agregar_tag();
            U_Agregar_tag datos = new U_Agregar_tag();
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            llenar_grilla();
        }
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

}//principal