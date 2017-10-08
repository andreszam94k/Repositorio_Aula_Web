using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data;
using Utilitarios;
using System.Collections;
using System.Reflection;
using System.Data;

namespace Logica
{
    public class L_master
    {
        //objeto de persistencia
        AulaWebContext_idioma.AulaWebDataContext_idioma operacion2 = new AulaWebContext_idioma.AulaWebDataContext_idioma();

        public U_master verificar_session(object var0, object var1, object var2, object var3, object var4)
        {
            U_master datos = new U_master();

            if (var2 == null)
            {
                //ocultamos los componentes
                datos.Bienvenido = " ";
                datos.LBienvenido = false;
                datos.ImgUser = false;
                datos.NomUser = " ";
                datos.LNomUser = false;
                datos.RolUser = " ";
                datos.LRolUser = false;
                datos.ImgMoney = false;
                datos.Dinero = " ";
                datos.LDinero = false;
                datos.LbCerrarSession = false;
                datos.Ddl_idiomas = true;
                datos.B_idiomas = true;

                //habilitamos menus
                datos.Menu_1 = false;
                datos.Menu_2 = false;
                datos.Menu_3 = false;
                datos.Menu_4 = true;
            }
            else
            {
                //mostramos componentes y llenamos valores
                datos.Bienvenido = "-- " + var1 + " --";
                datos.LBienvenido = true;
                datos.NomUser = "Nickname: " + var2;
                datos.LNomUser = true;
                datos.ImgMoney = true;
                datos.Dinero = "$ " + var3;
                datos.LDinero = true;
                datos.LbCerrarSession = true;
                datos.Ddl_idiomas = false;
                datos.B_idiomas = false;

                //menus, rol e imagen
                datos.Menu_4 = false;
                //por rol
                if (int.Parse((String)var4) == 1)
                {
                    datos.Menu_1 = true;
                    datos.Menu_2 = false;
                    datos.Menu_3 = false;
                    datos.RolUser = "Rol: Administrador/Administrator";
                    datos.LRolUser = true;
                    datos.UImgUser = "~/Imagenes/admin.png";
                    datos.ImgUser = true;
                    //Response.Redirect("formulario1_1.aspx");
                }
                else
                {
                    if (int.Parse((String)var4) == 2)
                    {
                        datos.Menu_1 = false;
                        datos.Menu_2 = true;
                        datos.Menu_3 = false;
                        datos.RolUser = "Rol: Moderador/Moderator";
                        datos.LRolUser = true;
                        datos.UImgUser = "~/Imagenes/mod.png";
                        datos.ImgUser = true;

                    }
                    else
                    {
                        if (int.Parse((String)var4) == 3)
                        {
                            datos.Menu_1 = false;
                            datos.Menu_2 = false;
                            datos.Menu_3 = true;
                            datos.RolUser = "Rol: Usuario/User";
                            datos.LRolUser = true;
                            datos.UImgUser = "~/Imagenes/user.png";
                            datos.ImgUser = true;

                        }
                        else //no es usurio del sistema
                        {
                            //Session["user"] = null;
                            //Session["rolID"] = null;
                        }
                    }
                }//else principal

            }

            return datos;

        }//clase verificar_session


        public DataTable idioma(Int64 idiomaId, Int64 formularioId) 
        {
            DataTable idioma = new DataTable();

            List<AulaWebContext_idioma.SpConsultarIdiomaResult> datos_idioma = operacion2.SpConsultarIdioma(idiomaId, formularioId).ToList<AulaWebContext_idioma.SpConsultarIdiomaResult>();
            idioma = ToDataTable(datos_idioma);

            return idioma;
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


    }//L_master
}//principal
