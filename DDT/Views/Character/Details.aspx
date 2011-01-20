﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Blueprint.Master" Inherits="System.Web.Mvc.ViewPage<DDT.Models.ViewModels.CharacterViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

		<h2><%: Model.Character.Name %></h2>

		<div>
			<div id="abilities" class="span-12">
				<table>
					<thead>
						<tr>
							<th>ABILITY</th>
							<th>MOD</th>
							<th>MOD+</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%: Model.Character.Strength %> STR</td><td>X</td><td>X</td>
						</tr>
						<tr>
							<td><%: Model.Character.Constitution %> CON</td><td>X</td><td>X</td>
						</tr>
						<tr>
							<td><%: Model.Character.Dexterity %> DEX</td><td>X</td><td>X</td>
						</tr>
						<tr>
							<td><%: Model.Character.Intellect %> INT</td><td>X</td><td>X</td>
						</tr>
						<tr>
							<td><%: Model.Character.Wisdom %> WIS</td><td>X</td><td>X</td>
						</tr>
						<tr>
							<td><%: Model.Character.Charisma %> CHA</td><td>X</td><td>X</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="defenses" class="span-12 last">
				<div class="span-3">
					<h3>AC</h3>
					<p><%: Model.Character.AC %></p>
					<ul>
							<% foreach (var bonus in Model.ACBonuses) { %>
								<li><%: bonus.BonusAmount %> <%: bonus.ExpirationKey %></li>
							<% } %>
					</ul>
				</div>
				<div class="span-3">
					<h3>FORT</h3>
					<p><%: Model.Character.Fortitude %></p>
					<ul>
							<% foreach (var bonus in Model.FortBonuses) { %>
								<li><%: bonus.BonusAmount %> <%: bonus.ExpirationKey %></li>
							<% } %>
					</ul>
				</div>
				<div class="span-3">
					<h3>AC</h3>
					<p><%: Model.Character.Reflex %></p>
					<ul>
							<% foreach (var bonus in Model.ReflexBonuses) { %>
								<li><%: bonus.BonusAmount %> <%: bonus.ExpirationKey %></li>
							<% } %>
					</ul>
				</div>
				<div class="span-3 last">
					<h3>AC</h3>
					<p><%: Model.Character.Will %></p>
					<ul>
							<% foreach (var bonus in Model.WillBonuses) { %>
								<li><%: bonus.BonusAmount %> <%: bonus.ExpirationKey %></li>
							<% } %>
					</ul>
				</div>
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
					<p><%: Model.Character.HPCurrent %></p>
				</div>
				<div class="span-3">
					<h4>Temp</h4>
					<p><%: Model.Character.HPTemp %></p>
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
					<p><%: Model.Character.SurgesUsed %></p>
				</div>
				<div class="span-3 last">
					<h4>Action Points</h4>
					<p><%: Model.Character.ActionPoints %></p>
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
