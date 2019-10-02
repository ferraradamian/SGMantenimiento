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
    public class FuncionController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Funcion
        public ActionResult Index()
        {
            var funcionSet = db.FuncionSet.Include(f => f.Especialidad);
            return View(funcionSet.ToList());
        }

        // GET: Funcion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Funcion funcion = db.FuncionSet.Find(id);
            if (funcion == null)
            {
                return HttpNotFound();
            }
            return View(funcion);
        }

        // GET: Funcion/Create
        public ActionResult Create()
        {
            ViewBag.EspecialidadId = new SelectList(db.EspecialidadSet, "especialidad_id", "nombre");
            return View();
        }

        // POST: Funcion/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "funcion_id,nombre,descripcion,EspecialidadId")] Funcion funcion)
        {
            if (ModelState.IsValid)
            {
                db.FuncionSet.Add(funcion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EspecialidadId = new SelectList(db.EspecialidadSet, "especialidad_id", "nombre", funcion.EspecialidadId);
            return View(funcion);
        }

        // GET: Funcion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Funcion funcion = db.FuncionSet.Find(id);
            if (funcion == null)
            {
                return HttpNotFound();
            }
            ViewBag.EspecialidadId = new SelectList(db.EspecialidadSet, "especialidad_id", "nombre", funcion.EspecialidadId);
            return View(funcion);
        }

        // POST: Funcion/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "funcion_id,nombre,descripcion,EspecialidadId")] Funcion funcion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(funcion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EspecialidadId = new SelectList(db.EspecialidadSet, "especialidad_id", "nombre", funcion.EspecialidadId);
            return View(funcion);
        }

        // GET: Funcion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Funcion funcion = db.FuncionSet.Find(id);
            if (funcion == null)
            {
                return HttpNotFound();
            }
            return View(funcion);
        }

        // POST: Funcion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Funcion funcion = db.FuncionSet.Find(id);
            db.FuncionSet.Remove(funcion);
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
