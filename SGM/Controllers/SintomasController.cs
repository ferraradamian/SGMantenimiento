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
    public class SintomasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Sintomas
        public ActionResult Index()
        {
            return View(db.Sintomas.ToList());
        }

        // GET: Sintomas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sintomas sintomas = db.Sintomas.Find(id);
            if (sintomas == null)
            {
                return HttpNotFound();
            }
            return View(sintomas);
        }

        // GET: Sintomas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Sintomas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,nombre")] Sintomas sintomas)
        {
            if (ModelState.IsValid)
            {
                db.Sintomas.Add(sintomas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(sintomas);
        }

        // GET: Sintomas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sintomas sintomas = db.Sintomas.Find(id);
            if (sintomas == null)
            {
                return HttpNotFound();
            }
            return View(sintomas);
        }

        // POST: Sintomas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,nombre")] Sintomas sintomas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sintomas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(sintomas);
        }

        // GET: Sintomas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Sintomas sintomas = db.Sintomas.Find(id);
            if (sintomas == null)
            {
                return HttpNotFound();
            }
            return View(sintomas);
        }

        // POST: Sintomas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Sintomas sintomas = db.Sintomas.Find(id);
            db.Sintomas.Remove(sintomas);
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
