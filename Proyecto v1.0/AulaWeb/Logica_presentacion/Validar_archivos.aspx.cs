using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentacion_Validar_archivos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if(!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("inicio.aspx");
            }
            else
            {
                if (int.Parse(Session["rolUser"].ToString()) != 1 && int.Parse(Session["rolUser"].ToString()) != 2)
                {
                    Response.Redirect("inicio.aspx");
                }
            }
            llenar_grilla();
        }

    }//page_load

    protected void llenar_grilla()
    {
        //Dependiendo el rol llenamos el gridview
        string rol="0";

        if (int.Parse(Session["rolUser"].ToString()) == 1)
        {
            //si es Admin ve los archivos de los Mod
            rol = "2";
        }
        else
        {
            if (int.Parse(Session["rolUser"].ToString()) == 2)
            {
                //si es Mod ve los archivos de los Users
                rol = "3";
            }
        }

        Consultar datos = new Consultar();
        DataTable info = datos.Consultar_archivo_datos(rol);

        GV_validar_archivos.DataSource = info;
        GV_validar_archivos.DataBind();
    }


    protected void GV_validar_archivos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //salir del estado de edicion
        GV_validar_archivos.EditIndex = -1;
        llenar_grilla();
    }

    protected void GV_validar_archivos_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //obtenemos el nombre del archivo
        HyperLink nom_archivo = GV_validar_archivos.Rows[e.RowIndex].FindControl("HyperLink2") as HyperLink;
        //consultamos el nombre del archivo
        Consultar archivo_mod = new Consultar();
        DataTable estado = archivo_mod.consultar_archivo_nombre(nom_archivo.Text.ToString());
        
        //preguntamos si el archivo ya ha sido moderado
        if(estado.Rows.Count == 0)
        { //si no trajo parametros el archivo fue moderado pero fue rechazado

            //salir del estado de edicion
            GV_validar_archivos.EditIndex = -1;
            Response.Write("<script type='text/javascript'>alert('El archivo ya fue moderado');</script>");
            //lenamos grilla
            llenar_grilla();

        }
        else
        {// si trajo parametros el archivo esta en el sistema

            //preguntamos si el archivo ya fue aprobado
            if(int.Parse(estado.Rows[0]["estado_mod"].ToString()) == 2)
            {//Si entra, el archivo ya fue moderado y fue aprobado

                //salir del estado de edicion
                GV_validar_archivos.EditIndex = -1;
                Response.Write("<script type='text/javascript'>alert('El archivo ya fue moderado');</script>");
                //lenamos grilla
                llenar_grilla();

            }
            else
            {//en caso contrario el archivo no ha sido moderado

                //lamamos metodo
                Eliminar archivoDatos = new Eliminar();
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

                try
                {
                    //eliminamos desde BD y  servidor
                    archivoDatos.eliminar_archivo(id, Session["rolID"].ToString());
                    System.IO.File.Delete(imagen_saveLocation);
                    System.IO.File.Delete(archivo_saveLocation);

                    cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo ha sido Eliminado del sistema');</script>");

                }
                catch (Exception exc)
                {
                    throw exc;
                }

            }//else
        
        }//fin else moderado

        //salir del estado de edicion
        GV_validar_archivos.EditIndex = -1;
        //lenamos grilla
        llenar_grilla();

    }

    protected void GV_validar_archivos_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //establece el indice de la fila que se va a modificar
        GV_validar_archivos.EditIndex = e.NewEditIndex;
        llenar_grilla();
    }

    protected void GV_validar_archivos_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        string dinero = "sin_dinero";
        //lamamos metodo
        Modificar archivoDatos;
        //Encapsular
        Encapsular_aprobar_archivo archivos;
        //obetenemos la fila
        GridViewRow fila = GV_validar_archivos.Rows[e.RowIndex];

        //obtenemos el nombre del archivo
        HyperLink nom_archivo = GV_validar_archivos.Rows[e.RowIndex].FindControl("HyperLink2") as HyperLink;
        //consultamos el nombre del archivo
        Consultar archivo_mod = new Consultar();
        DataTable estado = archivo_mod.consultar_archivo_nombre(nom_archivo.Text.ToString());

        //preguntamos si el archivo ya ha sido moderado
        if (estado.Rows.Count == 0)
        { //si no trajo parametros el archivo fue moderado pero fue rechazado

            //salir del estado de edicion
            GV_validar_archivos.EditIndex = -1;
            Response.Write("<script type='text/javascript'>alert('El archivo ya fue moderado');</script>");
            //lenamos grilla
            llenar_grilla();

        }
        else
        {// si trajo parametros el archivo esta en el sistema

            //preguntamos si el archivo ya fue aprobado
            if (int.Parse(estado.Rows[0]["estado_mod"].ToString()) == 2)
            {//Si entra, el archivo ya fue moderado y fue aprobado

                //salir del estado de edicion
                GV_validar_archivos.EditIndex = -1;
                Response.Write("<script type='text/javascript'>alert('El archivo ya fue moderado');</script>");
                //lenamos grilla
                llenar_grilla();

            }
            else
            {//en caso contrario el archivo no ha sido moderado

                //obtenemos el id del dropdownlist
                DropDownList ddl = fila.FindControl("DropDownList1") as DropDownList;

                //preguntamos si no hay categorias seleccionadas
                if (int.Parse(ddl.SelectedValue.ToString()) == 1)
                {
                    Response.Write("<script type='text/javascript'>alert('Debe seleccionar una categoria');</script>");
                    return;
                }
                else
                { //en caso contrario obtenemos el precio de la categoria

                    Consultar precio = new Consultar();
                    DataTable info = new DataTable();
                    info = precio.consultar_categoria(ddl.SelectedItem.Text.ToString());
                    dinero = info.Rows[0]["precio"].ToString();
                }

                //encapsulamos datos
                archivos = new Encapsular_aprobar_archivo();
                archivos.IdArchivo = (fila.FindControl("Label2") as Label).Text.ToString();
                archivos.IdCategoria = ddl.SelectedValue.ToString();
                archivos.IdUser = (fila.FindControl("Label5") as Label).Text.ToString();
                archivos.Precio = dinero;
                archivos.UserCambio = Session["rolID"].ToString();

                //creamos el metodo
                archivoDatos = new Modificar();

                try
                {
                    archivoDatos.modificar_archivo(archivos);
                    cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Archivo aprobado con exito');</script>");
                }
                catch (Exception exc)
                {
                    throw exc;
                }

            }//else

        }//fin else moderado

        //salir del estado de edicion
        GV_validar_archivos.EditIndex = -1;
        //lenamos grilla
        llenar_grilla();

    }

}//principal