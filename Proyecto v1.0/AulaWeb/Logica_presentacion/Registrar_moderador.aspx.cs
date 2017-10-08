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

public partial class Presentacion_Registrar_moderador : System.Web.UI.Page
{
    DataTable datos_idioma = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();
        //llamamos la logica y el metodo
        L_Registrar_moderador operacion = new L_Registrar_moderador();
        U_Registrar_moderador datos = new U_Registrar_moderador();

        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 10);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 10);
            llenar_componentes(datos_idioma);
        }

        if (!IsPostBack) 
        {
            datos = operacion.verificar(Session["user"], Session["rolUser"]);

            //enviar desde la logica un codigo scrip
            Response.Write(datos.Url_pag);

            llenar_grilla(DDL_rol.SelectedValue.ToString());
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MRM_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_registro_mod.Text = idioma_data.Rows[1]["Texto"].ToString();

        //Gridview
        GV_registro_mod.Columns[0].HeaderText = idioma_data.Rows[2]["Texto"].ToString();
        GV_registro_mod.Columns[1].HeaderText = idioma_data.Rows[3]["Texto"].ToString();
        GV_registro_mod.Columns[2].HeaderText = idioma_data.Rows[4]["Texto"].ToString();
        GV_registro_mod.Columns[3].HeaderText = idioma_data.Rows[5]["Texto"].ToString();
        GV_registro_mod.Columns[4].HeaderText = idioma_data.Rows[6]["Texto"].ToString();
        GV_registro_mod.Columns[5].HeaderText = idioma_data.Rows[7]["Texto"].ToString();
        GV_registro_mod.Columns[6].HeaderText = idioma_data.Rows[8]["Texto"].ToString();
        GV_registro_mod.Columns[7].HeaderText = idioma_data.Rows[9]["Texto"].ToString();
        GV_registro_mod.Columns[8].HeaderText = idioma_data.Rows[10]["Texto"].ToString();
        GV_registro_mod.Columns[9].HeaderText = idioma_data.Rows[11]["Texto"].ToString();

    }

    protected void DDL_rol_SelectedIndexChanged(object sender, EventArgs e)
    {
        //obetenmos el valor del dropdownlist y lo guardamos en una variable
        string valor = DDL_rol.SelectedValue.ToString();
        //lamamos metodos y obtenemos
        L_Registrar_moderador obtener = new L_Registrar_moderador();
        U_Registrar_moderador mensaje = new U_Registrar_moderador();
        mensaje = obtener.obtener_rol(valor);

        //enviar desde la logica un codigo scrip
        Response.Write(mensaje.Mensajes);

        //llenamos grilla
        llenar_grilla(valor);

    }

    protected void llenar_grilla(string rol) {

        //dependiendo el rol muestra Mod ò Users 
        L_Registrar_moderador verificar = new L_Registrar_moderador();
        DataTable info = verificar.actualizar_grillas(rol);

        GV_registro_mod.DataSource = info;
        GV_registro_mod.DataBind();
    
    }

    protected void GV_registro_mod_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        //salir del estado de edicion
        GV_registro_mod.EditIndex = -1;
        llenar_grilla(DDL_rol.SelectedValue.ToString());
    }

    protected void GV_registro_mod_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //establece el indice de la fila que se va a modificar
        GV_registro_mod.EditIndex = e.NewEditIndex;
        llenar_grilla(DDL_rol.SelectedValue.ToString());
    }

    protected void GV_registro_mod_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //mandamos al metodo de modificar usuarios
        L_Registrar_moderador userDatos = new L_Registrar_moderador();
        //encapsulamos datos
        E_moderador user = new E_moderador();

        //obetenemos la fila
        GridViewRow fila = GV_registro_mod.Rows[e.RowIndex];

        user.IdUser = (fila.FindControl("Label2") as Label).Text.ToString();
        user.Nombre = (fila.FindControl("Label3") as Label).Text.ToString();
        user.Apellido = (fila.FindControl("Label4") as Label).Text.ToString();
        user.Documento = (fila.FindControl("Label5") as Label).Text.ToString();
        user.Telefono = (fila.FindControl("Label6") as Label).Text.ToString();
        user.Correo = (fila.FindControl("Label7") as Label).Text.ToString();
        user.UserName = (fila.FindControl("Label8") as Label).Text.ToString();
        user.Clave = (fila.FindControl("Label9") as Label).Text.ToString();
        user.Dinero = (fila.FindControl("Label10") as Label).Text.ToString();
        user.IdRol = (fila.FindControl("Label11") as Label).Text.ToString();
        user.UserCambio = Session["rolID"].ToString();

 
        try
        {
            //reiniciamos la grilla y cambiamos rol
            GV_registro_mod.EditIndex = -1;
            //userDatos.modificar_rol(user);
            userDatos.registra_mod(user);
            //pintamos nuevamente la grilla
            llenar_grilla(DDL_rol.SelectedValue.ToString());
        }
        catch(Exception exc)
        {
            throw exc;
        }
    }

    protected void GV_registro_mod_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //definimos fila
        GridViewRow fila = e.Row;
        
        //Buscamos controles
        if (fila.FindControl("LinkButton1") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton1")).Text = datos_idioma.Rows[12]["Texto"].ToString();
        }

        if (fila.FindControl("LinkButton2") != null)
        {
            ((LinkButton)fila.FindControl("LinkButton2")).Text = datos_idioma.Rows[13]["Texto"].ToString();
            ((LinkButton)fila.FindControl("LinkButton3")).Text = datos_idioma.Rows[14]["Texto"].ToString();
        }
    }
}//principal