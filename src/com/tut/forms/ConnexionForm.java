package com.tut.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.tut.beans.Utilisateur;

public class ConnexionForm {
	private static final String CHAMP_IDF = "identifiant";
	private static final String CHAMP_PASS = "motdepasse";
	
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
	
	public Utilisateur connecterUtilisateur( HttpServletRequest request ) {
		/* Récupération des champs du formulaire */
		String email = getValeurChamp( request, CHAMP_IDF );
		String motDePasse = getValeurChamp(request, CHAMP_PASS);
		
		Utilisateur utilisateur = new Utilisateur();
		
		try {
			validationEmail( email );
		} catch (Exception e) {
			setErreur( CHAMP_IDF, e.getMessage());
		}
		utilisateur.setEmail(email);
		
		try {
			validationMotDePasse( motDePasse );
		} catch (Exception e) {
			setErreur( CHAMP_PASS, e.getMessage());
		}
		utilisateur.setMotDePasse(motDePasse);
		
		if (erreurs.isEmpty()) {
			resultat = "Succès de la connexion.";
		}
		else {
			resultat = "Echec de la connexion";
		}
		
		return utilisateur;
	}
	
	
	private void setErreur(String champ, String message) {
		erreurs.put( champ, message );
		
	}
	
	private void validationMotDePasse(String motDePasse) throws Exception {
		if ( motDePasse != null ) {
            if ( motDePasse.length() < 3 ) {
                throw new Exception( "Le mot de passe doit contenir au moins 3 caractères." );
            }
        } else {
            throw new Exception( "Merci de saisir votre mot de passe." );
        }
		
	}
	private void validationEmail(String email) throws Exception {
		if ( email != null && !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
            throw new Exception( "Merci de saisir une adresse mail valide." );
        }
		
		if (email == null)
			throw new Exception("Vous devez saisir votre mail.");
		
	}
	private String getValeurChamp(HttpServletRequest request, String nomChamp) {
		String valeur = request.getParameter(nomChamp);
		
		if (valeur == null || valeur.trim().length() == 0) {
			return null;
		} else {
			return valeur.trim();
		}
	}
	
}
