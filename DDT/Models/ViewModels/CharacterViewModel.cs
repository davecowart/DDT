using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DDT.Models.ViewModels {
	public class CharacterViewModel {

		public CharacterViewModel(Character character) {
			Character = character;
			ACBonuses = character.ACBonuses.ToList();
			FortBonuses = character.FortBonuses.ToList();
			ReflexBonuses = character.ReflexBonuses.ToList();
			WillBonuses = character.WillBonuses.ToList();
			Effects = character.Effects.ToList();
			Powers = character.Powers.ToList();
		}

		public Character Character { get; set; }
		public IEnumerable<ACBonuse> ACBonuses { get; set; }
		public IEnumerable<FortBonuse> FortBonuses { get; set; }
		public IEnumerable<ReflexBonuse> ReflexBonuses { get; set; }
		public IEnumerable<WillBonuse> WillBonuses { get; set; }
		public IEnumerable<Effect> Effects { get; set; }
		public IEnumerable<Power> Powers { get; set; }

		int? _bloodied;
		public int Bloodied {
			get {
				if (!_bloodied.HasValue)
					_bloodied = Convert.ToInt32(Math.Round(Character.HPMax / 2.0d));
				return _bloodied.Value;
			}
		}
		int? _surgeValue;
		public int SurgeValue {
			get {
				if (!_surgeValue.HasValue)
					_surgeValue = Convert.ToInt32(Math.Round(Character.HPMax / 4.0d));
				return _surgeValue.Value;
			}
		}
	}
}