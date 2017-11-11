using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logica;
using Utilitarios;
using Data;

public partial class Presentacion_Subir_archivos : System.Web.UI.Page
{
    DataTable datos_idioma = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        //llamamos la logica y el metodo
        L_Subir_archivos operacion = new L_Subir_archivos();
        U_Subir_archivos datos = new U_Subir_archivos();

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 14);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 14);
            llenar_componentes(datos_idioma);
        }

        if (!IsPostBack)
        {
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);
            //muestra u oculta las herramientas de categoria
            L_archivo_categoria.Visible = datos.Guardar;
            TB_archivo_precio.Visible = datos.Guardar;
            DDL_archivo_categoria.Visible = datos.Guardar;
            //ponemos valores por defecto sobre las cajas de texto de la fecha
            TB_archivo_fecha.Text = DateTime.Now.ToString("yyyy,MM,dd");
            llenar_grillas();
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MSA_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MSA_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_archivo_nombre.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_archivo_fecha.Text = idioma_data.Rows[3]["Texto"].ToString();
        L_archivo_sinopsis.Text = idioma_data.Rows[4]["Texto"].ToString();
        L_archivo_paginas.Text = idioma_data.Rows[5]["Texto"].ToString();
        L_archivo_categoria.Text = idioma_data.Rows[6]["Texto"].ToString();
        L_archivo_autores.Text = idioma_data.Rows[7]["Texto"].ToString();
        L_archivo_tags.Text = idioma_data.Rows[8]["Texto"].ToString();
        L_archivo_foto.Text = idioma_data.Rows[9]["Texto"].ToString();
        B_cargar_foto.Text = idioma_data.Rows[10]["Texto"].ToString();
        //Gridview
        GV_archivo_foto.Columns[0].HeaderText = idioma_data.Rows[11]["Texto"].ToString();
        L_archivo_file.Text = idioma_data.Rows[13]["Texto"].ToString();
        B_cargar_file.Text = idioma_data.Rows[14]["Texto"].ToString();
        //Gridview
        GV_archivo_file.Columns[0].HeaderText = idioma_data.Rows[15]["Texto"].ToString();
        B_archivo_subir.Text = idioma_data.Rows[17]["Texto"].ToString();

        //errores
        RFV_archivo_nombre.ErrorMessage = idioma_data.Rows[18]["Texto"].ToString();
        REV_archivo_nombre.ErrorMessage = idioma_data.Rows[19]["Texto"].ToString();
        RFV_archivo_fecha.ErrorMessage = idioma_data.Rows[20]["Texto"].ToString();
        RFV_archivo_sinopsis.ErrorMessage = idioma_data.Rows[21]["Texto"].ToString();
        REV_archivo_sinopsis.ErrorMessage = idioma_data.Rows[22]["Texto"].ToString();
        RFV_archivo_paginas.ErrorMessage = idioma_data.Rows[23]["Texto"].ToString();
        REV_archivo_paginas.ErrorMessage = idioma_data.Rows[24]["Texto"].ToString();

    }

    protected void llenar_grillas() 
    {
        GV_archivo_foto.DataSource = Session["foto"];
        GV_archivo_foto.DataBind();

        GV_archivo_file.DataSource = Session["archivo"];
        GV_archivo_file.DataBind();
    }

    //-----------------------imagen--------------------------------
    protected void B_cargar_foto_Click(object sender, EventArgs e)
    {

        ClientScriptManager cm = this.ClientScript;
        String nombreArchivo = System.IO.Path.GetFileName(FU_archivo_foto.PostedFile.FileName);
        string extension = System.IO.Path.GetExtension(FU_archivo_foto.PostedFile.FileName);
        string saveLocation = Server.MapPath("~\\Imagenes\\Imagenes_Archivos");

        L_Subir_archivos operacion = new L_Subir_archivos();
        U_Subir_archivos datos = new U_Subir_archivos();
        datos = operacion.seleccion_foto(nombreArchivo, extension, saveLocation, Session["foto"]);

        cm.RegisterClientScriptBlock(this.GetType(), "", datos.Mensajes);

        if (datos.Guardar == true)
        {
            try
            {
                FU_archivo_foto.PostedFile.SaveAs(datos.Url_pag);

                Session["foto"] = datos.Session_fotos;

                //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo ha sido cargado');</script>");
                Response.Write("<script type='text/javascript'>alert('La imagen ha sido cargada');</script>");

                llenar_grillas();
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
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Imagen no cargada');</script>");
        }

    }

    protected void GV_archivo_foto_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //obetenemos la fila
        GridViewRow fila = GV_archivo_foto.Rows[e.RowIndex];

        //Enviamos variable con su respectiva conversion
        //int id = int.Parse(((Label)GV_Archivo.Rows[e.RowIndex].FindControl("L_Id")).Text.ToString());
        string ruta = (fila.FindControl("Label3") as Label).Text.ToString();
        string saveLocation = Server.MapPath(ruta);

        try
        {
            System.IO.File.Delete(saveLocation);
            Session["foto"] = null;
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('La imagen ha sido Eliminada');</script>");
        }
        catch (Exception exc)
        {
            throw exc;
        }

        llenar_grillas();
    }

    //-----------------------archivo--------------------------------
    protected void B_cargar_file_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //String nombreArchivo = System.IO.Path.GetFileName(FU_archivo_file.PostedFile.FileName);
        string nom = TB_archivo_nombre.Text.ToString();
        string extension = System.IO.Path.GetExtension(FU_archivo_file.PostedFile.FileName);
        String nombreArchivo = nom + extension;
        string saveLocation = Server.MapPath("~\\Archivos");
        //string ruta = "hola";
        //DataTable archivo;

        L_Subir_archivos operacion = new L_Subir_archivos();
        U_Subir_archivos datos = new U_Subir_archivos();
        datos = operacion.seleccion_archivo(nombreArchivo, extension, saveLocation, Session["archivo"]);

        cm.RegisterClientScriptBlock(this.GetType(), "", datos.Mensajes);

        if (datos.Guardar == true)
        {
            try
            {
                FU_archivo_file.PostedFile.SaveAs(datos.Url_pag);

                Session["archivo"] = datos.Session_archivo;

                //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo ha sido cargado');</script>");
                Response.Write("<script type='text/javascript'>alert('El archivo ha sido cargado');</script>");

                llenar_grillas();
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

    protected void GV_archivo_file_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;
        //obetenemos la fila
        GridViewRow fila = GV_archivo_file.Rows[e.RowIndex];

        //Enviamos variable con su respectiva conversion
        //int id = int.Parse(((Label)GV_Archivo.Rows[e.RowIndex].FindControl("L_Id")).Text.ToString());
        string ruta = (fila.FindControl("Label4") as Label).Text.ToString();
        string saveLocation = Server.MapPath(ruta);

        try
        {
            System.IO.File.Delete(saveLocation);
            Session["archivo"] = null;
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo ha sido Eliminado');</script>");
        }
        catch (Exception exc)
        {
            throw exc;
        }

        llenar_grillas();
    }

    protected void GV_archivo_file_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Download")
        {
            string ruta = (e.CommandArgument).ToString();

            //forma de descargar archivos utilizando la libreria .IO
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(ruta));
            Response.WriteFile(ruta);
            Response.End();
        }
    }

    //-----------------------boton--------------------------------
    protected void B_archivo_subir_Click(object sender, EventArgs e)
    {
        ClientScriptManager cm = this.ClientScript;

        //reiniciamos session
        Session["tags"] = null;
        Session["autor"] = null;

        //obtenemos la variable de session de la imagen y archivo
        DataTable imagen_file = new DataTable();
        imagen_file = (DataTable)Session["foto"];
        DataTable archivo_file = new DataTable();
        archivo_file = (DataTable)Session["archivo"];
        
        //obetenmos las variables
        string nombre = TB_archivo_nombre.Text.ToString() +".pdf";
        string anio = TB_archivo_fecha.Text.ToString();
        string sinopsis = TB_archivo_sinopsis.Text.ToString();
        string num_pag = TB_archivo_paginas.Text.ToString();
        string foto_archivo = "";
        string link_archivo = "";
        string id_user = Session["rolID"].ToString();
        String tags = "";
        string rol_user = Session["rolUser"].ToString();
        DataList dl_tags = DL_archivo_tags;
        DataList dl_autor = DL_archivo_autores;
        //asignamos contadores 
        string categoria = DDL_archivo_categoria.SelectedValue.ToString();
        int cont_categoria = 0;
        int cont_autor = 0;
        int val_autor = 0;

        //foreach es un ciclo, Sintaxis: (var objeto, in coleccion(componente))
        //recorremos el datalist y guardamos
 
        // ---------------------------- obtenemos los tags ********************** 
        foreach (DataListItem dl0 in dl_tags.Items)
        {
            //iniciamos ciclo y preguntamos si hay checklist seleccionados para guardar
            CheckBox cb0 = (CheckBox)(dl0.FindControl("CB_tags"));
            if (cb0.Checked == true)
            {
                if (Session["tags"] == null)
                {
                    Session["tags"] = "hola";
                }
                tags += cb0.Text + '-';
            }

        }

        // ---------------------------- obtenemos los autores ********************** 
        foreach (DataListItem dl in dl_autor.Items)
        {
            //iniciamos ciclo y preguntamos si hay checklist seleccionados para guardar
            CheckBox cb = (CheckBox)(dl.FindControl("CB_autores"));
            if (cb.Checked == true)
            {
                if (Session["autor"] == null)
                {
                    Session["autor"] = "hola";
                }
                cont_autor += 1;
            }

        }

        //creamos el array que contendra los nombres de los autores
        string[] nom_autores = new string[cont_autor];

        foreach (DataListItem dl1 in DL_archivo_autores.Items)
        {
            //iniciamos ciclo y preguntamos si hay checklist seleccionados para guardar
            CheckBox cb1 = (CheckBox)(dl1.FindControl("CB_autores"));
            if (cb1.Checked == true)
            {
                //guardamos los nombres de cada autor
                nom_autores[val_autor] = cb1.Text.ToString();
                val_autor += 1;

            }//if

        }//foreach


        // ---------------------------- llammamos logica y mandamos variables ********************** 
        L_Subir_archivos operacion = new L_Subir_archivos();
        U_Subir_archivos datos_registro = operacion.subir_archivo(nombre, anio, sinopsis, num_pag, foto_archivo, link_archivo,
                                          id_user, tags, rol_user, categoria, cont_categoria, cont_autor, nom_autores,
                                          imagen_file, archivo_file, Session["tags"], Session["autor"]);


        //reiniciamos session
        Session["foto"] = datos_registro.Session_fotos;
        Session["archivo"] = datos_registro.Session_archivo;
        Session["tags"] = null;
        Session["autor"] = null;
        llenar_grillas();
        cm.RegisterClientScriptBlock(this.GetType(), "", datos_registro.Mensajes);
    
    }//boton

    protected void DDL_archivo_categoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        //obetenmos el valor del dropdownlist y lo guardamos en una variable
        string identificacion = DDL_archivo_categoria.SelectedItem.ToString();

        //llamamos el metodo
        L_Subir_archivos operacion = new L_Subir_archivos();
        //Consultar datos = new Consultar();
        DataTable info = operacion.precio(identificacion);

        TB_archivo_precio.Text = "$ " + info.Rows[0]["precio_categoria"].ToString();
    }

    protected void GV_archivo_foto_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //definimos fila
        GridViewRow fila = e.Row;

        //Buscamos controles
        if (fila.FindControl("LinkButton1") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton1")).Text = datos_idioma.Rows[12]["Texto"].ToString();
        }

    }

    protected void GV_archivo_file_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //definimos fila
        GridViewRow fila = e.Row;

        //Buscamos controles
        if (fila.FindControl("LinkButton3") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton3")).Text = datos_idioma.Rows[16]["Texto"].ToString();
        }

    }

}//principal