package com.collegetutorial.model;

import java.sql.Timestamp;

public class Products {
	private int productId;
	private String name;
	private String description;
	private double price;
	private int stock;
	private int categoryId;
	private Timestamp createdAt;

	// Constructors
	public Products() {
	}

	public Products(String name, String description, double price, int stock, int categoryId) {
		this.name = name;
		this.description = description;
		this.price = price;
		this.stock = stock;
		this.categoryId = categoryId;
	}

	public Products(int productId, String name, String description, double price, int stock, int categoryId,
			Timestamp createdAt) {
		this.productId = productId;
		this.name = name;
		this.description = description;
		this.price = price;
		this.stock = stock;
		this.categoryId = categoryId;
		this.createdAt = createdAt;
	}

	// Getters and Setters
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

}