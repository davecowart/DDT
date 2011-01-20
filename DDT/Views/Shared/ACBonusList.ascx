<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DDT.Models.IBonus>>" %>
<% using (Html.BeginForm("AddACBonus", "Character", FormMethod.Post, new { id = "acBonusForm" })) { %>
    <ul id="acBonusRows">
        <% Html.RenderPartial("BonusList", Model); %>
    </ul>
    <%: Html.ActionLink("Add Bonus", "BlankACBonusRow", null, new { id = "addACBonus" }) %>
<% } %>