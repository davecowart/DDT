<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DDT.Models.IBonus>" %>
<%@ Import Namespace="DDT.Helpers" %>
<li id="<%: Model.Prefix %>BonusFormContainer">
    <% using (Html.BeginCollectionItem("bonuses")) { %>
        <%: Html.ValidationSummary(true) %>
		<%: Html.TextBoxFor(model => model.BonusAmount) %>
        <%: Html.TextBoxFor(model => model.ExpirationKey) %>
        <input type="submit" value="Add" />
    <% } %>
</li>
