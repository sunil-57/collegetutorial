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
 * Servlet implementation class AddCategoryServlet
 */
@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 	String name = request.getParameter("categoryName");
	        String description = request.getParameter("categoryDescription");
	        
	        Category category = new Category(name, description);
	        
	        try {
	            CategoryDAO categorydao = new CategoryDAO();
	        	boolean isCategoryAdded = categorydao.addCategory(category);
	        	
	        	if(isCategoryAdded == true) {
	        		ArrayList<Category> categories = categorydao.getAllCategories();
	        		 // Store categories in request/session to display in Dashboard
	                request.setAttribute("categories", categories);
	                
	                // Forward to Dashboard (maintains same request)
	                request.getRequestDispatcher("/pages/Dashboard.jsp").forward(request, response);
	        	}else {
	                request.setAttribute("error", "Category could not be added");
	                request.getRequestDispatcher("/pages/Dashboard.jsp").forward(request, response);
	            }
	           
	        } catch (SQLException |ClassNotFoundException e) {
	        	 request.setAttribute("error", "Database error: " + e.getMessage());
	        	    request.getRequestDispatcher("/pages/Dashboard.jsp").forward(request, response);
	        } 
	}

}
