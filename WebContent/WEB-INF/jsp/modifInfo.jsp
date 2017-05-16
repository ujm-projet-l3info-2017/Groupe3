<jsp:include page="partials/header.jsp">
	<jsp:param value="Modifier ses informations" name="nom" />
	<jsp:param value="navigation_eleve.jsp" name="nav" />
</jsp:include>

<h1>Modification des informations</h1>

<div class="content">
	<form id="modif_prenom" method="post" action="user">

		<p>
			<label for="pseudo">Pr�nom </label> <input type="text" name="prenom"
				id="prenom" value="" size="20" maxlength="60" /> <span
				class="erreur">${ form.erreurs['prenom'] }</span>
			<button type="submit" class="sansLabel">Modifier pr�nom</button>
		</p>
	</form>
	<form id="modif_nom" method="post" action="modifInfo.jsp">
		<hr>
		<p>
			<label for="pseudo">Nom</label> <input type="text" name="nom"
				id="nom" value="" size="20" maxlength="60" /> <span
				class="erreur">${ form.erreurs['nom'] }</span>
			<button type="submit" class="sansLabel">Modifier nom</button>
		</p>
	</form>
	<form id="modif_mail" method="post" action="modifInfo.jsp">

		<hr>
		<p>
			<label for="mail">Email</label> <input type="text" name="mail"
				id="mail" value="" size="20" maxlength="60" /> <span class="erreur">${ form.erreurs['mail'] }</span>
			<button type="submit" class="sansLabel">Modifier email</button>
		</p>
	</form>
	<form id="modif_passe" method="post" action="modifInfo.jsp">
		<hr>
		<p>
			<label for="passe">Ancien mot de passe <span class="requis"></span></label>
			<input type="password" name="passe" id="passe" size="20"
				maxlength="60" /> <span class="erreur">${ form.erreurs['passe'] }</span>
		</p>

		<p>
			<label for="passe_new">Nouveau mot de passe <span
				class="requis"></span></label> <input type="password" name="passe_new"
				id="passe_new" size="20" maxlength="60" />
		</p>

		<p>
			<label for="passe_con">Confimation du nouveau mot de passe <span
				class="requis"></span></label> <input type="password" name="passe_con"
				id="passe_con" size="20" maxlength="60" />
			<button type="submit" class="sansLabel">Modifier mot de
				passe</button>
		</p>
	</form>
	<form id="modif_niveau" method="post" action="modifInfo.jsp">
		<hr>
		<p>
			<label for="niveau">Niveau </label> <select name="niveau" id="niveau">
				<option value="6�me">6�me</option>
				<option value="5�me">5�me</option>
				<option value="4�me">4�me</option>
				<option value="3�me">3�me</option>
				<option value="2nde">2nde</option>
				<option value="1�re">1�re</option>
				<option value="Terminale">Terminale</option>
			</select>
			<button type="submit" class="sansLabel">Modifier niveau</button>
		</p>

		<br /> <span class="${ empty form.erreurs ? 'succes' : 'erreur' }">${ form.resultat }</span>

	</form>

</div>
