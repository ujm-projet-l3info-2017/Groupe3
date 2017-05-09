<div class="profile-section">
	<span class="profile-name">${ sessionScope.sessionUtilisateur.pseudo }</span>
</div>

<style>
/* Dropdown Button */
.dropbtn {
    background-color: #ff3300;
    color: white;
    padding: 16px;
    font-size: 16px;
    border: none;
    cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #e62e00;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
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

<nav>
	<div class="dropdown">
	  <button class="dropbtn">Mémo</button>
	  <div class="dropdown-content">
	    <a href="#">Mon profil</a>
		<a href="#">Modifier profil</a>
		<a href="#">Paramètres</a>
		<a href="#">Modifier Compte</a>
		<a href="#">Accomplissements</a>
		<a href="#">Médailles</a>
		<a href="deconnexion">Log Out</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn">Mémo</button>
	  <div class="dropdown-content">
	    <a href="#">Recettes (cours)</a>
	    <a href="#">Exercices suivis</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn">Kolegia</button>
	  <div class="dropdown-content">
	    <a href="#">Challenges Globaux</a>
	    <a href="#">News</a>
	    <a href="#">Informations Générales</a>
	    <a href="#">Tutoriels</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn">Guilde</button>
	  <div class="dropdown-content">
	    <a href="#">Guilde Principale</a>
	    <a href="#">Guilde Secondaire</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn"><a class="title" href="Inventaire">Inventaire</a></button>
	  <div class="dropdown-content">
	    <a href="Marche">Marché</a>
	    <a href="Equipement">Équipement</a>
	  </div>
	</div>
</nav>

	<a href="deconnexion" class="bouton_deco">Déconnexion</a>
