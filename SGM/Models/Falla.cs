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
    
    public partial class Falla
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Falla()
        {
            this.Equipo = new HashSet<Equipo>();
        }
    
        public int falla_id { get; set; }
        public string descripcion { get; set; }
        public string causa { get; set; }
        public System.DateTime fecha { get; set; }
        public string estado { get; set; }
        public string costo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Equipo> Equipo { get; set; }
    }
}
