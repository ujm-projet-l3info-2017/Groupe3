package com.tut.dao;

import com.tut.beans.Utilisateur;

public interface UtilisateurDAO {
	
	void creer( Utilisateur utilisateur ) throws DAOException;
	
	Utilisateur trouver( String email ) throws DAOException;
	
}
