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