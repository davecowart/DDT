using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DDT.Models;
using DDT.Models.ViewModels;
using DDT.Helpers;

namespace DDT.Controllers {
	public class EncounterController : Controller {
		DDTDataContext _db = new DDTDataContext();

		public ActionResult Status() {
			var characters = _db.Characters.ToList();
			return View(characters);
		}

		public ActionResult IsBloodied(int id) {
			var character = _db.Characters.SingleOrDefault(c => c.Id == id);
			if (character == null) return Json(new { isBloodied = false }, JsonRequestBehavior.AllowGet);
			return Json(new { isBloodied = character.IsBloodied() }, JsonRequestBehavior.AllowGet);
		}
	}
}
