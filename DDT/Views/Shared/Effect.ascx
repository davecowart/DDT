﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DDT.Models.Effect>" %>
    <li><%: Model.Name%> (<%: Model.ExpirationKeyEnum %>) <%: Html.ActionLink("X", "RemoveEffect", new { id = Model.Id }, new { @class = "removeLink" })%> </li>