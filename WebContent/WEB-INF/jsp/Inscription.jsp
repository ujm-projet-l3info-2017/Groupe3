<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<jsp:include page="partials/header.jsp">
		<jsp:param value="Inscription" name="nom"/>
		<jsp:param value="navigation_invite.jsp" name="nav"/>
		<jsp:param value="css/inscription.css" name="style"/>
	</jsp:include>

	<script type="text/javascript">
	    function redirect_aventurier()
	    {
	    var url = "inscription_aventurier";
	    window.location.assign(url);
	    }
	    function redirect_maitre()
	    {
	    var url = "inscription_maitre";
	    window.location.assign(url);
	    }
	</script>	
	
	<div class="content">
		<h1>Inscription</h1>
		<div id="bloc_inscription">
			<button id="button1" class="button" onClick="redirect_aventurier()">Aventurier</button>
	
			<button id="button2" class="button" onClick="redirect_maitre()">Maitre</button>
		</div>
	</div>
	<jsp:include page="partials/footer.jsp"></jsp:include>