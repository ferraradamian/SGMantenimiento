using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SGM.Models;
using SGM.Models.ViewsModel;

namespace SGM.Controllers
{
    public class EquipoController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Equipo
        public ActionResult Index()
        {

            return View(db.Equipo.ToList());
        }

        // GET: Equipo/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipo equipo = db.Equipo.Find(id);
            if (equipo == null)
            {
                return HttpNotFound();
            }
            return View(equipo);
        }

        // GET: Equipo/Create
        public ActionResult Create()
        {
            EquipoViewModel oEquipoViewModel = new EquipoViewModel();

            oEquipoViewModel.SelectFallas = (from d in db.Falla
                                             orderby d.descripcion
                                             select new EquipoViewModel.SelectFalla
                                             {
                                                 falla_id = d.falla_id,
                                                 descripcion = d.descripcion,
                                                 causa = d.causa,
                                                 fecha = d.fecha,
                                                 estado = d.estado,
                                                 costo = d.costo,
                                                 esSelect = false
                                             }).ToList();
            return View(oEquipoViewModel);
        }

        // POST: Equipo/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(EquipoViewModel oEquipoViewModel)
        {
            if (ModelState.IsValid)
            {
                Equipo oEquipo = new Equipo();
                oEquipo.nombre = oEquipoViewModel.nombre;
                oEquipo.estadoActual = oEquipoViewModel.estadoActual;
                oEquipo.marca = oEquipoViewModel.marca;
                oEquipo.modelo = oEquipoViewModel.modelo;
                oEquipo.numeroSerie = oEquipoViewModel.numeroSerie;
                oEquipo.inicioOperacion = oEquipoViewModel.inicioOperacion;
                oEquipo.finOperacion = oEquipoViewModel.finOperacion;
                oEquipo.esCritico = oEquipoViewModel.esCritico;
                foreach (var item in oEquipoViewModel.SelectFallas.Where(d => d.esSelect == true))
                {
                    oEquipo.Falla.Add(db.Falla.Find(item.falla_id));
                }
                db.Equipo.Add(oEquipo);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(oEquipoViewModel);
        }

        // GET: Equipo/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipo equipo = db.Equipo.Find(id);
            if (equipo == null)
            {
                return HttpNotFound();
            }
            return View(equipo);
        }

        // POST: Equipo/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "equipo_id,nombre,estadoActual,marca,modelo,numeroSerie,inicioOperacion,finOperacion,esCritico")] Equipo equipo)
        {
            if (ModelState.IsValid)
            {
                db.Entry(equipo).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(equipo);
        }

        // GET: Equipo/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Equipo equipo = db.Equipo.Find(id);
            if (equipo == null)
            {
                return HttpNotFound();
            }
            return View(equipo);
        }

        // POST: Equipo/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Equipo equipo = db.Equipo.Find(id);
            db.Equipo.Remove(equipo);
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
