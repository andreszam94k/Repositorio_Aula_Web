using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using System.Data;
using System.Reflection;

namespace Logica
{
    public class L_Subir_archivos
    {
        AulaWebContext_public.AulaWebDataContext_public operacion = new AulaWebContext_public.AulaWebDataContext_public();

        //----- verificar sesion .....
        public U_Subir_archivos verificar(object user, object rol)
        {
            U_Subir_archivos datos = new U_Subir_archivos();

            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse((String)rol) != 1 && int.Parse((String)rol) != 2)
                {
                    //lo utilizamos para definir la visibilidad de los componentes 
                    datos.Guardar = false;
                }
                else
                {
                    datos.Guardar = true;
                }
            }

            return datos;
        }

        //----- verificar seleccion de foto .....
        public U_Subir_archivos seleccion_foto(String nombreArchivo, string extension, string saveLocation, object Sfotos)
        {
            DataTable imagen = new DataTable();
            U_Subir_archivos info = new U_Subir_archivos();
            string ruta = "hola";

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
                    info.Mensajes = "<script type='text/javascript'>alert('No puede subir mas de 1 imagen');</script>";
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
                        //saveLocation = (Server.MapPath("~\\Imagenes\\Imagenes_Archivos") + "\\" + nombreArchivo);
                        ruta = saveLocation + "\\" + nombreArchivo;

                        //confirmamos que no exitas el archivo
                        if (System.IO.File.Exists(ruta))
                        {
                            //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Ya existe un archivo en el servidor con ese nombre');</script>");
                            info.Mensajes = "<script type='text/javascript'>alert('Ya existe una imagen en el servidor con ese nombre');</script>";
                            info.Guardar = false;
                            return info;
                        }
                        else
                        {
                            info.Url_pag = ruta;
                            
                            //llenamos el data table
                            string[] celdas = new string[2];
                            celdas[0] = nombreArchivo;
                            celdas[1] = "~\\Imagenes\\Imagenes_Archivos" + "\\" + nombreArchivo;

                            imagen.Rows.Add(celdas);

                            info.Session_fotos = imagen;
                            info.Guardar = true;

                            return info;

                        }

                    }

                }

            }//else principal

        }

        //----- verificar seleccion de archivo .....
        public U_Subir_archivos seleccion_archivo(String nombreArchivo, string extension, string saveLocation, object Sarchivo)
        {
            DataTable archivo = new DataTable();
            U_Subir_archivos info = new U_Subir_archivos();
            string ruta = "hola";

            //validamos que se haya seleccionado un archivo
            if (nombreArchivo.Equals("") || extension.Equals(""))
            {
                //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe seleccionar una imagen');</script>");
                info.Mensajes = "<script type='text/javascript'>alert('Debe seleccionar un archivo');</script>";
                return info;
            }
            else
            {

                if (Sarchivo == null)
                {
                    //imagen = new DataTable();
                    archivo.Columns.Add("nombre");
                    archivo.Columns.Add("url");
                    Sarchivo = archivo;
                    info.Session_archivo = archivo;
                }

                archivo = (DataTable)Sarchivo;

                //validamos que no se hayan subido mas de 1 archivo
                if (archivo.Rows.Count == 1)
                {
                    //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('No puede subir mas de 1 archivo');</script>");
                    info.Mensajes = "<script type='text/javascript'>alert('No puede subir mas de 1 archivo');</script>";
                    info.Guardar = false;
                    return info;
                }
                else
                {
                    //preguntamos al extension y damos la localizacion de la carpeta
                    if (!(extension.Equals(".pdf")))
                    {
                        //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Tipo de archivo no valido - solo formatos(jpg, jpeg, png o bmp)');</script>");
                        info.Mensajes = "<script type='text/javascript'>alert('Tipo de archivo no valido - solo formatos(.pdf)');</script>";
                        info.Guardar = false;
                        return info;
                    }
                    else
                    {
                        //saveLocation = (Server.MapPath("~\\Imagenes\\Imagenes_Archivos") + "\\" + nombreArchivo);
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

                            //llenamos el data table
                            string[] celdas = new string[2];
                            celdas[0] = nombreArchivo;
                            celdas[1] = "~\\Archivos" + "\\" + nombreArchivo;

                            archivo.Rows.Add(celdas);

                            info.Session_archivo = archivo;
                            info.Guardar = true;

                            return info;

                        }

                    }

                }

            }//else principal

        }

        //----- subir archivo .....
        public U_Subir_archivos subir_archivo(string nombre, string anio, string sinopsis, string num_pag, string foto_archivo, string link_archivo,
                                string id_user, String tags, string rol_user, string categoria, int cont_categoria, int cont_autor, string[] nom_autores,
                                DataTable imagen_file, DataTable archivo_file, object Stags, object Sautor) 
        {
            U_Subir_archivos info_2 = new U_Subir_archivos();
            //Dao_Subir_archivos operacion = new Dao_Subir_archivos();
            //DataTable informacion_archivo = operacion.consultar_archivo_nombre(nombre);

            List<AulaWebContext_public.Archivo> datos = operacion.SpConsultaArchivoNombre(nombre).ToList<AulaWebContext_public.Archivo>();
            DataTable informacion_archivo = ToDataTable(datos);

            //asignamos la session en caso que no pase el if
            info_2.Session_fotos = imagen_file;
            info_2.Session_archivo = archivo_file;

            //cuando el componente esta oculto no se puede utilizar para el rol 3
            if (int.Parse(rol_user) == 3) { categoria = "1"; }
            else
            {
                cont_categoria = int.Parse(categoria);
            }

                //verificamos si la consulta trajo parametros
            if (informacion_archivo.Rows.Count == 0)
            {//datos no registrados usuario valido para insertar

                //--------------categorias_validaciones..............................................

                if (cont_categoria == 1)
                {
                    //Response.Write("<script type='text/javascript'>alert('Debe seleccionar una categoria');</script>");
                    info_2.Mensajes = "<script type='text/javascript'>alert('Debe seleccionar una categoria');</script>";
                    return info_2;
                }

                //--------------imagen_validaciones..............................................

                //preguntamos si posee parametros
                if (imagen_file != null)
                {
                    foto_archivo = imagen_file.Rows[0][1].ToString();
                }
                else
                {
                    //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe ingresar la imagen de la portada');</script>");
                    info_2.Mensajes = "<script type='text/javascript'>alert('Debe ingresar la imagen de la portada');</script>";
                    return info_2;
                }

                //--------------archivo_validaciones..............................................

                //preguntamos si posee parametros
                if (archivo_file != null)
                {
                    link_archivo = archivo_file.Rows[0][1].ToString();
                }
                else
                {
                    //cm.RegisterClientScriptBlock(this.GetType(), "", "<script type='text/javascript'>alert('Debe ingresar el archivo');</script>");
                    info_2.Mensajes = "<script type='text/javascript'>alert('Debe ingresar el archivo');</script>";
                    return info_2;
                }

                //--------------autores_validaciones..............................................

                //si la session es nula, no hay checklist seleccionados
                if (Sautor == null)
                {
                    //Response.Write("<script type='text/javascript'>alert('Debe seleccionar algun autor');</script>");
                    info_2.Mensajes = "<script type='text/javascript'>alert('Debe seleccionar algun autor');</script>";
                    return info_2;
                }

                //--------------tags_validaciones..............................................

                //si la session es nula, no hay checklist seleccionados
                if (Stags == null)
                {
                    //Response.Write("<script type='text/javascript'>alert('Debe seleccionar tags');</script>");
                    info_2.Mensajes = "<script type='text/javascript'>alert('Debe seleccionar tags');</script>";
                    return info_2;
                }


                //--------------insertar_archivo..............................................

                //Encapsulamos datos
                E_archivo datosArchivo = new E_archivo();

                datosArchivo.Nombre = nombre;
                datosArchivo.Fecha = anio;
                datosArchivo.Sinopsis = sinopsis;
                datosArchivo.NumPag = num_pag;
                datosArchivo.IdCategoria = categoria;
                datosArchivo.Foto = foto_archivo;
                datosArchivo.Link = link_archivo;
                datosArchivo.IdUser = id_user;
                datosArchivo.Tags = tags;
                datosArchivo.IdMod = rol_user;
                datosArchivo.UserCambio = id_user;

                //mandamos al metodo de agregar archivo
                try
                {
                    //operacion.insertar_archivo(datosArchivo);
                    operacion.SpInsertarArchivo(Int32.Parse(datosArchivo.IdMod), datosArchivo.Nombre, datosArchivo.Fecha, datosArchivo.Sinopsis,
                        Int32.Parse(datosArchivo.NumPag), datosArchivo.Foto, datosArchivo.Link, Int32.Parse(datosArchivo.IdUser), Int32.Parse(datosArchivo.IdCategoria),
                        datosArchivo.Tags, Int32.Parse(datosArchivo.UserCambio));
                }
                catch (Exception exc)
                {
                    throw exc;
                }

                //llamamos la clase encapsular
                E_archivo_autor archivo_autor = new E_archivo_autor();

                for (int i = 0; i < cont_autor; i++)
                {
                    //encapsulamos
                    archivo_autor.NombreAutor = nom_autores[i];
                    archivo_autor.UserCambio = id_user;

                    try
                    {
                        //mandamos al metodo de agregar archivo_autor
                        //operacion.insertar_archivo_autor(archivo_autor);
                        operacion.SpInsertarArchivoAutor(archivo_autor.NombreAutor, Int32.Parse(archivo_autor.UserCambio));
                    }
                    catch (Exception exc)
                    {
                        throw exc;
                    }
                
                }

                //obtenemos los datos del ultimo archivo subido
                //DataTable info = operacion.mostrar_archivo();

                List<AulaWebContext_public.Archivo> datos3 = operacion.SpMostrarArchivo().ToList<AulaWebContext_public.Archivo>();
                DataTable info = ToDataTable(datos3);

                //Encapsulamos datos
                E_subir_descargar subir_descargar = new E_subir_descargar();

                //obtenemos la posicion de la fila
                int contador = info.Rows.Count - 1;
                subir_descargar.IdUser = id_user;
                subir_descargar.IdArchivo = info.Rows[contador][0].ToString();
                subir_descargar.Concepto = "Upload";
                subir_descargar.Precio = "0";
                subir_descargar.UserCambio = id_user;

                try
                {
                    //mandamos al metodo de agregAR subir_descargar
                    //operacion.insertar_subir_descargar(subir_descargar);
                    operacion.SpInsertarSubirDescargar(Int32.Parse(subir_descargar.IdUser), Int32.Parse(subir_descargar.IdArchivo), subir_descargar.Concepto, Int32.Parse(subir_descargar.Precio), Int32.Parse(subir_descargar.UserCambio));

                    info_2.Mensajes = "<script type='text/javascript'>alert('Archivo subido con exito, esperar a moderacion');window.location=\"inicio.aspx\"</script>";
                    info_2.Session_fotos = null;
                    info_2.Session_archivo = null;

                    return info_2;
                }
                catch (Exception exc)
                {
                    throw exc;
                }

                        
            }//if
            else
            { //si trajo parametros el usuario esta en el sistema

                //Response.Write("<script type='text/javascript'>alert('El nombre(archivo) ya se encuentra registrado');</script>");
                info_2.Mensajes = "<script type='text/javascript'>alert('El nombre(archivo) ya se encuentra registrado');</script>";
                return info_2;
            }
            
        }///////////////

        public DataTable precio(string identificacion) 
        {
            //Dao_Subir_archivos operacion = new Dao_Subir_archivos();
            //DataTable nom = new DataTable();
            //nom = operacion.consultar_categoria(identificacion);

            List<AulaWebContext_public.Categoria> datos = operacion.SpConsultaCategoria(identificacion).ToList<AulaWebContext_public.Categoria>();
            DataTable nom = ToDataTable(datos);

            return nom;
        }

        //convierte en datatable
        private DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Defining type of data column gives proper data table 
                var type = (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>) ? Nullable.GetUnderlyingType(prop.PropertyType) : prop.PropertyType);
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name, type);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }

    }//L_Subir_archivos

}//principal
