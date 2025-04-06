package com.collegetutorial.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.collegetutorial.controller.database.DatabaseConnection;
import com.collegetutorial.model.Category;

public class CategoryDAO {
	private Connection conn;
	private PreparedStatement ps;
	public CategoryDAO() throws ClassNotFoundException, SQLException {
		conn = DatabaseConnection.getConnection();
	}
    // creating a new category
    public boolean addCategory(Category category) {
    	boolean isRowInserted = false;
        String sql = "INSERT INTO categories (name, description) VALUES (?, ?)";
        
        if(conn != null) {
        	try {
                ps = conn.prepareStatement(sql); 
                ps.setString(1, category.getName());
                ps.setString(2, category.getDescription());
                int rows = ps.executeUpdate();
                if(rows > 0) {
                	isRowInserted = true;
                }
                return isRowInserted;
            } catch  (SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
            }
        }
		return isRowInserted;
      }
    
    // get All Categories
    public ArrayList<Category> getAllCategories() throws SQLException {
    	ArrayList<Category> categoryList = new ArrayList<>();
        String sql = "SELECT category_id, name, description, created_at FROM categories ORDER BY name";
        if(conn != null) {
        	ps = conn.prepareStatement(sql);
    		ResultSet categorySet = ps.executeQuery(sql);
    		while (categorySet.next())  {
    		        Category category = new Category(
    		        		categorySet.getInt("category_id"),
    		        		categorySet.getString("name"),
    		        		categorySet.getString("description"),
    		        		categorySet.getTimestamp("created_at")
    		        );
    		    categoryList.add(category);
    		}
        }
        
        return categoryList;
    }
}
