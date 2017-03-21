<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<link href="style/style.css" media="screen" rel="stylesheet" />
		
		<% if (session == null) { %>
		
		<title>Kolegia : Fr�mir de joie d'apprendre</title>
		
		<% }else { %>
		
		<title>Kolegia : D�briefing</title>
		
		<% } %>
	</head>
	
	<body>
		<%@ include file="header.jsp" %>
		
		<section>
			<% if (session == null) { %>
			
			<!-- question du jour -->
			<%@ include file="question.jsp" %>
			
			<% } else { %>
			
			<!-- Carte des �toiles -->
			
			<%@ include file="carte.jsp" %>
			<%} %>
			
			<!-- Explications -->
			<h3>Petit tuto</h3>
			
			<!-- Diapo ici -->
			
		</section>
	</body>
</html>