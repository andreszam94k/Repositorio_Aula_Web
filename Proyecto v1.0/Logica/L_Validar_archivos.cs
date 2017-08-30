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
    public class L_Validar_archivos
    {
        //----- verificar sesion .....
        public U_Validar_archivos verificar(object user, object rol)
        {
            U_Validar_archivos datos = new U_Validar_archivos();
            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse(rol.ToString()) != 1 && int.Parse(rol.ToString()) != 2)
                {
                    datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
                }
            }

            return datos;
        }

        //----- mostrar grilla .....
        public DataTable mostrar_grilla(object rol_user) 
        {
            DataTable informacion = new DataTable();
            Dao_Validar_archivos mostrar = new Dao_Validar_archivos();
            
            //Dependiendo el rol llenamos el gridview
            string roles = "0";

                if (int.Parse(rol_user.ToString()) == 1)
                {
                    //si es Admin ve los archivos de los Mod
                    roles = "2";

                }
                else
                {
                    if (int.Parse(rol_user.ToString()) == 2)
                    {
                        //si es Mod ve los archivos de los Users
                        roles = "3";
                    }
                }

            informacion = mostrar.Consultar_archivo_datos(roles); 
            return informacion;   
        }

        //----- rechazar_archivo .....
        public U_Validar_archivos eliminar_archivo(string nombre_archivo, string id, string imagen_saveLocation, string archivo_saveLocation, string rol_user) 
        {
            //llamamos metodos
            Dao_Validar_archivos archivoDatos = new Dao_Validar_archivos();
            U_Validar_archivos accion = new U_Validar_archivos();
            DataTable estado = archivoDatos.consultar_archivo_nombre(nombre_archivo);

            //preguntamos si el archivo ya ha sido moderado
            if (estado.Rows.Count == 0)
            { //si no trajo parametros el archivo fue moderado pero fue rechazado

                accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                return accion;

            }
            else
            {// si trajo parametros el archivo esta en el sistema

                //preguntamos si el archivo ya fue aprobado
                if (int.Parse(estado.Rows[0]["estado_mod"].ToString()) == 2)
                {//Si entra, el archivo ya fue moderado y fue aprobado

                    accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                    return accion;

                }
                else
                {//en caso contrario el archivo no ha sido moderado

                    try
                    {
                        //eliminamos desde BD y  servidor
                        archivoDatos.eliminar_archivo(id, rol_user);
                        System.IO.File.Delete(imagen_saveLocation);
                        System.IO.File.Delete(archivo_saveLocation);

                        accion.Mensajes = "<script type='text/javascript'>alert('El archivo ha sido Eliminado del sistema');</script>";
                        return accion;

                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }

                }//else

            }//fin else moderado

        }

        //----- aprobar_archivo .....
        public U_Validar_archivos aprobar_archivo(string nombre_archivo, string dinero, string id, string idCategoria, string nomCategoria, string idUser, string rol_user) 
        {
            //llamamos metodos
            Dao_Validar_archivos archivoDatos = new Dao_Validar_archivos();
            U_Validar_archivos accion = new U_Validar_archivos();
            DataTable estado = archivoDatos.consultar_archivo_nombre(nombre_archivo);
            E_Aprobar_archivo archivos = new E_Aprobar_archivo();
            
            //preguntamos si el archivo ya ha sido moderado
            if (estado.Rows.Count == 0)
            { //si no trajo parametros el archivo fue moderado pero fue rechazado

                accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                return accion;
            }
            else
            {// si trajo parametros el archivo esta en el sistema

                //preguntamos si el archivo ya fue aprobado
                if (int.Parse(estado.Rows[0]["estado_mod"].ToString()) == 2)
                {//Si entra, el archivo ya fue moderado y fue aprobado

                    accion.Mensajes = "<script type='text/javascript'>alert('El archivo ya fue moderado');</script>";
                    return accion;

                }
                else
                {//en caso contrario el archivo no ha sido moderado

                    //preguntamos si no hay categorias seleccionadas
                    if (int.Parse(idCategoria) == 1)
                    {
                        accion.Mensajes = "<script type='text/javascript'>alert('Debe seleccionar una categoria');</script>";
                        return accion;
                    }
                    else
                    { //en caso contrario obtenemos el precio de la categoria

                        DataTable info = new DataTable();
                        info = archivoDatos.consultar_categoria(nomCategoria);
                        dinero = info.Rows[0]["precio"].ToString();
                    }

                    //encapsulamos datos
                    archivos.IdArchivo = id;
                    archivos.IdCategoria = idCategoria;
                    archivos.IdUser = idUser;
                    archivos.Precio = dinero;
                    archivos.UserCambio = rol_user;

                    try
                    {
                        archivoDatos.modificar_archivo(archivos);
                        accion.Mensajes = "<script type='text/javascript'>alert('Archivo aprobado con exito');</script>";
                        return accion;
                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }

                }//else

            }//fin else moderado
            
        }


    }//L_Validar_archivos

}//principal
