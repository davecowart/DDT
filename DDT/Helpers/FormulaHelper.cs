using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DDT.Models;
using System.Web.Mvc;

namespace DDT.Helpers {
	public static class FormulaHelper {
		public static int AbilityModifier(this HtmlHelper html, int abilityScore) {
			return CalculateModifier(abilityScore);
		}
		public static int AbilityModifierPlusHalf(this HtmlHelper html, int abilityScore, int level) {
			return CalculateModifier(abilityScore) + Convert.ToInt32(Math.Floor(level / 2.0d));
		}
		private static int CalculateModifier(int abilityScore) {
			return Convert.ToInt32(Math.Floor((abilityScore - 10) / 2.0d));
		}
	}
}