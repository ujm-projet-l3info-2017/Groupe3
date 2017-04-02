<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" />
<title>${ param.nom }</title>
</head>
<body>
	<header>
	<div id="logo">
		<h1>KOLEGIA</h1>
	</div>

	<nav> <a href="Inscription.jsp" class="bouton_menu"
		id="bouton_ins">Inscription</a> <label for="cble_connex"
		class="bouton_menu">Connexion</label> <input id="cble_connex"
		type="checkbox" />

	<div id="popup_connex">
		<form id="form_test">
			<label for="pseudo">Pseudo</label> <br /> <input type="text"
				id="pseudo" /> <br /> <label for="mdp">Mot de passe</label> <br />
			<input type="text" id="mdp" />
		</form>
	</div>
	</nav> 
	</header>