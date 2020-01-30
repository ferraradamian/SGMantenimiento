using System;
using System.Collections.Generic;
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
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public double cantidad { get; set; }
        public double costo { get; set; }
        public int duracion { get; set; }
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