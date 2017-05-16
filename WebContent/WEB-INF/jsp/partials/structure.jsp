			<style>
				#avatarE{
					/*padding-bottom: 20px;*/
					text-align: center;
				}
				.barreRessources{
					padding-top: 0;
					/*padding-bottom: 20px;*/
					text-align: center;
				}
				.inforpg{
					/*padding-bottom: 20px;*/
					text-align: center;
				}
				.options{
					text-align: center;
				}	
				.pseudo{
					text-align: center;
				}			
			</style>
			
			<div id="mainE">
				<div id="menuE">
					<div id="avatarE"></div>
					<div class="pseudo">
						<a href="ProfilA">${ sessionScope.sessionUtilisateur.pseudo }</a><hr>
					</div>
					
					<div class="barreRessources">
						<span class="gold">${ sessionScope.sessionAventurier.gold } Pièce(s) d'or</span><br>
						<span class="rubis">${ sessionScope.sessionAventurier.rubis } Rubis</span><br>
						<span class="saphir">${ sessionScope.sessionAventurier.saphir } Saphir</span>
					</div>
					<hr>
					<div class="inforpg">
						<span class="level">Niveau ${ sessionScope.sessionAventurier.lvl }</span><br>
						<span class="xptot">${ sessionScope.sessionAventurier.expTotale } total xp</span><br>
						<span class="xpcurrent">0 / 100 xp <br>(jusqu'au niveau suivant)</span>
					</div>
					<hr>
					<div class="options">
						<a href="">Accès Carte</a><br>
						<a href="user?action=do_exercice&&id_exo=${ id_aleatoire }">Quête au hasard</a>
					</div>
				</div>
				
				