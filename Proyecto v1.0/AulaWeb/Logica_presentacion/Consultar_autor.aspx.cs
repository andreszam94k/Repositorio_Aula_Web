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

public partial class Presentacion_Consultar_autor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        //ocultamos los componentes
        Image1_autor.Visible = false;
        L_nombre_autor.Visible = false;
        L_pais_autor.Visible = false; Label5.Visible = false;
        L_birth_autor.Visible = false; Label2.Visible = false;
        L_death_autor.Visible = false; Label3.Visible = false;
        TB_descripcion_autor.Visible = false; Label4.Visible = false;

    }//page_load

    protected void DDL_autor_SelectedIndexChanged(object sender, EventArgs e)
    {
        //obtenemos el id del autor
        string id = DDL_autor.SelectedValue.ToString();
        //consultamos todos los datos del autor
        L_Consultar_autor datos = new L_Consultar_autor();
        DataTable informacion = datos.consultar_autor_datos(id);

        //llenamos los componentes con los datos
        Image1_autor.ImageUrl = informacion.Rows[0]["Foto"].ToString();
        L_nombre_autor.Text = informacion.Rows[0]["Nombre"].ToString();
        L_pais_autor.Text = informacion.Rows[0]["Nacionalidad"].ToString();
        L_birth_autor.Text = informacion.Rows[0]["FechaNacimiento"].ToString();
        L_death_autor.Text = informacion.Rows[0]["FechaMuerte"].ToString();
        TB_descripcion_autor.Text = informacion.Rows[0]["Descripcion"].ToString();

        //mostramos los componentes
        Image1_autor.Visible = true;    
        L_nombre_autor.Visible = true;
        L_pais_autor.Visible = true; Label5.Visible = true;
        L_birth_autor.Visible = true; Label2.Visible = true;
        L_death_autor.Visible = true; Label3.Visible = true;
        TB_descripcion_autor.Visible = true; Label4.Visible = true;

        //llenamos el gridview
        llenar_grilla(id);

    }//DDL

    protected void llenar_grilla(string id) 
    {
        //obtenemos los archivos asociados al autor
        L_Consultar_autor archivos_autor = new L_Consultar_autor();
        DataTable datos = archivos_autor.consultar_autor_archivos(id);

        GV_archivo_autor.DataSource = datos;
        GV_archivo_autor.DataBind();

    }//llenar_grilla


    protected void GV_archivo_autor_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //establece el indice de la fila que se va a modificar
        GV_archivo_autor.EditIndex = e.NewEditIndex;
        //obetenemos la fila
        GridViewRow fila = GV_archivo_autor.Rows[GV_archivo_autor.EditIndex];
        int id_archivo = int.Parse((fila.FindControl("Label6") as Label).Text);
        //llenamos la session
        Session["archivoID"] = id_archivo;
        Response.Redirect("Descargar_archivo.aspx");
    }
}//principal