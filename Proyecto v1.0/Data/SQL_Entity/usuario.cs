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
    using System.Collections.Generic;
    
    public partial class usuario
    {
        public usuario()
        {
            this.archivo = new HashSet<archivo>();
            this.comentario = new HashSet<comentario>();
            this.subir_descargar = new HashSet<subir_descargar>();
        }
    
        public int id_usuario { get; set; }
        public string nombre_user { get; set; }
        public string apellido_user { get; set; }
        public Nullable<long> documento_user { get; set; }
        public string telefono_user { get; set; }
        public string correo_user { get; set; }
        public string usuario1 { get; set; }
        public string clave { get; set; }
        public Nullable<int> dinero_user { get; set; }
        public int id_rol { get; set; }
        public string ip { get; set; }
        public string mac { get; set; }
        public Nullable<int> modified_by { get; set; }
    
        public virtual ICollection<archivo> archivo { get; set; }
        public virtual ICollection<comentario> comentario { get; set; }
        public virtual rol rol { get; set; }
        public virtual ICollection<subir_descargar> subir_descargar { get; set; }
    }
}
