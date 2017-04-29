package com.tut.dao;

import static com.tut.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.tut.dao.DAOUtilitaire.initialisationRequetePreparee;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.tut.beans.Utilisateur;

public class UtilisateurDaoImpl implements UtilisateurDAO {
	protected DAOFactory daoFactory;
	private static final String SQL_SELECT_PAR_EMAIL = "SELECT idUser, email, pseudo, nom, prenom, password, departement,"
			+ "college, niveau, typeUser date_inscription FROM Utilisateurs WHERE email = ?;";
	private static final String SQL_INSERT = "INSERT INTO Utilisateurs (email, pseudo, nom, prenom, password, departement,"
			+ "college, niveau, typeUser, date_inscription) VALUES (?,?,?,?,?,?,?,?,?,NOW());";
	
	
	
	public UtilisateurDaoImpl( DAOFactory daoFactory ) {
		this.daoFactory = daoFactory;
	}	
	
	
	@Override
	public void creer(Utilisateur utilisateur) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet valeursAutoGenerees = null;
		
		try {
			/* Récupération d'une connexion depuis la Factory */
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion, SQL_INSERT, true, utilisateur.getEmail(), utilisateur.getPseudo(),
					utilisateur.getNom(), utilisateur.getPrenom(), utilisateur.getMotDePasse(), 
					utilisateur.getDpt(), utilisateur.getCollege(), utilisateur.getNiveau(), utilisateur.getTypeUser());
			int statut = preparedStatement.executeUpdate();
			
			/* Analyse du statut retourn� par la requ�te d'insertion */
			if (statut == 0) {
				throw new DAOException("Echec de la création de l'utilisateur,"
						+ "aucune ligne ajoutée dans la table");
			}
			/* Récupération de l'id auto-généré par la requête d'insertion */
			valeursAutoGenerees = preparedStatement.getGeneratedKeys();
			
			if (valeursAutoGenerees.next()) {
				/* Puis initialisation de la propri�t� id du bean Utilisateur */
				utilisateur.setId(valeursAutoGenerees.getLong(1));
			} else {
				throw new DAOException("Echec lors de la création de l'utilisateur,"
						+ "aucun ID auto-généré");
			}
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(valeursAutoGenerees, preparedStatement, connexion);
		}
		
	}

	@Override
	public Utilisateur trouver(String email) throws DAOException {
		Connection connexion = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Utilisateur utilisateur = null;
		
		try {
			/* R�cup�ration d'une connexion depuis la Factory */
			connexion = daoFactory.getConnection();
			preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_PAR_EMAIL, false, email);
			resultSet = preparedStatement.executeQuery();
			/* Parcours de la ligne de donn�es de l'�ventuel ResultSet retourn� */
			if (resultSet.next()) {
				utilisateur = map(resultSet);
			}
		} catch (SQLException e) {
			throw new DAOException(e);
		} finally {
			fermeturesSilencieuses(resultSet, preparedStatement, connexion);
		}
		
		
		return utilisateur;
	}
	
	
	public static Utilisateur map( ResultSet resultSet ) throws SQLException {
		Utilisateur user = new Utilisateur();
		
		user.setId(resultSet.getLong("idUser"));
		user.setPseudo(resultSet.getString("pseudo"));
		user.setEmail(resultSet.getString("email"));
		user.setMotDePasse(resultSet.getString("password"));
		user.setNom(resultSet.getString("nom"));
		user.setPrenom(resultSet.getString("prenom"));
		user.setDpt(resultSet.getString("departement"));
		user.setCollege(resultSet.getString("college"));
		user.setNiveau(resultSet.getString("niveau"));;
		user.setDate_inscription(resultSet.getString("date_inscription"));
		user.setTypeUser(resultSet.getString("typeUser"));
		
		return user;
	}


	

}
