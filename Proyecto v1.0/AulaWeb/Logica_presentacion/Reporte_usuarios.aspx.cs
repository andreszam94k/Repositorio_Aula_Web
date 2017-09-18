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

public partial class Presentacion_Reporte_usuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            //llamamos la logica y el metodo
            L_Reporte_usuarios operacion = new L_Reporte_usuarios();
            U_Reporte_usuarios datos = new U_Reporte_usuarios();
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
            L_Reporte_usuarios operacion = new L_Reporte_usuarios();
            Data_Reportes reporte = operacion.ObtenerInforme();

            CRS_usuarios.ReportDocument.SetDataSource(reporte);
            CRV_usuarios.ReportSource = CRS_usuarios;

        }
        catch (Exception exc)
        {

            throw exc;
        }

    }//poblar reporte



}//principal