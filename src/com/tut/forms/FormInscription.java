package com.tut.forms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jasypt.util.password.ConfigurablePasswordEncryptor;

import com.tut.beans.Utilisateur;
import com.tut.dao.DAOException;
import com.tut.dao.UtilisateurDAO;

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
	
	private static final String ALGO_CHIFFREMENT = "SHA-256";
	
	private UtilisateurDAO utilisateurDao;
	
	protected String resultat;
	protected Map<String, String> erreurs = new HashMap<>();
	
	
	
	public FormInscription(UtilisateurDAO utilisateurDao) {
		this.utilisateurDao = utilisateurDao;
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
	
	
	public Utilisateur inscrireUtilisateur(HttpServletRequest request) {
		String email = getValeurChamp(request, CHAMP_EMAIL );
		String nom = getValeurChamp(request, CHAMP_NOM);
		String prenom = getValeurChamp(request, CHAMP_PRENOM);
		String pseudo = getValeurChamp(request, CHAMP_PSEUDO).replaceAll(" ", "");
		String departement = getValeurChamp(request, CHAMP_DEP);
		String college = getValeurChamp(request, CHAMP_COLL);
		String mdp = getValeurChamp(request, CHAMP_PASS);
		String conf = getValeurChamp(request, CHAMP_CONF);
		String niveau = getValeurChamp(request, CHAMP_NIV);
		
		Utilisateur utilisateur = new Utilisateur();
		
		try {
			traiterNom(nom, utilisateur);
			
			traiterPrenom(prenom, utilisateur);
			
			traiterEmail(email, utilisateur);
			
			traiterPseudo(pseudo, utilisateur);
			
			traiterMotsDePasse(mdp, conf, utilisateur);
			
			utilisateur.setCollege(college);
			utilisateur.setDpt(departement);
			utilisateur.setNiveau(niveau);;
			
			utilisateur.setTypeUser((String) request.getAttribute("type"));
			
			
			if ( erreurs.isEmpty() ) {
				utilisateurDao.creer(utilisateur);
				resultat = "Succès de l'inscription";
			} else {
				resultat = "Echec de l'inscription";
			}
		} catch (DAOException e) {
			resultat = "Echec lors de l'inscription : une erreur imprévue est survenue";
			e.printStackTrace();
		}
		
		
		return utilisateur;
		
	}


	private void traiterMotsDePasse(String mdp, String conf, Utilisateur utilisateur) {
		try {
			validationMotsDePasse(mdp, conf);
		} catch (Exception e) {
			setErreur(CHAMP_PASS, e.getMessage());
		}
		
		
		/*
		 * Utilisation de la biblioth�que Jasypt pour chiffrer le mot de passe
		 * efficacement.
		 * 
		 * L'algorithme SHA-256 est ici utilis�, avec par d�faut un salage
		 * al�atoire et un grand nombre d'it�rations de la fonction de hashage.
		 * 
		 * La String retourn�e est de longueur 56 et contient le hash en Base64
		 */
		
		ConfigurablePasswordEncryptor passwordEncryptor = new ConfigurablePasswordEncryptor();
		passwordEncryptor.setAlgorithm(ALGO_CHIFFREMENT);
		passwordEncryptor.setPlainDigest(false);
		String motDePasseChiffre = passwordEncryptor.encryptPassword(mdp);
		
		
		utilisateur.setMotDePasse(motDePasseChiffre);
	}


	private void traiterPseudo(String pseudo, Utilisateur utilisateur) {
		try {
			validationPseudo( pseudo );
		} catch (Exception e) {
			setErreur(CHAMP_PSEUDO, e.getMessage());
		}
		utilisateur.setPseudo(pseudo);
	}


	private void traiterEmail(String email, Utilisateur utilisateur) {
		try {
			validationEmail( email );
		} catch (Exception e) {
			setErreur(CHAMP_EMAIL, e.getMessage());
		}
		utilisateur.setEmail(email);
	}


	private void traiterPrenom(String prenom, Utilisateur utilisateur) {
		try {
			validationPrenom( prenom );
		} catch (Exception e) {
			setErreur(CHAMP_PRENOM, e.getMessage());
		}
		utilisateur.setPrenom(prenom);
	}


	private void traiterNom(String nom, Utilisateur utilisateur) {
		try {
			validationNom( nom );
		} catch (Exception e) {
			setErreur(CHAMP_NOM, e.getMessage());
		}
		utilisateur.setNom(nom);
	}
	
	private void validationMotsDePasse(String motDePasse, String confirmation) throws Exception {
		if ( motDePasse != null && confirmation != null ) {
	        if ( !motDePasse.equals( confirmation ) ) {
	            throw new Exception( "Les mots de passe entr�s sont diff�rents, merci de les saisir � nouveau." );
	        } else if ( motDePasse.length() < 3 ) {
	            throw new Exception( "Les mots de passe doivent contenir au moins 3 caract�res." );
	        }
	    } else {
	        throw new Exception( "Merci de saisir et confirmer votre mot de passe." );
	    }
		
	}
	private void validationPseudo(String pseudo) throws Exception {
		if (pseudo != null && pseudo.length() < 3)
			throw new Exception("Le pseudo doit faire 3 caract�res minimum");
		else if (pseudo == null)
			throw new Exception("Merci de saisir un pseudo.");
		
	}
	private void validationEmail(String email) throws Exception {
		if ( email != null ) {
	        if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
	            throw new Exception( "Merci de saisir une adresse mail valide." );
	        } else if (utilisateurDao.trouver(email) != null) {
	        	throw new Exception( "Cette adresse mail est déjà utilisée, merci d'en choisir une autre." );
	        }
	    } else {
	        throw new Exception( "Merci de saisir une adresse mail." );
	    }
		
	}
	private void validationPrenom(String prenom) throws Exception {
		if (prenom != null && prenom.length() < 3)
			throw new Exception("Les pr�noms doivent faire 3 caract�res minimum.");
		else if (prenom == null)
			throw new Exception("Merci de renseigner votre pr�nom.");
		
	}
	private void validationNom(String nom) throws Exception {
		if (nom != null && nom.length() < 3)
			throw new Exception("Les noms doivent faire 3 caract�res minimum.");
		else if (nom == null)
			throw new Exception("Merci de renseigner votre nom.");
		
	}
	
	private void setErreur(String champNom, String message) {
		erreurs.put(champNom, message);
		
	}
	
	/* Renvoie une version sans espaces du param�tre 'nomChamp' */
	public String getValeurChamp(HttpServletRequest request, String nomChamp) {
		String valeur = request.getParameter( nomChamp );
		if ( valeur == null || valeur.trim().length() == 0 )
			return null;
		else
			return valeur.trim();
	}
}
