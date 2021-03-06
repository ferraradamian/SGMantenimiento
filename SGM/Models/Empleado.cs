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
    
    public partial class Empleado
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Empleado()
        {
            this.Cronograma = new HashSet<Cronograma>();
        }
    
        public int empleado_id { get; set; }
        public int empresa_id { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string legajo { get; set; }
        public int funcion_Id { get; set; }
        public Nullable<documento_tipo> documento_tipo { get; set; }
        public Nullable<int> documento_numero { get; set; }
        public string cuil { get; set; }
        public Nullable<grupo_sanguineo> grupo_sanguineo { get; set; }
        public Nullable<factor_rh> factor_rh { get; set; }
        public Nullable<long> telefono_fijo { get; set; }
        public Nullable<long> tel_celular_1 { get; set; }
        public Nullable<long> tel_celular_2 { get; set; }
        public Nullable<long> tel_radio { get; set; }
        public Nullable<long> radio { get; set; }
        public Nullable<int> interno { get; set; }
        public string email { get; set; }
        public byte[] foto { get; set; }
        public string direccion { get; set; }
        public string numero { get; set; }
        public string pais { get; set; }
        public string provincia { get; set; }
        public string ciudad { get; set; }
        public string codigo_postal { get; set; }
    
        public virtual Empresa Empresa { get; set; }
        public virtual Funcion Funcion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cronograma> Cronograma { get; set; }
    }
}
