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
    public class L_Descargar_archivo
    {
        //----- verificar sesion .....
        public U_Descargar_archivo verificar(object id_arch, object user)
        {
            U_Descargar_archivo datos = new U_Descargar_archivo();

            //preguntamos si la session es nula para verficar que venga procedente de consultar archivo
            if (id_arch == null)
            {
                //si es nula se redirecciona a consultar archivo
                datos.Url_pag = "<script type='text/javascript'>window.location=\"Consultar_archivo.aspx\"</script>";
                return datos;
            }
            else
            {   //preguntamos si es un usuario registrado o un visitante
                if (user == null)
                {
                    //ocultamos componentes
                    datos.Mostrar = false;
                    return datos;
                }
                else
                {
                    //mostramos componentes
                    datos.Mostrar = true;
                    return datos;
                }
            }
        }

        //-----Idioma...............
        public DataTable idioma(Int64 idiomaId, Int64 formularioId)
        {
            DataTable idioma = new DataTable();

            Dao_idioma operacion = new Dao_idioma();
            idioma = operacion.idioma(idiomaId, formularioId);

            return idioma;
        }

        //----- obtener datos .....
        public DataTable archivo_datos(string id_archivo) 
        {
            Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
            DataTable info = operacion.ver_archivo(id_archivo);

            return info;
        }

        //----- llenar grillas .....
        public DataTable comentarios(string idArc) 
        {
            Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
            DataTable info_comentarios = operacion.consultar_comentarios(idArc);

            return info_comentarios;
        }

        //----- descargar archivo .....
        public U_Descargar_archivo descargar_archivo(string user, string id_archivo, string idrol) 
        {
            Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
            U_Descargar_archivo datos = new U_Descargar_archivo();

            DataTable info_user = operacion.consultar_usuario(user);
            DataTable info_file = operacion.ver_archivo(id_archivo);

            int saldo = int.Parse(info_user.Rows[0]["dinero_user"].ToString());
            int precio = int.Parse(info_file.Rows[0]["precio_categoria"].ToString());

            //asignamos session por si no pasa el if
            datos.Session_dinero = saldo;

            //preguntamos que el user tenga dinero en la cuenta
            if (saldo != 0)
            {//tiene dinero en la cuenta

                //preguntamos si tiene dinero suficiente para comprar el archivo 
                if (saldo >= precio)
                {//permitir decarga

                    //--------------encapsulamos campos..............................................
                    E_subir_descargar subir_descargar = new E_subir_descargar();

                    subir_descargar.IdUser = info_user.Rows[0]["id_usuario"].ToString();
                    subir_descargar.IdArchivo = info_file.Rows[0]["id_archivo"].ToString();
                    subir_descargar.Concepto = "Download";
                    subir_descargar.Precio = precio.ToString();
                    subir_descargar.UserCambio = idrol;

                    E_descargar_archivo descargar = new E_descargar_archivo();

                    descargar.IdUser = info_user.Rows[0]["id_usuario"].ToString();
                    descargar.Dinero = precio.ToString();
                    descargar.UserCambio = idrol;


                    //--------------descargar_archivo..............................................
                    try
                    {
                        operacion.insertar_descargar_archivo(descargar);
                        operacion.insertar_subir_descargar(subir_descargar);
                        //cambiamos el valor de la session
                        datos.Session_dinero = saldo - precio;

                        string ruta = info_file.Rows[0]["url"].ToString();
                        datos.Url_pag = ruta;
                        datos.Descargar = true;
                        
                        return datos;
                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }

                }
                else
                {//no alcanza el dinero
                    datos.Descargar = false;
                    datos.Mensajes = "<script type='text/javascript'>alert('Dinero insuficiente para descargar el archivo, para obtener dinero participe subiendo archivos');</script>";
                    return datos;
                }
            }
            else
            {//el user se quedo sin dinero
                datos.Descargar = false;
                datos.Mensajes = "<script type='text/javascript'>alert('No tiene dinero en su cuenta, para obtener dinero participe subiendo archivos');</script>";
                return datos;
            }

        }

        //----- insertar Comentario .....
        public U_Descargar_archivo comentar_archivo(string comentary, string idrol, string id_archivo) 
        {
            //llamamos metodos
            Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
            U_Descargar_archivo datos = new U_Descargar_archivo();
            E_comentario comentario = new E_comentario();

            // encapsulamos campos
            comentario.IdUser = idrol;
            comentario.IdArchivo = id_archivo;
            comentario.Comentario = comentary;
            comentario.UserCambio = idrol;

            //--------------insertar_comentario..............................................
            try
            {
                operacion.insertar_comentario(comentario);
                datos.Url_pag = "<script type='text/javascript'>window.location=\"Descargar_archivo.aspx\"</script>";
                return datos;
            }
            catch (Exception exc)
            {
                throw exc;
            }
        }

    }//L_Descargar_archivo

}//principal
