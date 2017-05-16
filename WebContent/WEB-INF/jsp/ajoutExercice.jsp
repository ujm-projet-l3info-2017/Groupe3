<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title>Ajout d'exercice</title>
<link rel="stylesheet" href="css/style2.css"/>
<div class="navbar">
	  <a href="master?action=cours">Liste des Cours</a>
	  <a href="master?action=add_exercice">Ajouter un exercice</a>
	  <a href="">Corriger un exercice</a>
	  
	</div>
</head>
	<body class="content">
	<div class="header">
    <h2 style="margin:5px">Ajout d'exercice</h2>
    </div>
    
    <form method="post" action = "master?new">
    
    	
<!-- 	    <input  type="button" value="G" style="font-weight: bold;" onclick="commande('bold');" /> -->
<!-- 		<input type="button" value="I" style="font-style: italic;" onclick="commande('italic');" /> -->
<!-- 		<input type="button" value="S" style="text-decoration: underline;" onclick="commande('underline');" /> -->
		
		
		<input name="titre" id="titre" type="text" placeholder="Titre de l'exercice..."/><br />
		<br><br>
		<input type="hidden" name="id_maitre" value="${ sessionScope.sessionUtilisateur.email }" />
		<textarea name="content" class="mceForm"></textarea>
		<button class="button" type = "submit">Ajouter</button>
	</form>
	
<!-- 	<script  type="text/javascript"> -->
<!-- // 	function commande(nom, argument) { -->
<!-- // 		  if (typeof argument === 'undefined') { -->
<!-- // 		    argument = ''; -->
<!-- // 		  } -->
<!-- // 		  // Exécuter la commande -->
<!-- // 		  document.execCommand(nom, false, argument); -->
<!-- // 		} -->
<!-- 	</script> -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
	<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=zt48mefmr68f5whjsgb4qf5u5zn65j3r3z9t7s9at66pf7px"></script>
	<script src="https://use.fontawesome.com/7459d48990.js"></script>
	<script type="text/javascript" src="js/main.js"></script>
	</body>
</html>