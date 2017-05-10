package com.tut.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tut.beans.Aventurier;
import com.tut.beans.Utilisateur;
import com.tut.dao.AventurierDAO;
import com.tut.dao.DAOFactory;
import com.tut.dao.UtilisateurDAO;
import com.tut.forms.ConnexionForm;

/**
 * Servlet implementation class Connexion
 */
@WebServlet("/connexion")
public class Connexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE = "/WEB-INF/jsp/connexion.jsp";
	public static final String CONF_DAO_FACTORY = "daofactory";
	public static final String ATT_USER_SESSION = "sessionUtilisateur";
	public static final String ATT_AVENT_SESSION = "sessionAventurier";
	public static final String ATT_USER = "utilisateur";
	public static final String ATT_FORM = "form";
	public static final String URL_REDIRECTION = "home";
	
	private DAOFactory daoFactory;
	
	private UtilisateurDAO utilisateurDao;
	private AventurierDAO aventurierDao;
	
	public void init() {
		this.daoFactory = ( (DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY) );
		this.utilisateurDao = daoFactory.getUtilisateurDao();
		this.aventurierDao = daoFactory.getAventurierDao();
		
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Connexion() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ConnexionForm form = new ConnexionForm(utilisateurDao);
		
		Utilisateur utilisateur = form.connecterUtilisateur(request);
		Aventurier aventurier = null;
		HttpSession session = request.getSession();
		
		if (utilisateur.getTypeUser().equals("Aventuriers")) {
			aventurier = aventurierDao.trouver(utilisateur.getEmail());
			session.setAttribute(ATT_AVENT_SESSION, aventurier);
			
			System.out.println("Aventurier de niveau " + aventurier.getLvl() + " récupéré avec succès");
		}
		
		if (form.getErreurs().isEmpty()) {
			session.setAttribute(ATT_USER_SESSION, utilisateur);
		
		}
		else
			session.setAttribute(ATT_USER_SESSION, null);
		
		request.setAttribute(ATT_FORM, form);
		request.setAttribute(ATT_USER, utilisateur);
		
//		this.getServletContext().getRequestDispatcher(VUE).forward(request, response);
		
		response.sendRedirect(URL_REDIRECTION);
		
	}

}
