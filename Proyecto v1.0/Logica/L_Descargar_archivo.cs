﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using System.Data;
using Data.SQL_Entity;
using System.Reflection;

namespace Logica
{
    public class L_Descargar_archivo
    {
        //objeto de persistencia
        Aula_Web_SQLEntities operacion_n = new Aula_Web_SQLEntities();

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

            //Dao_idioma operacion = new Dao_idioma();
            //idioma = operacion.idioma(idiomaId, formularioId);

            List<sp_consultar_idioma_Result> datos_idioma = operacion_n.sp_consultar_idioma(idiomaId, formularioId).ToList<sp_consultar_idioma_Result>();
            idioma = ToDataTable(datos_idioma);

            return idioma;
        }

        //----- obtener datos .....
        public DataTable archivo_datos(string id_archivo) 
        {
            //Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
            //DataTable info = operacion.ver_archivo(id_archivo);

            List<sp_ver_archivo_Result> datos = operacion_n.sp_ver_archivo(Int32.Parse(id_archivo)).ToList<sp_ver_archivo_Result>();
            DataTable info = ToDataTable(datos);

            return info;
        }

        //----- llenar grillas .....
        public DataTable comentarios(string idArc) 
        {
            //Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
            //DataTable info_comentarios = operacion.consultar_comentarios(idArc);

            List<sp_consultar_comentarios_Result> datos = operacion_n.sp_consultar_comentarios(Int32.Parse(idArc)).ToList<sp_consultar_comentarios_Result>();
            DataTable info_comentarios = ToDataTable(datos);

            return info_comentarios;
        }

        //----- descargar archivo .....
        public U_Descargar_archivo descargar_archivo(string user, string id_archivo, string idrol) 
        {
            U_Descargar_archivo datos = new U_Descargar_archivo();
            //Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
            //DataTable info_user = operacion.consultar_usuario(user);
            //DataTable info_file = operacion.ver_archivo(id_archivo);

            List<sp_consulta_usuario_Result> datos2 = operacion_n.sp_consulta_usuario(user).ToList<sp_consulta_usuario_Result>();
            DataTable info_user = ToDataTable(datos2);
            List<sp_ver_archivo_Result> datos3 = operacion_n.sp_ver_archivo(Int32.Parse(id_archivo)).ToList<sp_ver_archivo_Result>();
            DataTable info_file = ToDataTable(datos3);

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
                        //operacion.insertar_descargar_archivo(descargar);
                        //operacion.insertar_subir_descargar(subir_descargar);
                        operacion_n.sp_descargar_archivo(Int32.Parse(descargar.IdUser), Int32.Parse(descargar.Dinero), Int32.Parse(descargar.UserCambio));
                        operacion_n.sp_insertar_subir_descargar(Int32.Parse(subir_descargar.IdUser), Int32.Parse(subir_descargar.IdArchivo), subir_descargar.Concepto, Int32.Parse(subir_descargar.Precio), Int32.Parse(subir_descargar.UserCambio));

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
            //Dao_Descargar_archivo operacion = new Dao_Descargar_archivo();
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
                //operacion.insertar_comentario(comentario);
                operacion_n.sp_insertar_comentario(Int32.Parse(comentario.IdUser), Int32.Parse(comentario.IdArchivo), comentario.Comentario, Int32.Parse(comentario.UserCambio));

                datos.Url_pag = "<script type='text/javascript'>window.location=\"Descargar_archivo.aspx\"</script>";
                return datos;
            }
            catch (Exception exc)
            {
                throw exc;
            }
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

    }//L_Descargar_archivo

}//principal
