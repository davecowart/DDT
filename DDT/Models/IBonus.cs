using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DDT.Models {
	public interface IBonus {
		int BonusAmount { get; set; }
		int ExpirationKey { get; set; }
		int Id { get; set; }
		int CharacterId { get; set; }
		string Prefix { get; }
	}

	public partial class ACBonuse : IBonus {
		public string Prefix { get { return "ac"; } }
	}
	public partial class FortBonuse : IBonus {
		public string Prefix { get { return "fort"; } }
	}
	public partial class ReflexBonuse : IBonus {
		public string Prefix { get { return "ref"; } }
	}
	public partial class WillBonuse : IBonus {
		public string Prefix { get { return "will"; } }
	}

}
