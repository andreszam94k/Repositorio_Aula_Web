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

        string saveLocation = Server.MapPath("~\\Imagenes\\Imagenes_Autores");
        string url_defecto = Server.MapPath("~\\Imagenes\\");

        try
        {
            //llamamos los metodos para llenar los informes
            L_Reporte_autores operacion = new L_Reporte_autores();
            Data_Reportes reporte = operacion.ObtenerInforme(saveLocation, url_defecto);

            CRS_autores.ReportDocument.SetDataSource(reporte);
            CRV_autores.ReportSource = CRS_autores;

        }
        catch (Exception exc)
        {

            throw exc;
        }

    }//poblar reporte

    


}//princicpal