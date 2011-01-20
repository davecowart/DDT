using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DDT.Models {
	public interface IBonus : IExpirable {
		int BonusAmount { get; set; }
		int ExpirationKey { get; set; }
		int Id { get; set; }
		int CharacterId { get; set; }
		string Prefix { get; }
	}

	public partial class ACBonuse : IBonus {
		public ExpirationKeys ExpirationKeyEnum {
			get { return (ExpirationKeys)ExpirationKey; }
			set { ExpirationKey = (int)value; }
		}
		public string Prefix { get { return "ac"; } }
	}
	public partial class FortBonuse : IBonus {
		public ExpirationKeys ExpirationKeyEnum {
			get { return (ExpirationKeys)ExpirationKey; }
			set { ExpirationKey = (int)value; }
		}
		public string Prefix { get { return "fort"; } }
	}
	public partial class ReflexBonuse : IBonus {
		public ExpirationKeys ExpirationKeyEnum {
			get { return (ExpirationKeys)ExpirationKey; }
			set { ExpirationKey = (int)value; }
		}
		public string Prefix { get { return "ref"; } }
	}
	public partial class WillBonuse : IBonus {
		public ExpirationKeys ExpirationKeyEnum {
			get { return (ExpirationKeys)ExpirationKey; }
			set { ExpirationKey = (int)value; }
		}
		public string Prefix { get { return "will"; } }
	}

}
