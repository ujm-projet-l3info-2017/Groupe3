<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link href="style/style.css" media="screen" rel="stylesheet" />
		
		<% if (session == null) { %>
		
		<title>Kolegia : Frémir de joie d'apprendre</title>
		
		<% }else { %>
		
		<title>Kolegia : Débriefing</title>
		
		<% } %>
	</head>
	
	<body>
		<%@ include file="header.jsp" %>
		
		<section>
			<% if (session == null) { %>
			
			<!-- question du jour -->
			<%@ include file="question.jsp" %>
			
			<% } else { %>
			
			<!-- Carte des étoiles -->
			
			<%@ include file="carte.jsp" %>
			<%} %>
			
			<!-- Explications -->
			<h3>Petit tuto</h3>
			
			<!-- Diapo ici -->
			
		</section>
	</body>
</html>