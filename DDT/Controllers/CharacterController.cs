﻿using System;
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

		public ActionResult Create() {
			return View();
		}

		[HttpPost]
		public ActionResult Create(Character character) {
			_db.Characters.InsertOnSubmit(character);
			_db.SubmitChanges();
			return RedirectToAction("Details", new { id = character.Id });
		}

		public ActionResult Details(int id) {
			var character = _db.Characters.SingleOrDefault(c => c.Id == id);
			if (character == null)
				return RedirectToRoute("CharacterNotFound");
			var charVM = new CharacterViewModel(character);
			return View(charVM);
		}

		public ViewResult BlankPowerRow() {
			return View("PowerEditorRow", new Power());
		}

		[HttpPost]
		public ActionResult AddPower(int characterId, IEnumerable<Power> powers) {
			try {
				var power = powers.First();
				power.CharacterId = characterId;
				_db.Powers.InsertOnSubmit(power);
				_db.SubmitChanges();
				return View("Power", power);
			} catch {
				return Json("Error");
			}
		}

		public ViewResult BlankEffectRow() {
			return View("EffectEditorRow", new Effect());
		}

		[HttpPost]
		public ActionResult AddEffect(int characterId, IEnumerable<Effect> effects) {
			try {
				var effect = effects.First();
				effect.CharacterId = characterId;
				_db.Effects.InsertOnSubmit(effect);
				_db.SubmitChanges();
				return View("Effect", effect);
			} catch {
				return Json("Error");
			}
		}

		[HttpDelete]
		public ActionResult RemoveEffect(int id, int characterId) {
			try {
				var effect = _db.Effects.SingleOrDefault(e => e.Id == id);
				if (effect == null)
					return Json("Error");
				_db.Effects.DeleteOnSubmit(effect);
				_db.SubmitChanges();
				return Json(new { success = true });
			} catch {
				return Json("Error");
			}
		}


	}
}
