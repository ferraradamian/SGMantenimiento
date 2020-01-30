using SGM.Models;
using SGM.Models.ViewsModel;
using System;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace SGM.Controllers
{
    public class MantenimientoController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Preventivo
        public ActionResult Index()
        {
            return View(db.Mantenimeinto.ToList());
        }

        // GET: Preventivo/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mantenimeinto mantenimeinto = db.Mantenimeinto.Find(id);
            if (mantenimeinto == null)
            {
                return HttpNotFound();
            }
            return View(mantenimeinto);
        }

        // GET: Preventivo/Create
        public ActionResult Create()
        {
            var oMantenimientoViewModel = new MantenimientoViewModel();
            oMantenimientoViewModel.SelectTareas = (from d in db.Tarea
                                              orderby d.nombre
                                              select new MantenimientoViewModel.selectTarea
                                              {
                                                  tarea_id = d.tarea_id,
                                                  nombre = d.nombre,
                                                  descripcion = d.descripcion,
                                                  cantidad = d.cantidad,
                                                  costo = d.costo,
                                                  duracion = d.duracion,
                                                  estado = d.estado,
                                                  esSelect = false

                                              }).ToList();

            oMantenimientoViewModel.SalectEmpleados = (from d in db.Empleado
                                                 orderby d.apellido
                                                 select new MantenimientoViewModel.salectEmpleado
                                                 {
                                                     empleado_id = d.empleado_id,
                                                     empresa_id = d.empresa_id,
                                                     nombre = d.nombre,
                                                     apellido = d.apellido,
                                                     telefono = d.telefono,
                                                     funcion = d.funcion,
                                                     esSelect = false

                                                 }).ToList();

            return View(oMantenimientoViewModel);
        }

        // POST: Preventivo/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MantenimientoViewModel oMantenimientoViewModel)
        {
            if (ModelState.IsValid)
            {
                var oMantenimiento = new Mantenimeinto();
                //guardia.coodinador_id = empleado_id;
                oMantenimiento.nombre = oMantenimientoViewModel.nombre;
                oMantenimiento.descripcion = oMantenimientoViewModel.descripcion;
                oMantenimiento.fecha = oMantenimientoViewModel.fecha;
                oMantenimiento.tipo_matenimiento = oMantenimientoViewModel.tipo_matenimiento;
                oMantenimiento.repetir_cada = oMantenimientoViewModel.repetir_cada;
                foreach (var item in oMantenimientoViewModel.SalectEmpleados.Where(a => a.esSelect == true))
                {
                    Empleado oEmpleado = db.Empleado.Find(item.empleado_id);
                    oMantenimiento.Empleado.Add(oEmpleado);
                }
                foreach (var item in oMantenimientoViewModel.SelectTareas.Where(a => a.esSelect == true))
                {
                    Tarea oTarea = db.Tarea.Find(item.tarea_id);
                    oMantenimiento.Tarea.Add(oTarea);
                }
                db.Mantenimeinto.Add(oMantenimiento);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(oMantenimientoViewModel);
        }

        // GET: Preventivo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mantenimeinto mantenimeinto = db.Mantenimeinto.Find(id);
            if (mantenimeinto == null)
            {
                return HttpNotFound();
            }
            return View(mantenimeinto);
        }

        // POST: Preventivo/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "mantenimeinto_id,descripcion,nombre,fecha,tipo_matenimiento,repetir_cada")] Mantenimeinto mantenimeinto)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mantenimeinto).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(mantenimeinto);
        }

        // GET: Preventivo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Mantenimeinto mantenimiento = db.Mantenimeinto.Find(id);
            if (mantenimiento == null)
            {
                return HttpNotFound();
            }
            return View(mantenimiento);
        }

        // POST: Preventivo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Mantenimeinto preventivo = db.Mantenimeinto.Find(id);
            db.Mantenimeinto.Remove(preventivo);
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
