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
					<jsp:include page="../partials/structmaster.jsp"></jsp:include>
						<div id="contentE" style="padding-left: 50px;padding-right:50px;">

				  			  <h2 style="margin:5px">Ajout d'exercice</h2>
				    
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
								</div>
					</div>
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
				

		</div>
	
<!-- 	<script  type="text/javascript"> -->
<!-- // 	function commande(nom, argument) { -->
<!-- // 		  if (typeof argument === 'undefined') { -->
<!-- // 		    argument = ''; -->
<!-- // 		  } -->
<!-- // 		  // Exécuter la commande -->
<!-- // 		  document.execCommand(nom, false, argument); -->
<!-- // 		} -->
<!-- 	</script> -->
	<jsp:include page="../partials/footer.jsp"></jsp:include>
	