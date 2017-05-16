	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../partials/header.jsp">
		<jsp:param value="Le Marché de Kolegia" name="nom"/>
		<jsp:param value="navigation_eleve.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>
		<script type="text/javascript" src="js/reponse.js"></script>
		
		
		<div class="content">
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Aventuriers' }">
						
						<jsp:include page="../partials/structure.jsp"></jsp:include>
						<div id="contentE">
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
				

		</div>
		
	
	
	<jsp:include page="../partials/footer.jsp"></jsp:include>