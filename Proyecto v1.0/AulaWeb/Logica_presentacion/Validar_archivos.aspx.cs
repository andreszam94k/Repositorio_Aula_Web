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
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if(!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Validar_archivos operacion = new L_Validar_archivos();
            U_Validar_archivos datos = new U_Validar_archivos();
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            llenar_grilla(Session["rolUser"]);
        }

    }//page_load

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

}//principal