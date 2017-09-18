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

public partial class Presentacion_Reporte_archivos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Reporte_archivos operacion = new L_Reporte_archivos();
            U_Reporte_archivos datos = new U_Reporte_archivos();
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);
            poblar_reporte();
        }
    }//page_load

    private void poblar_reporte()
    {

        string saveLocation = Server.MapPath("~\\Imagenes\\Imagenes_Archivos");
        string url_defecto = Server.MapPath("~\\Imagenes\\");
        
        try
        {
            //llamamos los metodos para llenar los informes
            L_Reporte_archivos operacion = new L_Reporte_archivos();
            Data_Reportes reporte = operacion.ObtenerInforme(saveLocation, url_defecto);

            CRS_archivos.ReportDocument.SetDataSource(reporte);
            CRV_archivos.ReportSource = CRS_archivos;

        }
        catch (Exception exc)
        {

            throw exc;
        }

    }//poblar reporte


}//principal