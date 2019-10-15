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
    public class FuncionesController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Funciones
        public ActionResult Index()
        {
            var funcionSet = db.Funcion.Include(f => f.Especialidad);
            return View(funcionSet.ToList());
        }

        // GET: Funciones/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Funcion funcion = db.Funcion.Find(id);
            if (funcion == null)
            {
                return HttpNotFound();
            }
            return View(funcion);
        }

        // GET: Funciones/Create
        public ActionResult Create()
        {
            ViewBag.EspecialidadId = new SelectList(db.Especialidad, "especialidad_id", "nombre");
            return View();
        }

        // POST: Funciones/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "funcion_id,nombre,descripcion,EspecialidadId")] Funcion funcion)
        {
            if (ModelState.IsValid)
            {
                db.Funcion.Add(funcion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EspecialidadId = new SelectList(db.Especialidad, "especialidad_id", "nombre", funcion.EspecialidadId);
            return View(funcion);
        }

        // GET: Funciones/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Funcion funcion = db.Funcion.Find(id);
            if (funcion == null)
            {
                return HttpNotFound();
            }
            ViewBag.EspecialidadId = new SelectList(db.Especialidad, "especialidad_id", "nombre", funcion.EspecialidadId);
            return View(funcion);
        }

        // POST: Funciones/Edit/5
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
            ViewBag.EspecialidadId = new SelectList(db.Especialidad, "especialidad_id", "nombre", funcion.EspecialidadId);
            return View(funcion);
        }

        // GET: Funciones/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Funcion funcion = db.Funcion.Find(id);
            if (funcion == null)
            {
                return HttpNotFound();
            }
            return View(funcion);
        }

        // POST: Funciones/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Funcion funcion = db.Funcion.Find(id);
            db.Funcion.Remove(funcion);
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
