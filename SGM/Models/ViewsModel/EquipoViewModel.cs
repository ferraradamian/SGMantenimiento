using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGM.Models.ViewsModel
{
    public class EquipoViewModel
    {
        public int equipo_id { get; set; }
        public string nombre { get; set; }
        public string estadoActual { get; set; }
        public string marca { get; set; }
        public string modelo { get; set; }
        public string numeroSerie { get; set; }
        public DateTime inicioOperacion { get; set; }
        public DateTime? finOperacion { get; set; }
        public bool esCritico { get; set; }

        public List<SelectFalla> SelectFallas { get; set; }

        public class SelectFalla
        {
            public int falla_id { get; set; }
            public string descripcion { get; set; }
            public string causa { get; set; }
            public DateTime fecha { get; set; }
            public string estado { get; set; }
            public double costo { get; set; }
            public bool esSelect { get; set; }
        }
    }
}