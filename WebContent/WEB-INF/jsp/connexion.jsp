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
                <br />

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['motdepasse']}</span>
                <br />

                <input type="submit" value="Connexion" class="sansLabel" />
                <br />
                
                <p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
           
           		<%-- Vérification de la présence d'un objet utilisateur en session --%>
           		<c:if test="${!empty sessionScope.sessionUtilisateur }">
           			<%-- Si l'utilisateur existe en session, alors on affiche son adresse mail --%>
           			<p class="succes">Vous êtes connecté(e) avec l'adresse :
           			${ sessionScope.sessionUtilisateur.identifiant }</p>
           		
           		</c:if>
            </fieldset>
        </form>

    <jsp:include page="partials/footer.jsp"></jsp:include>
