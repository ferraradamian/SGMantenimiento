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


        [Display(Name = "Coordinador")]
        public Nullable<int> coodinador_id { get; set; }

        [Display(Name = "Nomnre Coodinador")]
        public string nombreCoordinador { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        [Display(Name = "Fecha")]
        public System.DateTime fecha { get; set; }

        [Required]
        [DataType(DataType.Time)]
        [DisplayFormat(DataFormatString = "{0:hh\\:mm}")]
        [Display(Name = "Hr Inicio")]
        public System.TimeSpan horaInicio { get; set; }

        [Required]
        [DataType(DataType.Time)]
        [DisplayFormat(DataFormatString = "{0:hh\\:mm}")]
        [Display(Name = "Hr Fin")]
        public System.TimeSpan horaFin { get; set; }

        public List<selectTarea> SelectTareas { get; set; }
        public virtual List<salectEmpleado> SalectEmpleados { get; set; }

        public class salectEmpleado
        {
            public int empleado_id { get; set; }
            public int empresa_id { get; set; }

            [Required]
            [StringLength(120, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
            [Display(Name = "Nombre")]
            public string nombre { get; set; }

            [StringLength(20, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
            [Display(Name = "Apellido")]
            public string apellido { get; set; }

            [Phone]
            [StringLength(10, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
            [Display(Name = "Telefono")]
            public string telefono { get; set; }

            [Required]
            [StringLength(20, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
            [Display(Name = "Funcion")]
            public string funcion { get; set; }

            public bool esSelect { get; set; }
        }
            
        public class selectTarea
        {
            public int tarea_id { get; set; }

            [Required]
            [StringLength(100, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
            [Display(Name = "Nombre")]
            public string nombre { get; set; }

            [StringLength(250, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
            [Display(Name = "Descripcion")]
            public string descripcion { get; set; }

            [Display(Name = "Cantidad")]
            public Nullable<double> cantidad { get; set; }

            [Required]
            [DataType(DataType.Currency)]
            [Display(Name = "Costo")]
            public double costo { get; set; }

            [Required]
            [Display(Name = "Duracion")]
            public int duracion { get; set; }

            [Required]
            [StringLength(500, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
            [Display(Name = "Estado")]
            public string estado { get; set; }


            public bool esSelect { get; set; }
        }
    }
}