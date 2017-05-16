	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="../partials/header.jsp">
		<jsp:param value="Correction Exercices" name="nom"/>
		<jsp:param value="navigation_maitre.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>

		<style>
		/* Style the input */
		#myInput {
		  border: none;
		  width: 75%;
		  padding: 10px;
		  float: left;
		  font-size: 16px;
		}
		</style>
		
		<div class="content">	
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Maitres' }">
					<jsp:include page="../partials/structmaster.jsp"></jsp:include>
						<div id="contentE">
		
							<div id="myDIV" class="header" style="z-index:-100">
							  <h2 style="margin:5px">Liste des cours</h2>
							  <input type="text" id="myInput" placeholder="Titre de cours...">
							  <span onclick="nouveauElement()" class="addBtn">Ajouter</span>
							</div>
							
							<ul id="liste">
							  <li>Geometrie</li>
							  <li>Fonctions</li>
							  <li>Calcul</li>
							</ul>
							</div>
					</div>
				</c:when>
				<c:otherwise>
					<%@include file="../question.jsp" %>
				</c:otherwise>
			</c:choose>
		</div>	
		
		
			
		<script>
		// Create a "close" button and append it to each list item
		var myNodelist = document.getElementsByTagName("LI");
		var i;
		for (i = 0; i < myNodelist.length; i++) {
		  var span = document.createElement("SPAN");
		  var txt = document.createTextNode("\u00D7");
		  span.className = "close";
		  span.appendChild(txt);
		  myNodelist[i].appendChild(span);
		}
		
		// Click on a close button to hide the current list item
		var close = document.getElementsByClassName("close");
		var i;
		for (i = 0; i < close.length; i++) {
		  close[i].onclick = function() {
		    var div = this.parentElement;
		    div.style.display = "none";
		  }
		}
		//go to liste exos of an item
		var list = document.querySelector('ul');
		list.addEventListener('click', function(e) {
		  if (e.target.tagName === 'LI') {
			  window.location = "listeExercices.jsp";
		  }
		}, false);
		
		
		// Create a new list item when clicking on the "Add" button
		function nouveauElement() {
		  var li = document.createElement("li");
		  var inputValue = document.getElementById("myInput").value;
		  var t = document.createTextNode(inputValue);
		  li.appendChild(t);
		  if (inputValue === '') {
		    alert("Veuillez saisir un titre de cours à ajouter");
		  } else {
		    document.getElementById("liste").appendChild(li);
		  }
		  document.getElementById("myInput").value = "";
		
		  var span = document.createElement("SPAN");
		  var txt = document.createTextNode("\u00D7");
		  span.className = "close";
		  span.appendChild(txt);
		  li.appendChild(span);
		
		  for (i = 0; i < close.length; i++) {
		    close[i].onclick = function() {
		      var div = this.parentElement;
		      div.style.display = "none";
		    }
		  }
		}
		</script>
		
		<jsp:include page="../partials/footer.jsp"></jsp:include>
