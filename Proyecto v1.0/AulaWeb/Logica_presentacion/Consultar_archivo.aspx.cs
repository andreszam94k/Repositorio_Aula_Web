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

    DataTable datos_idioma = new DataTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        L_Consultar_archivos oper = new L_Consultar_archivos();
        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = oper.idioma(idioma, 16);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = oper.idioma(idioma, 16);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MCA_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_consultar_archivos.Text = idioma_data.Rows[1]["Texto"].ToString();
        B_mostrar_archivos.Text = idioma_data.Rows[2]["Texto"].ToString();
        B_consultar_archivos.Text = idioma_data.Rows[3]["Texto"].ToString(); 
        //Gridview
        GV_consultar_archivo.Columns[0].HeaderText = idioma_data.Rows[4]["Texto"].ToString();
        GV_consultar_archivo.Columns[1].HeaderText = idioma_data.Rows[5]["Texto"].ToString();
        GV_consultar_archivo.Columns[2].HeaderText = idioma_data.Rows[6]["Texto"].ToString();
        GV_consultar_archivo.Columns[3].HeaderText = idioma_data.Rows[7]["Texto"].ToString();
        GV_consultar_archivo.Columns[4].HeaderText = idioma_data.Rows[8]["Texto"].ToString();

        //errores
        RFV_consultar_archivos.ErrorMessage = idioma_data.Rows[10]["Texto"].ToString();
        REV_consultar_archivos.ErrorMessage = idioma_data.Rows[11]["Texto"].ToString();
    }

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

    protected void GV_consultar_archivo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //definimos fila
        GridViewRow fila = e.Row;

        //Buscamos controles
        if (fila.FindControl("LinkButton1") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton1")).Text = datos_idioma.Rows[9]["Texto"].ToString();
        }
    }

}//principal