<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="css/style.css" />
		<link type="text/css" rel="stylesheet" href= "${ param.style }" />
		<title>${ param.nom }</title>
	</head>
<body>
	<div class="wrapper">
		<div class="header">
			<script type="text/javascript">
				function redirect_home()
				{
					var url = "home";
					window.location.assign(url);
				}
			</script>
			<div id="logo">
				<button id="buttonLogo" onClick="redirect_home()"></button>
			</div>
			
		
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur == null }">
					<%@include file="navigation_invite.jsp" %>
				</c:when>
				
				<c:otherwise>
					<c:choose>
						<c:when test="${ sessionScope.sessionUtilisateur.typeUser == 'Aventuriers' }">
							<%@include file="navigation_eleve.jsp" %>
						</c:when>
						
						<c:otherwise>
							<%@include file="navigation_maitre.jsp" %>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		
		</div>
	