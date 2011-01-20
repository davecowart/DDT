<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<DDT.Models.IBonus>>" %>
<% foreach (var bonus in Model) {
    Html.RenderPartial("Bonus", bonus);
} %>
