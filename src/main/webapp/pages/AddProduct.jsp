<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Product</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Add New Product</h2>

    <!-- Success Message -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>

    <!-- Error Message -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/AddProductServlet" method="post">
        <div class="form-group">
            <label for="name">Product Name</label>
            <input type="text" class="form-control" id="name" name="name" required placeholder="Enter product name">
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <textarea class="form-control" id="description" name="description" rows="2" required></textarea>
        </div>

        <div class="form-group">
            <label for="price">Price (NPR)</label>
            <input type="number" step="1" class="form-control" id="price" name="price" required placeholder="e.g., 1500">
        </div>

        <div class="form-group">
            <label for="stock">Stock Quantity</label>
            <input type="number" class="form-control" id="stock" name="stock" required placeholder="e.g., 10">
        </div>

        <div class="form-group">
            <label for="categoryId">Category</label>
            <select class="form-control" id="categoryId" name="categoryId" required>
                <option value="">-- Select Category --</option>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.categoryId}">${category.name}</option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Add Product</button>
    </form>
</div>
</body>
</html>
