<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Blueprint.Master" Inherits="System.Web.Mvc.ViewPage<DDT.Models.ViewModels.CharacterViewModel>" %>
<%@ Import Namespace="DDT.Helpers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

		<h2><%: Model.Character.Name %></h2>

		<div>
			<div id="abilities" class="span-4">
				<table>
					<thead>
						<tr>
							<th>Ability</th>
							<th>Mod</th>
							<th>Mod+</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%: Model.Character.Strength %> STR</td><td><%: Html.AbilityModifier(Model.Character.Strength) %></td><td><%: Html.AbilityModifierPlusHalf(Model.Character.Strength, Model.Character.Level) %></td>
						</tr>
						<tr>
							<td><%: Model.Character.Constitution %> CON</td><td><%: Html.AbilityModifier(Model.Character.Constitution)%></td><td><%: Html.AbilityModifierPlusHalf(Model.Character.Constitution, Model.Character.Level)%></td>
						</tr>
						<tr>
							<td><%: Model.Character.Dexterity %> DEX</td><td><%: Html.AbilityModifier(Model.Character.Dexterity)%></td><td><%: Html.AbilityModifierPlusHalf(Model.Character.Dexterity, Model.Character.Level)%></td>
						</tr>
						<tr>
							<td><%: Model.Character.Intellect %> INT</td><td><%: Html.AbilityModifier(Model.Character.Intellect)%></td><td><%: Html.AbilityModifierPlusHalf(Model.Character.Intellect, Model.Character.Level)%></td>
						</tr>
						<tr>
							<td><%: Model.Character.Wisdom %> WIS</td><td><%: Html.AbilityModifier(Model.Character.Wisdom)%></td><td><%: Html.AbilityModifierPlusHalf(Model.Character.Wisdom, Model.Character.Level)%></td>
						</tr>
						<tr>
							<td><%: Model.Character.Charisma %> CHA</td><td><%: Html.AbilityModifier(Model.Character.Charisma)%></td><td><%: Html.AbilityModifierPlusHalf(Model.Character.Charisma, Model.Character.Level)%></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="defenses" class="span-16 last">
				<div class="span-4">
					<h3>AC</h3>
										<p><strong><%: Model.Character.AC + Model.ACBonuses.Sum(b => b.BonusAmount) %></strong></p>
					<p><%: Model.Character.AC %></p>
										<% Html.RenderPartial("ACBonusList", Model.ACBonuses); %>
				</div>
				<div class="span-4">
					<h3>FORT</h3>
										<p><strong><%: Model.Character.Fortitude + Model.FortBonuses.Sum(b => b.BonusAmount) %></strong></p>
					<p><%: Model.Character.Fortitude %></p>
										<% Html.RenderPartial("FortBonusList", Model.FortBonuses); %>
				</div>
				<div class="span-4">
					<h3>REF</h3>
										<p><strong><%: Model.Character.Reflex + Model.ReflexBonuses.Sum(b => b.BonusAmount) %></strong></p>
					<p><%: Model.Character.Reflex %></p>
										<% Html.RenderPartial("RefBonusList", Model.ReflexBonuses); %>
				</div>
				<div class="span-4 last">
					<h3>WILL</h3>
										<p><strong><%: Model.Character.Will + Model.WillBonuses.Sum(b => b.BonusAmount) %></strong></p>
					<p><%: Model.Character.Will %></p>
										<% Html.RenderPartial("WillBonusList", Model.WillBonuses); %>
				</div>
			</div>
			<div class="span-4 last">
				<% using (Html.BeginForm("EndEncounter", "Character", new { id = Model.Character.Id })) { %>
					<input type="submit" value="End Encounter" />
				<% } %>
				<% using (Html.BeginForm("EndDay", "Character", new { id = Model.Character.Id })) { %>
					<input type="submit" value="End Day" />
				<% } %>
			</div>
		</div>
		<div>
			<div id="health" class="span-24 last">
				<div class="span-3">
					<h4>HP</h4>
					<p>(<%: Model.Character.HPMax %> MAX)</p>
				</div>
				<div class="span-3">
					<h4>Current</h4>
										<p><%: Html.TextBoxFor(model => Model.Character.HPCurrent, new { @class = "span-3 last" })%></p>
				</div>
				<div class="span-3">
					<h4>Temp</h4>
										<p><%: Html.TextBoxFor(model => Model.Character.HPTemp, new { @class = "span-3 last" })%></p>
				</div>
				<div class="span-3">
					<h4>Bloodied</h4>
					<p><%: Model.Bloodied %></p>
				</div>
				<div class="span-3">
					<h4>Surge Value</h4>
					<p><%: Model.SurgeValue %></p>
				</div>
				<div class="span-3">
					<h4>Daily Surges</h4>
					<p><%: Model.Character.SurgesDaily %></p>
				</div>
				<div class="span-3">
					<h4>Surges Used</h4>
										<p><%: Html.TextBoxFor(model => Model.Character.SurgesUsed, new { @class = "span-3 last" })%></p>
				</div>
				<div class="span-3 last">
					<h4>Action Points</h4>
										<p><%: Html.TextBoxFor(model => Model.Character.ActionPoints, new { @class = "span-3 last" })%></p>
				</div>
			</div>
		</div>
		<div>
			<div id="effects" class="span-12">
				<div>
				<h2>Conditions/Effects</h2>
				<% using (Html.BeginForm("AddEffect", "Character", FormMethod.Post, new { id = "effectForm" })) { %>
				<ul id="effectRows">
					<% foreach (var effect in Model.Effects) {
												Html.RenderPartial("Effect", effect);
					} %>
				</ul>
								<%: Html.ActionLink("Add Effect", "BlankEffectRow", null, new { id = "addEffect" })%>
								<% } %>
				</div>
				<div id="basicattacks">
					<table>
						<thead>
							<tr>
								<th></th>
								<th>Attack</th>
								<th>Damage</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Melee Basic</td>
								<td><%: Model.Character.MeleeBasicAttack %></td>
								<td><%: Model.Character.MeleeBasicDamage %></td>
							</tr>
							<tr>
								<td>Ranged Basic</td>
								<td><%: Model.Character.RangedBasicAttack %></td>
								<td><%: Model.Character.RangedBasicDamage %></td>
							</tr>
							<tr>
								<td>Unarmed Melee</td>
								<td><%: Model.Character.UnarmedMeleeAttack %></td>
								<td><%: Model.Character.UnarmedMeleeDamage %></td>
							</tr>
							<tr>
								<td>Unarmed Ranged</td>
								<td><%: Model.Character.UnarmedRangedAttack %></td>
								<td><%: Model.Character.UnarmedRangedDamage %></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div id="skills" class="span-12 last">
				<h3>Skills</h3>
				<table>
					<tbody>
						<tr>
							<td>Acrobatics</td><td><%: Model.Character.Acrobatics %></td><td>Insight</td><td><%: Model.Character.Insight %></td>
						</tr>
						<tr>
							<td>Arcana</td><td><%: Model.Character.Arcana %></td><td>Intimidate</td><td><%: Model.Character.Intimidate %></td>
						</tr>
						<tr>
							<td>Athletics</td><td><%: Model.Character.Athletics %></td><td>Nature</td><td><%: Model.Character.Nature %></td>
						</tr>
						<tr>
							<td>Bluff</td><td><%: Model.Character.Bluff %></td><td>Perception</td><td><%: Model.Character.Perception %></td>
						</tr>
						<tr>
							<td>Diplomacy</td><td><%: Model.Character.Diplomacy %></td><td>Religion</td><td><%: Model.Character.Religion %></td>
						</tr>
						<tr>
							<td>Dungeoneering</td><td><%: Model.Character.Dungeoneering %></td><td>Stealth</td><td><%: Model.Character.Stealth %></td>
						</tr>
						<tr>
							<td>Endurance</td><td><%: Model.Character.Endurance %></td><td>Streetwise</td><td><%: Model.Character.Streetwise %></td>
						</tr>
						<tr>
							<td>Heal</td><td><%: Model.Character.Heal %></td><td>Thievery</td><td><%: Model.Character.Thievery %></td>
						</tr>
						<tr>
							<td>History</td><td><%: Model.Character.History %></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div>
			<div id="powers" class="span-24 last">
				<% using (Html.BeginForm("AddPower", "Character", FormMethod.Post, new { id = "powerForm" })) { %>
				<table>
					<thead>
						<tr>
							<th>Name</th>
							<th>Range</th>
							<th>Attack</th>
							<th>Damage</th>
							<th>Effects</th>
							<th>Hit</th>
							<th>Miss</th>
						</tr>
					</thead>
					<tbody id="powerRows">
						<% foreach (var power in Model.Powers) {
							Html.RenderPartial("Power", power);
						} %>
					</tbody>
				</table>
				<%: Html.ActionLink("Add Power", "BlankPowerRow", null, new { id = "addPower" })%>
				<% } %>
			</div>
		</div>
		<%: Html.Hidden("characterId", Model.Character.Id) %>
</asp:Content>
