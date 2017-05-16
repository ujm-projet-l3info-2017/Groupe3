package com.tut.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Memos
 */
@WebServlet("/memos")
public class Memos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String VUE = "/WEB-INF/jsp/adventurer/memos.jsp";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memos() {
        super();
    }

	
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
    	this.getServletContext().getRequestDispatcher( VUE ).forward(request, response);
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}