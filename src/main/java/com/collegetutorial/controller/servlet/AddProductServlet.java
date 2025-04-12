package com.collegetutorial.controller.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collegetutorial.controller.dao.CategoryDAO;
import com.collegetutorial.controller.dao.ProductDAO;
import com.collegetutorial.model.Category;
import com.collegetutorial.model.Products;

/**
 * Servlet implementation class AddProductServlet
 */
@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form data from the request
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		double price = Double.parseDouble(request.getParameter("price"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));

		// Create product model object
		Products product = new Products(name, description, price, stock, categoryId);
		boolean isProductAdded = false;
		try {
			ProductDAO productDAO = new ProductDAO();
			isProductAdded = productDAO.addProduct(product);
			// 4. Redirect or forward if the product is added
			if (isProductAdded) {
				request.setAttribute("successMessage", "Product added successfully!");
			} else {
				request.setAttribute("errorMessage", "Failed to add product.");
			}
			request.getRequestDispatcher("/pages/AddProduct.jsp").forward(request, response);
		} catch (NumberFormatException e) {
			request.setAttribute("errorMessage", "Invalid input. Please enter correct values.");
			request.getRequestDispatcher("/pages/AddProduct.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("errorMessage", "Error occurred while adding product.");
			request.getRequestDispatcher("/pages/AddProduct.jsp").forward(request, response);
		}

	}

}
