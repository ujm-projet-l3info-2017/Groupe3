<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link rel="stylesheet" href="css/inscription.css" />
<title>Maitre de Guilde</title>
</head>
<h1>Qui êtes-vous Maitre ?</h1>
<form id="inscription_form2" method="post" action="inscription_maitre">
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
		<label for="prenom">Prénom <span class="requis">*</span></label> <input
			type="text" name="prenom" id="prenom"
			value="<c:out value="${ utilisateur.prenom }" />" size="20"
			maxlength="60" /> <span class="erreur">${ form.erreurs['prenom'] }</span>
	</p>

	<p>
		<label for="nom">Nom <span class="requis">*</span></label> <input
			type="text" name="nom" id="nom"
			value="<c:out value="${ utilisateur.nom }" />" size="20"
			maxlength="60" /> <span class="erreur">${ form.erreurs['nom'] }</span>
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
		<label for="niveau">Niveau <span class="requis">*</span></label> <input
			type="text" name="niveau" id="niveau"
			value="<c:out value="${ utilisateur.niveau }" />" size="20"
			maxlength="60" />
	</p>

	<p>
		<label for="departement">Département</label> <input type="text"
			name="departement" id="departement"
			value="<c:out value="${ utilisateur.departement }" />" size="20"
			maxlength="60" />
	</p>

	<p>
		<label for="college">Collège</label> <input type="text" name="college"
			id="college" value="<c:out value="${ utilisateur.college }" />"
			size="20" maxlength="60" />
	</p>

	<p>
		<label for="matiere">Matière Enseignée <span class="requis">*</span></label> 
		<input type="text"
			name="matiere" id="matiere" value="<c:out value="${ utilisateur.matiere }" />" size="20" maxlength="60" />
	</p>
	
	<p>
		<button type="submit" class="sansLabel">M'inscrire</button>
	</p>
	
	<span class="${ empty erreurs ? 'succes' : 'echec' }">${ form.resultat }</span>
</form>

</body>
</html>