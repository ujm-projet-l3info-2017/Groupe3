package com.tut.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tut.beans.Exercice;
import com.tut.beans.Reponse;
import com.tut.dao.DAOFactory;
import com.tut.dao.ExerciceDAO;
import com.tut.dao.ReponseDAO;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user")
public class UserController extends HttpServlet {
	private static final String ATT_EXERCICE = "exercice";

	private static final String VUE_DO_EXERCICE = "/WEB-INF/jsp/resolution_exercice.jsp";

	private static final long serialVersionUID = 1L;
	
	public static final String VUE_SHOW = "/WEB-INF/jsp/modifInfo.jsp";

	private static final String CONF_DAO_FACTORY = "daofactory";
	private DAOFactory daoFactory;
	
	
	public void init() {
		this.daoFactory = ( (DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY) );
	}
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("action").equals("show")) {
			this.getServletContext().getRequestDispatcher(VUE_SHOW).forward(request, response);
		}
		else if (request.getParameter("action").equals("do_exercice") && request.getParameter("id_exo") != null) {
			int id = Integer.parseInt(request.getParameter("id_exo"));
			ExerciceDAO exerciceDao = new ExerciceDAO(daoFactory);
			Exercice exercice = exerciceDao.getExerciceById(id);
			//Insertion dans la requête
			request.setAttribute(ATT_EXERCICE, exercice);
			
			this.getServletContext().getRequestDispatcher(VUE_DO_EXERCICE).forward(request, response);
		}
		
		else if (request.getParameter("newQuest") != null) {
			List<Exercice> list = (new ExerciceDAO(daoFactory)).getAllExercices();
			int id = (int) (Math.random()*list.size()) + 1;
		
			response.sendRedirect("user?action=do_exercice&id_exo="+id);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("submitExercice") != null) {
			Reponse reponse = new Reponse();
			String contenu = request.getParameter("reponse");
			
			reponse.setTexteReponse(contenu);
			
			ReponseDAO reponseDao = new ReponseDAO(daoFactory);
			reponseDao.createReponse(reponse);
			
			System.out.println("Réponse acceptée dans la Servlet !!!");
			
			response.sendRedirect("home");
			
		}
		
	}

}
