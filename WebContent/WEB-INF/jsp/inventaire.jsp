	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<jsp:include page="partials/header.jsp">
		<jsp:param value="Inventaire" name="nom"/>
		<jsp:param value="navigation_eleve.jsp" name="nav"/>
		<jsp:param value="css/home.css" name="style"/>
	</jsp:include>
		<script type="text/javascript" src="js/reponse.js"></script>
		<style>
		
			#bloc_inventaire {
				margin: auto;
				text-align: center;
				display : inline-block;
			}
			
			.buttonInventaire {
				padding: 15px 25px;
				margin: 10px;
				font-size: 24px;
				text-align: center;
				cursor: pointer;
				outline: none;
				color: #800000;
				font-size : 30px;
				/*background-color: #E46C0A;*/
				border: none;
				border-radius: 15px;
				box-shadow: 0 9px #999;
				height: 200px;
				width: 200px;
			}
			
			#bout1{
				background : url("../ressources/avent.png");
				background-size: contain;
				background-color: #E46C0A;
			}
			
			#bout2{
				background : url("../ressources/maitre.png");
				background-size: contain;
				background-color: #E46C0A;
			}
			
			.buttonInventaire:active {
				background-color: #3e8e41;
				box-shadow: 0 5px #666;
				transform: translateY(4px);
			}
		</style>
		<script type="text/javascript">
		    function redirect_market()
		    {
		    var url = "Marche";
		    window.location.assign(url);
		    }
		    function redirect_equipment()
		    {
		    var url = "Equipement";
		    window.location.assign(url);
		    }
		</script>	
		
		<div class="content">

			
			<c:choose>
				<c:when test="${ sessionScope.sessionUtilisateur == null }">
						<%@include file="question.jsp" %>
				</c:when>
				<c:otherwise>
					<jsp:include page="partials/structure.jsp"></jsp:include>
				
						<div id="contentE">
							<div id="bloc_inventaire">
								<button id="bout1" class="buttonInventaire" onClick="redirect_market()">Accéder au marché</button>
								<div class="descript_marche">
									<span>Ici, vous accédez au marché dans lequel vous pourrez achetez de nouveaux équipements, des bonus, ou encore les revendre contre de l'or, les échangez contre d'autres ressources.</span> 
								</div>
								<button id="bout2" class="buttonInventaire" onClick="redirect_equipment()">Accéder à mon Inventaire</button>
								<div class="descript_inventaire"></div>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
	
	
	<jsp:include page="partials/footer.jsp"></jsp:include>