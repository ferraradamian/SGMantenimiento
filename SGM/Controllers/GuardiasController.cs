using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SGM.Models;

namespace SGM
{
    public class GuardiasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Guardias
        public ActionResult Index()
        {
            return View(db.Guardia.ToList());
        }

        // GET: Guardias/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guardia guardia = db.Guardia.Find(id);
            if (guardia == null)
            {
                return HttpNotFound();
            }
            return View(guardia);
        }

        // GET: Guardias/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Guardias/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "guardia_id,coodinador_id,fecha,horaInicio,horaFin")] Guardia guardia)
        {
            if (ModelState.IsValid)
            {
                db.Guardia.Add(guardia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(guardia);
        }

        // GET: Guardias/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guardia guardia = db.Guardia.Find(id);
            if (guardia == null)
            {
                return HttpNotFound();
            }
            return View(guardia);
        }

        // POST: Guardias/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "guardia_id,coodinador_id,fecha,horaInicio,horaFin")] Guardia guardia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(guardia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(guardia);
        }

        // GET: Guardias/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Guardia guardia = db.Guardia.Find(id);
            if (guardia == null)
            {
                return HttpNotFound();
            }
            return View(guardia);
        }

        // POST: Guardias/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Guardia guardia = db.Guardia.Find(id);
            db.Guardia.Remove(guardia);
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
