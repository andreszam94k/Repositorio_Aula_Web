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
    
    public partial class sp_consultar_archivos_Result
    {
        public int id_archivo { get; set; }
        public string nombre_archivo { get; set; }
        public string anio_archivo { get; set; }
        public string sinopsis_archivo { get; set; }
        public Nullable<int> num_pag { get; set; }
        public string imagen_portada { get; set; }
        public string url { get; set; }
        public string tags { get; set; }
        public int id_usuario { get; set; }
        public int id_estado { get; set; }
        public int id_categoria { get; set; }
        public int id_moderador { get; set; }
        public Nullable<int> estado_mod { get; set; }
        public Nullable<int> modified_by { get; set; }
        public string categoria { get; set; }
    }
}
