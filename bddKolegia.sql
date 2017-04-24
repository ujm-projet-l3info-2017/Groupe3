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
idUser INT( 12 ) NOT NULL AUTO_INCREMENT ,
email VARCHAR( 64 ) NOT NULL,
pseudo VARCHAR( 60 ) NOT NULL,
prenom VARCHAR( 32 ) NOT NULL,
nom VARCHAR( 32 ) NOT NULL,
password VARCHAR( 64 ) NOT NULL,
departement VARCHAR( 64 ) NOT NULL,
college VARCHAR( 64 ) NOT NULL,
niveau VARCHAR(9) NOT NULL,
date_inscription DATETIME NOT NULL,
typeUser VARCHAR(11) NOT NULL,
PRIMARY KEY ( idUser ),
UNIQUE ( email ),
UNIQUE ( pseudo )
)
ENGINE=InnoDB;

CREATE TABLE Aventuriers (
idHero INT( 12 ),
lvl INT UNSIGNED NOT NULL,
expTotale INT UNSIGNED NOT NULL,
gold INT UNSIGNED NOT NULL,
rubis INT UNSIGNED NOT NULL,
saphir INT UNSIGNED NOT NULL,
classe ENUM('Guerrier','Mage','Guérisseur','Voleur'),
armureCourante VARCHAR( 64 ) NOT NULL,
accessoireTeteCourant VARCHAR( 64 ) NOT NULL,
bouclierCourant VARCHAR( 64 ) NOT NULL,
armeCourante VARCHAR( 64 ) NOT NULL,
genreHeros ENUM('Masculin','Féminin'),
couleurPeau ENUM('Très claire','Claire','Intermédiaire','Méditerranéen','Foncée','Très foncée'),
coupeCheveux ENUM('Blanc','Brun','Blond','Roux','Noir'),
couleurShirt ENUM('Noire','Blanche','Bleue','Rouge','Orange','Jaune','Verte','Violette','Rose'),
PRIMARY KEY ( idHero ),
FOREIGN KEY ( idHero ) REFERENCES Utilisateurs( idUser )
)
ENGINE=InnoDB;

CREATE TABLE Maitres (
idMaitre INT( 12 ),
enseignement VARCHAR( 32 ) NOT NULL,
lvl INT UNSIGNED NOT NULL,
PRIMARY KEY ( idMaitre ),
FOREIGN KEY ( idMaitre ) REFERENCES Utilisateurs( idUser )
)
ENGINE=InnoDB;

CREATE TABLE Exercices (
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
)
ENGINE=InnoDB;

CREATE TABLE Reponses (
idReponse INT ( 12 ),
idQuestion INT ( 12 ),
texteReponse VARCHAR ( 64 ) NOT NULL,
statutReponse ENUM('valide','invalide'),
PRIMARY KEY ( idReponse ),
FOREIGN KEY ( idQuestion ) REFERENCES Questions( idQuestion )
)
ENGINE=InnoDB;

