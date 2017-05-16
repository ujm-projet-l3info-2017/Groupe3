	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../partials/header.jsp">
		<jsp:param value="Mon profil" name="nom"/>
		<jsp:param value="navigation_master.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>
		<script type="text/javascript" src="js/reponse.js"></script>
		
		
		<div class="content">
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Maitres' }">
					<jsp:include page="../partials/structure.jsp"></jsp:include>
						<div id="contentE" style="padding-left: 50px;padding-right:50px;">
								<h3 style="margin:0;padding-top : 50px;">Bonjour, Grand Maître !</h3>
								<p>
									Voici vos informations :<br><hr>
									Prénom : ${ sessionScope.sessionUtilisateur.prenom }<hr>
									Nom : ${ sessionScope.sessionUtilisateur.nom }<hr>
									email : ${ sessionScope.sessionUtilisateur.email }<hr>
								</p>
								<a href="ModiProfilAventurier">Modifier profil</a>				
	
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
				

		</div>
		
	
	
	<jsp:include page="../partials/footer.jsp"></jsp:include>