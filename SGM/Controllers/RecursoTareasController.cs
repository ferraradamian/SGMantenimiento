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
    public class RecursoTareasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: RecursoTareas
        public ActionResult Index()
        {
            var recursoTarea = db.RecursoTarea.Include(r => r.Recurso).Include(r => r.Tarea);
            return View(recursoTarea.ToList());
        }

        // GET: RecursoTareas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecursoTarea recursoTarea = db.RecursoTarea.Find(id);
            if (recursoTarea == null)
            {
                return HttpNotFound();
            }
            return View(recursoTarea);
        }

        // GET: RecursoTareas/Create
        public ActionResult Create()
        {
            ViewBag.Recurso_recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre");
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion");
            return View();
        }

        // POST: RecursoTareas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "recurso_id,cantidadUsada,unidad,Recurso_recurso_id,Tarea_tarea_id")] RecursoTarea recursoTarea)
        {
            if (ModelState.IsValid)
            {
                db.RecursoTarea.Add(recursoTarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Recurso_recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recursoTarea.Recurso_recurso_id);
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", recursoTarea.Tarea_tarea_id);
            return View(recursoTarea);
        }

        // GET: RecursoTareas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecursoTarea recursoTarea = db.RecursoTarea.Find(id);
            if (recursoTarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.Recurso_recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recursoTarea.Recurso_recurso_id);
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", recursoTarea.Tarea_tarea_id);
            return View(recursoTarea);
        }

        // POST: RecursoTareas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "recurso_id,cantidadUsada,unidad,Recurso_recurso_id,Tarea_tarea_id")] RecursoTarea recursoTarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recursoTarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Recurso_recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recursoTarea.Recurso_recurso_id);
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", recursoTarea.Tarea_tarea_id);
            return View(recursoTarea);
        }

        // GET: RecursoTareas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RecursoTarea recursoTarea = db.RecursoTarea.Find(id);
            if (recursoTarea == null)
            {
                return HttpNotFound();
            }
            return View(recursoTarea);
        }

        // POST: RecursoTareas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RecursoTarea recursoTarea = db.RecursoTarea.Find(id);
            db.RecursoTarea.Remove(recursoTarea);
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
