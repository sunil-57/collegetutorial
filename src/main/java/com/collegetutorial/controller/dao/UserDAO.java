package com.collegetutorial.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.collegetutorial.controller.database.DatabaseConnection;
import com.collegetutorial.model.User;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	// Constructor: Initializes the database connection when an object is created
	public UserDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}

	// Registers a new user in the database
	public boolean register(User user) {
		boolean isUserRegistered = false;
		// SQL statement to insert user details
		String query = "INSERT INTO users (name, email, password, phone, address, role) VALUES (?, ?, ?, ?, ?, ?)";
		if (conn != null) {

			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, user.getName());
				ps.setString(2, user.getEmail());
				ps.setString(3, user.getPassword()); // TODO Passwords should be hashed in real-world apps
				ps.setString(4, user.getPhone());
				ps.setString(5, user.getAddress());
				ps.setString(6, user.getRole());
				
				// Execute the insert query
				if (ps.executeUpdate() > 0) {
					isUserRegistered = true;
				}
			} catch (SQLException e) {
				// TODO Good for debugging; can be replaced with proper logging
				e.printStackTrace();
			}
		}
		return isUserRegistered;

	}

	// get all the users from database
	public ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet userSet = ps.executeQuery(); //stores all the user information retrieved by running query in database
				
				// Iterate over result set and populate User objects
				while (userSet.next()) {
					User user = new User();
					user.setUserId(userSet.getInt("user_id"));
					user.setName(userSet.getString("name"));
					user.setEmail(userSet.getString("email"));
					user.setPassword(userSet.getString("password"));
					user.setPhone(userSet.getString("phone"));
					user.setAddress(userSet.getString("address"));
					user.setRole(userSet.getString("role"));
					user.setCreatedAt(userSet.getTimestamp("created_at"));
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Shows error if query fails
				e.printStackTrace();
			}
		}
		return users;
	}

	// Authenticates user by checking email and password
	public User login(String emailToCheck, String passwordToCheck) {
		User user = null;
		String query = "SELECT * FROM users WHERE email = ? AND password = ?";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ps.setString(1, emailToCheck);
				ps.setString(2, passwordToCheck); // TODO In production, always hash and compare passwords
				ResultSet userSet = ps.executeQuery();
				
				// If user is found, put values to User object
				if (userSet.next()) {
					user = new User(
							userSet.getInt("user_id"), 
							userSet.getString("name"), 
							userSet.getString("email"),
							userSet.getString("password"), 
							userSet.getString("phone"), 
							userSet.getString("address"),
							userSet.getString("role"), 
							userSet.getTimestamp("created_at"));
				}
			} catch (SQLException e) {
				// TODO Logs error if login fails
				e.printStackTrace();
			}
		}
		return user;// Returns null if no match found and returns the user info if user the user was found in database
	}

}
