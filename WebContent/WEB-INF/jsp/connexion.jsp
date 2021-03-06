	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<jsp:include page="partials/header.jsp">
		<jsp:param value="Connexion" name="nom"/>
		<jsp:param value="navigation_invite.jsp" name="nav"/>
		<jsp:param value="css/form.css" name="style"/>
	</jsp:include>
	<div class="content">
        <form method="post" action="connexion">
            <fieldset>
                <legend>Connexion</legend>
                <p>Vous pouvez vous connecter via ce formulaire.</p>

                <label for="nom">Adresse mail <span class="requis">*</span></label>
                <input type="text" id="identifiant" name="identifiant" value="<c:out value="${utilisateur.email}"/>" size="20" maxlength="60" />
                <span class="erreur">${form.erreurs['email']}</span>
                <br />

                <label for="motdepasse">Mot de passe <span class="requis">*</span></label>
                <input type="password" id="motdepasse" name="motdepasse" value="" size="20" maxlength="20" />
                <span class="erreur">${form.erreurs['motdepasse']}</span>
                <br />

                <input type="submit" value="Connexion" class="sansLabel" />
                <br />
                <div class="result">
					<p class="${empty form.erreurs ? 'succes' : 'erreur'}">${form.resultat}</p>
                </div>
           
           		<%-- V�rification de la pr�sence d'un objet utilisateur en session --%>
           		<c:if test="${!empty sessionScope.sessionUtilisateur }">
           			<%-- Si l'utilisateur existe en session, alors on affiche son adresse mail --%>
           			<p class="succes">Vous �tes connect�(e) avec l'adresse :
           			${ sessionScope.sessionUtilisateur.email }</p>
           		
           		</c:if>
            </fieldset>
        </form>
	</div>
	<jsp:include page="partials/footer.jsp"></jsp:include>