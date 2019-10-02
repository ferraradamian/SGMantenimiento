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
    
    public partial class Tarea
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tarea()
        {
            this.FallaTarea = new HashSet<FallaTarea>();
            this.RecursoTarea = new HashSet<RecursoTarea>();
        }
    
        public int tarea_id { get; set; }
        public string descripcion { get; set; }
        public Nullable<estado_tarea> estado_tarea { get; set; }
        public System.DateTime fecha_hora { get; set; }
        public Nullable<long> permiso_trabajo { get; set; }
        public System.Guid CronogramaId { get; set; }
        public Nullable<int> Equipo_equipo_id { get; set; }
        public int OrganizacionUbicacionId { get; set; }
    
        public virtual Cronograma Cronograma { get; set; }
        public virtual Equipo Equipo { get; set; }
        public virtual OrganizacionUbicacion OrganizacionUbicacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FallaTarea> FallaTarea { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RecursoTarea> RecursoTarea { get; set; }
    }
}
