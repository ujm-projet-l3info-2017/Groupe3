package com.tut.dao;

import static com.tut.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.tut.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.tut.beans.Maitre;
import com.tut.beans.Utilisateur;

public class MaitreDAO extends UtilisateurDaoImpl {
	
	private static final String SQL_SELECT_PAR_ID = "SELECT enseignement, lvl FROM maitres WHERE idMaitre = ?";

	public MaitreDAO(DAOFactory daoFactory) {
		super(daoFactory);
	}
	
	
	public Maitre trouver(String email) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Utilisateur user = super.trouver(email);
		Maitre maitre = new Maitre();
		
		
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_PAR_ID, true, user.getId());
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				map (maitre, resultSet);
			}
			
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion);
		}
		
		return maitre;
		
	}
	
	
	public static void map(Maitre maitre, ResultSet result) throws SQLException {
		maitre.setLvl(result.getInt("lvl"));
		maitre.setEnseignement(result.getString("enseignement"));
	}

}
