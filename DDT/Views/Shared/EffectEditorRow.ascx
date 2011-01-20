<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DDT.Models.Effect>" %>
<%@ Import Namespace="DDT.Helpers" %>

<li id="effectFormContainer">
    <% using (Html.BeginCollectionItem("effects")) { %>
        <%: Html.ValidationSummary(true)%>
        <%: Html.TextBoxFor(model => model.Name)%>
        <%: Html.DropDownListFor(model => model.ExpirationKey, Model.ExpirationKeyEnum.ToSelectList()) %>
        <input type="submit" value="Add" />
    <% } %>
</li>
