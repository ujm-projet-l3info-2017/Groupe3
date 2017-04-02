package com.tut.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Inscription
 */
@WebServlet("/inscription")
public class Inscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE = "/WEB-INF/jsp/Inscription.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inscription() {
        super();
    }

	
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
    	this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
    }

}
