<style>
/* Dropdown Button */
.dropbtn {
    background-color: #ff3300;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    z-index: 1;	
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
    z-index: 1;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    z-index: 1;
    background-color: #e62e00;
    min-width: 160px;
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    text-color : white;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover{
	background-color: #f1f1f1;
	text-decoration : none;
	text-color : white;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
    display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
    background-color: #cc0000;
}

.title{
	color : inherit;
	text-decoration : none;
	text-color : white;
}
</style>

<script type="text/javascript">
	function redirect_profil()
	{
		var url = "ProfilM";
		window.location.assign(url);
	}
	function redirect_exercice()
	{
		var url = "AjoutExo";
		window.location.assign(url);
	}
</script>

<nav>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_profil()">Mon Coin</button>
	  <div class="dropdown-content">
	    <a href="ProfilM">Mon profil</a>
		<a href="#">Paramètres</a>
		<a href="#">Modifier Compte</a>
		<a href="#">Accomplissements</a>
		<a href="#">Médailles</a>
		<a href="deconnexion">Log Out</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_cours()">Mes Cours</button>
	  <div class="dropdown-content">
	    <a href="#">Mes cours</a>
	    <a href="#">Ajouter un cours</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_exercice()">Exercices</button>
	  <div class="dropdown-content">
	    <a href="AjoutExo">Ajouter</a>
	    <a href="CorrectionMaster">Corriger</a>
	  </div>
	</div>
</nav>

	<a href="deconnexion" class="bouton_deco">Déconnexion</a>
	
	  