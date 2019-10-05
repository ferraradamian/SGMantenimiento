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
    public class FallaTareasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: FallaTareas
        public ActionResult Index()
        {
            var fallaTarea = db.FallaTarea.Include(f => f.Falla).Include(f => f.Tarea);
            return View(fallaTarea.ToList());
        }

        // GET: FallaTareas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FallaTarea fallaTarea = db.FallaTarea.Find(id);
            if (fallaTarea == null)
            {
                return HttpNotFound();
            }
            return View(fallaTarea);
        }

        // GET: FallaTareas/Create
        public ActionResult Create()
        {
            ViewBag.FallaId = new SelectList(db.Falla, "Id", "nombre");
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion");
            return View();
        }

        // POST: FallaTareas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FallaId,Tarea_tarea_id")] FallaTarea fallaTarea)
        {
            if (ModelState.IsValid)
            {
                db.FallaTarea.Add(fallaTarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.FallaId = new SelectList(db.Falla, "Id", "nombre", fallaTarea.FallaId);
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", fallaTarea.Tarea_tarea_id);
            return View(fallaTarea);
        }

        // GET: FallaTareas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FallaTarea fallaTarea = db.FallaTarea.Find(id);
            if (fallaTarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.FallaId = new SelectList(db.Falla, "Id", "nombre", fallaTarea.FallaId);
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", fallaTarea.Tarea_tarea_id);
            return View(fallaTarea);
        }

        // POST: FallaTareas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FallaId,Tarea_tarea_id")] FallaTarea fallaTarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(fallaTarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FallaId = new SelectList(db.Falla, "Id", "nombre", fallaTarea.FallaId);
            ViewBag.Tarea_tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", fallaTarea.Tarea_tarea_id);
            return View(fallaTarea);
        }

        // GET: FallaTareas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            FallaTarea fallaTarea = db.FallaTarea.Find(id);
            if (fallaTarea == null)
            {
                return HttpNotFound();
            }
            return View(fallaTarea);
        }

        // POST: FallaTareas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            FallaTarea fallaTarea = db.FallaTarea.Find(id);
            db.FallaTarea.Remove(fallaTarea);
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
