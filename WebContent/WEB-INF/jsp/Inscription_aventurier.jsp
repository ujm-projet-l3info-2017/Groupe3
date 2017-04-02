<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/inscription.css" />
<title>Inscription Aventurier</title>
</head>
<body>
<h1>Qui es-tu jeune aventurier?</h1>
<form id = "inscription_form1" method = "post" action = "inscription_aventurier">
	<p>
	<label for = "pseudo">Pseudo <span class="requis">*</span></label>
	<input type = "text" name = "pseudo" id = "pseudo" value="${ utilisateur.pseudo }" />
	<span class="erreur">${ form.erreurs['pseudo'] }</span>
	</p>
		
	<p>
	<label for = "mail">Email <span class="requis">*</span></label>
	<input type="text" name="mail" id="mail" value="${ utilisateur.email }" />
	<span class="erreur">${ form.erreurs['mail'] }</span>
	</p>
	
	<p>
	<label for = "prenom">Prénom <span class="requis">*</span></label>
	<input type = "text" name = "prenom" id = "prenom" value="${ utilisateur.prenom }" />
	<span class="erreur">${ form.erreurs['prenom'] }</span>
	</p>
	
	<p>
	<label for = "nom">Nom <span class="requis">*</span></label>
	<input type = "text" name = "nom" id = "nom" value="${ utilisateur.nom }" />
	<span class="erreur">${ form.erreurs['nom'] }</span>
	</p>
	
	<p>
    <label for = "passe">Mot de passe <span class="requis">*</span></label>
    <input type = "password" name = "passe" id = "passe" />
    <span class="erreur">${ form.erreurs['passe'] }</span>
	</p>
	
	<p>
	<label for = "passe_con">Confirmation du mot de passe <span class="requis">*</span></label>
	<input type = "password" name = "passe_con" id = "passe_con" />
	</p>
	
	<p>
	<label for = "niveau">Niveau <span class="requis">*</span></label>
	<input type = "text" name = "niveau" id = "niveau" value="${ utilisateur.niveau }"/>
	</p>
	
	<p>
	<label for = "departement">Département</label>
	<input type = "text" name = "departement" id = "departement" value="${ utilisateur.departement }"/>
	</p>
	
	<p>
	<label for = "college">Collège</label>
	<input type = "text" name = "college" id = "college" value="${ utilisateur.college }" />
	</p>	
	
	<button type = "submit">M'inscrire</button>
	<br />
	
	<span class="${ empty erreurs ? 'succes' : 'echec' }">${ form.resultat }</span>
	
</form>
</body>
</html>