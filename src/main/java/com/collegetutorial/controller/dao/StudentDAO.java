package com.collegetutorial.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.collegetutorial.controller.database.DatabaseConnection;
import com.collegetutorial.model.Student;

public class StudentDAO {
	private Connection conn;
	private PreparedStatement ps;
	
	public StudentDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}
	
	public boolean addStudent(Student student) {
		boolean isRowInserted = false;
		String query = "INSERT INTO student(username, password)"
				+"VALUES (?,?)";
		if(conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, student.getUsername());
				ps.setString(2, student.getPassword());
				int rows = ps.executeUpdate();
				if(rows > 0) {
					isRowInserted = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return isRowInserted;
	}
	public ArrayList<Student> getStudents() {
		ArrayList<Student> students = new ArrayList<>();
		String query = "SELECT * FROM student";
		if(conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet studentSet = ps.executeQuery();
				while(studentSet.next()) {
					String username = studentSet.getString("username");
					String password = studentSet.getString("password");
					Student student = new Student(username,password);
					students.add(student);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return students;
	}
	
}
