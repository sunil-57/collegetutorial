package com.collegetutorial.controller.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collegetutorial.controller.dao.UserDAO;
import com.collegetutorial.model.User;

/**
 * Servlet implementation class LogInController
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/LogInController"})
public class LogInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInController() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			UserDAO userdao = new UserDAO();
			User user = userdao.login(email, password);
			if(user != null) {
					
							 // Create a session for the logged-in user
			                HttpSession session = request.getSession();
			                session.setAttribute("user", user);

			                // Redirect to the Dashboard or home page (could be a different page based on your setup)
			                response.sendRedirect(request.getContextPath() + "/pages/Dashboard.jsp");
					
			}else {
		                // If login fails, send an error message
		            	request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
		                request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
		            }	
			
		} catch (ClassNotFoundException | SQLException e) {
			// Log the error properly in production (use a logger)
		    request.setAttribute("errorMessage", "A system error occurred. Please try again later.");
		    request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
		} finally {
			if (out != null) {
		        out.close();
		    }
		}
		
	}

}







