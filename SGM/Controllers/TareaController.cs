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
    public class TareaController : Controller
    {
        private BDSGMEntities db = new BDSGMEntities();

        // GET: Tarea
        public ActionResult Index()
        {            
            return View(db.Tarea.ToList());
        }

        // GET: Detalle_Tarea/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea oTarea = db.Tarea.Find(id);
            if (oTarea == null)
            {
                return HttpNotFound();
            }
            return View(oTarea);
        }

        // GET: Detalle_Tarea/Create
        public ActionResult Create()
        {
            TareaViewModel oTareaViewModel = new TareaViewModel();

            oTareaViewModel.SelectEquipos = (from d in db.Equipo
                              orderby d.nombre
                              select new TareaViewModel.SelectEquipo
                              {
                                  equipo_id = d.equipo_id,
                                  nombre = d.nombre,
                                  estadoActual = d.estadoActual,
                                  marca = d.marca,
                                  numeroSerie = d.numeroSerie,
                                  inicioOperacion = d.inicioOperacion,
                                  finOperacion = d.finOperacion,
                                  esSelect = false
                              }).ToList();

            //ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion");
            return View(oTareaViewModel);
        }

        // POST: Detalle_Tarea/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TareaViewModel oTareaViewModel)
        {
            if (ModelState.IsValid)
            {
                Tarea oTarea = new Tarea();
                oTarea.nombre = oTareaViewModel.nombre;
                oTarea.descripcion = oTareaViewModel.descripcion;
                oTarea.cantidad = oTareaViewModel.cantidad;
                oTarea.costo = oTareaViewModel.costo;
                oTarea.duracion = oTareaViewModel.duracion;
                oTarea.estado = oTareaViewModel.estado;
                foreach(var item in oTareaViewModel.SelectEquipos.Where(d => d.esSelect == true))
                {
                    oTarea.Equipo.Add(db.Equipo.Find(item.equipo_id));                  
                }
                db.Tarea.Add(oTarea);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            //ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", detalle_Tarea.tarea_id);
            return View(oTareaViewModel);
        }

        // GET: Detalle_Tarea/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea detalle_Tarea = db.Tarea.Find(id);
            if (detalle_Tarea == null)
            {
                return HttpNotFound();
            }
            ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", detalle_Tarea.tarea_id);
            return View(detalle_Tarea);
        }

        // POST: Detalle_Tarea/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "detalleTarea_id,tarea_id,nombre,descripcion,cantidad,costo,duracion,estado")]Tarea Tarea)
        {
            if (ModelState.IsValid)
            {
                db.Entry(Tarea).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.tarea_id = new SelectList(db.Tarea, "tarea_id", "descripcion", Tarea.tarea_id);
            return View(Tarea);
        }

        // GET: Detalle_Tarea/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tarea detalle_Tarea = db.Tarea.Find(id);
            if (detalle_Tarea == null)
            {
                return HttpNotFound();
            }
            return View(detalle_Tarea);
        }

        // POST: Detalle_Tarea/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tarea detalle_Tarea = db.Tarea.Find(id);
            db.Tarea.Remove(detalle_Tarea);
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
