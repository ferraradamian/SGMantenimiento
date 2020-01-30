using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SGM.Models.ViewsModel
{
    public class MantenimientoViewModel
    {
        public int mantenimiento_id { get; set; }
        public string descripcion { get; set; }
        public string nombre { get; set; }
        public DateTime fecha { get; set; }
        public string tipo_matenimiento { get; set; }
        public string repetir_cada { get; set; }



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