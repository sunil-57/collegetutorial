package com.collegetutorial.controller.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.collegetutorial.controller.database.DatabaseConnection;
import com.collegetutorial.model.Category;
import com.collegetutorial.model.Products;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement ps;

	// Constructor: Establishes database connection when ProductDAO is created
	public ProductDAO() throws SQLException, ClassNotFoundException {
		this.conn = DatabaseConnection.getConnection();
	}

	// add a new product to database
	public boolean addProduct(Products product) {
		boolean isRowInserted = false;
		// SQL query to insert product data into the products table 
		String query = "INSERT INTO products (name, description, price, stock, category_id) VALUES (?, ?, ?, ?, ?)";
		if (conn != null) {
			try {
				ps = conn.prepareStatement(query);
				// Setting values from the product object into the SQL query
				ps.setString(1, product.getName());
				ps.setString(2, product.getDescription());
				ps.setDouble(3, product.getPrice());
				ps.setInt(4, product.getStock());
				ps.setInt(5, product.getCategoryId());

				int affectedRows = ps.executeUpdate();// Execute the query and check if a row was inserted

				if (affectedRows > 0) {
					isRowInserted = true;// Product added successfully
				}
			} catch (SQLException e) {
				// TODO error details if any
				e.printStackTrace();
			}
		}
		return isRowInserted;
	}

	public boolean updateProductDetail(Products product) {
	    boolean isUpdated = false;
	    String sql = "UPDATE products SET name = ?, description = ?, price = ?, stock = ?, category_id = ? WHERE product_id = ?";

	    if (conn != null) {
	        try {
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, product.getName());
	            ps.setString(2, product.getDescription());
	            ps.setDouble(3, product.getPrice());
	            ps.setInt(4, product.getStock());
	            ps.setInt(5, product.getCategoryId());
	            ps.setInt(6, product.getProductId());

	            int affectedRows = ps.executeUpdate();
	            if (affectedRows > 0) {
	                isUpdated = true; // Update successful
	            }
	        } catch (SQLException e) {
	            e.printStackTrace(); // Log error for debugging
	        }
	    }

	    return isUpdated;
	}
}
