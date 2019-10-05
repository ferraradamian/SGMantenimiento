using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SGM.Models;

namespace SGM.Controllers
{
    public class TareasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Tareas
        public ActionResult Index()
        {
            var tarea = db.Tarea.Include(t => t.Cronograma).Include(t => t.Equipo).Include(t => t.OrganizacionUbicacion);
            return View(tarea.ToList());
        }

        // GET: Tareas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea tarea = db.Tarea.Find(id);
            if (tarea == null)
            {
                return HttpNotFound();
            }
            return View(tarea);
        }

        // GET: Tareas/Create
        public ActionResult Create()
        {
            ViewBag.CronogramaId = new SelectList(db.Empleado_Guardia, "Id", "observaciones");
            ViewBag.Equipo_equipo_id = new SelectList(db.Equipo, "equipo_id", "nombre");
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre");
            return View();
        }

        // POST: Tareas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "tarea_id,descripcion,estado_tarea,fecha_hora,permiso_trabajo,CronogramaId,Equipo_equipo_id,OrganizacionUbicacionId")] Tarea tarea)
        {
            if (ModelState.IsValid)
            {
                db.Tarea.Add(tarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CronogramaId = new SelectList(db.Empleado_Guardia, "Id", "observaciones", tarea.CronogramaId);
            ViewBag.Equipo_equipo_id = new SelectList(db.Equipo, "equipo_id", "nombre", tarea.Equipo_equipo_id);
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre", tarea.OrganizacionUbicacionId);
            return View(tarea);
        }

        // GET: Tareas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea tarea = db.Tarea.Find(id);
            if (tarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.CronogramaId = new SelectList(db.Empleado_Guardia, "Id", "observaciones", tarea.CronogramaId);
            ViewBag.Equipo_equipo_id = new SelectList(db.Equipo, "equipo_id", "nombre", tarea.Equipo_equipo_id);
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre", tarea.OrganizacionUbicacionId);
            return View(tarea);
        }

        // POST: Tareas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "tarea_id,descripcion,estado_tarea,fecha_hora,permiso_trabajo,CronogramaId,Equipo_equipo_id,OrganizacionUbicacionId")] Tarea tarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CronogramaId = new SelectList(db.Empleado_Guardia, "Id", "observaciones", tarea.CronogramaId);
            ViewBag.Equipo_equipo_id = new SelectList(db.Equipo, "equipo_id", "nombre", tarea.Equipo_equipo_id);
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre", tarea.OrganizacionUbicacionId);
            return View(tarea);
        }

        // GET: Tareas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea tarea = db.Tarea.Find(id);
            if (tarea == null)
            {
                return HttpNotFound();
            }
            return View(tarea);
        }

        // POST: Tareas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tarea tarea = db.Tarea.Find(id);
            db.Tarea.Remove(tarea);
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
