package com.tut.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.tut.beans.Utilisateur;

public class FormInscription {
	protected static final String CHAMP_NOM="nom";
	protected static final String CHAMP_PRENOM="prenom";
	protected static final String CHAMP_PSEUDO="pseudo";
	protected static final String CHAMP_EMAIL="mail";
	protected static final String CHAMP_PASS="passe";
	protected static final String CHAMP_CONF="passe_con";
	protected static final String CHAMP_NIV="niveau";
	protected static final String CHAMP_DEP="departement";
	protected static final String CHAMP_COLL="college";
	
	protected String resultat;
	protected Map<String, String> erreurs = new HashMap<>();
	
	
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
	
	
	public Utilisateur inscrireUtilisateur(HttpServletRequest request) {
		String email = getValeurChamp(request, CHAMP_EMAIL );
		String nom = getValeurChamp(request, CHAMP_NOM);
		String prenom = getValeurChamp(request, CHAMP_PRENOM);
		String pseudo = getValeurChamp(request, CHAMP_PSEUDO);
		String departement = getValeurChamp(request, CHAMP_DEP);
		String college = getValeurChamp(request, CHAMP_COLL);
		String mdp = getValeurChamp(request, CHAMP_PASS);
		String conf = getValeurChamp(request, CHAMP_CONF);
		String niveau = getValeurChamp(request, CHAMP_NIV);
		
		Utilisateur utilisateur = new Utilisateur();
		
		try {
			validationNom( nom );
		} catch (Exception e) {
			setErreur(CHAMP_NOM, e.getMessage());
		}
		utilisateur.setNom(nom);
		
		try {
			validationPrenom( prenom );
		} catch (Exception e) {
			setErreur(CHAMP_PRENOM, e.getMessage());
		}
		utilisateur.setPrenom(prenom);
		
		try {
			validationEmail( email );
		} catch (Exception e) {
			setErreur(CHAMP_EMAIL, e.getMessage());
		}
		utilisateur.setEmail(email);
		
		try {
			validationPseudo( pseudo );
		} catch (Exception e) {
			setErreur(CHAMP_PSEUDO, e.getMessage());
		}
		utilisateur.setPseudo(pseudo);
		
		try {
			validationMotsDePasse(mdp, conf);
		} catch (Exception e) {
			setErreur(CHAMP_PASS, e.getMessage());
		}
		utilisateur.setMotDePasse(mdp);
		
		utilisateur.setCollege(college);
		utilisateur.setDepartement(departement);
		utilisateur.setNiveau(niveau);
		
		
		if ( erreurs.isEmpty() ) {
			resultat = "Succès de l'inscription";
		} else {
			resultat = "Echec de l'inscription";
		}
		
		
		return utilisateur;
		
	}
	
	private void validationMotsDePasse(String motDePasse, String confirmation) throws Exception {
		if ( motDePasse != null && confirmation != null ) {
	        if ( !motDePasse.equals( confirmation ) ) {
	            throw new Exception( "Les mots de passe entrés sont différents, merci de les saisir à nouveau." );
	        } else if ( motDePasse.length() < 3 ) {
	            throw new Exception( "Les mots de passe doivent contenir au moins 3 caractères." );
	        }
	    } else {
	        throw new Exception( "Merci de saisir et confirmer votre mot de passe." );
	    }
		
	}
	private void validationPseudo(String pseudo) throws Exception {
		if (pseudo != null && pseudo.length() < 3)
			throw new Exception("Le pseudo doit faire 3 caractères minimum");
		
	}
	private void validationEmail(String email) throws Exception {
		if ( email != null ) {
	        if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
	            throw new Exception( "Merci de saisir une adresse mail valide." );
	        }
	    } else {
	        throw new Exception( "Merci de saisir une adresse mail." );
	    }
		
	}
	private void validationPrenom(String prenom) throws Exception {
		if (prenom != null && prenom.length() < 3)
			throw new Exception("Les prénoms doivent faire 3 caractères minimum.");
		else if (prenom == null)
			throw new Exception("Merci de renseigner votre prénom.");
		
	}
	private void validationNom(String nom) throws Exception {
		if (nom != null && nom.length() < 3)
			throw new Exception("Les noms doivent faire 3 caractères minimum.");
		else if (nom == null)
			throw new Exception("Merci de renseigner votre nom.");
		
	}
	
	private void setErreur(String champNom, String message) {
		erreurs.put(champNom, message);
		
	}
	
	public String getValeurChamp(HttpServletRequest request, String nomChamp) {
		String valeur = request.getParameter( nomChamp );
		if ( valeur == null || valeur.trim().length() == 0 )
			return null;
		else
			return valeur.trim();
	}
}
