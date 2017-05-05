package com.tut.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MaitreController
 */
@WebServlet("/master")
public class MaitreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String VUE_COURS = "/WEB-INF/jsp/coursMaitre.jsp";
	private static final String VUE_EXERCICES = "/WEB-INF/jsp/listeExercices.jsp";
	private static final String VUE_AJOUT = "/WEB-INF/jsp/ajoutExercice.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MaitreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("action").equals("cours")) {
			this.getServletContext().getRequestDispatcher(VUE_COURS).forward(request, response);
		}
		
		if (request.getParameter("action").equals("exercices")) {
			this.getServletContext().getRequestDispatcher(VUE_EXERCICES).forward(request, response);
		}
		
		if (request.getParameter("action").equals("add")) {
			this.getServletContext().getRequestDispatcher(VUE_AJOUT).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
