<jsp:include page="partials/header.jsp">
	<jsp:param value="Modification d'exercice" name="nom"/>
	<jsp:param value="css/pages/updateExercice.css" name="style"/>
</jsp:include>



<div id="container">
	
	<form method="post" action="master?updatePost=${ exercice.idExo }">
		<label for="titreExo">Titre</label><br />
		<input type="text" value="${ exercice.titreExo }" name="titreExo" id="titreExo" tabindex="1"/>
		<br>
		<textarea class="mceForm" name="content">${ exercice.content }</textarea>
		<input type="submit" value="Modify" />
	</form>
	
</div>


<%@include file="partials/footer.jsp" %>