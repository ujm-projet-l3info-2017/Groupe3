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
 * Servlet implementation class Home
 */
@WebServlet({ "/home" })
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE = "/WEB-INF/jsp/home.jsp";
	private static final String CONF_DAO_FACTORY = "daofactory";
	private DAOFactory daoFactory;
	
	public void init() {
		daoFactory = ( (DAOFactory) getServletContext().getAttribute(CONF_DAO_FACTORY) );
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Exercice> list = (new ExerciceDAO(daoFactory)).getAllExercices();
		int id = (int) (Math.random()*list.size()) + 1;
		request.setAttribute("id_aleatoire", new Integer(id));
		this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
