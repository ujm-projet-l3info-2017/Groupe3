	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<jsp:include page="partials/header.jsp">
		<jsp:param value="Kolegia : Frémir de joie d'apprendre" name="nom"/>
		<jsp:param value="navigation_invite.jsp" name="nav"/>
	</jsp:include>
		<script type="text/javascript" src="js/reponse.js"></script>
		
		<div class="content">
		<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur == null }">
					<%@include file="question.jsp" %>
				</c:when>
				
				<c:otherwise>
					<c:choose>
						<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Aventuriers' }">
							<%@include file="home_eleve.jsp" %>
						</c:when>
						
						<c:otherwise>
							<%@include file="coursMaitre.jsp" %>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</div>
		
	
	<jsp:include page="partials/footer.jsp"></jsp:include>
