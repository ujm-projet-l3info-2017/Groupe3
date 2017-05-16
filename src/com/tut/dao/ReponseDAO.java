package com.tut.dao;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.tut.beans.Reponse;

import static com.tut.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.tut.dao.DAOUtilitaire.initialisationRequetePreparee;

public class ReponseDAO {
	
	private DAOFactory daoFactory;
	
	
	public ReponseDAO(DAOFactory daoFactory) {
		this.daoFactory = daoFactory;
	}
	
	
	public void createReponse(Reponse response) {
		final String SQL_INSERT = "INSERT INTO reponses (texteReponse) VALUES (?)";
		Connection connexion = null;
		PreparedStatement create = null;
		int statut;
		
		try {
			connexion = daoFactory.getConnection();
			create = initialisationRequetePreparee(connexion, SQL_INSERT, false, response.getTexteReponse());
			statut = create.executeUpdate();
			
			if (statut == 0) {
				throw new DAOException("Echec lors de l'enregistrement de la réponse à l'exercice :"
						+ " aucune réponse rajoutée");
			} else {
				System.out.println("Réponse bien enregistrée !!!");
			}
			
			
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(create, connexion);
			
		}
		
		
	}
	

}
