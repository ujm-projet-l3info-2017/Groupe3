<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<jsp:include page="partials/header.jsp">
		<jsp:param value="Inscription Ma�tre" name="nom"/>
		<jsp:param value="navigation_invite.jsp" name="nav"/>
		<jsp:param value="css/inscription.css" name="style"/>
	</jsp:include>
	
	<div class="content">
		<h1>Venez guider nos nouveaux aventuriers, Grand Ma�tre !</h1>
		
		<div class="result">
			<span class="${ empty form.erreurs ? 'succes' : 'erreur' }">${ form.resultat }</span>
		</div>
		<form id="inscription_form2" method="post" action="inscription_maitre">
		
			<fieldset id="zone_obligatoire">
				<legend>Obligatoire</legend>
				<p>
					<label for="pseudo">Pseudo <span class="requis">*</span></label> <input
						type="text" name="pseudo" id="pseudo"
						value="<c:out value="${ utilisateur.pseudo }" />" size="20"
						maxlength="60" /> <span class="erreur">${ form.erreurs['pseudo'] }</span>
				</p>
			
				<p>
					<label for="mail">Email <span class="requis">*</span></label> <input
						type="text" name="mail" id="mail"
						value="<c:out value="${ utilisateur.email }" />" size="20"
						maxlength="60" /> <span class="erreur">${ form.erreurs['mail'] }</span>
				</p>
				
				<p>
					<label for="passe">Mot de passe <span class="requis">*</span></label>
					<input type="password" name="passe" id="passe" size="20"
						maxlength="60" /> <span class="erreur">${ form.erreurs['passe'] }</span>
				</p>
			
				<p>
					<label for="passe_con">Confirmation du mot de passe <span
						class="requis">*</span></label> <input type="password" name="passe_con"
						id="passe_con" size="20" maxlength="60" />
				</p>
				
				<p>
					<label for="matiere">Mati�re Enseign�e <span class="requis">*</span></label> 
					<!-- <input type="text"
						name="matiere" id="matiere" value="<c:out value="${ utilisateur.matiere }" />" size="20" maxlength="60" />-->
					<select name="matiere" id="matiere">
						<option value="Maths">Maths</option>
						<option value="Fran�ais">Fran�ais</option>
						<option value="Physique">Physique</option>
						<option value="Chimie">Chimie</option>
						<option value="Histoire">Histoire</option>
						<option value="G�ographie">G�ographie</option>
					</select>
				</p>
			
				<p>
					<label for="niveau">Niveau <span class="requis">*</span></label>
					<select name="niveau" id="niveau">
						<option value="6�me">6�me</option>
						<option value="5�me">5�me</option>
						<option value="4�me">4�me</option>
						<option value="3�me">3�me</option>
						<option value="2nde">2nde</option>
						<option value="1�re">1�re</option>
						<option value="Terminale">Terminale</option>
					</select>
				</p>
			</fieldset>
			
				<button type="submit" class="sansLabel">M'inscrire</button>
				
			<fieldset id="zone_facultative">
				<legend>Optionnel</legend>
				<p>
					<label for="prenom">Pr�nom</label> <input
						type="text" name="prenom" id="prenom"
						value="<c:out value="${ utilisateur.prenom }" />" size="20"
						maxlength="60" /> <span class="erreur">${ form.erreurs['prenom'] }</span>
				</p>
			
				<p>
					<label for="nom">Nom</label> <input
						type="text" name="nom" id="nom"
						value="<c:out value="${ utilisateur.nom }" />" size="20"
						maxlength="60" /> <span class="erreur">${ form.erreurs['nom'] }</span>
				</p>
			
				
			
				<p>
					<label for="departement">D�partement</label> <input type="text"
						name="departement" id="departement"
						value="<c:out value="${ utilisateur.dpt }" />" size="20"
						maxlength="60" />
				</p>
			
				<p>
					<label for="college">Coll�ge</label> <input type="text" name="college"
						id="college" value="<c:out value="${ utilisateur.college }" />"
						size="20" maxlength="60" />
				</p>
			</fieldset>
			
		</form>
	</div>

	<jsp:include page="partials/footer.jsp"></jsp:include>
