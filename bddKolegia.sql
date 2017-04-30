DROP DATABASE IF EXISTS bddKolegia ;
CREATE DATABASE bddKolegia CHARACTER SET 'utf8';
USE bddKolegia;

DROP TABLE IF EXISTS Utilisateurs;
DROP TABLE IF EXISTS Aventuriers;
DROP TABLE IF EXISTS Maitres;
<<<<<<< HEAD

DROP TABLE IF EXISTS Questions;
DROP TABLE IF EXISTS CreationQuestion;
DROP TABLE IF EXISTS AssemblageExos;
DROP TABLE IF EXISTS Exercices;
DROP TABLE IF EXISTS CorrectionMaitre;
DROP TABLE IF EXISTS ContenuExercice;

DROP TABLE IF EXISTS Reponses;
DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS Labelisation;

DROP TABLE IF EXISTS Resolution;

DROP TABLE IF EXISTS Accomplissements;
DROP TABLE IF EXISTS AvoirAcompli;

DROP TABLE IF EXISTS EquipementBonus;
DROP TABLE IF EXISTS EnInventaire;

DROP TABLE IF EXISTS GuildePrincipale;
DROP TABLE IF EXISTS GuildeSecondaire;


CREATE TABLE Utilisateurs (
idUser INT ( 12 ) NOT NULL AUTO_INCREMENT ,
email VARCHAR ( 64 ) NOT NULL,
pseudo VARCHAR ( 60 ) NOT NULL,
prenom VARCHAR ( 32 ) NOT NULL,
nom VARCHAR ( 32 ) NOT NULL,
password VARCHAR( 64 ) NOT NULL,
departement VARCHAR ( 64 ) NOT NULL,
college VARCHAR ( 64 ) NOT NULL,
=======
DROP TABLE IF EXISTS Exercices;
DROP TABLE IF EXISTS Questions;
DROP TABLE IF EXISTS Reponses;
DROP TABLE IF EXISTS Tags;
DROP TABLE IF EXISTS Labelisation;
DROP TABLE IF EXISTS Contenu;
DROP TABLE IF EXISTS CorrectionMaitre;
DROP TABLE IF EXISTS Resolution;
DROP TABLE IF EXISTS GuildePrincipale;
DROP TABLE IF EXISTS GuildeSecondaire;
DROP TABLE IF EXISTS Accomplissements;
DROP TABLE IF EXISTS Inventaire;

CREATE TABLE Utilisateurs (
idUser INT( 12 ) NOT NULL AUTO_INCREMENT ,
email VARCHAR( 64 ) NOT NULL,
pseudo VARCHAR( 60 ) NOT NULL,
prenom VARCHAR( 32 ) NOT NULL,
nom VARCHAR( 32 ) NOT NULL,
password VARCHAR( 64 ) NOT NULL,
departement VARCHAR( 64 ) NOT NULL,
college VARCHAR( 64 ) NOT NULL,
>>>>>>> master
niveau VARCHAR(9) NOT NULL,
date_inscription DATETIME NOT NULL,
typeUser VARCHAR(11) NOT NULL,
PRIMARY KEY ( idUser ),
UNIQUE ( email ),
UNIQUE ( pseudo )
)
ENGINE=InnoDB;

CREATE TABLE Aventuriers (
<<<<<<< HEAD
idAventurier INT ( 12 ),
=======
idHero INT( 12 ),
>>>>>>> master
lvl INT UNSIGNED NOT NULL,
expTotale INT UNSIGNED NOT NULL,
gold INT UNSIGNED NOT NULL,
rubis INT UNSIGNED NOT NULL,
saphir INT UNSIGNED NOT NULL,
classe ENUM('Guerrier','Mage','Guérisseur','Voleur'),
<<<<<<< HEAD
armureCourante VARCHAR ( 64 ) NOT NULL,
accessoireTeteCourant VARCHAR ( 64 ) NOT NULL,
bouclierCourant VARCHAR ( 64 ) NOT NULL,
armeCourante VARCHAR ( 64 ) NOT NULL,
=======
armureCourante VARCHAR( 64 ) NOT NULL,
accessoireTeteCourant VARCHAR( 64 ) NOT NULL,
bouclierCourant VARCHAR( 64 ) NOT NULL,
armeCourante VARCHAR( 64 ) NOT NULL,
>>>>>>> master
genreHeros ENUM('Masculin','Féminin'),
couleurPeau ENUM('Très claire','Claire','Intermédiaire','Méditerranéen','Foncée','Très foncée'),
coupeCheveux ENUM('Blanc','Brun','Blond','Roux','Noir'),
couleurShirt ENUM('Noire','Blanche','Bleue','Rouge','Orange','Jaune','Verte','Violette','Rose'),
<<<<<<< HEAD
PRIMARY KEY ( idAventurier ),
FOREIGN KEY ( idAventurier )
	REFERENCES Utilisateurs( idUser )
	ON UPDATE CASCADE ON DELETE CASCADE
=======
PRIMARY KEY ( idHero ),
FOREIGN KEY ( idHero ) REFERENCES Utilisateurs( idUser )
>>>>>>> master
)
ENGINE=InnoDB;

CREATE TABLE Maitres (
<<<<<<< HEAD
idMaitre INT ( 12 )	,
enseignement VARCHAR ( 32 ) NOT NULL,
lvl INT UNSIGNED NOT NULL,
PRIMARY KEY ( idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Utilisateurs( idUser )
	ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Questions (
idQuestion INT ( 12 ) NOT NULL AUTO_INCREMENT,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
niveauDifficulte ENUM('Lapin','Gnome','Gobelin','Orc','Dragon','Démon'),
typeExo ENUM('QCM','Résultat','Texte à trou','Dessin'),
PRIMARY KEY ( idQuestion )
)
ENGINE=InnoDB;

CREATE TABLE CreationQuestion (
idQuestion INT ( 12 ),
idCreateur int ( 12 ),
dateCreation DATETIME NOT NULL,
PRIMARY KEY ( idQuestion, idCreateur, dateCreation),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions ( idQuestion )
	ON DELETE CASCADE,
FOREIGN KEY ( idCreateur )
	REFERENCES Maitres ( idMaitre )
	ON DELETE CASCADE
=======
idMaitre INT( 12 ),
enseignement VARCHAR( 32 ) NOT NULL,
lvl INT UNSIGNED NOT NULL,
PRIMARY KEY ( idMaitre ),
FOREIGN KEY ( idMaitre ) REFERENCES Utilisateurs( idUser )
>>>>>>> master
)
ENGINE=InnoDB;

CREATE TABLE Exercices (
<<<<<<< HEAD
idExo INT ( 24 )  NOT NULL AUTO_INCREMENT,
titreExo VARCHAR( 64 ) NOT NULL,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
PRIMARY KEY ( idExo )
)
ENGINE=InnoDB;

CREATE TABLE AssemblageExos (
idExo INT ( 24 ),
idAssembleur INT ( 12 ),
dateAssemblement DATETIME NOT NULL,
PRIMARY KEY ( idExo, idAssembleur, dateAssemblement ),
FOREIGN KEY ( idExo )
	REFERENCES Exercices( idExo ),
FOREIGN KEY ( idAssembleur )
	REFERENCES Maitres( idMaitre )
)
ENGINE=InnoDB;

CREATE TABLE CorrectionMaitre (
idEleve INT ( 12 ),
noteAttribuee INT ( 12 ) NOT NULL,
commentaire VARCHAR ( 64 ),
idExo INT ( 12 ),
idMaitre INT ( 12 ),
dateCorrection DATETIME NOT NULL,
PRIMARY KEY ( idEleve, idExo, idMaitre, dateCorrection ),
FOREIGN KEY ( idEleve )
	REFERENCES Aventuriers( idAventurier ),
FOREIGN KEY ( idExo )
	REFERENCES Exercices( idExo ),
FOREIGN KEY ( idMaitre )
	REFERENCES Maitres( idMaitre )
)
ENGINE=InnoDB;

CREATE TABLE ContenuExercice ( 
numeroQ INT ( 12 ) NOT NULL,
idExo INT ( 12 ),
idQuestion INT ( 12 ),
PRIMARY KEY ( idExo, idQuestion, numeroQ ),
FOREIGN KEY ( idExo )
	REFERENCES Exercices( idExo )
	ON DELETE CASCADE,
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion )
=======
idExo INT(24),
idMaitre INT( 12 ),
titreExo VARCHAR( 64 ) NOT NULL,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
PRIMARY KEY ( idExo ),
FOREIGN KEY ( idMaitre ) REFERENCES Maitres( idMaitre ) 
)
ENGINE=InnoDB;

CREATE TABLE Questions (
idQuestion INT ( 12 ),
idMaitre INT ( 12 ),
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
niveauDifficulte ENUM('Lapin','Gnome','Gobelin','Orc','Dragon','Démon'),
typeExo ENUM('QCM','Résultat','Texte à trou','Dessin'),
PRIMARY KEY ( idQuestion ),
FOREIGN KEY ( idMaitre ) REFERENCES Maitres( idMaitre )
>>>>>>> master
)
ENGINE=InnoDB;

CREATE TABLE Reponses (
<<<<<<< HEAD
idReponse INT ( 12 )  NOT NULL AUTO_INCREMENT,
=======
idReponse INT ( 12 ),
>>>>>>> master
idQuestion INT ( 12 ),
texteReponse VARCHAR ( 64 ) NOT NULL,
statutReponse ENUM('valide','invalide'),
PRIMARY KEY ( idReponse ),
<<<<<<< HEAD
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Tags (
idTag INT ( 12 )  NOT NULL AUTO_INCREMENT,
intituleTag VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idTag )
)
ENGINE=InnoDB;

CREATE TABLE Labelisation (
idQuestion INT ( 12 ),
idTag INT ( 12 ),
PRIMARY KEY ( idQuestion, idTag ),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion ),
FOREIGN KEY ( idTag )
	REFERENCES Tags( idTag )
)
ENGINE=InnoDB;

CREATE TABLE Resolution (
idResolveur INT ( 12 ),
idExo INT ( 12 ),
dateResolution DATETIME NOT NULL,
noteAutomatique INT ( 12 ) NOT NULL,
nbCatTF INT ( 12 ), -- catégorie très facile
nbCatF INT ( 12 ),	-- catégorie facile
nbCatN INT ( 12 ),	-- catégorie normale
nbCatM INT ( 12 ),	-- catégorie moyenne
nbCatD INT ( 12 ),	-- catégorie difficile
PRIMARY KEY ( idResolveur, idExo, dateResolution ),
FOREIGN KEY ( idResolveur )
	REFERENCES Aventuriers( idAventurier )
	ON DELETE CASCADE,
FOREIGN KEY ( idExo )
	REFERENCES Exercices( idExo )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Accomplissements (
idAccomplissements INT ( 12 ) AUTO_INCREMENT,
intituleAccomp VARCHAR ( 64 ) NOT NULL,
categorieA VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idAccomplissements )
)
ENGINE=InnoDB;

CREATE TABLE AvoirAcompli (
idHero INT ( 12 ),
idAccomplissements INT ( 12 ),
dateAccomplissement DATETIME NOT NULL,
PRIMARY KEY ( idHero, idAccomplissements, dateAccomplissement ),
FOREIGN KEY ( idHero )
	REFERENCES Aventuriers( idAventurier )
	ON DELETE CASCADE,
FOREIGN KEY ( idAccomplissements )
	REFERENCES Accomplissements( idAccomplissements )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE EquipementBonus (
idEB INT ( 12 ) AUTO_INCREMENT,
intituleEB VARCHAR ( 64 ) NOT NULL,
categorieEB VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idEB )
)
ENGINE=InnoDB;

CREATE TABLE EnInventaire (
idProprio INT ( 12 ),
idObjet INT ( 12 ),
limiteUsage INT ( 12 ) NOT NULL,
PRIMARY KEY ( idProprio, idObjet, limiteUsage ),
FOREIGN KEY ( idProprio )
	REFERENCES Aventuriers( idAventurier )
	ON DELETE CASCADE,
FOREIGN KEY ( idObjet )
	REFERENCES EquipementBonus( idEB )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE GuildePrincipale (
idGuildeP INT ( 12 ) AUTO_INCREMENT,
idMaitre INT ( 12 ),
nomGuilde VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Maitres( idMaitre )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE MembreGuildeP (
idGuildeP INT ( 12 ),
idHero INT ( 12 ),
dateAdhesion DATETIME NOT NULL,
rang VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idHero, dateAdhesion ),
FOREIGN KEY ( idGuildeP )
	REFERENCES GuildePrincipale( idGuildeP ),
FOREIGN KEY ( idHero )
	REFERENCES Aventuriers( idAventurier )
)
ENGINE=InnoDB;
=======
FOREIGN KEY ( idQuestion ) REFERENCES Questions( idQuestion )
)
ENGINE=InnoDB;

>>>>>>> master
