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
    
    public partial class Mantenimeinto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Mantenimeinto()
        {
            this.Empleado = new HashSet<Empleado>();
            this.Tarea = new HashSet<Tarea>();
        }
    
        public int mantenimeinto_id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public System.DateTime fecha { get; set; }
        public string tipo_matenimiento { get; set; }
        public string repetir_cada { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Empleado> Empleado { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tarea> Tarea { get; set; }
    }
}
