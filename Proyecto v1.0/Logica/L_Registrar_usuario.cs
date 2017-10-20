using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using System.Data;

namespace Logica
{
    public class L_Registrar_usuario
    {
        //----- verificar sesion .....
        public U_Registrar_usuario verificar(object user)
        {
            U_Registrar_usuario datos = new U_Registrar_usuario();

            if (user != null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }

            return datos;
        }

        //-----Idioma...............
        public DataTable idioma(Int64 idiomaId, Int64 formularioId)
        {
            DataTable idioma = new DataTable();

            Dao_idioma operacion = new Dao_idioma();
            idioma = operacion.idioma(idiomaId, formularioId);

            return idioma;
        }

        //----- verificar_user .....
        public DataTable verif_user(string usuario)
        {
            Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
            DataTable informacion_user = operacion.consultar_usuario(usuario);

            return informacion_user;     
        }

        //----- verificar_documento .....
        public DataTable verif_doc(string documento)
        {
            Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
            DataTable informacion_documento = operacion.consultar_documento(documento);

            return informacion_documento;
        }

        //----- verificar_correo .....
        public DataTable verif_correo(string correo)
        {
            Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
            DataTable informacion_correo = operacion.consultar_correo(correo);

            return informacion_correo;
        }


        //----- Registrar usuario .....
        public E_usuario registrar(DataTable informacion_user, DataTable informacion_documento, DataTable informacion_correo,
                                   string nombre, string apellido, string documento, string telefono, string correo, string usuario, string clave,
                                   Boolean terminos) 
        {
            //llamamos metodo encapsular
            E_usuario user = new E_usuario();

            //verificamos si la consulta trajo parametros
            if (informacion_user.Rows.Count == 0 && informacion_documento.Rows.Count == 0 && informacion_correo.Rows.Count == 0)
            {//datos no registrados usuario valido para insertar

                //encapsulamos datos
                user.Nombre = nombre;
                user.Apellido = apellido;
                user.Documento = documento;
                user.Telefono = telefono;
                user.Correo = correo;
                user.UserName = usuario;
                user.Clave = clave;
                user.UserCambio = "1";

                //Verficamos los terminos y condiciones
                if (terminos == false)
                {
                    //Response.Write("<script type='text/javascript'>alert('No ha aceptado los Terminos y Condiciones');return;</script>");
                    //return;
                    user.Mensajes = "<script type='text/javascript'>alert('No ha aceptado los Terminos y Condiciones');</script>";

                }
                else
                {

                    if (terminos == true)
                    {
                        try
                        {
                            //mandamos al metodo de agregar usuarios
                            Dao_Registrar_usuario operacion = new Dao_Registrar_usuario();
                            operacion.insertar_usuario(user);
                            //confirmamos y redireccionamos
                            user.Mensajes = "<script type='text/javascript'>alert('Usuario registrado con exito');window.location=\"inicio.aspx\"</script>";
                            //Response.Redirect("inicio.aspx");  
                        }
                        catch (Exception exc)
                        {
                            throw exc;
                        }

                    }
                }


            }
            else
            { //si trajo parametros el usuario esta en el sistema

                if (informacion_user.Rows.Count != 0)
                {
                    user.Mensajes = "<script type='text/javascript'>alert('El usuario(nickname) ya se encuentra registrado');</script>";
                }
                else
                {
                    if (informacion_documento.Rows.Count != 0)
                    {
                        user.Mensajes = "<script type='text/javascript'>alert('El documento ya se encuentra registrado');</script>";
                    }
                    else
                    {
                        if (informacion_correo.Rows.Count != 0)
                        {
                            user.Mensajes = "<script type='text/javascript'>alert('El correo ya esta vinculado a otra cuenta');</script>";
                        }
                    }
                }

            }//else principal

            return user;
        }


    }//L_Registrar_usuario


}//Principal
