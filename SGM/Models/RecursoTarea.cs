//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SGM.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class RecursoTarea
    {
        public int recurso_id { get; set; }
        public double cantidadUsada { get; set; }
        public string unidad { get; set; }
        public int Recurso_recurso_id { get; set; }
        public int Tarea_tarea_id { get; set; }
    
        public virtual Recurso Recurso { get; set; }
        public virtual Tarea Tarea { get; set; }
    }
}
