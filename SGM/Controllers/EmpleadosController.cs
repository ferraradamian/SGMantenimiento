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
    public class EmpleadosController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Empleados
        public ActionResult Index()
        {
            var empleado = db.Empleado.Include(e => e.Empresa).Include(e => e.Funcion);
            return View(empleado.ToList());
        }

        // GET: Empleados/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // GET: Empleados/Create
        public ActionResult Create()
        {
            ViewBag.empresa_id = new SelectList(db.Empresa, "empresa_id", "nombre");
            ViewBag.funcion_Id = new SelectList(db.Funcion, "funcion_id", "nombre");
            return View();
        }

        // POST: Empleados/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "empleado_id,empresa_id,nombre,apellido,legajo,funcion_Id,documento_tipo,documento_numero,cuil,grupo_sanguineo,factor_rh,telefono_fijo,tel_celular_1,tel_celular_2,tel_radio,radio,interno,email,foto,direccion,numero,pais,provincia,ciudad,codigo_postal")] Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                db.Empleado.Add(empleado);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.empresa_id = new SelectList(db.Empresa, "empresa_id", "nombre", empleado.empresa_id);
            ViewBag.funcion_Id = new SelectList(db.Funcion, "funcion_id", "nombre", empleado.funcion_Id);
            return View(empleado);
        }

        // GET: Empleados/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            ViewBag.empresa_id = new SelectList(db.Empresa, "empresa_id", "nombre", empleado.empresa_id);
            ViewBag.funcion_Id = new SelectList(db.Funcion, "funcion_id", "nombre", empleado.funcion_Id);
            return View(empleado);
        }

        // POST: Empleados/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "empleado_id,empresa_id,nombre,apellido,legajo,funcion_Id,documento_tipo,documento_numero,cuil,grupo_sanguineo,factor_rh,telefono_fijo,tel_celular_1,tel_celular_2,tel_radio,radio,interno,email,foto,direccion,numero,pais,provincia,ciudad,codigo_postal")] Empleado empleado)
        {
            if (ModelState.IsValid)
            {
                db.Entry(empleado).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.empresa_id = new SelectList(db.Empresa, "empresa_id", "nombre", empleado.empresa_id);
            ViewBag.funcion_Id = new SelectList(db.Funcion, "funcion_id", "nombre", empleado.funcion_Id);
            return View(empleado);
        }

        // GET: Empleados/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Empleado empleado = db.Empleado.Find(id);
            if (empleado == null)
            {
                return HttpNotFound();
            }
            return View(empleado);
        }

        // POST: Empleados/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Empleado empleado = db.Empleado.Find(id);
            db.Empleado.Remove(empleado);
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
