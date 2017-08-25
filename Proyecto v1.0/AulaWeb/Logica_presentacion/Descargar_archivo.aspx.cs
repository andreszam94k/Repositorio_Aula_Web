using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentacion_Descargar_archivo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            //preguntamos si la session es nula para verficar que venga procedente de consultar archivo
            if (Session["archivoID"] == null)
            {
                //si es nula se redirecciona a consultar archivo
                Response.Redirect("Consultar_archivo.aspx");
            }
            else
            {   //preguntamos si es un usuario registrado o un visitante
                if (Session["user"] == null)
                {
                    //ocultamos componentes
                    IB_descargar_archivo.Visible = false;
                    TB_comentario.Visible = false;
                    B_comentar.Visible = false;
                }
                else
                {
                    //mostramos componentes
                    IB_descargar_archivo.Visible = true;
                    TB_comentario.Visible = true;
                    B_comentar.Visible = true;
                }
            }
            //llenamos los componentes con valores del archivo
            llenar_componentes();
        }
    }//page_load

    protected void llenar_componentes() 
    {
        string autores = "";
        //consultar los datos del archivo
        Consultar archivo_datos = new Consultar();
        string id_archivo = Session["archivoID"].ToString();
        DataTable info_archivo = archivo_datos.ver_archivo(id_archivo);

        //----------------------llenamos los componentes con los datos......................................
        Image1_archivo.ImageUrl = info_archivo.Rows[0]["imagen_portada"].ToString();
        L_nombre_archivo.Text = info_archivo.Rows[0]["nombre"].ToString();
        L_fecha_archivo.Text = info_archivo.Rows[0]["anio"].ToString();
        L_paginas_archivo.Text = info_archivo.Rows[0]["num_pag"].ToString();
        L_categoria_archivo.Text = info_archivo.Rows[0]["categoria"].ToString();
        L_precio_archivo.Text = "$ " + info_archivo.Rows[0]["precio"].ToString();
        TB_sinopsis_archivo.Text = info_archivo.Rows[0]["sinopsis"].ToString();
        L_tags_archivo.Text = info_archivo.Rows[0]["tags"].ToString();

        //foreach es un ciclo, Sintaxis: (var objeto, in coleccion(componente))
        // Todas las filas del datatable' rows
        foreach (DataRow dtRow in info_archivo.Rows)
        {
            autores += dtRow["nombre_autor"].ToString() + " | ";
        }//foreach filas

        //agregamos los autores
        L_autor_archivo.Text = autores;

        //llenamos el gridview
        llenar_grilla(id_archivo);

    }//llenar componentes

    protected void llenar_grilla(string id_archivo) 
    {
        Consultar comentarios = new Consultar();
        DataTable datos = comentarios.consultar_comentarios(id_archivo);

        GV_comentarios.DataSource = datos;
        GV_comentarios.DataBind();

    }//llenar grillas


    protected void IB_descargar_archivo_Click(object sender, ImageClickEventArgs e)
    {
        //lamamos el metodo
        ClientScriptManager cm = this.ClientScript;
        Insertar campos;

        //consultamos los datos del usuario para obtener su saldo y los datos del archivo para saber su precio
        Consultar datos_descarga = new Consultar();
        DataTable info_user = datos_descarga.consultar_usuario(Session["user"].ToString());
        DataTable info_file = datos_descarga.ver_archivo(Session["archivoID"].ToString());

        int saldo = int.Parse(info_user.Rows[0]["dinero"].ToString());
        int precio = int.Parse(info_file.Rows[0]["precio"].ToString());

        //preguntamos que el user tenga dinero en la cuenta
        if (saldo != 0)
        {//tiene dinero en la cuenta

            //preguntamos si tiene dinero suficiente para comprar el archivo 
            if(saldo >= precio)
            {//permitir decarga

                //--------------encapsulamos campos..............................................
                Encapsular_subir_descargar subir_descargar = new Encapsular_subir_descargar();

                subir_descargar.IdUser = info_user.Rows[0]["id_usuario"].ToString();
                subir_descargar.IdArchivo = info_file.Rows[0]["id_archivo"].ToString();
                subir_descargar.Concepto = "Download";
                subir_descargar.Precio = precio.ToString();
                subir_descargar.UserCambio = Session["rolID"].ToString();

                Encapsular_descargar_archivo descargar = new Encapsular_descargar_archivo();

                descargar.IdUser = info_user.Rows[0]["id_usuario"].ToString();
                descargar.Dinero = precio.ToString();
                descargar.UserCambio = Session["rolID"].ToString();

                //creamos el metodo
                campos = new Insertar();

                //--------------descargar_archivo..............................................
                try
                {
                    campos.insertar_descargar_archivo(descargar);
                    campos.insertar_subir_descargar(subir_descargar);
                    //cambiamos el valor de la session
                    Session["dinero"] = saldo - precio;

                    string ruta = info_file.Rows[0]["url"].ToString();
                    //forma de descargar archivos utilizando la libreria .IO
                    Response.ContentType = ContentType;
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(ruta));
                    Response.WriteFile(ruta);
                    //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Archivo descargado con exito');</script>");
                    Response.End();
                }
                catch(Exception exc)
                {
                    throw exc;
                }         
                
            }
            else
            {//no alcanza el dinero
                Response.Write("<script type='text/javascript'>alert('Dinero insuficiente para descargar el archivo, para obtener dinero participe subiendo archivos');</script>");
                return;
            }
        }
        else
        {//el user se quedo sin dinero
            Response.Write("<script type='text/javascript'>alert('No tiene dinero en su cuenta, para obtener dinero participe subiendo archivos');</script>");
            return;
        }


    }//descargar

    protected void B_comentar_Click(object sender, EventArgs e)
    {
        //llamamos el metodo
        Insertar comentario_user = new Insertar();
        Encapsular_comentario comentario = new Encapsular_comentario();

        //obtenemos los datos
        string comentary = TB_comentario.Text.ToString();
        // encapsulamos campos
        comentario.IdUser = Session["rolID"].ToString();
        comentario.IdArchivo = Session["archivoID"].ToString();
        comentario.Comentario = comentary;
        comentario.UserCambio = Session["rolID"].ToString();

        //--------------insertar_comentario..............................................
        try
        {
            comentario_user.insertar_comentario(comentario);
            Response.Redirect("Descargar_archivo.aspx");
        }
        catch (Exception exc)
        {
            throw exc;
        }

    }//comentar

}//principal