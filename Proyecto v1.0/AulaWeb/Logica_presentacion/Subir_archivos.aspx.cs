using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentacion_Subir_archivos : System.Web.UI.Page
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
                {   //oculta las herramientas de categoria
                    L_archivo_categoria.Visible = false;
                    TB_archivo_precio.Visible = false;
                    DDL_archivo_categoria.Visible = false;

                }
                else
                {   //muestra las herramientas de categoria
                    L_archivo_categoria.Visible = true;
                    TB_archivo_precio.Visible = true;
                    DDL_archivo_categoria.Visible = true;
                }
            }
            TB_archivo_fecha.Text = DateTime.Now.ToString("yyyy,MM,dd");
            llenar_grillas();
        }
    }//page_load

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
        string saveLocation = "hola";
        string ruta = "hola";
        DataTable imagen;

        //validamos que se haya seleccionado un archivo
        if (nombreArchivo.Equals("") || extension.Equals(""))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe seleccionar una imagen');</script>");
            return;
        }
        else
        {

            if (Session["foto"] == null)
            {
                imagen = new DataTable();
                imagen.Columns.Add("nombre");
                imagen.Columns.Add("ruta");
                Session["foto"] = imagen;
            }

            imagen = (DataTable)Session["foto"];

        }

        //evaluamos la cantidad de filas
        if (imagen.Rows.Count == 1)
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No puede subir mas de 1 archivo');</script>");
            return;
        }

        //preguntamos al extension y damos la localizacion de la carpeta
        if (!(extension.Equals(".jpg") || extension.Equals(".JPG") || extension.Equals(".png") || extension.Equals(".PNG") || extension.Equals(".jpge") || extension.Equals(".bmp")))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tipo de archivo no valido - solo formatos(jpg, jpeg, png o bmp)');</script>");
            return;
        }
        else
        {
            saveLocation = (Server.MapPath("~\\Imagenes\\Imagenes_Archivos") + "\\" + nombreArchivo);
            ruta = saveLocation;
        }

        //confirmamos que no exitas el archivo
        if (System.IO.File.Exists(saveLocation))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe un archivo en el servidor con ese nombre');</script>");
            return;
        }

        try
        {
            //cargar
            FU_archivo_foto.PostedFile.SaveAs(saveLocation);
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('La imagen ha sido cargada');</script>");
        }
        catch (Exception exc)
        {
            //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error: ');</script>");
            //return;
            throw exc;
        }

        //llenamos el data table
        string[] celdas = new string[2];
        celdas[0] = nombreArchivo;
        celdas[1] = "~\\Imagenes\\Imagenes_Archivos" + "\\" + nombreArchivo;

        imagen.Rows.Add(celdas);

        Session["foto"] = imagen;

        llenar_grillas();

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
        string saveLocation = "hola";
        string ruta = "hola";
        DataTable archivo;

        //validamos que se haya seleccionado un archivo
        if (nombreArchivo.Equals("") || extension.Equals(""))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe seleccionar un archivo');</script>");
            return;
        }
        else
        {

            if (Session["archivo"] == null)
            {
                archivo = new DataTable();
                archivo.Columns.Add("nombre");
                archivo.Columns.Add("url");
                Session["archivo"] = archivo;
            }

            archivo = (DataTable)Session["archivo"];

        }

        //evaluamos la cantidad de filas
        if (archivo.Rows.Count == 1)
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No puede subir mas de 1 archivo');</script>");
            return;
        }

        //preguntamos al extension y damos la localizacion de la carpeta
        if (!(extension.Equals(".pdf")))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tipo de archivo no valido - solo formatos(.pdf)');</script>");
            return;
        }
        else
        {
            saveLocation = (Server.MapPath("~\\Archivos") + "\\" + nombreArchivo);
            ruta = saveLocation;
        }

        //confirmamos que no exitas el archivo
        if (System.IO.File.Exists(saveLocation))
        {
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe un archivo en el servidor con ese nombre');</script>");
            return;
        }

        try
        {
            //cargar
            FU_archivo_file.PostedFile.SaveAs(saveLocation);
            cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('El archivo ha sido cargado');</script>");
        }
        catch (Exception exc)
        {
            //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Error: ');</script>");
            //return;
            throw exc;
        }

        //llenamos el data table
        string[] celdas = new string[2];
        celdas[0] = nombreArchivo;
        celdas[1] = "~\\Archivos" + "\\" + nombreArchivo;

        archivo.Rows.Add(celdas);

        Session["archivo"] = archivo;

        llenar_grillas();
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
            //Response.Redirect(ruta);
            //Response.Write("<script>window.open('"+ ruta +"','_blank')<" + "/script>");

            //var ruta = Server.MapPath("~\\Archivos\\") + e.CommandArgument;
            //string scrip = "<script type='text/javascript'>window.open('" + ruta + e.CommandName + "','_blank');target='_blank'</script>";
            //Response.Write(scrip);

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

        //obtenemos la variable de session
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
        //asignamos la categoria por roles
        string categoria;
        int cont_categoria = 0;
        //cuando el componente esta oculto no se puede utilizar para el rol 3
        if (int.Parse(Session["rolUser"].ToString()) == 3) { categoria = "1"; }
        else { categoria = DDL_archivo_categoria.SelectedValue.ToString(); 
               cont_categoria = int.Parse(DDL_archivo_categoria.SelectedValue.ToString()); }

        //mandamos parametros para verificar que no existan en el sistema
        Consultar datos = new Consultar();
        DataTable informacion_archivo = datos.consultar_archivo_nombre(nombre);

        //verificamos si la consulta trajo parametros
        if (informacion_archivo.Rows.Count == 0)
        {//datos no registrados usuario valido para insertar

            //--------------categorias_validaciones..............................................

            if (cont_categoria == 1)
            {
                Response.Write("<script type='text/javascript'>alert('Debe seleccionar una categoria');</script>");
                return;
            }

            //--------------imagen_validaciones..............................................

            //preguntamos si posee parametros
            if (imagen_file != null)
            {
                foto_archivo = imagen_file.Rows[0][1].ToString();
            }
            else
            {
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe ingresar la imagen de la portada');</script>");
                return;
            }

            //--------------archivo_validaciones..............................................

            //preguntamos si posee parametros
            if (archivo_file != null)
            {
                link_archivo = archivo_file.Rows[0][1].ToString();
            }
            else
            {
                cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe ingresar el archivo');</script>");
                return;
            }

            //--------------tags_validaciones..............................................

            //foreach es un ciclo, Sintaxis: (var objeto, in coleccion(componente))
            //recorremos el datalist y guardamos 
            foreach (DataListItem dl0 in DL_archivo_tags.Items)
            {
                //iniciamos ciclo y preguntamos si hay checklist seleccionados para guardar
                CheckBox cb0 = (CheckBox)(dl0.FindControl("CB_tags"));
                if (cb0.Checked == true) 
                {
                    if (Session["tags"] == null)
                    {
                        Session["tags"] = "hola";
                    }
                    tags += cb0.Text +'-';
                }

            }

            //si la session es nula, no hay checklist seleccionados
            if (Session["tags"] == null)
            {
                Response.Write("<script type='text/javascript'>alert('Debe seleccionar tags');</script>");
                return;
            }

            //--------------autores_validaciones..............................................

            //foreach es un ciclo, Sintaxis: (var objeto, in coleccion(componente))
            //recorremos el datalist y guardamos 
            foreach (DataListItem dl in DL_archivo_autores.Items)
            {
                //iniciamos ciclo y preguntamos si hay checklist seleccionados para guardar
                CheckBox cb = (CheckBox)(dl.FindControl("CB_autores"));
                if (cb.Checked == true)
                {
                    if (Session["autor"] == null)
                    {
                        Session["autor"] = "hola";
                    }
                }

            }

            //si la session es nula, no hay checklist seleccionados
            if (Session["autor"] == null)
            {
                Response.Write("<script type='text/javascript'>alert('Debe seleccionar algun autor');</script>");
                return;
            }

            //--------------insertar_archivo..............................................

            //Encapsulamos datos
            Encapsular_archivo datosArchivo = new Encapsular_archivo();

            datosArchivo.Nombre = nombre;
            datosArchivo.Fecha = anio;
            datosArchivo.Sinopsis = sinopsis;
            datosArchivo.NumPag = num_pag;
            datosArchivo.IdCategoria = categoria;
            datosArchivo.Foto = foto_archivo;
            datosArchivo.Link = link_archivo;
            datosArchivo.IdUser = id_user;
            datosArchivo.Tags = tags;
            datosArchivo.IdMod = rol_user;
            datosArchivo.UserCambio = Session["rolID"].ToString();

            //mandamos al metodo de agregar archivo
            Insertar archivoDatos = new Insertar();

            try
            {
                archivoDatos.insertar_archivo(datosArchivo);
            }
            catch (Exception exc)
            {
                throw exc;
            }

            //llamamos la clase encapsular
            Encapsular_archivo_autor archivo_autor = new Encapsular_archivo_autor();

            //foreach es un ciclo, Sintaxis: (var objeto, in coleccion)
            //recorremos el datalist y guardamos 
            foreach (DataListItem dl1 in DL_archivo_autores.Items)
            {
                //iniciamos ciclo y preguntamos si hay checklist seleccionados para guardar
                CheckBox cb1 = (CheckBox)(dl1.FindControl("CB_autores"));
                if (cb1.Checked == true)
                {
                    //encapsulamos
                    archivo_autor.NombreAutor = cb1.Text.ToString();
                    archivo_autor.UserCambio = Session["rolID"].ToString();

                    try
                    {
                        //mandamos al metodo de agregar archivo_autor
                        archivoDatos.insertar_archivo_autor(archivo_autor);
                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }

                }//if

            }//foreach

            //obtenemos los datos del ultimo archivo subido
            DataTable info = datos.mostrar_archivo();

            //Encapsulamos datos
            Encapsular_subir_descargar subir_descargar = new Encapsular_subir_descargar();

            //obtenemos la posicion de la fila
            int contador = info.Rows.Count - 1;
            subir_descargar.IdUser = Session["rolID"].ToString();
            subir_descargar.IdArchivo = info.Rows[contador][0].ToString();
            subir_descargar.Concepto = "Upload";
            subir_descargar.Precio = "0";
            subir_descargar.UserCambio = Session["rolID"].ToString();

            try
            {
                //mandamos al metodo de agregAR subir_descargar
                archivoDatos.insertar_subir_descargar(subir_descargar);
            }
            catch (Exception exc)
            {
                throw exc;
            }

            //reiniciamos session
            Session["foto"] = null;
            Session["archivo"] = null;
            Session["tags"] = null;
            Session["autor"] = null;

            llenar_grillas();
            //confirmamos y redireccionamos
            Response.Write("<script type='text/javascript'>alert('Archivo subido con exito, esperar a moderacion');window.location=\"inicio.aspx\"</script>");

        }//if
        else
        { //si trajo parametros el usuario esta en el sistema

            Response.Write("<script type='text/javascript'>alert('El nombre(archivo) ya se encuentra registrado');</script>");
        }

    
    }//boton

    protected void DDL_archivo_categoria_SelectedIndexChanged(object sender, EventArgs e)
    {
        //obetenmos el valor del dropdownlist y lo guardamos en una variable
        string identificacion = DDL_archivo_categoria.SelectedItem.ToString();

        //llamamos el metodo
        Consultar datos = new Consultar();
        DataTable info = datos.consultar_categoria(identificacion);

        TB_archivo_precio.Text = "$ " + info.Rows[0]["precio"].ToString();
    }
}//principal