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
    public class OrganizacionEstructuraController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: OrganizacionEstructura
        public ActionResult Index()
        {
            return View(db.OrganizacionEstructuraSet.ToList());
        }

        // GET: OrganizacionEstructura/Details/5
        public ActionResult Details(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizacionEstructura organizacionEstructura = db.OrganizacionEstructuraSet.Find(id);
            if (organizacionEstructura == null)
            {
                return HttpNotFound();
            }
            return View(organizacionEstructura);
        }

        // GET: OrganizacionEstructura/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: OrganizacionEstructura/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,nivel,nivel_nombre")] OrganizacionEstructura organizacionEstructura)
        {
            if (ModelState.IsValid)
            {
                db.OrganizacionEstructuraSet.Add(organizacionEstructura);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(organizacionEstructura);
        }

        // GET: OrganizacionEstructura/Edit/5
        public ActionResult Edit(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizacionEstructura organizacionEstructura = db.OrganizacionEstructuraSet.Find(id);
            if (organizacionEstructura == null)
            {
                return HttpNotFound();
            }
            return View(organizacionEstructura);
        }

        // POST: OrganizacionEstructura/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,nivel,nivel_nombre")] OrganizacionEstructura organizacionEstructura)
        {
            if (ModelState.IsValid)
            {
                db.Entry(organizacionEstructura).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(organizacionEstructura);
        }

        // GET: OrganizacionEstructura/Delete/5
        public ActionResult Delete(byte? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizacionEstructura organizacionEstructura = db.OrganizacionEstructuraSet.Find(id);
            if (organizacionEstructura == null)
            {
                return HttpNotFound();
            }
            return View(organizacionEstructura);
        }

        // POST: OrganizacionEstructura/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(byte id)
        {
            OrganizacionEstructura organizacionEstructura = db.OrganizacionEstructuraSet.Find(id);
            db.OrganizacionEstructuraSet.Remove(organizacionEstructura);
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
