<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DDT.Models.Power>" %>
<tr class="<%: Model.CooldownEnum.ToString() %> power" id="power_<%: Model.Id %>">
	<td><%: Model.Name %></td>
	<td><%: Model.Range %></td>
	<td><%: Model.Attack %></td>
	<td><%: Model.Damage %></td>
	<td><%: Model.Effect %></td>
	<td><%: Model.Hit %></td>
	<td><%: Model.Miss %></td>
</tr>