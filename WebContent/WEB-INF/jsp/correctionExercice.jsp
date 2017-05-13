<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Correction d'exercice</title>
<link rel="stylesheet" href="css/style2.css"/>
<style>
/* Style the input */
input {
  border: none;
  width: 75%;
  padding: 10px;
  float: left;
  font-size: 16px;
}
</style>
<div class="navbar">
	  <a href="coursMaitre.jsp">Liste des Cours</a>
	  <a href="ajoutExercice.jsp">Ajouter un exercice</a>
	  <a href="correctionExercice.jsp">Corriger un exercice</a>
	  
	</div>
</head>
<body class="content">


<div id="myDIV" class="header">
  <h2 style="margin:5px">Liste des exercices</h2>
</div>

<ul id="liste">
  <li>Exercice1</li>
  <li>Exercice2</li>
  <li>Exercice3</li>
 
</ul>

<script>
var list = document.querySelector('ul');
list.addEventListener('click', function(e) {
  if (e.target.tagName === 'LI') {
	 //ici on va afficher le contenu de l'exercice
  }
}, false);

//ajout des boutton ajouter pour chaque item
var myNodelist = document.getElementsByTagName("LI");
var i;
for (i = 0; i < myNodelist.length; i++) {
  var span = document.createElement("SPAN");
  var txt = document.createTextNode("Corriger");
  span.className = "correct";
  span.appendChild(txt);
  myNodelist[i].appendChild(span);
}

//Click sur le button corriger pour corriger l'exercice
var list = document.getElementsByClassName("correct");
var i;
for (i = 0; i < list.length; i++) {
  list[i].onclick = function() {
	  window.location = "correction.jsp";
  }
}
</script>
</body>
</html>