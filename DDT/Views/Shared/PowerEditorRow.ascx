<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DDT.Models.Power>" %>
<%@ Import Namespace="DDT.Helpers" %>

<tr id="powerFormContainer">
	<% using (Html.BeginCollectionItem("powers")) { %>
	<%: Html.ValidationSummary(true) %>
		<td>
			<%: Html.TextBoxFor(model => model.Name) %><br />
			<%: Html.DropDownListFor(model => model.Cooldown, Model.CooldownEnum.ToSelectList()) %>
		</td>
		<td>
			<%: Html.TextBoxFor(model => model.Range) %>
		</td>
		<td>
			<%: Html.TextBoxFor(model => model.Attack) %>
		</td>
		<td>
			<%: Html.TextBoxFor(model => model.Damage) %>
		</td>
		<td>
			<%: Html.TextBoxFor(model => model.Effect) %>
		</td>
		<td>
			<%: Html.TextBoxFor(model => model.Hit) %>
		</td>
		<td>
			<%: Html.TextBoxFor(model => model.Miss) %>
			<input type="submit" value="Add" />
		</td>
	<% } %>
</tr>