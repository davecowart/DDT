<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Blueprint.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DDT.Models.Character>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Characters
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

		<h2>Characters</h2>

		<table>
				<tr>
						<th>
								Name
						</th>
				</tr>

		<% foreach (var item in Model) { %>
		
				<tr>
						<td>
								<%: Html.ActionLink(item.Name, "Details", new { id=item.Id })%> |
						</td>
				</tr>
		
		<% } %>

		</table>

		<p><%: Html.ActionLink("Create New Character", "Create") %></p>
</asp:Content>

