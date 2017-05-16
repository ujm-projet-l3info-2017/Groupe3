	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../partials/header.jsp">
		<jsp:param value="Correction Exercices" name="nom"/>
		<jsp:param value="navigation_maitre.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>



	
	<script  type="text/javascript">
	function commande(nom, argument) {
		  if (typeof argument === 'undefined') {
		    argument = '';
		  }
		  // Exécuter la commande
		  document.execCommand(nom, false, argument);
		}
	</script>
			<div class="content">
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Maitres' }">
						
						<jsp:include page="../partials/structmaster.jsp"></jsp:include>
				
						  <div id="contentE" style="z-index: -1000;">
								<div >
							    <h2 style="margin:0;padding-top:50px;">Ajout d'exercice</h2>
							    <input  type="button" value="G" style="font-weight: bold;" onclick="commande('bold');" />
								<input type="button" value="I" style="font-style: italic;" onclick="commande('italic');" />
								<input type="button" value="S" style="text-decoration: underline;" onclick="commande('underline');" />
								<input type="text" value="titre de l'exercice..." style=" border: 2px solid black; width: 90%; padding: 10px; float: left;font-size: 16px;"/>
								<div id="editeur"  contentEditable="true"></div>
								<button class="button" type = "submit">Ajouter</button>
								</div>
						</div> 
						</div>

						
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
		</div>
	
	
<jsp:include page="../partials/footer.jsp"></jsp:include>