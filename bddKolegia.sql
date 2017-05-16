DROP DATABASE IF EXISTS bddKolegia ;
CREATE DATABASE bddKolegia CHARACTER SET 'utf8';
USE bddKolegia;

DROP TABLE IF EXISTS Utilisateurs;
DROP TABLE IF EXISTS Aventuriers;
DROP TABLE IF EXISTS Maitres;
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
idUser INT NOT NULL AUTO_INCREMENT ,
email VARCHAR( 254 ) NOT NULL,
pseudo VARCHAR( 254 ) NOT NULL,
prenom VARCHAR( 254 ) NOT NULL,
nom VARCHAR( 254 ) NOT NULL,
password VARCHAR( 254 ) NOT NULL,
departement VARCHAR ( 254 ),
college VARCHAR ( 254 ),
niveau VARCHAR(254) NOT NULL,
date_inscription DATETIME NOT NULL,
typeUser VARCHAR(254) NOT NULL,
PRIMARY KEY ( idUser ),
UNIQUE ( email ),
UNIQUE ( pseudo )
)
ENGINE=InnoDB;

CREATE TABLE Aventuriers (
idAventurier INT,
lvl INT UNSIGNED NOT NULL DEFAULT '0',
expTotale INT UNSIGNED NOT NULL DEFAULT '0',
gold INT UNSIGNED NOT NULL DEFAULT '0',
rubis INT UNSIGNED NOT NULL DEFAULT '0',
saphir INT UNSIGNED NOT NULL DEFAULT '0',
classe ENUM('Guerrier','Mage','Guérisseur','Voleur'),
armureCourante VARCHAR ( 254 ),
accessoireTeteCourant VARCHAR ( 254 ),
bouclierCourant VARCHAR ( 254 ),
armeCourante VARCHAR ( 254 ),
genreHeros ENUM('Masculin','Féminin'),
couleurPeau ENUM('Très claire','Claire','Intermédiaire','Méditerranéen','Foncée','Très foncée'),
coupeCheveux ENUM('Blanc','Brun','Blond','Roux','Noir'),
couleurShirt ENUM('Noire','Blanche','Bleue','Rouge','Orange','Jaune','Verte','Violette','Rose'),
PRIMARY KEY ( idAventurier ),
FOREIGN KEY ( idAventurier )
	REFERENCES Utilisateurs( idUser )
	ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Maitres (
idMaitre INT,
enseignement VARCHAR ( 254 ) NOT NULL,
lvl INT UNSIGNED NOT NULL DEFAULT '0',
PRIMARY KEY ( idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Utilisateurs( idUser )
	ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;


CREATE TABLE Exercices (
idExo INT,
idMaitre INT,
titreExo VARCHAR (254) NOT NULL,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
PRIMARY KEY ( idExo ),
FOREIGN KEY ( idMaitre ) REFERENCES Maitres( idMaitre ) 
)
ENGINE=InnoDB;

CREATE TABLE Questions (
idQuestion INT ,
idMaitre INT ,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
niveauDifficulte ENUM('Lapin','Gnome','Gobelin','Orc','Dragon','Démon'),
typeExo ENUM('QCM','Résultat','Texte à trou','Dessin'),
PRIMARY KEY ( idQuestion ),
FOREIGN KEY ( idMaitre ) REFERENCES Maitres( idMaitre )
)
ENGINE=InnoDB;

CREATE TABLE Reponses (
idReponse INT ,
idQuestion INT ,
texteReponse VARCHAR ( 254 ) NOT NULL,
statutReponse ENUM('valide','invalide'),
PRIMARY KEY ( idReponse ),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Tags (
idTag INT   NOT NULL AUTO_INCREMENT,
intituleTag VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idTag )
)
ENGINE=InnoDB;

CREATE TABLE Labelisation (
idQuestion INT ,
idTag INT ,
PRIMARY KEY ( idQuestion, idTag ),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion ),
FOREIGN KEY ( idTag )
	REFERENCES Tags( idTag )
)
ENGINE=InnoDB;

CREATE TABLE Resolution (
idResolveur INT ,
idExo INT ,
dateResolution DATETIME NOT NULL,
noteAutomatique INT NOT NULL,
nbCatTF INT NOT NULL DEFAULT '0', -- catégorie très facile
nbCatF INT NOT NULL DEFAULT '0',	-- catégorie facile
nbCatN INT NOT NULL DEFAULT '0',	-- catégorie normale
nbCatM INT NOT NULL DEFAULT '0',	-- catégorie moyenne
nbCatD INT NOT NULL DEFAULT '0',	-- catégorie difficile
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
idAccomplissements INT AUTO_INCREMENT,
intituleAccomp VARCHAR ( 254 ) NOT NULL,
categorieA VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idAccomplissements )
)
ENGINE=InnoDB;

CREATE TABLE AvoirAcompli (
idHero INT,
idAccomplissements INT ,
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
idEB INT AUTO_INCREMENT,
intituleEB VARCHAR ( 254 ) NOT NULL,
categorieEB VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idEB )
)
ENGINE=InnoDB;

CREATE TABLE EnInventaire (
idProprio INT,
idObjet INT ,
limiteUsage INT NOT NULL,
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
idGuildeP INT AUTO_INCREMENT,
idMaitre INT,
nomGuilde VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Maitres( idMaitre )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE MembreGuildeP (
idGuildeP INT ,
idHero INT ,
dateAdhesion DATETIME NOT NULL,
rang VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idHero, dateAdhesion ),
FOREIGN KEY ( idGuildeP )
	REFERENCES GuildePrincipale( idGuildeP ),
FOREIGN KEY ( idHero )
	REFERENCES Aventuriers( idAventurier )
)
ENGINE=InnoDB;

