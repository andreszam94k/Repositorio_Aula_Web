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

public partial class Presentacion_Registrar_usuario : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Cache.SetNoStore();

        //llamamos la logica y el metodo
        L_Registrar_usuario operacion = new L_Registrar_usuario();
        U_Registrar_usuario datos = new U_Registrar_usuario();
        datos = operacion.verificar(Session["user"]);

        //enviar desde la logica un codigo scrip
        Response.Write(datos.Url_pag);

        DataTable datos_idioma = new DataTable();
        Int64 idioma;

        //preguntamos si la session idioma viene vacio
        if (Session["idioma"] == null)
        {
            //idioma por defecto 
            idioma = Int64.Parse("1");
            datos_idioma = operacion.idioma(idioma, 9);
            llenar_componentes(datos_idioma);
        }
        else if (Session["idioma"] != null)
        {
            //idioma seleccionado
            idioma = Int64.Parse(Session["idioma"].ToString());
            datos_idioma = operacion.idioma(idioma, 9);
            llenar_componentes(datos_idioma);
        }

    }//page_load

    protected void llenar_componentes(DataTable idioma_data)
    {
        //componentes
        L_MRU_1.Text = idioma_data.Rows[0]["Texto"].ToString();
        L_MRU_2.Text = idioma_data.Rows[1]["Texto"].ToString();
        L_registro_nombre.Text = idioma_data.Rows[2]["Texto"].ToString();
        L_registro_apellido.Text = idioma_data.Rows[3]["Texto"].ToString();
        L_registro_documento.Text = idioma_data.Rows[4]["Texto"].ToString();
        L_registro_telefono.Text = idioma_data.Rows[5]["Texto"].ToString();
        L_registro_correo.Text = idioma_data.Rows[6]["Texto"].ToString();
        L_registro_user.Text = idioma_data.Rows[7]["Texto"].ToString();
        L_registro_clave.Text = idioma_data.Rows[8]["Texto"].ToString();
        L_registro_confirmar.Text = idioma_data.Rows[9]["Texto"].ToString();
        B_registrar.Text = idioma_data.Rows[10]["Texto"].ToString();
        CB_terminos.Text = idioma_data.Rows[11]["Texto"].ToString();
        HL_terminos.Text = idioma_data.Rows[12]["Texto"].ToString();

        //errores
        RFV_nombre.ErrorMessage = idioma_data.Rows[13]["Texto"].ToString();
        REV_nombre.ErrorMessage = idioma_data.Rows[14]["Texto"].ToString();
        RFV_apellido.ErrorMessage = idioma_data.Rows[15]["Texto"].ToString();
        REV_apellido.ErrorMessage = idioma_data.Rows[16]["Texto"].ToString();
        RFV_documento.ErrorMessage = idioma_data.Rows[17]["Texto"].ToString();
        REV_documento.ErrorMessage = idioma_data.Rows[18]["Texto"].ToString();
        RFV_telefono.ErrorMessage = idioma_data.Rows[19]["Texto"].ToString();
        REV_telefono.ErrorMessage = idioma_data.Rows[20]["Texto"].ToString();
        RFV_correo.ErrorMessage = idioma_data.Rows[21]["Texto"].ToString();
        REV_correo.ErrorMessage = idioma_data.Rows[22]["Texto"].ToString();
        RFV_user.ErrorMessage = idioma_data.Rows[23]["Texto"].ToString();
        REV_user.ErrorMessage = idioma_data.Rows[24]["Texto"].ToString();
        RFV_clave.ErrorMessage = idioma_data.Rows[25]["Texto"].ToString();
        REV_clave.ErrorMessage = idioma_data.Rows[26]["Texto"].ToString();
        RFV_confirmar.ErrorMessage = idioma_data.Rows[27]["Texto"].ToString();
        REV_confirmar.ErrorMessage = idioma_data.Rows[28]["Texto"].ToString();
        CV_confirmar.ErrorMessage = idioma_data.Rows[29]["Texto"].ToString();
    }

    protected void B_registrar_Click(object sender, EventArgs e)
    {
        //obtenemos los datos en variables
        string nombre = TB_registro_nombre.Text.ToString();
        string apellido = TB_registro_apellido.Text.ToString();
        string documento = TB_registro_documento.Text.ToString();
        string telefono = TB_registro_telefono.Text.ToString();
        string correo = TB_registro_correo.Text.ToString();
        string usuario = TB_registro_user.Text.ToString();
        string clave = TB_registro_clave.Text.ToString();
        Boolean terminos = CB_terminos.Checked;

        //mandamos parametros para verificar que no existan en el sistema
        L_Registrar_usuario verificar = new L_Registrar_usuario();

        DataTable informacion_user = verificar.verif_user(usuario);
        DataTable informacion_documento = verificar.verif_doc(documento);
        DataTable informacion_correo = verificar.verif_correo(correo);

        //mandamos parametros para validar registro
        E_usuario user_datos = verificar.registrar(informacion_user, informacion_documento, informacion_correo,
                                                  nombre, apellido, documento, telefono, correo, usuario, clave,
                                                  terminos);

        //confirmamos y redireccionamos
        Response.Write(user_datos.Mensajes);

    }//boton

}//principal