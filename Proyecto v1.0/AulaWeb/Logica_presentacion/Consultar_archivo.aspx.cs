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

public partial class Presentacion_Consultar_archivo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
    }//page_load

    protected void B_mostrar_archivos_Click(object sender, EventArgs e)
    {
        //mostramos todos los archivos que esten aprobados
        L_Consultar_archivos datos = new L_Consultar_archivos();
        DataTable informacion = datos.mostrar_archivos();
        //llenamos el GV y salimos del estado de edicion por si acaso
        GV_consultar_archivo.EditIndex = -1;
        GV_consultar_archivo.DataSource = informacion;
        GV_consultar_archivo.DataBind();        
    }

    protected void B_consultar_archivos_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //obtenemos el parametro de la consulta
        string dato = TB_consultar_archivos.Text.ToString();
        //mostramos todos los archivos que esten aprobados
        L_Consultar_archivos parametros = new L_Consultar_archivos();
        DataTable info = parametros.consultar_archivos(dato);
        
        //preguntamos si la consulta trajo parametros
        if (info.Rows.Count == 0)
        { 
            //no trajo datos
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No se encontraron resultados');</script>");

        }
        else 
        { 
            //llenamos el GV y salimos del estado de edicion por si acaso
            GV_consultar_archivo.EditIndex = -1;
            GV_consultar_archivo.DataSource = info;
            GV_consultar_archivo.DataBind();
        }
    }
    protected void GV_consultar_archivo_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //establece el indice de la fila que se va a modificar
        GV_consultar_archivo.EditIndex = e.NewEditIndex;
        //obetenemos la fila
        GridViewRow fila = GV_consultar_archivo.Rows[GV_consultar_archivo.EditIndex];
        int id_archivo = int.Parse((fila.FindControl("Label2") as Label).Text);
        //llenamos la session
        Session["archivoID"] = id_archivo;
        Response.Redirect("Descargar_archivo.aspx");
    }
}