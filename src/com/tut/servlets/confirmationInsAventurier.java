package com.tut.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class confirmation_ins
 */
@WebServlet("/confirmation_ins")
public class confirmationInsAventurier extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 public static final String SOURCE = "/Inscription_aventurier.jsp";
	    public static final String EMAIL = "email";
	    public static final String PASS = "motdepasse";
	    public static final String CONF = "confirmation";
	    public static final String PSEUDO= "pseudo";

    public confirmationInsAventurier() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  this.getServletContext().getRequestDispatcher( SOURCE).forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String email = request.getParameter( EMAIL );
	        String Pass = request.getParameter(PASS );
	        String confirmation = request.getParameter( CONF );
	        String pseudo = request.getParameter( PSEUDO );
	        String resultat;
	        final String ATT_ERREURS  = "erreurs";
	        final String ATT_RESULTAT = "resultat";
	        Map<String, String> erreurs = new HashMap<String, String>();

	        try {
	            validEmail( email );
	        } catch (Exception e) {
	        	erreurs.put( EMAIL, e.getMessage() );
	        }
	        try { validPasse( Pass, confirmation );
	        
	 		} catch (Exception e) {
	 			erreurs.put(PASS, e.getMessage() );
	 		}
	        try{
	            validPseudo(pseudo);
			 } catch (Exception e) {
		     	erreurs.put(PSEUDO, e.getMessage() );
		     }
	        if ( erreurs.isEmpty() ) {
	            resultat = "inscription résussie";
	        } else {
	            resultat = "échec d'inscription.";
	        }  
	        request.setAttribute( ATT_ERREURS, erreurs );
	        request.setAttribute( ATT_RESULTAT, resultat );

	        
	        this.getServletContext().getRequestDispatcher( SOURCE ).forward( request, response );
	    }

	private void validPseudo(String nom) throws Exception{
		if ( nom != null && nom.trim().length() < 3 ) {
	        throw new Exception( "Le nom d'utilisateur doit contenir au moins 3 caract�res." );
	    }
		
	}

	private void validPasse(String motDePasse, String confirmation)throws Exception {
		if (motDePasse != null && motDePasse.length() != 0 && confirmation != null && confirmation.length() != 0) {
	        if (!motDePasse.equals(confirmation)) {
	            throw new Exception("Les mots de passe entr�s sont diff�rents");
	        } else if (motDePasse.length() < 6) {
	            throw new Exception("Les mots de passe doivent contenir au moins 6 caract�res.");
	        }
	    } else {
	        throw new Exception("Veuillez saisir et confirmer votre mot de passe.");
	    }
		
	}

	private void validEmail( String email ) throws Exception {
	    if ( email != null && email.length() != 0 ) {
	        if ( !email.matches( "([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)" ) ) {
	            throw new Exception( "Saisissez une adresse mail valide." );
	        }
	    } else {
	        throw new Exception( "Saisissez une adresse mail." );
	    }
	}
}