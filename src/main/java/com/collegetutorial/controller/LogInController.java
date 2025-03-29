package com.collegetutorial.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegetutorial.controller.dao.StudentDAO;
import com.collegetutorial.controller.model.Student;

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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Student student = new Student(username, password);
		
		out.println("<html><body><h1>"+username+"</h1>");
		out.println("<p>"+password+"</p></body></html>");
		try {
			StudentDAO studentDAO = new StudentDAO();
			boolean isStudentAdded = studentDAO.addStudent(student);
			if(isStudentAdded == true) {
				out.println("<p>Student Added Successfully</p>");
				out.println("<p>Student Info</p>");
			        ArrayList<Student> studentList = studentDAO.getStudents();
					for(Student studentInfo: studentList) {
						out.println("<p>");
						out.println(studentInfo.getUsername());
						out.println(studentInfo.getPassword());
						out.println("</p>");
					}
			}else {
				out.println("Failed to Add Student");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}







