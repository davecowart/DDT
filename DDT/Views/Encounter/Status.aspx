<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Blueprint.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DDT.Models.Character>>" %>
<%@ Import Namespace="DDT.Helpers" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptContent" runat="server">
	<script src="<%=this.ResolveUrl("~/Scripts/encounter.js")%>" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Status
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

		<h2>Status</h2>

<ul>
	<% foreach (var character in Model) { %>
			<li>
				<span id="<%: character.Id %>" class="characterStatusRow<%: character.IsBloodied() ? " bloodied" : "" %>"><%: character.Name %></span>
			</li>
<% } %>
</ul>

		<p>
				<%: Html.ActionLink("Create New", "Create") %>
		</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>

