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
    public class Recurso_DetalleTareaController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Recurso_DetalleTarea
        public ActionResult Index()
        {
            var recurso_DetalleTarea = db.Recurso_DetalleTarea.Include(r => r.Detalle_Tarea).Include(r => r.Recurso);
            return View(recurso_DetalleTarea.ToList());
        }

        // GET: Recurso_DetalleTarea/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso_DetalleTarea recurso_DetalleTarea = db.Recurso_DetalleTarea.Find(id);
            if (recurso_DetalleTarea == null)
            {
                return HttpNotFound();
            }
            return View(recurso_DetalleTarea);
        }

        // GET: Recurso_DetalleTarea/Create
        public ActionResult Create()
        {
            ViewBag.detalleTarea_id = new SelectList(db.Detalle_Tarea, "detalleTarea_id", "nombre");
            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre");
            return View();
        }

        // POST: Recurso_DetalleTarea/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "detalleTarea_id,recurso_id,cantidadUsada")] Recurso_DetalleTarea recurso_DetalleTarea)
        {
            if (ModelState.IsValid)
            {
                db.Recurso_DetalleTarea.Add(recurso_DetalleTarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.detalleTarea_id = new SelectList(db.Detalle_Tarea, "detalleTarea_id", "nombre", recurso_DetalleTarea.detalleTarea_id);
            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recurso_DetalleTarea.recurso_id);
            return View(recurso_DetalleTarea);
        }

        // GET: Recurso_DetalleTarea/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso_DetalleTarea recurso_DetalleTarea = db.Recurso_DetalleTarea.Find(id);
            if (recurso_DetalleTarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.detalleTarea_id = new SelectList(db.Detalle_Tarea, "detalleTarea_id", "nombre", recurso_DetalleTarea.detalleTarea_id);
            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recurso_DetalleTarea.recurso_id);
            return View(recurso_DetalleTarea);
        }

        // POST: Recurso_DetalleTarea/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "detalleTarea_id,recurso_id,cantidadUsada")] Recurso_DetalleTarea recurso_DetalleTarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(recurso_DetalleTarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.detalleTarea_id = new SelectList(db.Detalle_Tarea, "detalleTarea_id", "nombre", recurso_DetalleTarea.detalleTarea_id);
            ViewBag.recurso_id = new SelectList(db.Recurso, "recurso_id", "nombre", recurso_DetalleTarea.recurso_id);
            return View(recurso_DetalleTarea);
        }

        // GET: Recurso_DetalleTarea/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Recurso_DetalleTarea recurso_DetalleTarea = db.Recurso_DetalleTarea.Find(id);
            if (recurso_DetalleTarea == null)
            {
                return HttpNotFound();
            }
            return View(recurso_DetalleTarea);
        }

        // POST: Recurso_DetalleTarea/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Recurso_DetalleTarea recurso_DetalleTarea = db.Recurso_DetalleTarea.Find(id);
            db.Recurso_DetalleTarea.Remove(recurso_DetalleTarea);
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
