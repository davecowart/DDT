using System;
using System.Linq;
using System.Web.Mvc;

namespace DDT.Helpers {
	public static class EnumHelper {
		public static SelectList ToSelectList<T>(this T value) {
			var v = Enum.GetValues(typeof(T)).Cast<T>().Select(e => new { ID = Convert.ToInt32(e), Name = e.ToString() });
			return new SelectList(v, "Id", "Name", value);
		}
	}
}