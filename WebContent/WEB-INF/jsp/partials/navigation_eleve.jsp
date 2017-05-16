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
		var url = "ProfilA";
		window.location.assign(url);
	}
	function redirect_memo()
	{
		var url = "memos";
		window.location.assign(url);
	}
	function redirect_monde()
	{
		var url = "";
		window.location.assign(url);
	}
	function redirect_guilde()
	{
		var url = "";
		window.location.assign(url);
	}
	function redirect_inventaire()
	{
		var url = "Inventaire";
		window.location.assign(url);
	}
</script>

<nav>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_profil()">Mon Coin</button>
	  <div class="dropdown-content">
	    <a href="ProfilA">Mon profil</a>
		<a href="#">Paramètres</a>
		<a href="#">Modifier Compte</a>
		<a href="#">Accomplissements</a>
		<a href="#">Médailles</a>
		<a href="deconnexion">Log Out</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_memo()">Mémo</button>
	  <div class="dropdown-content">
	    <a href="#">Recettes (cours)</a>
	    <a href="#">Exercices suivis</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_monde()">Kolegia</button>
	  <div class="dropdown-content">
	    <a href="#">Challenges Globaux</a>
	    <a href="#">News</a>
	    <a href="#">Informations Générales</a>
	    <a href="#">Tutoriels</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_guilde()">Guilde</button>
	  <div class="dropdown-content">
	    <a href="#">Guilde Principale</a>
	    <a href="#">Guilde Secondaire</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn" onClick="redirect_inventaire()">Inventaire</button>
	  <div class="dropdown-content">
	    <a href="Marche">Marché</a>
	    <a href="Equipement">Équipement</a>
	  </div>
	</div>
</nav>

	<a href="deconnexion" class="bouton_deco">Déconnexion</a>