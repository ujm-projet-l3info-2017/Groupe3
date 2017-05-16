package com.tut.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tut.beans.Exercice;
import com.tut.dao.DAOFactory;
import com.tut.dao.ExerciceDAO;

/**
 * Servlet implementation class MaitreController
 */
@WebServlet("/master")
public class MaitreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String VUE_COURS = "/WEB-INF/jsp/master/coursMaitre.jsp";
	private static final String VUE_EXERCICES = "/WEB-INF/master/jsp/listeExercices.jsp";
	private static final String VUE_AJOUT = "/WEB-INF/jsp/master/ajoutExercice.jsp";

	private static final String CONF_DAO_FACTORY = "daofactory";

	private static final String ATT_EXERCICES = "exercices";
	
	private ExerciceDAO exerciceDAO;
	private DAOFactory daoFactory;
	
	public void init() {
		daoFactory = (DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY);
		this.exerciceDAO = new ExerciceDAO(daoFactory);
	}
       
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
		
		/*Charge la liste des cours*/
		if (request.getParameter("action").equals("cours")) {
			this.getServletContext().getRequestDispatcher(VUE_COURS).forward(request, response);
		}
		
		/*Charge la page des exercices */
		if (request.getParameter("action").equals("exercices")) {
			List<Exercice> listExercices = exerciceDAO.getAllExercices();
			request.setAttribute(ATT_EXERCICES, listExercices);
			
			this.getServletContext().getRequestDispatcher(VUE_EXERCICES).forward(request, response);
		}
		
		/*Charge la page d'ajout d'exercices*/
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
