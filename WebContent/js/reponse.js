var boutonRep = document.getElementsByClassName('bouton_rep');
var bonneReponse = document.getElementById('bonne_reponse');

for (var i = 0; i < boutonRep.length; i++) {
	boutonRep[i].addEventListener("click", function (b) {
		if (b == bonneReponse) {
			bonneReponse.style.backgroundColor = "rgb(10,255,0)";

		}
		else {
			this.style.backgroundColor = "rgb(192,255,0)";
			bonneReponse.style.backgroundColor = "rgb(10,255,0)";
		}
		desactiver_hover();
		var explication = document.getElementById('reponse');
		
		explication.style.display = 'block';
	});
}

function desactiver_hover() {
	for (var i=0; i < boutonRep.length; i++) {
		boutonRep[i].style.color = "white";
		boutonRep[i].style.border = "0px solid black";
	}
	
}