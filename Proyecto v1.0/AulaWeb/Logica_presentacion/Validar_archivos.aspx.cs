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

public partial class Presentacion_Validar_archivos : System.Web.UI.Page
{
    DataTable datos_idioma = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        //llamamos la logica y el metodo
        L_Validar_archivos operacion = new L_Validar_archivos();
        U_Validar_archivos datos = new U_Validar_archivos();

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 15);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 15);
            llenar_componentes(datos_idioma);
        }

        if (!IsPostBack)
        {
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            llenar_grilla(Session["rolUser"]);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MVA_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MVA_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_MVA_3.Text = idioma_data.Rows[2]["Texto"].ToString();
        HyperLink3.Text = idioma_data.Rows[3]["Texto"].ToString();
        //Gridview
        GV_validar_archivos.Columns[0].HeaderText = idioma_data.Rows[4]["Texto"].ToString();
        GV_validar_archivos.Columns[1].HeaderText = idioma_data.Rows[5]["Texto"].ToString();
        GV_validar_archivos.Columns[2].HeaderText = idioma_data.Rows[6]["Texto"].ToString();
        GV_validar_archivos.Columns[3].HeaderText = idioma_data.Rows[7]["Texto"].ToString();
        GV_validar_archivos.Columns[4].HeaderText = idioma_data.Rows[8]["Texto"].ToString();
        GV_validar_archivos.Columns[5].HeaderText = idioma_data.Rows[9]["Texto"].ToString();
        GV_validar_archivos.Columns[6].HeaderText = idioma_data.Rows[10]["Texto"].ToString();
        GV_validar_archivos.Columns[7].HeaderText = idioma_data.Rows[11]["Texto"].ToString();
        GV_validar_archivos.Columns[8].HeaderText = idioma_data.Rows[12]["Texto"].ToString();

    }

    protected void llenar_grilla(object rol_user)
    {
        if(rol_user != null)
        {
            L_Validar_archivos operacion = new L_Validar_archivos();
            DataTable info = operacion.mostrar_grilla(rol_user);

            GV_validar_archivos.DataSource = info;
            GV_validar_archivos.DataBind();
        }

    }


    protected void GV_validar_archivos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //salir del estado de edicion
        GV_validar_archivos.EditIndex = -1;
        llenar_grilla(Session["rolUser"]);
    }

    protected void GV_validar_archivos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //obtenemos el nombre del archivo
        HyperLink nom_archivo = GV_validar_archivos.Rows[e.RowIndex].FindControl("HyperLink2") as HyperLink;
        string nombre_archivo = nom_archivo.Text.ToString();
        //obetenemos la fila
        GridViewRow fila = GV_validar_archivos.Rows[e.RowIndex];
        //obtenemos el id del archivo
        string id = (fila.FindControl("Label2") as Label).Text.ToString();

        //obtenemos la ruta de la imagen
        Image imagen = fila.FindControl("Image1") as Image;
        string ruta = imagen.ImageUrl.ToString();
        string imagen_saveLocation = Server.MapPath(ruta);

        //obetenemos la ruta del archivo
        HyperLink archivo = fila.FindControl("HyperLink2") as HyperLink;
        string url = archivo.NavigateUrl.ToString();
        string archivo_saveLocation = Server.MapPath(url);

        //creamos metodo y mandamos datos
        L_Validar_archivos archivo_rechazar = new L_Validar_archivos();
        U_Validar_archivos datos = archivo_rechazar.eliminar_archivo(nombre_archivo, id, imagen_saveLocation, archivo_saveLocation, Session["rolID"].ToString());

        //mandamos script desde la logica
        Response.Write(datos.Mensajes);
        //salir del estado de edicion
        GV_validar_archivos.EditIndex = -1;
        //lenamos grilla
        llenar_grilla(Session["rolUser"]);

    }

    protected void GV_validar_archivos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //establece el indice de la fila que se va a modificar
        GV_validar_archivos.EditIndex = e.NewEditIndex;
        llenar_grilla(Session["rolUser"]);
    }

    protected void GV_validar_archivos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        string dinero = "sin_dinero";
        //obtenemos el nombre del archivo
        HyperLink nom_archivo = GV_validar_archivos.Rows[e.RowIndex].FindControl("HyperLink2") as HyperLink;
        string nombre_archivo = nom_archivo.Text.ToString();
        //obetenemos la fila
        GridViewRow fila = GV_validar_archivos.Rows[e.RowIndex];
        //obtenemos el id del dropdownlist
        DropDownList ddl = fila.FindControl("DropDownList1") as DropDownList;
        //obtenemos los datos del archivo
        string id = (fila.FindControl("Label2") as Label).Text.ToString();
        string idCategoria = ddl.SelectedValue.ToString();
        string nomCategoria = ddl.SelectedItem.Text.ToString();
        string idUser = (fila.FindControl("Label5") as Label).Text.ToString();

        //creamos metodo y mandamos datos
        L_Validar_archivos archivo_aprobar = new L_Validar_archivos();
        U_Validar_archivos datos = archivo_aprobar.aprobar_archivo(nombre_archivo, dinero, id, idCategoria, nomCategoria, idUser, Session["rolID"].ToString());

        //mandamos script desde la logica
        Response.Write(datos.Mensajes);

        //salir del estado de edicion
        GV_validar_archivos.EditIndex = -1;
        //lenamos grilla
        llenar_grilla(Session["rolUser"]);

    }

    protected void GV_validar_archivos_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //definimos fila
        GridViewRow fila = e.Row;

        //Buscamos controles
        if (fila.FindControl("LinkButton1") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton1")).Text = datos_idioma.Rows[13]["Texto"].ToString();
        }

        if (fila.FindControl("LinkButton2") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton2")).Text = datos_idioma.Rows[14]["Texto"].ToString();
            ((LinkButton)fila.FindControl("LinkButton3")).Text = datos_idioma.Rows[15]["Texto"].ToString();
            ((LinkButton)fila.FindControl("LinkButton4")).Text = datos_idioma.Rows[16]["Texto"].ToString();
        }

    }

}//principal