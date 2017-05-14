	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="partials/header.jsp">
		<jsp:param value="Modifier ses informations" name="nom"/>
		<jsp:param value="navigation_eleve.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>

	<style>
		#modif_prenom{
			padding-top : 20px;
		}
		form{
			padding-left : 20px;
			padding-right : 20px;
		}
		label{	
			display: block; /* La balise devient de type block. */
			width: 300px;
			float : left;
			padding-left : 50px;
			font-weight : bold;
		}
	</style>

		<div class="content">
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur == null }">
						<%@include file="question.jsp" %>
				</c:when>
				<c:otherwise>
					<jsp:include page="partials/structure.jsp"></jsp:include>
						<div id="contentE">
							<form id = "modif_prenom" method = "post" action = "">
								<p>
									<label for="pseudo">Prénom </label> 
									<input
										type="text" name="prenom" id="prenom"
										value="" size="20"
										maxlength="60" 
									/> 
									<span class="erreur">${ form.erreurs['prenom'] }</span>
									<button type = "submit" class="sansLabel">Modifier prénom</button>
								</p>
							</form>
							<form id = "modif_nom" method = "post" action = "">
								<hr>
								<p>
									<label for="pseudo">Nom</label> 
										<input
											type="text" name="nom" id="nom"
											value="" size="20"
											maxlength="60" 
										/> 
										<span class="erreur">${ form.erreurs['nom'] }</span>
										<button type = "submit" class="sansLabel">Modifier nom</button>
								</p>
							</form>
							<form id = "modif_mail" method = "post" action = "">
								<hr>
								<p>
									<label for="mail">Email</label> 
										<input
											type="text" name="mail" id="mail"
											value="" size="20"
											maxlength="60" /> 
										<span class="erreur">${ form.erreurs['mail'] }</span>
										<button type = "submit" class="sansLabel">Modifier email</button>
								</p>
							</form>
							<form id = "modif_passe" method = "post" action = "">
								<hr>
								<p>
									<label for="passe">Ancien mot de passe <span class="requis"></span></label>
									<input type="password" name="passe" id="passe" size="20"
										maxlength="60" /> <span class="erreur">${ form.erreurs['passe'] }</span>
								</p>
								<p>
									<label for="passe_new">Nouveau mot de passe <span
										class="requis"></span></label> <input type="password" name="passe_new"
										id="passe_new" size="20" maxlength="60" />
								</p>
								<label for="passe_con">Confimation du nouveau mot de passe <span
										class="requis"></span></label> <input type="password" name="passe_con"
										id="passe_con" size="20" maxlength="60" />
										<button type = "submit" class="sansLabel">Modifier mot de passe</button>
								</p>
							</form>
							<form id = "modif_niveau" method = "post" action = "">
								<hr>
								<p>
									<label for="niveau">Niveau </label> 
										<select name="niveau" id="niveau">
											<option value="6ème">6ème</option>
											<option value="5ème">5ème</option>
											<option value="4ème">4ème</option>
											<option value="3ème">3ème</option>
											<option value="2nde">2nde</option>
											<option value="1ère">1ère</option>
											<option value="Terminale">Terminale</option>
										</select>
									<button type = "submit" class="sansLabel">Modifier niveau</button>
								</p>
								<br />
								<span class="${ empty form.erreurs ? 'succes' : 'erreur' }">${ form.resultat }</span>
							</form>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		
		</div>


	
	<jsp:include page="partials/footer.jsp"></jsp:include>
