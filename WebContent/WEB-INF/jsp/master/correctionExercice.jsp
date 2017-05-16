	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../partials/header.jsp">
		<jsp:param value="Correction Exercices" name="nom"/>
		<jsp:param value="navigation_maitre.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>

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
	<script>
		var list = document.querySelector('ul');
		list.addEventListener('click', function(e) {
		  if (e.target.tagName === 'LI') {
			 //ici on va afficher le contenu de l'exercice
		  }
		}, false);
		
		//ajout des boutton ajouter pour chaque item
		var myNodelist = document.getElementsByTagName("LI");
		var i;
		for (i = 0; i < myNodelist.length; i++) {
		  var span = document.createElement("SPAN");
		  var txt = document.createTextNode("Corriger");
		  span.className = "correct";
		  span.appendChild(txt);
		  myNodelist[i].appendChild(span);
		}
		
		//Click sur le button corriger pour corriger l'exercice
		var list = document.getElementsByClassName("correct");
		var i;
		for (i = 0; i < list.length; i++) {
		  list[i].onclick = function() {
			  window.location = "correction.jsp";
		  }
		}
	</script>

		<div class="content">	
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Maitres' }">
					<jsp:include page="../partials/structmaster.jsp"></jsp:include>
						<div id="contentE">
							<div id="myDIV">
  							<h2 style="margin:0; padding-top : 50px;">Liste des exercices</h2>
							</div>
							<ul id="liste">
							  <li>Exercice1</li>
							  <li>Exercice2</li>
							  <li>Exercice3</li>
							</ul>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
		</div>
		
		
	<jsp:include page="../partials/footer.jsp"></jsp:include>
