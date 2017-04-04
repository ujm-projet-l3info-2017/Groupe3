package com.tut.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.tut.beans.Utilisateur;

public class ConnexionForm {
	private static final String CHAMP_PASS = "motdepasse";
	private static final String CHAMP_IDF = "identifiant";
	
	private String resultat;
	private Map<String, String> erreurs = new HashMap<>();
	
	
	public String getResultat() {
		return resultat;
	}
	public void setResultat(String resultat) {
		this.resultat = resultat;
	}
	public Map<String, String> getErreurs() {
		return erreurs;
	}
	public void setErreurs(Map<String, String> erreurs) {
		this.erreurs = erreurs;
	}
	
	
	/* Fonctions de validation */
	
	private void validationIdentifiant(String identifiant) throws Exception {
		if (identifiant == null)
			throw new Exception( "Merci de saisir un pseudo ou une adresse mail." );
		
		if (!validationEmail(identifiant) && !validationPseudo(identifiant))
			throw new Exception ( "Adresse mail ou pseudo invalde." );
		
	}

	private boolean validationEmail(String email) {
		if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            return false;
        }
		
		return true;
		
	}
	
	private boolean validationPseudo(String pseudo) {
		if (pseudo != null && pseudo.length() < 3) {
			return false;
		}
		
		return true;
		
	}
	
	public void validationMotDePasse(String motDePasse) throws Exception {
		
	}
	
	
	/* Récupération de la valeur d'un champ du formulaire grâce à l'objet requête */
	private String getValeurChamp( HttpServletRequest request, String nomChamp ) {
		String value = request.getParameter(nomChamp);
		
		if (value == null || value.trim().length() == 0)
			return null;
		return value.trim();
	}
	
	private void setErreur(String nomChamp, String message) {
		erreurs.put(nomChamp, message);
	}
	
	
	/* Fonction de connexion */
	public Utilisateur connecterUtilisateur (HttpServletRequest request) {
		String identifiant = getValeurChamp(request, CHAMP_IDF);
		String motDePasse = getValeurChamp(request, CHAMP_PASS);
		
		Utilisateur utilisateur = new Utilisateur();
		
		try {
			validationIdentifiant(identifiant);
		} catch (Exception e) {
			setErreur (CHAMP_IDF, e.getMessage());
		}
		utilisateur.setIdentifiant(identifiant);
		
		utilisateur.setMotDePasse(motDePasse);
		
		if (erreurs.isEmpty()) {
			resultat = "Bienvenue !";
		}
		else {
			resultat = "Echec de la connexion.";
		}
		
		return utilisateur;
	}
	
}
