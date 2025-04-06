package com.collegetutorial.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.collegetutorial.controller.database.DatabaseConnection;
import com.collegetutorial.model.Products;

public class ProductDAO {
	 private Connection conn;
	    private PreparedStatement ps;

	    public ProductDAO() throws SQLException, ClassNotFoundException {
	            this.conn = DatabaseConnection.getConnection();
	    }
	    
	    // add a new product to database
	    public boolean addProduct(Products product){
	    	boolean isRowInserted = false;
	        String sql = "INSERT INTO products (name, description, price, stock, category_id) VALUES (?, ?, ?, ?, ?)";
	        if(conn != null) {
	        	try {
	        		ps = conn.prepareStatement(sql);
			        ps.setString(1, product.getName());
			        ps.setString(2, product.getDescription());
			        ps.setDouble(3, product.getPrice());
			        ps.setInt(4, product.getStock());
			        ps.setInt(5, product.getCategoryId());

			        int affectedRows = ps.executeUpdate();
			        
			        if (affectedRows > 0) {
			        	isRowInserted = true;
			        }
	        	}catch (SQLException e) {
					// TODO: handle exception
	        		e.printStackTrace();
				}
	        }
	        return isRowInserted;
	    }
	    
	    
}
