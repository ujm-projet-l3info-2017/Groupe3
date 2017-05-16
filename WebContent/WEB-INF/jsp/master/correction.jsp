	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../partials/header.jsp">
		<jsp:param value="Correction" name="nom"/>
		<jsp:param value="navigation_maitre.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>

		<div class="content">
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Maitres' }">
					<jsp:include page="../partials/structmaster.jsp"></jsp:include>
					<div id="contentE">
						<div class="header">
			    			<h2 style="margin:0; padding-top : 50px;">Correction</h2>
			    		</div>
			 			<input  type="button" value="G" style="font-weight: bold;" onclick="commande('bold');" />
						<input type="button" value="I" style="font-style: italic;" onclick="commande('italic');" />
						<input type="button" value="S" style="text-decoration: underline;" onclick="commande('underline');" />
						<div id="editeur"  contentEditable="true"></div>
						<button class="button" type = "submit">Ajouter</button>
					</div>
					</div>
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
		</div>

	<jsp:include page="../partials/footer.jsp"></jsp:include>
	