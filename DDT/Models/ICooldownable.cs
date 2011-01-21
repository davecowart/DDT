using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDT.Models {
	public interface ICooldownable {
		Cooldowns CooldownEnum { get; set; }
	}

	public partial class Power : ICooldownable {
		public Cooldowns CooldownEnum {
			get { return (Cooldowns)Cooldown; }
			set { Cooldown = (int)value; }
		}
	}
}