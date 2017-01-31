using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using v3.Models;
using v3.Utilities;

namespace v3.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Mortalidad()
        {

            List<MortalidadEntidad> listMort = new List<MortalidadEntidad>();

            listMort = function.DatosMortalidad("1", "1"); // asumiendo una busqueda completa de datos ya que no estan los filtros
            return View(listMort);
        }

        public ActionResult Natalidad()
        {

            List<NatalidadEntidad> listNat = new List<NatalidadEntidad>();

            listNat = function.DatosNatalidad("1", "1"); // asumiendo una busqueda completa de datos ya que no estan los filtros
            return View(listNat);
        }
    }
}