<<<<<<< HEAD
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<jsp:include page="partials/header.jsp">
		<jsp:param value="Kolegia : Connexion" name="nom"/>
	</jsp:include>
	
	<link rel="stylesheet" href="css/form.css" />
	
        <form method="post" action="connexion">
        	<fieldset> 
                <legend>Connexion</legend>
                <p></p>

                <label for="nom">Pseudo <span class="requis">*</span></label>
                <input type="text" id="identifiant" name="identifiant" value="<c:out value="${utilisateur.identifiant}"/>" size="20" maxlength="60" />
                <span class="erreur">${form.erreurs['identifiant']}</span>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Connexion</title>
	<link type="text/css" rel="stylesheet" href="form.css" />
    </head>
    <body>
        <form method="post" action="connexion">
            <fieldset>
                <legend>Connexion</legend>
                <p>Vous pouvez vous connecter via ce formulaire.</p>

                <label for="nom">Adresse mail <span class="requis">*</span></label>
                <input type="text" id="identifiant" name="identifiant" value="<c:out value="${utilisateur.email}"/>" size="20" maxlength="60" />
                <span class="erreur">${form.erreurs['email']}</span>
>>>>>>> master
                <br />

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['motdepasse']}</span>
                <br />

                <input type="submit" value="Connexion" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
           
<<<<<<< HEAD
           		<%-- V�rification de la pr�sence d'un objet utilisateur en session --%>
           		<c:if test="${!empty sessionScope.sessionUtilisateur }">
           			<%-- Si l'utilisateur existe en session, alors on affiche son adresse mail --%>
           			<p class="succes">Vous �tes connect�(e) avec l'adresse :
           			${ sessionScope.sessionUtilisateur.identifiant }</p>
=======
           		<%-- Vérification de la présence d'un objet utilisateur en session --%>
           		<c:if test="${!empty sessionScope.sessionUtilisateur }">
           			<%-- Si l'utilisateur existe en session, alors on affiche son adresse mail --%>
           			<p class="succes">Vous êtes connecté(e) avec l'adresse :
           			${ sessionScope.sessionUtilisateur.email }</p>
>>>>>>> master
           		
           		</c:if>
            </fieldset>
        </form>
<<<<<<< HEAD

    <jsp:include page="partials/footer.jsp"></jsp:include>
=======
    </body>
</html>
>>>>>>> master
