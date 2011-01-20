<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DDT.Models.IBonus>>" %>
<% using (Html.BeginForm("AddFortBonus", "Character", FormMethod.Post, new { id = "fortBonusForm" })) { %>
    <ul id="fortBonusRows">
        <% Html.RenderPartial("BonusList", Model); %>
    </ul>
    <%: Html.ActionLink("Add Bonus", "BlankFortBonusRow", null, new { id = "addFortBonus" }) %>
<% } %>