<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Correction</title>
<link rel="stylesheet" href="css/style2.css"/>

<div class="navbar">
	  <a href="coursMaitre.jsp">Liste des Cours</a>
	  <a href="ajoutExercice.jsp">Ajouter un exercice</a>
	  <a href="correctionExercice.jsp">Corriger un exercice</a>
	  </div>
	
</head>
<body class="content">
<div class="header">
    <h2 style="margin:5px">Correction</h2>
    </div>
 <input  type="button" value="G" style="font-weight: bold;" onclick="commande('bold');" />
	<input type="button" value="I" style="font-style: italic;" onclick="commande('italic');" />
	<input type="button" value="S" style="text-decoration: underline;" onclick="commande('underline');" />
	<div id="editeur"  contentEditable></div>
	<button class="button" type = "submit">Ajouter</button>
</body>
</html>