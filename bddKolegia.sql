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
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE Aventuriers (
idAventurier INT,
lvl INT UNSIGNED NOT NULL DEFAULT '0',
expTotale INT UNSIGNED NOT NULL DEFAULT '0',
gold INT UNSIGNED NOT NULL DEFAULT '0',
rubis INT UNSIGNED NOT NULL DEFAULT '0',
saphir INT UNSIGNED NOT NULL DEFAULT '0',
classe ENUM('Guerrier','Mage','Guérisseur','Voleur') DEFAULT NULL,
armureCourante VARCHAR ( 254 ) DEFAULT NULL,
accessoireTeteCourant VARCHAR ( 254 ) DEFAULT NULL,
bouclierCourant VARCHAR ( 254 ) DEFAULT NULL,
armeCourante VARCHAR ( 254 ) DEFAULT NULL,
genreHeros ENUM('Masculin','Féminin') DEFAULT NULL,
couleurPeau ENUM('Très claire','Claire','Intermédiaire','Méditerranéen','Foncée','Très foncée') DEFAULT NULL,
coupeCheveux ENUM('Blanc','Brun','Blond','Roux','Noir') DEFAULT NULL,
couleurShirt ENUM('Noire','Blanche','Bleue','Rouge','Orange','Jaune','Verte','Violette','Rose') DEFAULT NULL,
PRIMARY KEY ( idAventurier ),
FOREIGN KEY ( idAventurier )
	REFERENCES Utilisateurs( idUser )
	ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Maitres (
idMaitre INT NOT NULL,
enseignement VARCHAR ( 254 ) NOT NULL,
lvl INT UNSIGNED NOT NULL DEFAULT '0',
PRIMARY KEY ( idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Utilisateurs( idUser )
	ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE Exercices (
idExo INT NOT NULL,
idMaitre INT NOT NULL,
titreExo VARCHAR (254) NOT NULL,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie') DEFAULT NULL,
PRIMARY KEY ( idExo ),
FOREIGN KEY ( idMaitre ) REFERENCES Maitres( idMaitre ) 
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Questions (
idQuestion INT NOT NULL,
idMaitre INT NOT NULL,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie') DEFAULT NULL,
niveauDifficulte ENUM('Lapin','Gnome','Gobelin','Orc','Dragon','Démon') DEFAULT NULL,
typeExo ENUM('QCM','Résultat','Texte à trou','Dessin') DEFAULT NULL,
PRIMARY KEY ( idQuestion ),
FOREIGN KEY ( idMaitre ) REFERENCES Maitres( idMaitre )
)
ENGINE=InnoDB  DEFAULT CHARSET=utf8;

CREATE TABLE Reponses (
idReponse INT ,
idQuestion INT ,
texteReponse LONGTEXT NOT NULL,
statutReponse ENUM('valide','invalide'),
PRIMARY KEY ( idReponse ),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion )
	ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Tags (
idTag INT   NOT NULL AUTO_INCREMENT,
intituleTag VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idTag )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Labelisation (
idQuestion INT NOT NULL,
idTag INT NOT NULL,
PRIMARY KEY ( idQuestion, idTag ),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion ),
FOREIGN KEY ( idTag )
	REFERENCES Tags( idTag )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Resolution (
idResolveur INT NOT NULL,
idExo INT NOT NULL,
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
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Accomplissements (
idAccomplissements INT AUTO_INCREMENT,
intituleAccomp VARCHAR ( 254 ) NOT NULL,
categorieA VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idAccomplissements )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE AvoirAcompli (
idHero INT NOT NULL,
idAccomplissements INT NOT NULL,
dateAccomplissement DATETIME NOT NULL,
PRIMARY KEY ( idHero, idAccomplissements, dateAccomplissement ),
FOREIGN KEY ( idHero )
	REFERENCES Aventuriers( idAventurier )
	ON DELETE CASCADE,
FOREIGN KEY ( idAccomplissements )
	REFERENCES Accomplissements( idAccomplissements )
	ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE EquipementBonus (
idEB INT NOT NULL AUTO_INCREMENT,
intituleEB VARCHAR ( 254 ) NOT NULL,
categorieEB VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idEB )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE EnInventaire (
idProprio INT NOT NULL,
idObjet INT NOT NULL,
limiteUsage INT NOT NULL,
PRIMARY KEY ( idProprio, idObjet, limiteUsage ),
FOREIGN KEY ( idProprio )
	REFERENCES Aventuriers( idAventurier )
	ON DELETE CASCADE,
FOREIGN KEY ( idObjet )
	REFERENCES EquipementBonus( idEB )
	ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE GuildePrincipale (
idGuildeP INT NOT NULL AUTO_INCREMENT,
idMaitre INT NOT NULL,
nomGuilde VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Maitres( idMaitre )
	ON DELETE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE MembreGuildeP (
idGuildeP INT NOT NULL,
idHero INT NOT NULL,
dateAdhesion DATETIME NOT NULL,
rang VARCHAR ( 254 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idHero, dateAdhesion ),
FOREIGN KEY ( idGuildeP )
	REFERENCES GuildePrincipale( idGuildeP ),
FOREIGN KEY ( idHero )
	REFERENCES Aventuriers( idAventurier )
)
ENGINE=InnoDB DEFAULT CHARSET=utf8;

