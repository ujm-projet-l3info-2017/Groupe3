<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" />
<title>${ param.nom }</title>
</head>
<body>
	<header>
	<div id="logo">
		<h1>KOLEGIA</h1>
	</div>


	<c:choose>
		<c:when test="${ user == null }">
			<%@include file="navigation_invite.jsp" %>
		</c:when>
		
		<c:otherwise>
			<c:when test="${ user.typeUser == 0 }">
				<%@include file="navigation_eleve.jsp" %>
			</c:when>
			
			<c:otherwise>
				<%@include file="navigation_maitre.jsp" %>
			</c:otherwise>
		</c:otherwise>
	</c:choose>
	
	</header>