using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using Logica;
using Utilitarios;
using Data;


public partial class Presentacion_inicio_sesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        //llamamos la logica y el metodo
        L_inicio_sesion operacion = new L_inicio_sesion();
        U_inicio_sesion datos = new U_inicio_sesion();
        datos = operacion.verificar(Session["user"]);

        //enviar desde la logica un codigo scrip
        //this.RegisterStartupScript("mensaje", datos.Url_pag);
        Response.Write(datos.Url_pag);

        DataTable datos_idioma = new DataTable();
        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 8);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 8);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MIS_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MIS_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        HL_CrearUser.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_inicio_usuario.Text = idioma_data.Rows[3]["Texto"].ToString();
        L_inicio_clave.Text = idioma_data.Rows[4]["Texto"].ToString();
        B_iniciarSession.Text = idioma_data.Rows[5]["Texto"].ToString();
        B_cancelarSession.Text = idioma_data.Rows[6]["Texto"].ToString();

        //errores
        RFV_usuario.ErrorMessage = idioma_data.Rows[7]["Texto"].ToString();
        REV_usuario.ErrorMessage = idioma_data.Rows[8]["Texto"].ToString();
        RFV_contraseña.ErrorMessage = idioma_data.Rows[9]["Texto"].ToString();
        REV_contraseña.ErrorMessage = idioma_data.Rows[10]["Texto"].ToString();
    }

    protected void B_iniciarSession_Click(object sender, EventArgs e)
    {
        
        //asigno esos valores para despues mandarlos a la funcion loggin_usuario
        string user = TB_inicio_usuario.Text.ToString();
        string clave = TB_inicio_clave.Text.ToString();

        //encapsulamos campos
        E_loggin_user datos_loggin = new E_loggin_user();
        datos_loggin.User = user;
        datos_loggin.Clave = clave;

        //mandamos parametros para validar usuario
        L_inicio_sesion abrir = new L_inicio_sesion();
        E_usuario datos1 = new E_usuario();
        datos1 = abrir.open_session(datos_loggin);

        //llenamos session
        Session["rolID"] = datos1.IdUser;
        Session["nomUser"] = datos1.Nombre;
        Session["docUser"] = datos1.Documento;
        Session["user"] = datos1.UserName;
        Session["dinero"] = datos1.Dinero;
        Session["rolUser"] = datos1.IdRol;

        //confirmamos y redireccionamos
        Response.Write(datos1.Mensajes);

    }
    protected void B_cancelarSession_Click(object sender, EventArgs e)
    {
        TB_inicio_usuario.Text = " ";
        TB_inicio_clave.Text = " ";       
    }
}