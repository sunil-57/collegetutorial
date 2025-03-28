package com.collegetutorial.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/LogInServlet"})
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInServlet() {
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

	        // Retrieve form data
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        // Display response
	        out.println("<html><body>");
	        out.println("<h2>Form Submitted Successfully!</h2>");
	        out.println("<p>Name: " + username + "</p>");
	        out.println("<p>Email: " + password + "</p>");
	        out.println("</body></html>");
	}

}
