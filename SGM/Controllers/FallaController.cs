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
    public class FallaController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Falla
        public ActionResult Index()
        {
            return View(db.Falla.ToList());
        }

        // GET: Falla/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Falla falla = db.Falla.Find(id);
            if (falla == null)
            {
                return HttpNotFound();
            }
            return View(falla);
        }

        // GET: Falla/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Falla/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "falla_id,descripcion,causa,fecha,estado,costo")] Falla falla)
        {
            if (ModelState.IsValid)
            {
                db.Falla.Add(falla);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(falla);
        }

        // GET: Falla/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Falla falla = db.Falla.Find(id);
            if (falla == null)
            {
                return HttpNotFound();
            }
            return View(falla);
        }

        // POST: Falla/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "falla_id,descripcion,causa,fecha,estado,costo")] Falla falla)
        {
            if (ModelState.IsValid)
            {
                db.Entry(falla).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(falla);
        }

        // GET: Falla/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Falla falla = db.Falla.Find(id);
            if (falla == null)
            {
                return HttpNotFound();
            }
            return View(falla);
        }

        // POST: Falla/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Falla falla = db.Falla.Find(id);
            db.Falla.Remove(falla);
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
