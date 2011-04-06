using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DDT.Models;
using DDT.Models.ViewModels;
using System.Xml.Linq;
using System.IO;
using DDT.Helpers;
using System.Text;

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

		[HttpPost]
		public JsonResult Upload(int id) {
			var querystring = Request.QueryString["qqfile"];
			var dotIndex = querystring.LastIndexOf('.');
			var uploadFilename = querystring.Substring(0, dotIndex);
			var uploadExtension = querystring.Substring(dotIndex);
			bool isCharacterFile = uploadExtension == ".dnd4e";

			const int length = 4096;
			int bytesRead = 0;
			var buffer = new Byte[length];
			MemoryStream xmlStream = new MemoryStream();

			try {
				//this works in Chrome/FF/Safari
				try {
					do {
						bytesRead = Request.InputStream.Read(buffer, 0, length);
						xmlStream.Write(buffer, 0, bytesRead);
					} while (bytesRead > 0);
				} catch (Exception ex) {
					return Json(new { error = ex.Message });
				}
			} catch {
				try {
					do {
						bytesRead = Request.Files[0].InputStream.Read(buffer, 0, length);
						xmlStream.Write(buffer, 0, bytesRead);
					} while (bytesRead > 0);
				} catch (Exception ex) {
					return Json(new { error = ex.Message });
				}
			}

			var xmlBytes = xmlStream.ToArray();
			var disallowedCharacters = new byte[] { 0x27, 0x28, 0x29 };
			xmlStream.Dispose();

			for (int i = 0; i < xmlBytes.Length; i++) {
				if (disallowedCharacters.Contains(xmlBytes[i])) {
					xmlBytes[i] = 0x5F;
				}
			}

			var characterString = Encoding.UTF8.GetString(xmlBytes);
			if (characterString.StartsWith(Encoding.UTF8.GetString(Encoding.UTF8.GetPreamble())))
				characterString = characterString.Remove(0, Encoding.UTF8.GetString(Encoding.UTF8.GetPreamble()).Length);
			characterString = RemoveComments(characterString);
			var campaignStart = characterString.IndexOf("<D20CampaignSetting");
			var campaignEnd = characterString.IndexOf("</D20CampaignSetting>") + "</D20CampaignSetting>".Length;
			characterString = characterString.Remove(campaignStart, campaignEnd - campaignStart);
			var characterSheet = XDocument.Parse(characterString);

			var character = _db.Characters.SingleOrDefault(c => c.Id == id);
			if (character == null) return Json(new { error = "Character not found" });
			var updatedCharacter = CharacterSheetParser.Parse(characterSheet, character);
			_db.SubmitChanges();

			return Json(new { success = true });
		}

		private string RemoveComments(string characterString) {
			while (characterString.Contains("<!--")) {
				var start = characterString.IndexOf("<!--");
				var length = characterString.IndexOf("-->") - start + 3;
				characterString = characterString.Remove(start, length);
			}
			return characterString;
		}

		public ActionResult Details(int id) {
			var character = _db.Characters.SingleOrDefault(c => c.Id == id);
			if (character == null) return RedirectToRoute("CharacterNotFound");
			var charVM = new CharacterViewModel(character);
			return View(charVM);
		}

		[HttpPost]
		public ActionResult EndEncounter(int id) {
			var character = _db.Characters.SingleOrDefault(c => c.Id == id);
			if (character == null) return RedirectToRoute("CharacterNotFound");
			_db.ACBonuses.DeleteAllOnSubmit(character.ACBonuses);
			_db.FortBonuses.DeleteAllOnSubmit(character.FortBonuses);
			_db.ReflexBonuses.DeleteAllOnSubmit(character.ReflexBonuses);
			_db.WillBonuses.DeleteAllOnSubmit(character.WillBonuses);
			_db.Effects.DeleteAllOnSubmit(character.Effects);
			character.HPTemp = 0;

			character.Powers.Where(p => p.CooldownEnum != Cooldowns.Daily).ToList().ForEach(p => p.Available = true);
			_db.SubmitChanges();

			return RedirectToAction("Details", new { id = id });
		}

		[HttpPost]
		public ActionResult EndDay(int id) {
			var character = _db.Characters.SingleOrDefault(c => c.Id == id);
			if (character == null) return RedirectToRoute("CharacterNotFound");
			_db.ACBonuses.DeleteAllOnSubmit(character.ACBonuses);
			_db.FortBonuses.DeleteAllOnSubmit(character.FortBonuses);
			_db.ReflexBonuses.DeleteAllOnSubmit(character.ReflexBonuses);
			_db.WillBonuses.DeleteAllOnSubmit(character.WillBonuses);
			_db.Effects.DeleteAllOnSubmit(character.Effects);
			character.HPTemp = 0;
			character.SurgesUsed = 0;
			character.ActionPoints = 1;
			character.HPCurrent = character.HPMax;

			character.Powers.ToList().ForEach(p => p.Available = true);
			_db.SubmitChanges();

			return RedirectToAction("Details", new { id = id });
		}

		#region Powers

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

		[HttpPost]
		public ActionResult TogglePowerAvailability(int characterId, int powerId) {
			try {
				var power = _db.Powers.FirstOrDefault(p => p.Id == powerId);
				if (power == null) return Json(new { available = false });
				power.Available = !power.Available;
				_db.SubmitChanges();
				return Json(new { available = power.Available });
			} catch {
				return Json(new { available = false });
			}
		}

		#endregion

		#region Effects

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

		#endregion

		#region Defensive Bonuses

		public ViewResult BlankACBonusRow() {
			return View("BonusEditorRow", new ACBonuse());
		}

		[HttpPost]
		public ActionResult AddACBonus(int characterId, IEnumerable<ACBonuse> bonuses) {
			try {
				var bonus = bonuses.First();
				bonus.CharacterId = characterId;
				_db.ACBonuses.InsertOnSubmit(bonus);
				_db.SubmitChanges();
				return View("Bonus", bonus);
			} catch {
				return Json("Error");
			}
		}

		public ViewResult BlankFortBonusRow() {
			return View("BonusEditorRow", new FortBonuse());
		}

		[HttpPost]
		public ActionResult AddFortBonus(int characterId, IEnumerable<FortBonuse> bonuses) {
			try {
				var bonus = bonuses.First();
				bonus.CharacterId = characterId;
				_db.FortBonuses.InsertOnSubmit(bonus);
				_db.SubmitChanges();
				return View("Bonus", bonus);
			} catch {
				return Json("Error");
			}
		}

		public ViewResult BlankRefBonusRow() {
			return View("BonusEditorRow", new ReflexBonuse());
		}

		[HttpPost]
		public ActionResult AddRefBonus(int characterId, IEnumerable<ReflexBonuse> bonuses) {
			try {
				var bonus = bonuses.First();
				bonus.CharacterId = characterId;
				_db.ReflexBonuses.InsertOnSubmit(bonus);
				_db.SubmitChanges();
				return View("Bonus", bonus);
			} catch {
				return Json("Error");
			}
		}

		public ViewResult BlankWillBonusRow() {
			return View("BonusEditorRow", new WillBonuse());
		}

		[HttpPost]
		public ActionResult AddWillBonus(int characterId, IEnumerable<WillBonuse> bonuses) {
			try {
				var bonus = bonuses.First();
				bonus.CharacterId = characterId;
				_db.WillBonuses.InsertOnSubmit(bonus);
				_db.SubmitChanges();
				return View("Bonus", bonus);
			} catch {
				return Json("Error");
			}
		}

		[HttpDelete]
		public ActionResult RemoveBonus(int id, int characterId, string bonusType) {
			try {
				IBonus bonus = null;
				switch (bonusType) {
					case "ac":
						bonus = _db.ACBonuses.SingleOrDefault(b => b.Id == id);
						DeleteBonus(bonus as ACBonuse);
						break;
					case "fort":
						bonus = _db.FortBonuses.SingleOrDefault(b => b.Id == id);
						DeleteBonus(bonus as FortBonuse);
						break;
					case "ref":
						bonus = _db.ReflexBonuses.SingleOrDefault(b => b.Id == id);
						DeleteBonus(bonus as ReflexBonuse);
						break;
					case "will":
						bonus = _db.WillBonuses.SingleOrDefault(b => b.Id == id);
						DeleteBonus(bonus as WillBonuse);
						break;
				}
				if (bonus == null)
					return Json("Error");
				return Json(new { success = true });
			} catch {
				return Json("Error");
			}
		}

		private void DeleteBonus(ACBonuse bonus) {
			_db.ACBonuses.DeleteOnSubmit(bonus);
			_db.SubmitChanges();
		}

		private void DeleteBonus(FortBonuse bonus) {
			_db.FortBonuses.DeleteOnSubmit(bonus);
			_db.SubmitChanges();
		}

		private void DeleteBonus(ReflexBonuse bonus) {
			_db.ReflexBonuses.DeleteOnSubmit(bonus);
			_db.SubmitChanges();
		}

		private void DeleteBonus(WillBonuse bonus) {
			_db.WillBonuses.DeleteOnSubmit(bonus);
			_db.SubmitChanges();
		}

		#endregion

		#region AjaxFields

		[HttpPost]
		public ActionResult SetCurrentHP(int characterId, int hp) {
			try {
				var character = _db.Characters.SingleOrDefault(c => c.Id == characterId);
				if (character == null)
					return Json("Error");
				var normalizedHP = Math.Min(character.HPMax, hp);
				character.HPCurrent = normalizedHP;
				_db.SubmitChanges();
				return Json(new { hp = normalizedHP });
			} catch {
				return Json("Error");
			}
		}

		[HttpPost]
		public ActionResult SetTempHP(int characterId, int hp) {
			try {
				var character = _db.Characters.SingleOrDefault(c => c.Id == characterId);
				if (character == null)
					return Json("Error");
				character.HPTemp = hp;
				_db.SubmitChanges();
				return Json(new { hp = hp });
			} catch {
				return Json("Error");
			}
		}

		[HttpPost]
		public ActionResult SetSurgesUsed(int characterId, int surges) {
			try {
				var character = _db.Characters.SingleOrDefault(c => c.Id == characterId);
				if (character == null)
					return Json("Error");
				character.SurgesUsed = surges;
				_db.SubmitChanges();
				return Json(new { surges = surges });
			} catch {
				return Json("Error");
			}
		}

		[HttpPost]
		public ActionResult SetActionPoints(int characterId, int actionPoints) {
			try {
				var character = _db.Characters.SingleOrDefault(c => c.Id == characterId);
				if (character == null)
					return Json("Error");
				character.ActionPoints = actionPoints;
				_db.SubmitChanges();
				return Json(new { actionPoints = actionPoints });
			} catch {
				return Json("Error");
			}
		}

		#endregion

	}
}
