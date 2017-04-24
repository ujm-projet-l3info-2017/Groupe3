<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Liste des cours</title>
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
	  <a href="">Corriger un exercice</a>
	  
	</div>
</head>
<body class="content">


<div id="myDIV" class="header">
  <h2 style="margin:5px">Liste des cours</h2>
  <input type="text" id="myInput" placeholder="Titre de cours...">
  <span onclick="nouveauElement()" class="addBtn">Ajouter</span>
</div>

<ul id="liste">
  <li>Geometrie</li>
  <li>Fonctions</li>
  <li>Calcul</li>
 
</ul>

<script>
// Create a "close" button and append it to each list item
var myNodelist = document.getElementsByTagName("LI");
var i;
for (i = 0; i < myNodelist.length; i++) {
  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  myNodelist[i].appendChild(span);
}

// Click on a close button to hide the current list item
var close = document.getElementsByClassName("close");
var i;
for (i = 0; i < close.length; i++) {
  close[i].onclick = function() {
    var div = this.parentElement;
    div.style.display = "none";
  }
}
//go to liste exos of an item
var list = document.querySelector('ul');
list.addEventListener('click', function(e) {
  if (e.target.tagName === 'LI') {
	  window.location = "listeExercices.jsp";
  }
}, false);


// Create a new list item when clicking on the "Add" button
function nouveauElement() {
  var li = document.createElement("li");
  var inputValue = document.getElementById("myInput").value;
  var t = document.createTextNode(inputValue);
  li.appendChild(t);
  if (inputValue === '') {
    alert("Veuillez saisir un titre de cours à ajouter");
  } else {
    document.getElementById("liste").appendChild(li);
  }
  document.getElementById("myInput").value = "";

  var span = document.createElement("SPAN");
  var txt = document.createTextNode("\u00D7");
  span.className = "close";
  span.appendChild(txt);
  li.appendChild(span);

  for (i = 0; i < close.length; i++) {
    close[i].onclick = function() {
      var div = this.parentElement;
      div.style.display = "none";
    }
  }
}
</script>

</body>
</html>
