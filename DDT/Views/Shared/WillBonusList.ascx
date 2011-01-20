<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DDT.Models.IBonus>>" %>
<% using (Html.BeginForm("AddWillBonus", "Character", FormMethod.Post, new { id = "willBonusForm" })) { %>
    <ul id="willBonusRows">
        <% Html.RenderPartial("BonusList", Model); %>
    </ul>
    <%: Html.ActionLink("Add Bonus", "BlankWillBonusRow", null, new { id = "addWillBonus" }) %>
<% } %>