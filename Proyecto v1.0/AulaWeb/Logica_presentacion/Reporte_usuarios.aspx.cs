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
            Data_Reportes reporte = ObtenerInforme();
            CRS_usuarios.ReportDocument.SetDataSource(reporte);
            CRV_usuarios.ReportSource = CRS_usuarios;

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
        personaInformacion = datos.Tables["DT_usuarios"];

        //hacemos una consulta para obtener los datos en otro datatable que servira de intermedio
        Dao_Ver_Reportes dao = new Dao_Ver_Reportes();
        DataTable Intermedio = dao.consultar_reporte_usuarios();

        //recorremos el datatable intermedio
        for (int i = 0; i < Intermedio.Rows.Count; i++)
        {
            //definimos una nueva fila para agregar los datos del datatable intermedio
            fila = personaInformacion.NewRow();

            //agregamos las campos y los llenamos con los datos del datatable intermedio
            fila["id_usuario"] = int.Parse(Intermedio.Rows[i]["id_usuario"].ToString());
            fila["nombre"] = Intermedio.Rows[i]["nombre"].ToString();
            fila["apellido"] = Intermedio.Rows[i]["apellido"].ToString();
            fila["documento"] = Intermedio.Rows[i]["documento"].ToString();
            fila["telefono"] = Intermedio.Rows[i]["telefono"].ToString();
            fila["correo"] = Intermedio.Rows[i]["correo"].ToString();
            fila["usuario"] = Intermedio.Rows[i]["usuario"].ToString();
            fila["clave"] = Intermedio.Rows[i]["clave"].ToString();
            fila["dinero"] = Intermedio.Rows[i]["dinero"].ToString();
            fila["id_rol"] = Intermedio.Rows[i]["id_rol"].ToString();
            fila["rol"] = Intermedio.Rows[i]["rol"].ToString();

            //finalmente ya con los datos, agregamos la fila al datatable principal
            personaInformacion.Rows.Add(fila);
        }

        return datos;
    }

}//principal