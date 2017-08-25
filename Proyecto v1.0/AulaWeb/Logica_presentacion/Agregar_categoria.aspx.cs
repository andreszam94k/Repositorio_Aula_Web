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

public partial class Presentacion_Agregar_categoria : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if(!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Agregar_categoria operacion = new L_Agregar_categoria();
            U_Agregar_categoria datos = new U_Agregar_categoria();
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            llenar_grilla();
        }
    }

    protected void B_agregar_categoria_Click(object sender, EventArgs e)
    {
        //obtenemos los datos en variables
        string categoria = TB_categoria.Text.ToString();
        string costo = TB_costo.Text.ToString();

         
        L_Agregar_categoria operacion = new L_Agregar_categoria();
        U_Agregar_categoria info = operacion.agreggar_categoria(categoria, costo, Session["rolID"].ToString());

        //mandamos script desde la logica
        Response.Write(info.Mensajes);
        
    }//boton

    protected void llenar_grilla() 
    {
        L_Agregar_categoria operacion = new L_Agregar_categoria();
        DataTable informacion = operacion.llenar_gridview();

        GV_categoria.DataSource = informacion;
        GV_categoria.DataBind();
    
    }

    protected void GV_categoria_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //salir del estado de edicion
        GV_categoria.EditIndex = -1;
        llenar_grilla();
    }

    protected void GV_categoria_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //llamamos metodo
        L_Agregar_categoria operacion = new L_Agregar_categoria();
        //obetenemos la fila
        GridViewRow fila = GV_categoria.Rows[e.RowIndex];

        try
        {
            string id = ((Label)fila.FindControl("Label2")).Text.ToString();
            operacion.eliminar_categoria(id, Session["rolID"].ToString());
            
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Categoria eliminada');</script>");
        }
        catch(Exception exc)
        {
            throw exc;
        }

        //llenamos grilla
        llenar_grilla();

    }

    protected void GV_categoria_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //estableceel indice de la fila que se va a modificar
        GV_categoria.EditIndex = e.NewEditIndex;
        llenar_grilla();
    }

    protected void GV_categoria_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;

        //obetenemos la fila
        GridViewRow fila = GV_categoria.Rows[e.RowIndex];

        L_Agregar_categoria operacion = new L_Agregar_categoria();

        string id_categoria = (fila.FindControl("Label2") as Label).Text.ToString();
        string nom_categoria = (fila.FindControl("TextBox1") as TextBox).Text.ToString();
        string precio = (fila.FindControl("TextBox2") as TextBox).Text.ToString();

        try
        {
            //reiniciamos la grilla y mandamos metodo
            GV_categoria.EditIndex = -1;
            operacion.modificar_categoria(id_categoria, nom_categoria, precio, Session["rolID"].ToString());

            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Categoria modificada');</script>");
        }
        catch(Exception exc)
        {
            throw exc;
        }

        //pintamos nuevamente la grilla
        llenar_grilla();
    }
}//principal