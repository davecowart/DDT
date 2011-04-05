using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DDT.Models;
using System.Xml.Linq;

namespace DDT.Helpers {
	public class CharacterSheetParser {
		public Character Parse(XDocument saveFile) {
			var chr = new Character();
			var cs = saveFile.Root.Element("CharacterSheet");

			//Character Details
			var details = cs.Element("Details");
			chr.Name = details.Element("name").Value.Trim();
			chr.Level = int.Parse(details.Element("Level").Value.Trim());

			//Ability Scores
			var abilities = cs.Element("AbilityScores");
			chr.Strength = int.Parse(cs.Element("Strength").Attribute("score").Value);
			chr.Constitution = int.Parse(cs.Element("Constitution").Attribute("score").Value);
			chr.Dexterity = int.Parse(cs.Element("Dexterity").Attribute("score").Value);
			chr.Intellect = int.Parse(cs.Element("Intellect").Attribute("score").Value);
			chr.Wisdom = int.Parse(cs.Element("Wisdom").Attribute("score").Value);
			chr.Charisma = int.Parse(cs.Element("Charisma").Attribute("score").Value);

			//Defense Scores
			var stats = cs.Element("statBlock");
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