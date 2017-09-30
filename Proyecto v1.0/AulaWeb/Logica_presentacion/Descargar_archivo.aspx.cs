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

public partial class Presentacion_Descargar_archivo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Descargar_archivo operacion = new L_Descargar_archivo();
            U_Descargar_archivo datos = new U_Descargar_archivo();
            datos = operacion.verificar(Session["archivoID"], Session["user"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            //visualizamos componentes
            IB_descargar_archivo.Visible = datos.Mostrar;
            TB_comentario.Visible = datos.Mostrar;
            B_comentar.Visible = datos.Mostrar;
            
            //llenamos los componentes con valores del archivo
            llenar_componentes();
        }
    }//page_load

    protected void llenar_componentes() 
    {
        if (Session["archivoID"] != null) 
        {
            string autores = "";
            //consultar los datos del archivo
            L_Descargar_archivo operacion = new L_Descargar_archivo();
            string id_archivo = Session["archivoID"].ToString();
            DataTable info_archivo = operacion.archivo_datos(id_archivo);

            //----------------------llenamos los componentes con los datos......................................
            Image1_archivo.ImageUrl = info_archivo.Rows[0]["ImagenPortada"].ToString();
            L_nombre_archivo.Text = info_archivo.Rows[0]["Nombre"].ToString();
            L_fecha_archivo.Text = info_archivo.Rows[0]["Anio"].ToString();
            L_paginas_archivo.Text = info_archivo.Rows[0]["NumPag"].ToString();
            L_categoria_archivo.Text = info_archivo.Rows[0]["Categoria"].ToString();
            L_precio_archivo.Text = "$ " + info_archivo.Rows[0]["Precio"].ToString();
            TB_sinopsis_archivo.Text = info_archivo.Rows[0]["Sinopsis"].ToString();
            L_tags_archivo.Text = info_archivo.Rows[0]["Tags"].ToString();

            //foreach es un ciclo, Sintaxis: (var objeto, in coleccion(componente))
            // Todas las filas del datatable' rows
            foreach (DataRow dtRow in info_archivo.Rows)
            {
                autores += dtRow["NombreAutor"].ToString() + " | ";
            }//foreach filas

            //agregamos los autores
            L_autor_archivo.Text = autores;

            //llenamos el gridview
            llenar_grilla(id_archivo);
        }

    }//llenar componentes

    protected void llenar_grilla(string id_archivo) 
    {
        L_Descargar_archivo ver_comen = new L_Descargar_archivo();
        DataTable datos = ver_comen.comentarios(id_archivo);

        GV_comentarios.DataSource = datos;
        GV_comentarios.DataBind();

    }//llenar grillas


    protected void IB_descargar_archivo_Click(object sender, ImageClickEventArgs e)
    {
        //llamamos la logica y el metodo
        L_Descargar_archivo operacion = new L_Descargar_archivo();
        U_Descargar_archivo datos = new U_Descargar_archivo();

        datos = operacion.descargar_archivo(Session["user"].ToString(), Session["archivoID"].ToString(), Session["rolID"].ToString());

        Session["dinero"] = datos.Session_dinero;
        Response.Write(datos.Mensajes);

        if(datos.Descargar == true)
        {
            //forma de descargar archivos utilizando la libreria Web.IO
            Response.ContentType = ContentType;
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(datos.Url_pag));
            Response.WriteFile(datos.Url_pag);
            Response.End();

        }

    }//descargar

    protected void B_comentar_Click(object sender, EventArgs e)
    {
        //llamamos la logica y el metodo
        L_Descargar_archivo operacion = new L_Descargar_archivo();
        U_Descargar_archivo datos = new U_Descargar_archivo();

        //obtenemos los datos
        string comentary = TB_comentario.Text.ToString();

        datos = operacion.comentar_archivo(comentary, Session["rolID"].ToString(), Session["archivoID"].ToString());

        Response.Write(datos.Url_pag);

    }//comentar

}//principal