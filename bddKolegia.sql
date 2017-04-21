DROP DATABASE IF EXISTS bddKolegia ;
CREATE DATABASE bddKolegia CHARACTER SET 'utf8';
USE bddKolegia;

DROP TABLE IF EXISTS Utilisateurs;
DROP TABLE IF EXISTS Aventuriers;
DROP TABLE IF EXISTS Maitres;

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


CREATE TABLE Utilisateurs (
idUser INT UNSIGNED NOT NULL AUTO_INCREMENT ,
email VARCHAR ( 64 ) NOT NULL,
pseudo VARCHAR ( 60 ) NOT NULL,
prenom VARCHAR ( 32 ) NOT NULL,
nom VARCHAR ( 32 ) NOT NULL,
password VARCHAR( 64 ) NOT NULL,
departement VARCHAR ( 64 ) NOT NULL,
college VARCHAR ( 64 ) NOT NULL,
niveau ENUM('6ème','5ème','4ème','3ème','2nde','1ère','Terminale'),
date_inscription DATETIME NOT NULL,
typeUser ENUM('Aventuriers','Maitres'),
PRIMARY KEY ( idUser ),
UNIQUE ( email ),
UNIQUE ( pseudo )
)
ENGINE=InnoDB;

CREATE TABLE Aventuriers (
idAventurier INT UNSIGNED,
lvl INT UNSIGNED NOT NULL,
expTotale INT UNSIGNED NOT NULL,
gold INT UNSIGNED NOT NULL,
rubis INT UNSIGNED NOT NULL,
saphir INT UNSIGNED NOT NULL,
classe ENUM('Guerrier','Mage','Guérisseur','Voleur'),
armureCourante VARCHAR ( 64 ) NOT NULL,
accessoireTeteCourant VARCHAR ( 64 ) NOT NULL,
bouclierCourant VARCHAR ( 64 ) NOT NULL,
armeCourante VARCHAR ( 64 ) NOT NULL,
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
idMaitre INT UNSIGNED,
enseignement VARCHAR ( 32 ) NOT NULL,
lvl INT UNSIGNED NOT NULL,
PRIMARY KEY ( idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Utilisateurs( idUser )
	ON UPDATE CASCADE ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Questions (
idQuestion INT UNSIGNED NOT NULL AUTO_INCREMENT,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
niveauDifficulte ENUM('Lapin','Gnome','Gobelin','Orc','Dragon','Démon'),
typeExo ENUM('QCM','Résultat','Texte à trou','Dessin'),
PRIMARY KEY ( idQuestion )
)
ENGINE=InnoDB;

CREATE TABLE CreationQuestion (
idQuestion INT UNSIGNED,
idCreateur INT UNSIGNED,
dateCreation DATETIME NOT NULL,
PRIMARY KEY ( idQuestion, idCreateur, dateCreation),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions ( idQuestion )
	ON DELETE CASCADE,
FOREIGN KEY ( idCreateur )
	REFERENCES Maitres ( idMaitre )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Exercices (
idExo INT UNSIGNED NOT NULL AUTO_INCREMENT,
titreExo VARCHAR( 64 ) NOT NULL,
matiere ENUM('Maths','Français','Histoire','Géographie','Physique','Chimie'),
PRIMARY KEY ( idExo )
)
ENGINE=InnoDB;


CREATE TABLE AssemblageExos (
idAssemble INT UNSIGNED NOT NULL,
idAssembleur INT UNSIGNED NOT NULL,
dateAssemblement DATETIME NOT NULL,
PRIMARY KEY ( idAssemble, idAssembleur, dateAssemblement ),
FOREIGN KEY ( idAssemble )
	REFERENCES Exercices( idExo )
	ON DELETE CASCADE,
FOREIGN KEY ( idAssembleur )
	REFERENCES Maitres( idMaitre )
)
ENGINE=InnoDB;



CREATE TABLE CorrectionMaitre (
idEleve INT UNSIGNED,
noteAttribuee INT UNSIGNED NOT NULL,
commentaire VARCHAR ( 64 ),
idExo INT UNSIGNED,
idMaitre INT UNSIGNED,
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
numeroQ INT UNSIGNED NOT NULL,
idExo INT UNSIGNED,
idQuestion INT UNSIGNED,
PRIMARY KEY ( idExo, idQuestion, numeroQ ),
FOREIGN KEY ( idExo )
	REFERENCES Exercices( idExo )
	ON DELETE CASCADE,
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion )
)
ENGINE=InnoDB;

CREATE TABLE Reponses (
idReponse INT UNSIGNED  NOT NULL AUTO_INCREMENT,
idQuestion INT UNSIGNED,
texteReponse VARCHAR ( 64 ) NOT NULL,
statutReponse ENUM('valide','invalide'),
PRIMARY KEY ( idReponse ),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE Tags (
idTag INT UNSIGNED  NOT NULL AUTO_INCREMENT,
intituleTag VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idTag )
)
ENGINE=InnoDB;

CREATE TABLE Labelisation (
idQuestion INT UNSIGNED,
idTag INT UNSIGNED,
PRIMARY KEY ( idQuestion, idTag ),
FOREIGN KEY ( idQuestion )
	REFERENCES Questions( idQuestion ),
FOREIGN KEY ( idTag )
	REFERENCES Tags( idTag )
)
ENGINE=InnoDB;

CREATE TABLE Resolution (
idResolveur INT UNSIGNED,
idExo INT UNSIGNED,
dateResolution DATETIME NOT NULL,
noteAutomatique INT UNSIGNED NOT NULL,
nbCatTF INT UNSIGNED, -- catégorie très facile
nbCatF INT UNSIGNED,	-- catégorie facile
nbCatN INT UNSIGNED,	-- catégorie normale
nbCatM INT UNSIGNED,	-- catégorie moyenne
nbCatD INT UNSIGNED,	-- catégorie difficile
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
idAccomplissements INT UNSIGNED AUTO_INCREMENT,
intituleAccomp VARCHAR ( 64 ) NOT NULL,
categorieA VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idAccomplissements )
)
ENGINE=InnoDB;

CREATE TABLE AvoirAcompli (
idHero INT UNSIGNED,
idAccomplissements INT UNSIGNED,
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
idEB INT UNSIGNED AUTO_INCREMENT,
intituleEB VARCHAR ( 64 ) NOT NULL,
categorieEB VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idEB )
)
ENGINE=InnoDB;

CREATE TABLE EnInventaire (
idProprio INT UNSIGNED,
idObjet INT UNSIGNED,
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
idGuildeP INT UNSIGNED AUTO_INCREMENT,
idMaitre INT UNSIGNED,
nomGuilde VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idMaitre ),
FOREIGN KEY ( idMaitre )
	REFERENCES Maitres( idMaitre )
	ON DELETE CASCADE
)
ENGINE=InnoDB;

CREATE TABLE MembreGuildeP (
idGuildeP INT UNSIGNED,
idHero INT UNSIGNED,
dateAdhesion DATETIME NOT NULL,
rang VARCHAR ( 64 ) NOT NULL,
PRIMARY KEY ( idGuildeP, idHero, dateAdhesion ),
FOREIGN KEY ( idGuildeP )
	REFERENCES GuildePrincipale( idGuildeP )
	ON DELETE CASCADE,
FOREIGN KEY ( idHero )
	REFERENCES Aventuriers( idAventurier )
)
ENGINE=InnoDB;