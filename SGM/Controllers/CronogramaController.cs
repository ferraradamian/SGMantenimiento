using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SGM.Models;
using SGM.Models.ViewsModel;

namespace SGM.Controllers
{
    public class CronogramaController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Cronograma
        public ActionResult Index()
        {
            var oCronograma = new CronogramaViewModel();

            oCronograma.Guardias = (from d in db.Guardia
                                             select new CronogramaViewModel.GuardiaC
                                             {
                                                 guardia_id = d.guardia_id,
                                                 coordinador = (from e in db.Empleado
                                                                where e.empleado_id == d.coodinador_id
                                                                select e.nombre + " " + e.apellido).FirstOrDefault(), 
                                                 fecha = d.fecha,
                                                 horaInicio = d.horaInicio,
                                                 horaFin = d.horaFin
                                             }).ToList();

            oCronograma.Mantenimientos = (from d in db.Mantenimeinto
                                                select new CronogramaViewModel.MantenimientoC
                                                {
                                                    mantenimiento_id = d.mantenimeinto_id,
                                                    descripcion = d.descripcion,
                                                    nombre = d.nombre,
                                                    fecha = d.fecha,
                                                    tipo_matenimiento = d.tipo_matenimiento,
                                                    repetir_cada = d.repetir_cada
                                                }).ToList();


            return View(oCronograma);
        }
    }
}