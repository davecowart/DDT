using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DDT.Models;
using System.Xml.Linq;

namespace DDT.Helpers {
	public static class CharacterSheetParser {
		public static Character Parse(XDocument saveFile) {
			return Parse(saveFile, new Character());
		}

		public static Character Parse(XDocument saveFile, Character chr) {
			var cs = saveFile.Root.Element("CharacterSheet");

			//Character Details
			var details = cs.Element("Details");
			chr.Name = details.Element("name").Value.Trim();
			chr.Level = int.Parse(details.Element("Level").Value.Trim());

			//Ability Scores
			var stats = cs.Element("StatBlock");
			chr.Strength = stats.GetStatValue("Strength");
			chr.Constitution = stats.GetStatValue("Constitution");
			chr.Dexterity = stats.GetStatValue("Dexterity");
			chr.Intellect = stats.GetStatValue("Intelligence");
			chr.Wisdom = stats.GetStatValue("Wisdom");
			chr.Charisma = stats.GetStatValue("Charisma");

			//Defense Scores
			chr.AC = stats.GetStatValue("AC");
			chr.Fortitude = stats.GetStatValue("Fortitude");
			chr.Reflex = stats.GetStatValue("Reflex");
			chr.Will = stats.GetStatValue("Will");

			//Health
			chr.HPMax = stats.GetStatValue("Hit Points");
			chr.SurgesDaily = stats.GetStatValue("Healing Surges");
			chr.ActionPoints = stats.GetStatValue("_BaseActionPoints");
			

			//Skill Scores
			chr.Acrobatics = stats.GetStatValue("Acrobatics");
			chr.Arcana = stats.GetStatValue("Arcana");
			chr.Athletics = stats.GetStatValue("Athletics");
			chr.Bluff = stats.GetStatValue("Bluff");
			chr.Diplomacy = stats.GetStatValue("Diplomacy");
			chr.Dungeoneering = stats.GetStatValue("Dungeoneering");
			chr.Endurance = stats.GetStatValue("Endurance");
			chr.Heal = stats.GetStatValue("Heal");
			chr.History = stats.GetStatValue("History");
			chr.Insight = stats.GetStatValue("Insight");
			chr.Intimidate = stats.GetStatValue("Intimidate");
			chr.Nature = stats.GetStatValue("Nature");
			chr.Perception = stats.GetStatValue("Perception");
			chr.Religion = stats.GetStatValue("Religion");
			chr.Stealth = stats.GetStatValue("Stealth");
			chr.Streetwise = stats.GetStatValue("Streetwise");
			chr.Thievery = stats.GetStatValue("Thievery");

			return chr;
		}
	}

	public static class CharacterSheetExtensions {
		public static int GetStatValue(this XElement statBlock, string alias) {
			return int.Parse(statBlock.Elements("Stat").First(s => s.Elements("alias").Any(a => a.Attribute("name").Value == alias)).Attribute("value").Value.Trim());
		}
	}
}