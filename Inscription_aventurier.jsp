<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Inscription Aventurier</title>
</head>
<body>

<form id = "inscription_form1" method = "post" action = "<?php echo $_SERVER['PHP_SELF']; ?>">
	<p><label for = "pseudo">Pseudo *:</label> <input type = "text" name = "pseudo" id = "pseudo" />

	<p><label for = "prenom">prenom *:</label> <input type = "text" name = "prenom" id = "prenom" required/></p>
	<p><label for = "nom">nom *:</label> <input type = "text" name = "nom" id = "nom" required/></p>
	
    <p><label for = "passe">Mot de passe *:</label> <input type = "password" name = "passe" id = "passe" required/></p>

	<p><label for = "passe_con">Confirmation du mot de passe *:</label> <input type = "password" name = "passe_con" id = "passe_con" required/></p>
	<p><label for = "mail">e-mail *:</label> <input type = "email" name = "mail" id = "mail" required/></p>
	<p><label for = "departement">departement *:</label> <input type = "text" name = "departement" id = "departement" required/></p>
	
	<p><label for = "college">college :</label> <input type = "text" name = "college" id = "college" required/></p>
	<p><label for = "niveau">Niveau :</label> <input type = "text" name = "niveau" id = "niveau" required/></p>

	<p><button type = "submit">M'inscrire</button></p>
</form>
</body>
</html>