package com.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.controller.database.DatabaseConnection;
import com.controller.model.Student;

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
					Student student = new Student(studentSet.getString("username"), studentSet.getString("password"));
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
