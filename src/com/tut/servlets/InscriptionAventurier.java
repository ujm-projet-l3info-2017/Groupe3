package com.tut.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tut.beans.Utilisateur;
import com.tut.forms.FormInscription;

/**
 * Servlet implementation class InscriptionAventurier
 */
@WebServlet("/inscription_aventurier")
public class InscriptionAventurier extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE = "/WEB-INF/jsp/Inscription_aventurier.jsp";
	public static final String ATT_USER = "utilisateur";
	public static final String ATT_FORM = "form";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InscriptionAventurier() {
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
		FormInscription form = new FormInscription();
		
		Utilisateur utilisateur = form.inscrireUtilisateur(request);
		
		request.setAttribute(ATT_USER, utilisateur);
		request.setAttribute(ATT_FORM, form);
		
		this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
	}

}
