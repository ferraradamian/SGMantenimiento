using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace SGM.Models.ViewsModel
{
    public class TareaViewModel
    {
        public TareaViewModel()
        {
            this.SelectEquipos = new List<SelectEquipo>();
        }

        public int tarea_id { get; set; }

        [Required]
        [StringLength(100, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
        [Display(Name = "Nombre")]
        public string nombre { get; set; }

        [StringLength(250, ErrorMessage = "El {0} debe tener al menos {1} caracteres", MinimumLength = 1)]
        [Display(Name = "Descripcion")]
        public string descripcion { get; set; }

        
        [Display(Name = "Cantidad")]
        public double cantidad { get; set; }

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

        public List<SelectEquipo> SelectEquipos { get; set; }

        public class SelectEquipo
        {
            public int equipo_id { get; set; }
            public string nombre { get; set; }
            public string estadoActual { get; set; }
            public string marca { get; set; }
            public string numeroSerie { get; set; }
            public DateTime inicioOperacion { get; set; }
            public DateTime? finOperacion { get; set; }
            public bool esSelect { get; set; }
        }
        
    }
}