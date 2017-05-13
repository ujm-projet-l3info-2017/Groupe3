<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	  <a href="/master?action=cours">Liste des Cours</a>
	  <a href="/master?action=add">Ajouter un exercice</a>
<!-- 	  <a href="">Corriger un exercice</a> -->
	  
	</div>
</head>
<body class="content">


<div id="myDIV" class="header">
  <h2 style="margin:5px">Liste des exercices</h2>
</div>

<ul id="liste">
  
  <c:forEach var="exercice" items="${ requestScope.exercices }">
  	<li>
  		<c:out value="${ exercice.titreExo }"></c:out>
  	</li>
  </c:forEach>
 
</ul>

<script>
var list = document.querySelector('ul');
list.addEventListener('click', function(e) {
  if (e.target.tagName === 'LI') {
	 //ici on va afficher le contenu de l'exercice
  }
}, false);

</script>
</body>
</html>