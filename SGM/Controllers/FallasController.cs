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
    public class FallasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Fallas
        public ActionResult Index()
        {
            var falla = db.Falla.Include(f => f.Sintomas);
            return View(falla.ToList());
        }

        // GET: Fallas/Details/5
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

        // GET: Fallas/Create
        public ActionResult Create()
        {
            ViewBag.SintomasId = new SelectList(db.Sintomas, "Id", "nombre");
            return View();
        }

        // POST: Fallas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SintomasId,Id,nombre")] Falla falla)
        {
            if (ModelState.IsValid)
            {
                db.Falla.Add(falla);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SintomasId = new SelectList(db.Sintomas, "Id", "nombre", falla.SintomasId);
            return View(falla);
        }

        // GET: Fallas/Edit/5
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
            ViewBag.SintomasId = new SelectList(db.Sintomas, "Id", "nombre", falla.SintomasId);
            return View(falla);
        }

        // POST: Fallas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SintomasId,Id,nombre")] Falla falla)
        {
            if (ModelState.IsValid)
            {
                db.Entry(falla).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.SintomasId = new SelectList(db.Sintomas, "Id", "nombre", falla.SintomasId);
            return View(falla);
        }

        // GET: Fallas/Delete/5
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

        // POST: Fallas/Delete/5
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
