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
    
    public partial class OrganizacionUbicacion
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrganizacionUbicacion()
        {
            this.OrganizacionUbicacion1 = new HashSet<OrganizacionUbicacion>();
            this.Equipo = new HashSet<Equipo>();
            this.Tarea = new HashSet<Tarea>();
        }
    
        public int Id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public byte OrganizacionEstructuraId { get; set; }
        public int OrganizacionUbicacionId { get; set; }
    
        public virtual OrganizacionEstructura OrganizacionEstructura { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrganizacionUbicacion> OrganizacionUbicacion1 { get; set; }
        public virtual OrganizacionUbicacion OrganizacionUbicacion2 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Equipo> Equipo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tarea> Tarea { get; set; }
    }
}