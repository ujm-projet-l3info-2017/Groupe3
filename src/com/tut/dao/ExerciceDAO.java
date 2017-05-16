package com.tut.dao;

import static com.tut.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.tut.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import com.tut.beans.Exercice;
import com.tut.beans.Maitre;

public class ExerciceDAO {
	
	private DAOFactory daoFactory;	
	
	public ExerciceDAO(DAOFactory daoFactory) {
		this.daoFactory = daoFactory;
	}
	
	
	/* Récupère la liste de tous les exercices stockés dans la base de données */
	public List<Exercice> getAllExercices() {
		final String SELECT_ALL = "SELECT * FROM Exercices";
		List<Exercice> list = new ArrayList<>();
		Connection connexion = null;
		Statement selection = null;
		ResultSet result = null;
		Exercice exercice = new Exercice();
		
		try {
			connexion = daoFactory.getConnection();
			
			selection = (Statement) connexion.createStatement();
			
			result = selection.executeQuery(SELECT_ALL);
			
			System.out.println("Liste des exos");
			while (result.next()) {
				System.out.println(result.getString("titreExo"));
				exercice = map(exercice, result);
				System.out.println(exercice.getTitreExo());
				list.add(exercice);
//				System.out.println(result.getString("titreExo"));
			}
			
			for (Exercice e : list) {
				System.out.println(e.getTitreExo());
			}
			
			
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(result, selection, connexion);
		}
		
		return list;
	}
	


	/*Stocke un exercice dans la base de données*/
	public void createExercice(Exercice exercice, Maitre maitre) {
		
		final String SQL_INSERT = "INSERT INTO Exercices(idMaitre, titreExo, content, matiere)"
				+ "VALUES (?, ?, ?, ?)";
		Connection connexion = null;
		PreparedStatement insertion = null;
		int statut;
		
		
		try {
			
			connexion = daoFactory.getConnection();
			insertion = initialisationRequetePreparee(connexion, SQL_INSERT, false, maitre.getId(), exercice.getTitreExo(), 
					exercice.getContent(), maitre.getEnseignement());
			statut = insertion.executeUpdate();
			
			if (statut == 0) {
				throw new DAOException("Echec de la création d'exercice"
						+ " : pas la moindre ligne de rajoutée dans la table");
			}
			
			
			
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(insertion, connexion);
		}
		
	}
	
	
	/*Supprime un exercice de la base de données*/
	public void removeExercice(int id_exercice) {
		
		final String SQL_DELETE = "DELETE FROM Exercices WHERE idExo = ?";
		Connection connexion = null;
		PreparedStatement deletion = null;
		int statut;
		
		try {
			
			connexion = daoFactory.getConnection();
			deletion = initialisationRequetePreparee(connexion, SQL_DELETE, false, id_exercice);
			statut = deletion.executeUpdate();
			
			if (statut == 0) {
				throw new DAOException("Echec de la suppression : "
						+ "aucune ligne n'a été enlevée");
			}
			
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(deletion, connexion);
		}
		
		
	}
	
	
	public void updateExercice(Exercice exercice) {
		
		final String SQL_UPDATE = "UPDATE Exercices SET titreExo = ?, content = ? WHERE idExo = ?";
		Connection connexion = null;
		PreparedStatement update = null;
		int statut;
		
		try {
			
			connexion = daoFactory.getConnection();
			update = initialisationRequetePreparee(connexion, SQL_UPDATE, false, exercice.getTitreExo(), exercice.getContent(),
					exercice.getIdExo());
			statut = update.executeUpdate();
			
			if (statut == 0) {
				throw new DAOException("Echec de la mise à jour des informations de l'exercice d'ID " + exercice.getIdExo() +
						" de titre : " + exercice.getTitreExo());
			} else {
				System.out.println("Modification d'exercice effectuée avec succès !!!");
			}
			
		} catch (SQLException e) {
			throw new DAOException(e);
		}
		
	}
	
	
	private Exercice map(Exercice exercice, ResultSet result) throws SQLException {
		exercice.setCreator_id(result.getInt("idMaitre"));
		exercice.setIdExo(result.getInt("idExo"));
		exercice.setMatiere(result.getString("matiere"));
		exercice.setTitreExo(result.getString("titreExo"));
		
		return exercice;
	}
	
	
	public Exercice getExerciceById(int id) {
		
		final String SQL_SELECT_BY_ID = "SELECT * FROM exercices WHERE idExo = ?";
		Connection connexion = null;
		PreparedStatement get = null;
		ResultSet result = null;
		Exercice exercice = new Exercice();
		
		try {
			connexion = daoFactory.getConnection();
			get = initialisationRequetePreparee(connexion, SQL_SELECT_BY_ID, true, new Integer(id));
			result = get.executeQuery();
			
			if (result.next()) {
				exercice.setIdExo(id);
				exercice.setContent(result.getString("content"));
				exercice.setCreator_id(result.getInt("idMaitre"));
				exercice.setMatiere(result.getString("matiere"));
				exercice.setTitreExo(result.getString("titreExo"));
			}
			
		} catch (SQLException e) {
			throw new DAOException(e);
		}
		
		
		return exercice;
		
		
	}
	
	

}
