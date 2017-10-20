using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;
using Data;
using System.Data;

namespace Logica
{
    public class L_Reporte_usuarios
    {
        //----- verificar sesion .....
        public U_Reporte_usuarios verificar(object user, object rol)
        {
            U_Reporte_usuarios datos = new U_Reporte_usuarios();

            if (user == null)
            {
                datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
            }
            else
            {
                if (int.Parse((String)rol) != 1)
                {
                    datos.Url_pag = "<script type='text/javascript'>window.location=\"inicio.aspx\"</script>";
                }
            }

            return datos;
        }

        //metodo para llenar informe principal
        //NOTA: el subinforme obtiene los datos de esta consulta, si falta alguno no lo muestra
        public Data_Reportes ObtenerInforme()
        {
            //definimos la fila la cual contendra los datos del datatable intermedio
            DataRow fila;  //dr
            //definimos un datatable principal y llamamos al dataset
            DataTable personaInformacion = new DataTable(); //dt
            Data_Reportes datos = new Data_Reportes();

            //llenamos el datatable principal con la info del data set
            personaInformacion = datos.Tables["DT_usuarios"];

            //hacemos una consulta para obtener los datos en otro datatable que servira de intermedio
            Dao_Ver_Reportes dao = new Dao_Ver_Reportes();
            DataTable Intermedio = dao.consultar_reporte_usuarios();

            //recorremos el datatable intermedio
            for (int i = 0; i < Intermedio.Rows.Count; i++)
            {
                //definimos una nueva fila para agregar los datos del datatable intermedio
                fila = personaInformacion.NewRow();

                //agregamos las campos y los llenamos con los datos del datatable intermedio
                fila["id_usuario"] = int.Parse(Intermedio.Rows[i]["id_usuario"].ToString());
                fila["nombre"] = Intermedio.Rows[i]["nombre"].ToString();
                fila["apellido"] = Intermedio.Rows[i]["apellido"].ToString();
                fila["documento"] = Intermedio.Rows[i]["documento"].ToString();
                fila["telefono"] = Intermedio.Rows[i]["telefono"].ToString();
                fila["correo"] = Intermedio.Rows[i]["correo"].ToString();
                fila["usuario"] = Intermedio.Rows[i]["usuario"].ToString();
                fila["clave"] = Intermedio.Rows[i]["clave"].ToString();
                fila["dinero"] = Intermedio.Rows[i]["dinero"].ToString();
                fila["id_rol"] = Intermedio.Rows[i]["id_rol"].ToString();
                fila["rol"] = Intermedio.Rows[i]["rol"].ToString();

                //finalmente ya con los datos, agregamos la fila al datatable principal
                personaInformacion.Rows.Add(fila);
            }

            return datos;
        }


    }//L_Reporte_usuarios

}//principal
