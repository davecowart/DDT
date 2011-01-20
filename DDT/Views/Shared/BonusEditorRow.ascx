<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DDT.Models.IBonus>" %>
<%@ Import Namespace="DDT.Helpers" %>
<li id="<%: Model.Prefix %>BonusFormContainer">
    <% using (Html.BeginCollectionItem("bonuses")) { %>
        <%: Html.ValidationSummary(true) %>
		<%: Html.TextBoxFor(model => model.BonusAmount) %>
        <%: Html.DropDownListFor(model => model.ExpirationKey, Model.ExpirationKeyEnum.ToSelectList()) %>
        <input type="submit" value="Add" />
    <% } %>
</li>
