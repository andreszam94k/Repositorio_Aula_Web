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
    
    public partial class comentario
    {
        public int id_comentario { get; set; }
        public string comentario1 { get; set; }
        public Nullable<System.DateTime> fecha { get; set; }
        public int id_usuario { get; set; }
        public int id_archivo { get; set; }
        public Nullable<int> modified_by { get; set; }
    
        public virtual archivo archivo { get; set; }
        public virtual usuario usuario { get; set; }
    }
}
