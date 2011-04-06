using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDT.Models {
	public enum Cooldowns {
		AtWill = 1,
		Encounter = 2,
		Daily = 3
	}

	public enum ActionTypes {
		Free = 0,
		Move = 1,
		Minor = 2,
		Standard = 3
	}
}