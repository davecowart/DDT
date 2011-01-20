using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DDT.Models;
using DDT.Models.ViewModels;

namespace DDT.Controllers {
	public class CharacterController : Controller {

		DDTDataContext _db = new DDTDataContext();

		public ActionResult Index() {
			var characters = _db.Characters.ToList();
			return View(characters);
		}

		public ActionResult Details(int id) {
			var character = _db.Characters.SingleOrDefault(c => c.Id == id);
			if (character == null)
				return RedirectToRoute("CharacterNotFound");
			var charVM = new CharacterViewModel(character);
			return View(charVM);
		}

	}
}
