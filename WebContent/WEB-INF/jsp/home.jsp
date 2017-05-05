	<jsp:include page="partials/header.jsp">
		<jsp:param value="Kolegia : Frémir de joie d'apprendre" name="nom"/>
		<jsp:param value="navigation_invite.jsp" name="nav"/>
	</jsp:include>
		<script type="text/javascript" src="js/reponse.js"></script>
		
		<div class="content">
			<section>
				<div id="question">
					<h3>Le savais-tu?</h3>
					<p id="question_jour">D'où vient cette tradition de souffler des bougies lors d'un
						anniversaire ?</p>
			
					<p class="bouton_rep"  id="bonne_reponse">D'un rituel de la Grèce Antique</p>
					<br />
					<p class="bouton_rep">D'une tradition gauloise</p>
					
					<p style="display: none;" id="reponse">
						En effet, cela vient d'un rituel grec ancien...
					</p>
				</div>
			</section>
		</div>
		
	
	<jsp:include page="partials/footer.jsp"></jsp:include>
