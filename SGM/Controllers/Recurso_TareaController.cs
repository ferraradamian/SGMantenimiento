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
    public class Recurso_TareaController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Recurso_Tarea
        public ActionResult Index()
        {
            var recurso_Tarea = db.Recurso_Tarea.Include(r => r.Recurso).Include(r => r.Tarea);
            return View(recurso_Tarea.ToList());
        }

        // GET: Recurso_Tarea/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso_Tarea recurso_Tarea = db.Recurso_Tarea.Find(id);
            if (recurso_Tarea == null)
            {
                return HttpNotFound();
            }
            return View(recurso_Tarea);
        }

        // GET: Recurso_Tarea/Create
        public ActionResult Create()
        {
            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre");
            ViewBag.Tarea_id = new SelectList(db.Tarea, "tarea_id", "nombre");
            return View();
        }

        // POST: Recurso_Tarea/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Tarea_id,recurso_id,cantidadUsada")] Recurso_Tarea recurso_Tarea)
        {
            if (ModelState.IsValid)
            {
                db.Recurso_Tarea.Add(recurso_Tarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recurso_Tarea.recurso_id);
            ViewBag.Tarea_id = new SelectList(db.Tarea, "tarea_id", "nombre", recurso_Tarea.Tarea_id);
            return View(recurso_Tarea);
        }

        // GET: Recurso_Tarea/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso_Tarea recurso_Tarea = db.Recurso_Tarea.Find(id);
            if (recurso_Tarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recurso_Tarea.recurso_id);
            ViewBag.Tarea_id = new SelectList(db.Tarea, "tarea_id", "nombre", recurso_Tarea.Tarea_id);
            return View(recurso_Tarea);
        }

        // POST: Recurso_Tarea/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Tarea_id,recurso_id,cantidadUsada")] Recurso_Tarea recurso_Tarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recurso_Tarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recurso_Tarea.recurso_id);
            ViewBag.Tarea_id = new SelectList(db.Tarea, "tarea_id", "nombre", recurso_Tarea.Tarea_id);
            return View(recurso_Tarea);
        }

        // GET: Recurso_Tarea/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso_Tarea recurso_Tarea = db.Recurso_Tarea.Find(id);
            if (recurso_Tarea == null)
            {
                return HttpNotFound();
            }
            return View(recurso_Tarea);
        }

        // POST: Recurso_Tarea/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Recurso_Tarea recurso_Tarea = db.Recurso_Tarea.Find(id);
            db.Recurso_Tarea.Remove(recurso_Tarea);
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
