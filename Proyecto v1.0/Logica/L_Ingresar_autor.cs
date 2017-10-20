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
    public class L_Ingresar_autor
    {
        //----- verificar sesion .....
        public U_Ingresar_autor verificar(object user, object rol)
        {
            U_Ingresar_autor datos = new U_Ingresar_autor();

            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse((String)rol) != 1 && int.Parse((String)rol) != 2)
                {
                    datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
                }
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

        //----- verificar checkbox death .....
        public Boolean veri_check(Boolean estado) 
        {
            Boolean mostrar;
            if (estado == false)
            {
                mostrar = true;
            }
            else
            {
                mostrar = false;
            }

            return mostrar;
        }

        //----- verificar seleccion de foto .....
        public U_Ingresar_autor seleccion_archivo(String nombreArchivo, string extension, string saveLocation, object Sfotos)
        {
            DataTable imagen = new DataTable();
            U_Ingresar_autor info = new U_Ingresar_autor();
            string ruta= "hola";

            //validamos que se haya seleccionado un archivo
            if (nombreArchivo.Equals("") || extension.Equals(""))
            {
                //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe seleccionar una imagen');</script>");
                info.Mensajes = "<script type='text/javascript'>alert('Debe seleccionar una imagen');</script>";
                return info;
            }
            else
            {

                if (Sfotos == null)
                {
                    //imagen = new DataTable();
                    imagen.Columns.Add("nombre");
                    imagen.Columns.Add("ruta");
                    Sfotos = imagen;
                    info.Session_fotos = imagen;
                }

                imagen = (DataTable)Sfotos;

                //validamos que no se hayan subido mas de 1 archivo
                if (imagen.Rows.Count == 1)
                {
                    //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No puede subir mas de 1 archivo');</script>");
                    info.Mensajes = "<script type='text/javascript'>alert('No puede subir mas de 1 archivo');</script>";
                    info.Guardar = false;
                    return info;
                }
                else
                {
                    //preguntamos al extension y damos la localizacion de la carpeta
                    if (!(extension.Equals(".jpg") || extension.Equals(".JPG") || extension.Equals(".png") || extension.Equals(".PNG") || extension.Equals(".jpge") || extension.Equals(".bmp")))
                    {
                        //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tipo de archivo no valido - solo formatos(jpg, jpeg, png o bmp)');</script>");
                        info.Mensajes = "<script type='text/javascript'>alert('Tipo de archivo no valido - solo formatos(jpg, jpeg, png o bmp)');</script>";
                        info.Guardar = false;
                        return info;
                    }
                    else
                    {
                        //saveLocation = (Server.MapPath("~\\Imagenes\\Imagenes_Autores") + "\\" + nombreArchivo);
                        ruta = saveLocation + "\\" + nombreArchivo;

                        //confirmamos que no exitas el archivo
                        if (System.IO.File.Exists(ruta))
                        {
                            //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe un archivo en el servidor con ese nombre');</script>");
                            info.Mensajes = "<script type='text/javascript'>alert('Ya existe un archivo en el servidor con ese nombre');</script>";
                            info.Guardar = false;
                            return info;
                        }
                        else
                        {
                            info.Url_pag = ruta;
                            info.Imagen_datos = imagen;

                            //llenamos el data table
                            string[] celdas = new string[2];
                            celdas[0] = nombreArchivo;
                            celdas[1] = "~\\Imagenes\\Imagenes_Autores" + "\\" + nombreArchivo;

                            imagen.Rows.Add(celdas);

                            info.Session_fotos = imagen;
                            info.Guardar = true;

                            return info;

                        }

                    }

                }

            }//else principal

        }

        //----- ingresar autor  .....
        public U_Ingresar_autor ingresar_autor(string nombre, string fecha_birth, string fecha_death, string pais, string foto, string descripcion,
                                               Boolean estado_check, object Sfotos, object Srolid) 
        {

            U_Ingresar_autor info_2 = new U_Ingresar_autor();
            Dao_Ingresar_autor operacion = new Dao_Ingresar_autor();
            DataTable informacion = operacion.consultar_autor(nombre);

            //asignamos la session en caso que no pase el if
            info_2.Session_fotos = Sfotos;

            //verificamos si la consulta trajo parametros
            if (informacion.Rows.Count == 0)
            {//datos no registrados usuario valido para insertar

                //validamos si el autor tiene fecha de muerte
                if (estado_check != false)
                {
                    fecha_death = "No especificado";
                }

                //obtenemos la variable de session
                DataTable imagen_autor = new DataTable();
                imagen_autor = (DataTable)Sfotos;

                //preguntamos si posee parametros
                if (imagen_autor != null)
                {
                    foto = imagen_autor.Rows[0][1].ToString();

                    //Encapsulamos datos
                    E_autor datosAutor = new E_autor();

                    datosAutor.Nombre = nombre;
                    datosAutor.FechaBirth = fecha_birth;
                    datosAutor.FechaDeath = fecha_death;
                    datosAutor.Foto = foto;
                    datosAutor.Descripcion = descripcion;
                    datosAutor.Nacionalidad = pais;
                    datosAutor.UserCambio = Srolid.ToString();

                    try
                    {
                        //mandamos datos de registro
                        operacion.insertar_autor(datosAutor);
                        //reiniciamos session
                        info_2.Session_fotos = null;
                        //confirmamos y redireccionamos
                        info_2.Mensajes = "<script type='text/javascript'>alert('Autor registrado con exito');window.location=\"inicio.aspx\"</script>";
                        //Response.Redirect("inicio.aspx");
                        return info_2;
                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }

                }
                else
                {
                    info_2.Mensajes = "<script type='text/javascript'>alert('Debe ingresar la imagen del autor');</script>";
                    return info_2;
                }

            }
            else
            {   //si trajo parametros el usuario esta en el sistema

                info_2.Mensajes = "<script type='text/javascript'>alert('El nombre de autor ya se encuentra registrado');</script>";
                return info_2;

            }
            
        }


    }//L_Ingresar_autor

}//Principal
