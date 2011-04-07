using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DDT.Models;
using System.Xml.Linq;

namespace DDT.Helpers {
	public static class CharacterSheetParser {
		public static Character Parse(XDocument saveFile) {
			var character = new Character();
			Parse(saveFile, character);
			return character;
		}

		public static void Parse(XDocument saveFile, Character chr) {
			var cs = saveFile.Root.Element("CharacterSheet");

			//Character Details
			var details = cs.Element("Details");
			chr.Name = details.Element("name").Value.Trim();
			chr.Level = int.Parse(details.Element("Level").Value.Trim());

			var levelRule = saveFile.Root.Element("Level").Element("RulesElement");
			chr.Race = levelRule.Elements("RulesElement").First(re => re.Attribute("type").Value == "Race").Attribute("name").Value;
			chr.Class = levelRule.Elements("RulesElement").First(re => re.Attribute("type").Value == "Class").Attribute("name").Value;

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

			//Powers
			var powers = cs.Element("PowerStats").Elements("Power").Select(p => ParsePower(p));
			var existingPowers = chr.Powers.ToList();
			var updatedPowers = powers.Where(p => existingPowers.Any(ep => ep.Name == p.Name));
			var newPowers = powers.Where(p => !existingPowers.Any(ep => ep.Name == p.Name));
			var removedPowers = existingPowers.Where(ep => !powers.Any(p => p.Name == ep.Name));
			foreach (var updatedPower in updatedPowers) {
				var power = chr.Powers.Single(p => p.Name == updatedPower.Name);
				power.Cooldown = updatedPower.Cooldown;
				power.ActionType = updatedPower.ActionType;
				power.Attack = updatedPower.Attack;
				power.Damage = updatedPower.Damage;
			}
			chr.Powers.AddRange(newPowers);
			foreach (var removedPower in removedPowers)
				chr.Powers.Remove(removedPower);
		}

		private static Power ParsePower(XElement powerElement) {
			var power = new Power();
			power.Name = powerElement.Attribute("name").Value;
			power.CooldownEnum = ParseCooldown(powerElement.Elements("specific").First(s => s.Attribute("name").Value == "Power Usage").Value);
			power.ActionTypeEnum = ParseActionType(powerElement.Elements("specific").First(s => s.Attribute("name").Value == "Action Type").Value);
			if (powerElement.Elements("Weapon").Any()) {
				power.Attack = String.Format("{0} vs. {1}", powerElement.Element("Weapon").Element("AttackBonus").Value.Trim(), powerElement.Element("Weapon").Element("Defense").Value.Trim());
				power.Damage = powerElement.Element("Weapon").Element("Damage").Value.Trim();
			}
			power.Available = true;
			return power;
		}

		private static Cooldowns ParseCooldown(string cooldown) {
			switch (cooldown.Trim()) {
				case "Encounter":
					return Cooldowns.Encounter;
				case "Encounter (Special)":
					return Cooldowns.Encounter;
				case "At-Will":
					return Cooldowns.AtWill;
				case "Daily":
					return Cooldowns.Daily;
				default:
					return Cooldowns.AtWill;
			}
		}

		private static ActionTypes ParseActionType(string actionType) {
			switch (actionType.Trim()) {
				case "Move Action":
					return ActionTypes.Move;
				case "Minor Action":
					return ActionTypes.Minor;
				case "Standard action":
					return ActionTypes.Standard;
				case "Free Action":
					return ActionTypes.Free;
				default:
					return ActionTypes.Standard;
			}
		}
	}

	public static class CharacterSheetExtensions {
		public static int GetStatValue(this XElement statBlock, string alias) {
			return int.Parse(statBlock.Elements("Stat").First(s => s.Elements("alias").Any(a => a.Attribute("name").Value == alias)).Attribute("value").Value.Trim());
		}
	}
}