<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Blueprint.Master" Inherits="System.Web.Mvc.ViewPage<DDT.Models.Character>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptContent" runat="server">
	<script src="<%=this.ResolveUrl("~/Scripts/fileuploader.js")%>"type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

		<h2>Create</h2>

		<% using (Html.BeginForm()) {%>
				<%: Html.ValidationSummary(true) %>

				<fieldset>
						<legend>Fields</legend>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Name) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Name) %>
								<%: Html.ValidationMessageFor(model => model.Name) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Race) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Race) %>
								<%: Html.ValidationMessageFor(model => model.Race) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Level) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Level) %>
								<%: Html.ValidationMessageFor(model => model.Level) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.HPMax) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.HPMax) %>
								<%: Html.ValidationMessageFor(model => model.HPMax) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.SurgesDaily) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.SurgesDaily) %>
								<%: Html.ValidationMessageFor(model => model.SurgesDaily) %>
						</div>
						
						<hr />

						<div class="editor-label">
								<%: Html.LabelFor(model => model.Strength) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Strength) %>
								<%: Html.ValidationMessageFor(model => model.Strength) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Constitution) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Constitution) %>
								<%: Html.ValidationMessageFor(model => model.Constitution) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Dexterity) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Dexterity) %>
								<%: Html.ValidationMessageFor(model => model.Dexterity) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Intellect) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Intellect) %>
								<%: Html.ValidationMessageFor(model => model.Intellect) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Wisdom) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Wisdom) %>
								<%: Html.ValidationMessageFor(model => model.Wisdom) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Charisma) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Charisma) %>
								<%: Html.ValidationMessageFor(model => model.Charisma) %>
						</div>
						
						<hr />

						<div class="editor-label">
								<%: Html.LabelFor(model => model.AC) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.AC) %>
								<%: Html.ValidationMessageFor(model => model.AC) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Fortitude) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Fortitude) %>
								<%: Html.ValidationMessageFor(model => model.Fortitude) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Reflex) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Reflex) %>
								<%: Html.ValidationMessageFor(model => model.Reflex) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Will) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Will) %>
								<%: Html.ValidationMessageFor(model => model.Will) %>
						</div>

						<hr />						
					
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Acrobatics) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Acrobatics) %>
								<%: Html.ValidationMessageFor(model => model.Acrobatics) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Arcana) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Arcana) %>
								<%: Html.ValidationMessageFor(model => model.Arcana) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Athletics) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Athletics) %>
								<%: Html.ValidationMessageFor(model => model.Athletics) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Bluff) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Bluff) %>
								<%: Html.ValidationMessageFor(model => model.Bluff) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Diplomacy) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Diplomacy) %>
								<%: Html.ValidationMessageFor(model => model.Diplomacy) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Dungeoneering) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Dungeoneering) %>
								<%: Html.ValidationMessageFor(model => model.Dungeoneering) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Endurance) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Endurance) %>
								<%: Html.ValidationMessageFor(model => model.Endurance) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Heal) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Heal) %>
								<%: Html.ValidationMessageFor(model => model.Heal) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.History) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.History) %>
								<%: Html.ValidationMessageFor(model => model.History) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Insight) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Insight) %>
								<%: Html.ValidationMessageFor(model => model.Insight) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Intimidate) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Intimidate) %>
								<%: Html.ValidationMessageFor(model => model.Intimidate) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Nature) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Nature) %>
								<%: Html.ValidationMessageFor(model => model.Nature) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Perception) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Perception) %>
								<%: Html.ValidationMessageFor(model => model.Perception) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Religion) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Religion) %>
								<%: Html.ValidationMessageFor(model => model.Religion) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Stealth) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Stealth) %>
								<%: Html.ValidationMessageFor(model => model.Stealth) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Streetwise) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Streetwise) %>
								<%: Html.ValidationMessageFor(model => model.Streetwise) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.Thievery) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.Thievery) %>
								<%: Html.ValidationMessageFor(model => model.Thievery) %>
						</div>
						
						<hr />

						<div class="editor-label">
								<%: Html.LabelFor(model => model.MeleeBasicAttack) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.MeleeBasicAttack) %>
								<%: Html.ValidationMessageFor(model => model.MeleeBasicAttack) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.RangedBasicAttack) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.RangedBasicAttack) %>
								<%: Html.ValidationMessageFor(model => model.RangedBasicAttack) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.UnarmedMeleeAttack) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.UnarmedMeleeAttack) %>
								<%: Html.ValidationMessageFor(model => model.UnarmedMeleeAttack) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.UnarmedRangedAttack) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.UnarmedRangedAttack) %>
								<%: Html.ValidationMessageFor(model => model.UnarmedRangedAttack) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.MeleeBasicDamage) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.MeleeBasicDamage) %>
								<%: Html.ValidationMessageFor(model => model.MeleeBasicDamage) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.RangedBasicDamage) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.RangedBasicDamage) %>
								<%: Html.ValidationMessageFor(model => model.RangedBasicDamage) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.UnarmedMeleeDamage) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.UnarmedMeleeDamage) %>
								<%: Html.ValidationMessageFor(model => model.UnarmedMeleeDamage) %>
						</div>
						
						<div class="editor-label">
								<%: Html.LabelFor(model => model.UnarmedRangedDamage) %>
						</div>
						<div class="editor-field">
								<%: Html.TextBoxFor(model => model.UnarmedRangedDamage) %>
								<%: Html.ValidationMessageFor(model => model.UnarmedRangedDamage) %>
						</div>
						
						<p>
								<input type="submit" value="Create" />
						</p>
				</fieldset>

		<% } %>

		<div>
				<%: Html.ActionLink("Back to List", "Index") %>
		</div>

</asp:Content>

