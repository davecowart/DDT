using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DDT.Models;

namespace DDT.Helpers {
	public static class ExtensionMethods {
		public static bool IsBloodied(this Character character) {
			return character.HPCurrent <= character.BloodiedValue();
		}

		public static int BloodiedValue(this Character character) {
			return Convert.ToInt32(Math.Round(character.HPMax / 2.0d));
		}

		public static int SurgeValue(this Character character) {
			return Convert.ToInt32(Math.Round(character.HPMax / 4.0d));
		}
	}
}