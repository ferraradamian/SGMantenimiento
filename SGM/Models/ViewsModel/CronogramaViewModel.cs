using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGM.Models.ViewsModel
{
    public class CronogramaViewModel
    {
        public List<GuardiaC> Guardias { get; set; }
        public List<MantenimientoC> Mantenimientos { get; set; }

        public class GuardiaC
        {
            public int guardia_id { get; set; }
            public string coordinador { get; set; }
            public System.DateTime fecha { get; set; }
            public System.TimeSpan horaInicio { get; set; }
            public System.TimeSpan horaFin { get; set; }
        }

        public class MantenimientoC
        {
            public int mantenimiento_id { get; set; }
            public string descripcion { get; set; }
            public string nombre { get; set; }
            public DateTime fecha { get; set; }
            public string tipo_matenimiento { get; set; }
            public string repetir_cada { get; set; }
        }
    }
}