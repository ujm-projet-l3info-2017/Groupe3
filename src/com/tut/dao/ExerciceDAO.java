package com.tut.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.tut.beans.Exercice;
import com.tut.beans.Maitre;

import static com.tut.dao.DAOUtilitaire.*;

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
		PreparedStatement selection = null;
		ResultSet result = null;
		Exercice exercice = new Exercice();
		
		try {
			connexion = daoFactory.getConnection();
			
			selection = initialisationRequetePreparee(connexion, SELECT_ALL, false, (Object[]) null);
			result = selection.executeQuery();
			
			while (result.next()) {
				map(exercice, result);
				list.add(exercice);
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
		
		final String SQL_INSERT = "INSERT INTO Exercices(idExo, idMaitre, titreExo, content, matiere)"
				+ "VALUES (?, ?, ?, ?, ?)";
		Connection connexion = null;
		PreparedStatement insertion = null;
		int statut;
		
		
		try {
			
			connexion = daoFactory.getConnection();
			insertion = initialisationRequetePreparee(connexion, SQL_INSERT, false, exercice.getIdExo(),
					maitre.getId(), exercice.getTitreExo(), exercice.getContent(), maitre.getMatiere());
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
			}
			
		} catch (SQLException e) {
			throw new DAOException(e);
		}
		
	}
	
	
	private void map(Exercice exercice, ResultSet result) throws SQLException {
		exercice.setCreator_id(result.getInt("idMaitre"));
		exercice.setIdExo(result.getInt("idExo"));
		exercice.setMatiere(result.getString("matiere"));
		exercice.setTitreExo(result.getString("titreExo"));
		
	}

}
