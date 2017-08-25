using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Presentacion_Reporte_usuarios : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        if (!IsPostBack)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("inicio.aspx");
            }
            else
            {
                if (int.Parse(Session["rolUser"].ToString()) != 1)
                {
                    Response.Redirect("inicio.aspx");
                }
            }
            poblar_reporte();
        }
    }//page_load

    private void poblar_reporte()
    {

        try
        {
            //llamamos los metodos para llenar los informes
            Reportes reporte = ObtenerInforme();
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
    protected Reportes ObtenerInforme()
    {
        //definimos la fila la cual contendra los datos del datatable intermedio
        DataRow fila;  //dr
        //definimos un datatable principal y llamamos al dataset
        DataTable personaInformacion = new DataTable(); //dt
        Reportes datos = new Reportes();

        //llenamos el datatable principal con la info del data set
        personaInformacion = datos.Tables["usuarios"];

        //hacemos una consulta para obtener los datos en otro datatable que servira de intermedio
        Consultar dao = new Consultar();
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