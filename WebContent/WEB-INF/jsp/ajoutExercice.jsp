<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ajout d'exercice</title>
<link rel="stylesheet" href="css/style2.css"/>
<div class="navbar">
	  <a href="coursMaitre.jsp">Liste des Cours</a>
	  <a href="ajoutExercice.jsp">Ajouter un exercice</a>
	  <a href="">Corriger un exercice</a>
	  
	</div>
</head>
	<body class="content">
	<div class="header">
    <h2 style="margin:5px">Ajout d'exercice</h2>
    </div>
     <input  type="button" value="G" style="font-weight: bold;" onclick="commande('bold');" />
	<input type="button" value="I" style="font-style: italic;" onclick="commande('italic');" />
	<input type="button" value="S" style="text-decoration: underline;" onclick="commande('underline');" />
	<input type="text" value="titre de l'exercice..." style=" border: 2px solid black; width: 100%; padding: 10px; float: left;font-size: 16px;"/>
	<div id="editeur"  contentEditable></div>
	<button class="button" type = "submit">Ajouter</button>
	</body>
	<script  type="text/javascript">
	function commande(nom, argument) {
		  if (typeof argument === 'undefined') {
		    argument = '';
		  }
		  // Exécuter la commande
		  document.execCommand(nom, false, argument);
		}
</script>
</html>