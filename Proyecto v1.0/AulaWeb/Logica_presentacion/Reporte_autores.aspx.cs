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

public partial class Presentacion_Reporte_autores : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Reporte_autores operacion = new L_Reporte_autores();
            U_Reporte_autores datos = new U_Reporte_autores();
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);
            poblar_reporte();
        }
    }//page_load

    private void poblar_reporte()
    {

        try
        {
            //llamamos los metodos para llenar los informes
            Data_Reportes reporte = ObtenerInforme();
            CRS_autores.ReportDocument.SetDataSource(reporte);
            CRV_autores.ReportSource = CRS_autores;

        }
        catch (Exception exc)
        {

            throw exc;
        }

    }//poblar reporte

    //metodo para llenar informe principal
    //NOTA: el subinforme obtiene los datos de esta consulta, si falta alguno no lo muestra
    protected Data_Reportes ObtenerInforme()
    {
        //definimos la fila la cual contendra los datos del datatable intermedio
        DataRow fila;  //dr
        //definimos un datatable principal y llamamos al dataset
        DataTable personaInformacion = new DataTable(); //dt
        Data_Reportes datos = new Data_Reportes();

        //llenamos el datatable principal con la info del data set
        personaInformacion = datos.Tables["DT_autores"];

        //hacemos una consulta para obtener los datos en otro datatable que servira de intermedio
        Dao_Ver_Reportes dao = new Dao_Ver_Reportes();
        DataTable Intermedio = dao.consultar_reporte_autores();

        //recorremos el datatable intermedio
        for (int i = 0; i < Intermedio.Rows.Count; i++)
        {
            //definimos una nueva fila para agregar los datos del datatable intermedio
            fila = personaInformacion.NewRow();

            //agregamos las campos y los llenamos con los datos del datatable intermedio
            fila["id_autor"] = int.Parse(Intermedio.Rows[i]["id_autor"].ToString());
            fila["nombre"] = Intermedio.Rows[i]["nombre"].ToString();
            fila["fecha_birth"] = Intermedio.Rows[i]["fecha_birth"].ToString();
            fila["fecha_death"] = Intermedio.Rows[i]["fecha_death"].ToString();
            fila["descripcion"] = Intermedio.Rows[i]["descripcion"].ToString();
            fila["id_nacionalidad"] = int.Parse(Intermedio.Rows[i]["id_nacionalidad"].ToString());
            fila["pais"] = Intermedio.Rows[i]["pais"].ToString();
            //para la imagen se utiliza un metodo
            fila["foto"] = obtenerImagen(Intermedio.Rows[i]["foto"].ToString());

            //finalmente ya con los datos, agregamos la fila al datatable principal
            personaInformacion.Rows.Add(fila);
        }

        return datos;
    }

    //metodo obtener imagen que convierte la ruta en un conjunto de datos binarios
    //NOTA:para hacer la conversion la imagen debe definirse como .Byte[] en el dataset
    protected byte[] obtenerImagen(String url)
    {
        //definimos la ruta fisica de la imagen
        String urlImagen = Server.MapPath(url);

        //preguntamos si no existe la imagen en el servidor 
        if (!System.IO.File.Exists(urlImagen))
        {
            //si no existe dejamos una por defecto
            urlImagen = Server.MapPath("~\\Imagenes\\" + "autor.png");
        }

        // FileStream stream = File.OpenRead(@""+ urlImagen);

        //este metodo hace la conversion binaria de la imagen
        byte[] fileBytes = System.IO.File.ReadAllBytes(urlImagen);

        return fileBytes;

    }


}//princicpal