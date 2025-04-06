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
	
	public UserDAO() throws ClassNotFoundException, SQLException {
		this.conn = DatabaseConnection.getConnection();
	}
	//User registration
	 public boolean register(User user){
		 	boolean isUserRegistered = false;
	        String query = "INSERT INTO users (name, email, password, phone, address, role) VALUES (?, ?, ?, ?, ?, ?)";
	        if(conn != null) {
	        	
					try {
						ps = conn.prepareStatement(query);
						 ps.setString(1, user.getName());
				            ps.setString(2, user.getEmail());
				            ps.setString(3, user.getPassword()); // TODO Should be hashed
				            ps.setString(4, user.getPhone());
				            ps.setString(5, user.getAddress());
				            ps.setString(6, user.getRole());
				            if(ps.executeUpdate() > 0) {
				            	isUserRegistered = true;
				            }
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        }
	        return isUserRegistered;
	        
	    }
	
	 // get all the users from database
	public ArrayList<User> getAllUsers() {
		ArrayList<User> users = new ArrayList<>();
		String query = "SELECT * FROM users";
		if(conn != null) {
			try {
				ps = conn.prepareStatement(query);
				ResultSet userSet = ps.executeQuery();
				while(userSet.next()) {
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
					users.add(user);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return users;
	}
	
	//get user log info
	public User login(String email, String password) {
		User user = null;
        String query = "SELECT * FROM users WHERE email = ? AND password = ?";
        if(conn != null) {
        	try {
            	ps = conn.prepareStatement(query);
                ps.setString(1, email);
                ps.setString(2, password); // NOTE: Password should be hashed in production
                ResultSet userSet = ps.executeQuery();

                if (userSet.next()) {
                	new User(
                			userSet.getInt("user_id"),
                			userSet.getString("name"),
                			userSet.getString("email"),
                			userSet.getString("password"),
                			userSet.getString("phone"),
                			userSet.getString("address"),
                			userSet.getString("role"),
                			userSet.getTimestamp("created_at")
                        );
                }
            }catch(SQLException e) {
            	// TODO Auto-generated catch block
    			e.printStackTrace();
            }
        }
        return user;
    }
	
	
}
