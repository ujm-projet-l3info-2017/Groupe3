<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<jsp:include page="header.jsp">
	<jsp:param value="Kolegia : En route pour de nouvelles aventures ?" name="nom"/>
</jsp:include>
	
<link rel="stylesheet" href="css/inscription.css" />	
	
	<section>
		<h1>En route pour l'aventure ?</h1>
		<form id = "inscription_form1" method = "post" action = "inscription_aventurier">
		
			<fieldset id="zone_obligatoire">
				<p>
					<label for = "pseudo">Pseudo <span class="requis">*</span></label>
					<input type = "text" name = "pseudo" id = "pseudo" value="<c:out value="${ utilisateur.pseudo }" />" size="20" maxlength="60"  />
					<span class="erreur">${ form.erreurs['pseudo'] }</span>
				</p>
					
				<p>
					<label for = "mail">Email <span class="requis">*</span></label>
					<input type="text" name="mail" id="mail" value="<c:out value="${ utilisateur.email }" />" size="20" maxlength="60" />
					<span class="erreur">${ form.erreurs['mail'] }</span>
				</p>
				
				<p>
			    	<label for = "passe">Mot de passe <span class="requis">*</span></label>
			    	<input type = "password" name = "passe" id = "passe" size="20" maxlength="60" />
			    	<span class="erreur">${ form.erreurs['passe'] }</span>
				</p>
				
				<p>
					<label for = "passe_con">Confirmation du mot de passe <span class="requis">*</span></label>
					<input type = "password" name = "passe_con" id = "passe_con" size="20" maxlength="60"  />
				</p>
				
				<p>
					<label for = "niveau">Niveau <span class="requis">*</span></label>
					<!--  <input type = "text" name = "niveau" id = "niveau" value="<c:out value="${ utilisateur.niveau }" />" size="20" maxlength="60" />
					-->
					<select name="niveau" id ="niveau"  size="1">
						<option value="<c:out value="${ utilisateur.niveau }" />" selected>6eme
					</select>
				</p>
				<button type = "submit" class="sansLabel">M'inscrire</button>
				
			</fieldset>
			
			<fieldset id = "zone_facultative">
				<legend>Accessoirement...</legend>
				<p>
					<label for = "prenom">Prénom</label>
					<input type = "text" name = "prenom" id = "prenom" value="<c:out value="${ utilisateur.prenom }" />" size="20" maxlength="60" />
					<span class="erreur">${ form.erreurs['prenom'] }</span>
				</p>
					
				<p>
					<label for = "nom">Nom</label>
					<input type = "text" name = "nom" id = "nom" value="<c:out value="${ utilisateur.nom }" />" size="20" maxlength="60" />
					<span class="erreur">${ form.erreurs['nom'] }</span>
				</p>
				
				<p>
					<label for = "departement">Département</label>
					<input type = "text" name = "departement" id = "departement" value="<c:out value="${ utilisateur.departement }" />" size="20" maxlength="60" />
				</p>
				
				<p>
					<label for = "college">Collège</label>
					<input type = "text" name = "college" id = "college" value="<c:out value="${ utilisateur.college }" />" size="20" maxlength="60" />
				</p>
				
			</fieldset>

			<br/>
			
			<span class="${ empty form.erreurs ? 'succes' : 'erreur' }">${ form.resultat }</span>
			
		</form>
	</section>
	
<jsp:include page="footer.jsp"></jsp:include>
	