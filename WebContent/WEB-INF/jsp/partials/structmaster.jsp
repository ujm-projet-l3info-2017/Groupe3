			<style>
				#avatarM{
					/*padding-bottom: 20px;*/
					text-align: center;
				}
				.inforpg{
					/*padding-bottom: 20px;*/
					text-align: center;
				}
				.infos{
					text-align: center;
				}			
			</style>

			<div id="mainE">
				<div id="menuE">
					<div id="avatarE"></div>
					<div class="infos">
						<a href="ProfilM">${ sessionScope.sessionUtilisateur.pseudo }</a><br>
						<span class="enseignement"> Maître de ${ sessionScope.sessionMaitre.enseignement }</span>
					</div>
					<hr>
					<div class="inforpg">
						<span class="level">Niveau ${ sessionScope.sessionMaitre.lvl }</span><br>
					</div>
					<hr>
				</div>