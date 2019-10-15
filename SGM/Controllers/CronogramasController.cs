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
    public class CronogramasController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Cronogramas
        public ActionResult Index()
        {
            var Cronograma = db.Cronograma.Include(c => c.Empleado).Include(c => c.Guardia);
            return View(Cronograma.ToList());
        }

        // GET: Cronogramas/Details/5
        public ActionResult Details(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cronograma cronograma = db.Cronograma.Find(id);
            if (cronograma == null)
            {
                return HttpNotFound();
            }
            return View(cronograma);
        }

        // GET: Cronogramas/Create
        public ActionResult Create()
        {
            ViewBag.Empleado_empleado_id = new SelectList(db.Empleado, "empleado_id", "nombre");
            ViewBag.Guardia_guardia_id = new SelectList(db.Guardia, "guardia_id", "nombre");
            return View();
        }

        // POST: Cronogramas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Guardia_guardia_id,Empleado_empleado_id,fecha_inicio,hora_inicio,fecha_fin,hora_fin,observaciones")] Cronograma cronograma)
        {
            if (ModelState.IsValid)
            {
                cronograma.Id = Guid.NewGuid();
                db.Cronograma.Add(cronograma);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Empleado_empleado_id = new SelectList(db.Empleado, "empleado_id", "nombre", cronograma.Empleado_empleado_id);
            ViewBag.Guardia_guardia_id = new SelectList(db.Guardia, "guardia_id", "nombre", cronograma.Guardia_guardia_id);
            return View(cronograma);
        }

        // GET: Cronogramas/Edit/5
        public ActionResult Edit(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cronograma cronograma = db.Cronograma.Find(id);
            if (cronograma == null)
            {
                return HttpNotFound();
            }
            ViewBag.Empleado_empleado_id = new SelectList(db.Empleado, "empleado_id", "nombre", cronograma.Empleado_empleado_id);
            ViewBag.Guardia_guardia_id = new SelectList(db.Guardia, "guardia_id", "nombre", cronograma.Guardia_guardia_id);
            return View(cronograma);
        }

        // POST: Cronogramas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Guardia_guardia_id,Empleado_empleado_id,fecha_inicio,hora_inicio,fecha_fin,hora_fin,observaciones")] Cronograma cronograma)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cronograma).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Empleado_empleado_id = new SelectList(db.Empleado, "empleado_id", "nombre", cronograma.Empleado_empleado_id);
            ViewBag.Guardia_guardia_id = new SelectList(db.Guardia, "guardia_id", "nombre", cronograma.Guardia_guardia_id);
            return View(cronograma);
        }

        // GET: Cronogramas/Delete/5
        public ActionResult Delete(Guid? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cronograma cronograma = db.Cronograma.Find(id);
            if (cronograma == null)
            {
                return HttpNotFound();
            }
            return View(cronograma);
        }

        // POST: Cronogramas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Cronograma cronograma = db.Cronograma.Find(id);
            db.Cronograma.Remove(cronograma);
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
