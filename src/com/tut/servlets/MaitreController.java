package com.tut.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tut.beans.Exercice;
import com.tut.beans.ListeExercices;
import com.tut.beans.Maitre;
import com.tut.dao.DAOFactory;
import com.tut.dao.ExerciceDAO;
import com.tut.dao.MaitreDAO;

/**
 * Servlet implementation class MaitreController
 */
@WebServlet("/master")
public class MaitreController extends HttpServlet {
	private static final String VUE_UPDATE = "/WEB-INF/jsp/updateExercice.jsp";

	private static final String REDIRECTION_AJOUT = "home";

	private static final String PARAM_CONTENT = "content";

	private static final String PARAM_TITRE = "titre";

	private static final long serialVersionUID = 1L;
	
	private static final String VUE_COURS = "/WEB-INF/jsp/master/coursMaitre.jsp";
	private static final String VUE_EXERCICES = "/WEB-INF/jsp/master/listeExercices.jsp";
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
		else if (request.getParameter("action").equals("exercices")) {
			List<Exercice> listExercices = exerciceDAO.getAllExercices();
			System.out.println(listExercices.size());
			ListeExercices container = new ListeExercices();
			container.setListExercices(listExercices);
			request.setAttribute(ATT_EXERCICES, container);
			
			this.getServletContext().getRequestDispatcher(VUE_EXERCICES).forward(request, response);
		}
		
		/*Charge la page d'ajout d'exercices*/
		else if (request.getParameter("action").equals("add_exercice")) {
			this.getServletContext().getRequestDispatcher(VUE_AJOUT).forward(request, response);
		}
		
		/*Charge la page de modification des exercices*/
		else if (request.getParameter("action").equals("edit") && request.getParameter("id_exo") != null) {
			int id = Integer.parseInt(request.getParameter("id_exo"));
			Exercice exercice = exerciceDAO.getExerciceById(id);
			
			request.setAttribute("exercice", exercice);
			this.getServletContext().getRequestDispatcher(VUE_UPDATE).forward(request, response);
			
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("new") != null) {
			
			Exercice newExercice = new Exercice();
			Maitre maitre = (new MaitreDAO(daoFactory)).trouver(request.getParameter("id_maitre"));
			newExercice.setTitreExo(request.getParameter(PARAM_TITRE));
			newExercice.setContent(request.getParameter(PARAM_CONTENT));
			
			//Insertion en base de données
			exerciceDAO.createExercice(newExercice, maitre);
			System.out.println("L'exercice sur " + newExercice.getTitreExo() + " par le prof de "+maitre.getEnseignement()
			+" a été créé avec succès !!!");
			
			response.sendRedirect(REDIRECTION_AJOUT);
			
		}
		
		else if (request.getParameter("updatePost") != null) {
			
			int id = Integer.parseInt(request.getParameter("updatePost"));
			
			Exercice exercice = new Exercice();
			exercice.setTitreExo(request.getParameter("titreExo"));
			exercice.setContent(request.getParameter("content"));
			exercice.setIdExo(id);
			
			exerciceDAO.updateExercice(exercice);
			
			System.out.println("On est arrivé jusque là, donc tout baigne dans la Servlet");
			
			response.sendRedirect("user?action=do_exercice&id_exo="+id);
			
		}
		
	}

}
