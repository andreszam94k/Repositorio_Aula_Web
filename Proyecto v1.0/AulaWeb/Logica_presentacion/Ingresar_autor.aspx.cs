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

public partial class Presentacion_Ingresar_autor : System.Web.UI.Page
{
    DataTable datos_idioma = new DataTable();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        //llamamos la logica y el metodo
        L_Ingresar_autor operacion = new L_Ingresar_autor();
        U_Ingresar_autor datos = new U_Ingresar_autor();

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 11);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 11);
            llenar_componentes(datos_idioma);
        }
        
        if (!IsPostBack) 
        {
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            //ponemos valores por defecto sobre las cajas de texto de la fecha
            TB_autor_birth.Text = DateTime.Now.ToString("yyyy,MM,dd");
            TB_autor_death.Text = DateTime.Now.ToString("yyyy,MM,dd");

            llenar_grilla();
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MIA_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MIA_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_autor_nombre.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_autor_birth.Text = idioma_data.Rows[3]["Texto"].ToString();
        L_autor_death.Text = idioma_data.Rows[4]["Texto"].ToString();
        L_autor_nacionalidad.Text = idioma_data.Rows[5]["Texto"].ToString();
        L_autor_descripcion.Text = idioma_data.Rows[6]["Texto"].ToString();
        L_autor_foto.Text = idioma_data.Rows[7]["Texto"].ToString();
        B_cargar_foto.Text = idioma_data.Rows[8]["Texto"].ToString();
        //Gridview
        GV_autor_foto.Columns[0].HeaderText = idioma_data.Rows[9]["Texto"].ToString();
        B_ingresar_autor.Text = idioma_data.Rows[11]["Texto"].ToString();
        
        //errores
        RFV_nombre_autor.ErrorMessage = idioma_data.Rows[12]["Texto"].ToString();
        REV_nombre_autor.ErrorMessage = idioma_data.Rows[13]["Texto"].ToString();
        RFV_nacimiento_autor.ErrorMessage = idioma_data.Rows[14]["Texto"].ToString();
        RFV_descripcion_autor.ErrorMessage = idioma_data.Rows[15]["Texto"].ToString();
        REV_descripcion_autor.ErrorMessage = idioma_data.Rows[16]["Texto"].ToString();

    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        Boolean estado_checkbox = CheckBox1.Checked;
        L_Ingresar_autor verificar = new L_Ingresar_autor();
        TB_autor_death.Enabled = verificar.veri_check(estado_checkbox);
    }

    protected void llenar_grilla()
    {

        GV_autor_foto.DataSource = Session["fotos"];
        GV_autor_foto.DataBind();

    }

    //-----------------------imagen--------------------------------
    protected void B_cargar_foto_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        String nombreArchivo = System.IO.Path.GetFileName(FU_autor_foto.PostedFile.FileName);
        string extension = System.IO.Path.GetExtension(FU_autor_foto.PostedFile.FileName);
        string saveLocation = Server.MapPath("~\\Imagenes\\Imagenes_Autores");
        //string ruta = "hola";
        //DataTable imagen = new DataTable();

        L_Ingresar_autor operacion = new L_Ingresar_autor();
        U_Ingresar_autor datos = new U_Ingresar_autor();
        datos = operacion.seleccion_archivo(nombreArchivo, extension, saveLocation, Session["fotos"]);
        
        cm.RegisterClientScriptBlock(this.GetType(), "", datos.Mensajes);

        if (datos.Guardar == true)
        {
            try
            {
                FU_autor_foto.PostedFile.SaveAs(datos.Url_pag);

                Session["fotos"] = datos.Session_fotos;
                
                //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo ha sido cargado');</script>");
                Response.Write("<script type='text/javascript'>alert('El archivo ha sido cargado');</script>");
                
                llenar_grilla();
            }
            catch (Exception exc)
            {
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error: ');</script>");
                return;

                throw exc;
            }

        }
        else
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Archivo no cargado');</script>");
        }
             
    }

    protected void GV_autor_foto_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //obetenemos la fila
        GridViewRow fila = GV_autor_foto.Rows[e.RowIndex];

        //Enviamos variable con su respectiva conversion
        //int id = int.Parse(((Label)GV_Archivo.Rows[e.RowIndex].FindControl("L_Id")).Text.ToString());
        
        Image imagen = fila.FindControl("Image1") as Image;
        string ruta = imagen.ImageUrl.ToString();
        //string ruta = (fila.FindControl("Label3") as Label).Text.ToString();
        string saveLocation = Server.MapPath(ruta);

        try
        {
            System.IO.File.Delete(saveLocation);
            Session["fotos"] = null;
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('La imagen ha sido Eliminada');</script>");
        }
        catch (Exception exc)
        {
            throw exc;
        }

        llenar_grilla();
    }

    //-----------------------boton--------------------------------
    protected void B_ingresar_autor_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //obetenmos las variables
        string nombre = TB_autor_nombre.Text.ToString();
        string fecha_birth = TB_autor_birth.Text.ToString();
        string fecha_death = TB_autor_death.Text.ToString();
        string pais = DDL_autor_nacionalidad.SelectedValue.ToString();
        string foto="sin foto";
        string descripcion = TB_autor_descripcion.Text.ToString();
        Boolean estado_check = CheckBox1.Checked;

        L_Ingresar_autor operacion = new L_Ingresar_autor();
        U_Ingresar_autor datos_registro = operacion.ingresar_autor(nombre, fecha_birth, fecha_death, pais, foto, descripcion,
                                                                    estado_check, Session["fotos"], Session["rolID"]);

        Session["fotos"] = datos_registro.Session_fotos;
        llenar_grilla();
        cm.RegisterClientScriptBlock(this.GetType(), "", datos_registro.Mensajes);
        
    }

    protected void GV_autor_foto_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //definimos fila
        GridViewRow fila = e.Row;

        //Buscamos controles
        if (fila.FindControl("LinkButton1") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton1")).Text = datos_idioma.Rows[10]["Texto"].ToString();
        }
    }

}//principal