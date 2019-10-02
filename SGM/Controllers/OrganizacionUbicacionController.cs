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
    public class OrganizacionUbicacionController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: OrganizacionUbicacion
        public ActionResult Index()
        {
            var organizacionUbicacionSet = db.OrganizacionUbicacionSet.Include(o => o.OrganizacionEstructura).Include(o => o.OrganizacionUbicacion2);
            return View(organizacionUbicacionSet.ToList());
        }

        // GET: OrganizacionUbicacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizacionUbicacion organizacionUbicacion = db.OrganizacionUbicacionSet.Find(id);
            if (organizacionUbicacion == null)
            {
                return HttpNotFound();
            }
            return View(organizacionUbicacion);
        }

        // GET: OrganizacionUbicacion/Create
        public ActionResult Create()
        {
            ViewBag.OrganizacionEstructuraId = new SelectList(db.OrganizacionEstructuraSet, "Id", "nivel_nombre");
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre");
            return View();
        }

        // POST: OrganizacionUbicacion/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,nombre,descripcion,OrganizacionEstructuraId,OrganizacionUbicacionId")] OrganizacionUbicacion organizacionUbicacion)
        {
            if (ModelState.IsValid)
            {
                db.OrganizacionUbicacionSet.Add(organizacionUbicacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.OrganizacionEstructuraId = new SelectList(db.OrganizacionEstructuraSet, "Id", "nivel_nombre", organizacionUbicacion.OrganizacionEstructuraId);
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre", organizacionUbicacion.OrganizacionUbicacionId);
            return View(organizacionUbicacion);
        }

        // GET: OrganizacionUbicacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizacionUbicacion organizacionUbicacion = db.OrganizacionUbicacionSet.Find(id);
            if (organizacionUbicacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.OrganizacionEstructuraId = new SelectList(db.OrganizacionEstructuraSet, "Id", "nivel_nombre", organizacionUbicacion.OrganizacionEstructuraId);
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre", organizacionUbicacion.OrganizacionUbicacionId);
            return View(organizacionUbicacion);
        }

        // POST: OrganizacionUbicacion/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,nombre,descripcion,OrganizacionEstructuraId,OrganizacionUbicacionId")] OrganizacionUbicacion organizacionUbicacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(organizacionUbicacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.OrganizacionEstructuraId = new SelectList(db.OrganizacionEstructuraSet, "Id", "nivel_nombre", organizacionUbicacion.OrganizacionEstructuraId);
            ViewBag.OrganizacionUbicacionId = new SelectList(db.OrganizacionUbicacionSet, "Id", "nombre", organizacionUbicacion.OrganizacionUbicacionId);
            return View(organizacionUbicacion);
        }

        // GET: OrganizacionUbicacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrganizacionUbicacion organizacionUbicacion = db.OrganizacionUbicacionSet.Find(id);
            if (organizacionUbicacion == null)
            {
                return HttpNotFound();
            }
            return View(organizacionUbicacion);
        }

        // POST: OrganizacionUbicacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OrganizacionUbicacion organizacionUbicacion = db.OrganizacionUbicacionSet.Find(id);
            db.OrganizacionUbicacionSet.Remove(organizacionUbicacion);
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
