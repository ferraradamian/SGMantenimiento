using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SGM.Models;
using SGM.Models.ViewsModel;

namespace SGM.Controllers
{
    public class GuardiasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Guardias
        public ActionResult Index()
        {            
            List<GuardiaViewModel> oListGuardia = new List<GuardiaViewModel>();
            foreach (Guardia guardia in db.Guardia)
            {
                GuardiaViewModel oGuardia = new GuardiaViewModel();
                oGuardia.guardia_id = guardia.guardia_id;
                oGuardia.coodinador_id = guardia.coodinador_id;
                oGuardia.nombreCoordinador = db.Empleado.Where(e => e.empleado_id == guardia.coodinador_id).First().nombre + " " + db.Empleado.Where(e => e.empleado_id == guardia.coodinador_id).First().apellido;
                oGuardia.fecha = guardia.fecha;
                oGuardia.horaInicio = guardia.horaInicio;
                oGuardia.horaFin = guardia.horaFin;
                oListGuardia.Add(oGuardia);
            }
            return View(oListGuardia);
        }

        // GET: Guardias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guardia guardia = db.Guardia.Find(id);
            if (guardia == null)
            {
                return HttpNotFound();
            }
            ViewBag.nombreCoordinador = db.Empleado.Where(e => e.empleado_id == guardia.coodinador_id).First().nombre + " " + db.Empleado.Where(e => e.empleado_id == guardia.coodinador_id).First().apellido;
            return View(guardia);
        }

        // GET: Guardias/Create
        [HttpGet]
        public ActionResult Create(string searchEmpleado, string searchTarea)
        {
            ViewBag.empleado_id = new SelectList(db.Empleado, "empleado_id", "nombre");

            var oGuardiaViewModel = new GuardiaViewModel();
            oGuardiaViewModel.SelectTareas = (from d in db.Tarea
                                              orderby d.nombre
                                                select new GuardiaViewModel.selectTarea
                                                {
                                                    tarea_id = d.tarea_id,
                                                    nombre = d.nombre,
                                                    descripcion = d.descripcion,
                                                    cantidad = d.cantidad,
                                                    costo = d.costo,
                                                    duracion=d.duracion,
                                                    estado = d.estado,
                                                    esSelect = false 

                                                 }).ToList();

            oGuardiaViewModel.SalectEmpleados = (from d in db.Empleado
                                                 orderby d.apellido
                                                 select new GuardiaViewModel.salectEmpleado
                                                 {
                                                     empleado_id = d.empleado_id,
                                                     empresa_id = d.empresa_id,
                                                     nombre = d.nombre,
                                                     apellido = d.apellido,
                                                     telefono = d.telefono,
                                                     funcion = d.funcion,
                                                     esSelect = false

                                                 }).ToList();

            return View(oGuardiaViewModel);
        }

        // POST: Guardias/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GuardiaViewModel oGuardiaViewModel, int empleado_id)
        {
            ViewBag.empleado_id = new SelectList(db.Empleado, "empleado_id", "nombre");
            bool overlap = db.Guardia.Where(h => oGuardiaViewModel.horaInicio < h.horaFin && h.horaInicio < oGuardiaViewModel.horaFin && oGuardiaViewModel.fecha == h.fecha).Count() != 0;
            if (!overlap) { 

                if (ModelState.IsValid)
                {                            
                    var guardia = new Guardia();
                    guardia.coodinador_id = empleado_id;
                    guardia.fecha = oGuardiaViewModel.fecha;
                    guardia.horaInicio = oGuardiaViewModel.horaInicio;
                    guardia.horaFin = oGuardiaViewModel.horaFin;
                    foreach(var item in oGuardiaViewModel.SalectEmpleados.Where(a => a.esSelect == true))
                    {
                        Empleado oEmpleado = db.Empleado.Find(item.empleado_id);
                        guardia.Empleado.Add(oEmpleado);
                    }
                    foreach (var item in oGuardiaViewModel.SelectTareas.Where(a => a.esSelect == true))
                    {
                        Tarea oTarea = db.Tarea.Find(item.tarea_id);
                        guardia.Tarea.Add(oTarea);
                    }
                    db.Guardia.Add(guardia);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            ModelState.AddModelError("", "El horario se superpone con otra guardia");
            return View(oGuardiaViewModel);
        }

        // GET: Guardias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guardia guardia = db.Guardia.Find(id);
            if (guardia == null)
            {
                return HttpNotFound();
            }             
            return View(guardia);
        }

        // POST: Guardias/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "guardia_id,coodinador_id,fecha,horaInicio,horaFin")] Guardia guardia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(guardia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(guardia);
        }

        // GET: Guardias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guardia guardia = db.Guardia.Find(id);
            if (guardia == null)
            {
                return HttpNotFound();
            }

            return View(guardia);
        }

        // POST: Guardias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Guardia guardia = db.Guardia.Find(id);
            db.Guardia.Remove(guardia);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
