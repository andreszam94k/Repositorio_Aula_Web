//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data.SQL_Entity
{
    using System;
    
    public partial class sp_consulta_correo_Result
    {
        public int id_usuario { get; set; }
        public string nombre_user { get; set; }
        public string apellido_user { get; set; }
        public Nullable<long> documento_user { get; set; }
        public string telefono_user { get; set; }
        public string correo_user { get; set; }
        public string usuario { get; set; }
        public string clave { get; set; }
        public Nullable<int> dinero_user { get; set; }
        public int id_rol { get; set; }
        public string ip { get; set; }
        public string mac { get; set; }
        public Nullable<int> modified_by { get; set; }
    }
}
