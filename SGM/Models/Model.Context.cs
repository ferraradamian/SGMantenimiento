﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class BDSGMEntities : DbContext
    {
        public BDSGMEntities()
            : base("name=BDSGMEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Empleado> Empleado { get; set; }
        public virtual DbSet<Empresa> Empresa { get; set; }
        public virtual DbSet<Equipo> Equipo { get; set; }
        public virtual DbSet<Guardia> Guardia { get; set; }
        public virtual DbSet<Tarea> Tarea { get; set; }
        public virtual DbSet<Recurso> Recurso { get; set; }
        public virtual DbSet<RecursoTarea> RecursoTarea { get; set; }
        public virtual DbSet<Especialidad> Especialidad { get; set; }
        public virtual DbSet<Funcion> Funcion { get; set; }
        public virtual DbSet<OrganizacionEstructura> OrganizacionEstructura { get; set; }
        public virtual DbSet<OrganizacionUbicacion> OrganizacionUbicacion { get; set; }
        public virtual DbSet<Cronograma> Cronograma { get; set; }
        public virtual DbSet<Falla> Falla { get; set; }
        public virtual DbSet<FallaTarea> FallaTarea { get; set; }
        public virtual DbSet<Sintomas> Sintomas { get; set; }
        public virtual DbSet<Grupo> Grupo { get; set; }
    }
}
