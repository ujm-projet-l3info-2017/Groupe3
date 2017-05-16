<jsp:include page="partials/header.jsp">
	<jsp:param value="Résolution" name="nom"/>
	<jsp:param value="css/pages/resolution.css" name="style"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="container">
	<div id="titreExo">${ exercice.titreExo }</div>
	
	<div id="exercice">${ exercice.content }</div>
	
	<c:if test="${ sessionScope.sessionUtilisateur.typeUser == 'Maitres' }">
		<div id="control_panel"><a href="master?action=edit&id_exo=${ exercice.idExo }">Edit</a></div>
	</c:if>
	<!-- Zone de saisie de réponse aux exercices -->
	<form action="user?submitExercice" method="post" id="zone_resolution">
		<textarea name="reponse" class="mceForm"></textarea>
		<input type="submit" value="Submit" />
	</form>
</div>


<%@include file="partials/footer.jsp"%>