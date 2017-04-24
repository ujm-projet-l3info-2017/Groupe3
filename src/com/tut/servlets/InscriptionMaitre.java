package com.tut.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tut.beans.Utilisateur;
import com.tut.dao.DAOFactory;
import com.tut.dao.UtilisateurDAO;
import com.tut.forms.FormMaitre;

/**
 * Servlet implementation class InscriptionMaitre
 */
@WebServlet("/inscription_maitre")
public class InscriptionMaitre extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String CONF_DAO_FACTORY = "daofactory";
	public static final String VUE = "/WEB-INF/jsp/Inscription_maitre.jsp";
	public static final String ATT_FORM = "form";
	public static final String ATT_USER = "utilisateur";
	public static final String ATT_USER_TYPE = "type";
	
	private UtilisateurDAO utilisateurDao;
	
	
	public void init() {
		this.utilisateurDao = ( (DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY) )
				.getUtilisateurDao();
	}
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionMaitre() {
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
		FormMaitre form = new FormMaitre(utilisateurDao);
		request.setAttribute(ATT_USER_TYPE, new String("Maitres"));
		Utilisateur utilisateur = form.inscrireUtilisateur(request);
		
		request.setAttribute(ATT_FORM, form);
		request.setAttribute(ATT_USER, utilisateur);
		
		this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
	}

}
