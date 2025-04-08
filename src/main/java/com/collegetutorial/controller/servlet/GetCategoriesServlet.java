package com.collegetutorial.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegetutorial.controller.dao.CategoryDAO;
import com.collegetutorial.model.Category;

/**
 * Servlet implementation class GetCategoriesServlet
 */
@WebServlet("/GetCategoriesServlet")
public class GetCategoriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCategoriesServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		try {
			CategoryDAO categorydao = new CategoryDAO();
			ArrayList<Category> categories = categorydao.getAllCategories();
			 // Store categories in request/session to display in Dashboard
	        request.setAttribute("categories", categories);
	        request.getRequestDispatcher("/pages/ViewCategories.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Could not get the Categories");
			request.getRequestDispatcher("/pages/ViewCategories.jsp").forward(request, response);
		} 
		
	}

}
