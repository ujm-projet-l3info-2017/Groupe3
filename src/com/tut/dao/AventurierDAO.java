package com.tut.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.tut.beans.Aventurier;

import static com.tut.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.tut.dao.DAOUtilitaire.initialisationRequetePreparee;

public class AventurierDAO extends UtilisateurDaoImpl {
	private static final String SQL_SELECT_PAR_ID = "SELECT idAventurier, lvl, expTotale, "
			+ "gold, rubis, saphir, classe WHERE idAventurier = ?";
	
	public AventurierDAO(DAOFactory daoFactory) {
		super (daoFactory );
	}
	
	/* Hérite des comportements de la methode de la classe mere
	 * insere en plus l'utilisateur dans la table Aventuriers en base de données
	 */
	public void creer(Aventurier aventurier) {
		super.creer(aventurier);
	}
	
	public Aventurier trouver(String email) {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Aventurier aventurier = (Aventurier) super.trouver(email);
		
		
		try {
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_PAR_ID, true, aventurier.getId());
			resultSet = preparedStatement.executeQuery();
			
			if (resultSet.next()) {
				map (aventurier, resultSet);
			}
			
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion);
		}
		
		
		return aventurier;
	}
	
	public static void map(Aventurier aventurier, ResultSet result) throws SQLException {
		aventurier.setLvl(result.getInt("lvl"));
		aventurier.setExpTotale(result.getInt("expTotale"));
		aventurier.setGold(result.getInt("gold"));
		aventurier.setRubis(result.getInt("rubis"));
		aventurier.setSaphir(result.getInt("saphir"));
		aventurier.setClasse(result.getString("classe"));
	}
	
}
