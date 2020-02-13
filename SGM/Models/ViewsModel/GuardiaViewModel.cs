using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SGM.Models.ViewsModel
{
    public class GuardiaViewModel
    {
        //public GuardiaViewModel()
        //{
        //    this.SalectEmpleados = new List<salectEmpleado>();
        //    this.SelectTareas = new List<selectTarea>();
        //}

        public int guardia_id { get; set; }


        [Display(Name = "Cordinador")]
        public Nullable<int> coodinador_id { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [Display(Name = "Fecha")]
        public System.DateTime fecha { get; set; }
       
        public System.TimeSpan horaInicio { get; set; }
        public System.TimeSpan horaFin { get; set; }

        public List<selectTarea> SelectTareas { get; set; }
        public virtual List<salectEmpleado> SalectEmpleados { get; set; }

        public class salectEmpleado
        {
            public int empleado_id { get; set; }
            public int empresa_id { get; set; }
            public string nombre { get; set; }
            public string apellido { get; set; }
            public string telefono { get; set; }
            public string funcion { get; set; }
            public bool esSelect { get; set; }
        }
            
        public class selectTarea
        {
            public int tarea_id { get; set; }
            public string nombre { get; set; }
            public string descripcion { get; set; }
            public Nullable<double> cantidad { get; set; }
            public double costo { get; set; }
            public int duracion { get; set; }
            public string estado { get; set; }
            public bool esSelect { get; set; }
        }
    }
}