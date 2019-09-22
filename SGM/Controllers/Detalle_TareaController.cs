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
    public class Detalle_TareaController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Detalle_Tarea
        public ActionResult Index()
        {
            var detalle_Tarea = db.Detalle_Tarea.Include(d => d.Tarea);
            return View(detalle_Tarea.ToList());
        }

        // GET: Detalle_Tarea/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Detalle_Tarea detalle_Tarea = db.Detalle_Tarea.Find(id);
            if (detalle_Tarea == null)
            {
                return HttpNotFound();
            }
            return View(detalle_Tarea);
        }

        // GET: Detalle_Tarea/Create
        public ActionResult Create()
        {
            ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "estado");
            return View();
        }

        // POST: Detalle_Tarea/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "detalleTarea_id,tarea_id,nombre,descripcion,cantidad")] Detalle_Tarea detalle_Tarea)
        {
            if (ModelState.IsValid)
            {
                db.Detalle_Tarea.Add(detalle_Tarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "estado", detalle_Tarea.tarea_id);
            return View(detalle_Tarea);
        }

        // GET: Detalle_Tarea/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Detalle_Tarea detalle_Tarea = db.Detalle_Tarea.Find(id);
            if (detalle_Tarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "estado", detalle_Tarea.tarea_id);
            return View(detalle_Tarea);
        }

        // POST: Detalle_Tarea/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "detalleTarea_id,tarea_id,nombre,descripcion,cantidad")] Detalle_Tarea detalle_Tarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(detalle_Tarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "estado", detalle_Tarea.tarea_id);
            return View(detalle_Tarea);
        }

        // GET: Detalle_Tarea/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Detalle_Tarea detalle_Tarea = db.Detalle_Tarea.Find(id);
            if (detalle_Tarea == null)
            {
                return HttpNotFound();
            }
            return View(detalle_Tarea);
        }

        // POST: Detalle_Tarea/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Detalle_Tarea detalle_Tarea = db.Detalle_Tarea.Find(id);
            db.Detalle_Tarea.Remove(detalle_Tarea);
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
