<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DDT.Models.IBonus>>" %>
<% using (Html.BeginForm("AddRefBonus", "Character", FormMethod.Post, new { id = "refBonusForm" })) { %>
    <ul id="refBonusRows">
        <% Html.RenderPartial("BonusList", Model); %>
    </ul>
    <%: Html.ActionLink("Add Bonus", "BlankRefBonusRow", null, new { id = "addRefBonus" }) %>
<% } %>