namespace DDT.Models {
	public partial class Power {
		public ActionTypes ActionTypeEnum {
			get { return (ActionTypes)ActionType; }
			set { ActionType = (int)value; }
		}
	}
}