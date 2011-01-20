using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDT.Models {
	public interface IExpirable {
		ExpirationKeys ExpirationKeyEnum { get; set; }
	}

	public partial class Effect : IExpirable {
		public ExpirationKeys ExpirationKeyEnum {
			get { return (ExpirationKeys)ExpirationKey; }
			set { ExpirationKey = (int)value; }
		}
	}
}