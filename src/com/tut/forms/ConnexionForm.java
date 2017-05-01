package com.tut.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.tut.beans.Utilisateur;
import com.tut.dao.UtilisateurDAO;

public class ConnexionForm {
	private static final String CHAMP_IDF = "identifiant";
	private static final String CHAMP_PASS = "motdepasse";	
	
	private static final String ALGO_CHIFFREMENT = "SHA-256";	
	private UtilisateurDAO utilisateurDao;
	
	private String resultat;
	private Map<String, String> erreurs = new HashMap<>();
	
	
	public ConnexionForm(UtilisateurDAO utilisateurDAO) {
		this.utilisateurDao = utilisateurDAO;
	}
	
	
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
		
		utilisateur = traiterEmail(email, utilisateur);
		
//		System.out.println("Mot de passe : " + utilisateur.getMotDePasse());
		
		traiterMotDePasse(motDePasse, utilisateur);
		
		if (erreurs.isEmpty()) {
			resultat = "Succès de la connexion.";
		}
		else {
			resultat = "Echec de la connexion";
		}
		
		return utilisateur;
	}
	
	
	
	
	private Utilisateur traiterMotDePasse(String motDePasse, Utilisateur utilisateur) {
		try {
			validationMotDePasse( motDePasse );
		} catch (Exception e) {
			setErreur( CHAMP_PASS, e.getMessage());
		}
		
		if ( utilisateur != null ) {
			ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
			passwordEncryptor.setAlgorithm(ALGO_CHIFFREMENT);
			passwordEncryptor.setPlainDigest(false);
			
			if ( !(passwordEncryptor.checkPassword(motDePasse, utilisateur.getMotDePasse())) ) {
				setErreur(CHAMP_PASS, "Mot de passe incorrect");
			}
		}
		
		
		return utilisateur;
	}
	
	
	
	private Utilisateur traiterEmail(String email, Utilisateur utilisateur) {
		try {
			validationEmail( email );
		} catch (Exception e) {
			setErreur( CHAMP_IDF, e.getMessage());
		}
		
		utilisateur = utilisateurDao.trouver(email);
		
		if (utilisateur == null) {
			setErreur( CHAMP_IDF, "Utilisateur inconnu" );
			System.out.println( "traiterEmail() --> Echec de l'inscription : utilisateur non stocké en base de données" );
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
