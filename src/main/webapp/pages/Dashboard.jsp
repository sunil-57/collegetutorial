<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

    <div class="container mt-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1>Welcome, <c:out value="${sessionScope.user.name}" />!</h1>
                <p class="lead">We are glad to have you here. Explore the products and services we offer!</p>
            </div>
        </div>
        
        <!-- Example for displaying user's role (optional) -->
        <div class="row mt-3">
            <div class="col-12 text-center">
                <p>Your Role: <strong><c:out value="${sessionScope.user.role}" /></strong></p>
            </div>
        </div>
    </div>
	<div class="container mt-5">
    <!-- Category Management Section -->
    <div class="row mt-5">
        <div class="col-md-10 mx-auto">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Category Management</h4>
                </div>
                <div class="card-body">
    <h3>Add a New Category</h3>

    <!-- Display Success Message -->
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
            <c:out value="${successMessage}" />
        </div>
    </c:if>

    <!-- Display Error Message -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            <c:out value="${errorMessage}" />
        </div>
    </c:if>
       <!-- Add New Category Form -->
                    <form action="${pageContext.request.contextPath}/AddCategoryServlet" method="post" class="mb-4">
                        <input type="hidden" name="action" value="add">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="categoryName" class="form-label">Category Name</label>
                                    <input type="text" class="form-control" id="categoryName" 
                                           name="categoryName" placeholder="Electronics" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="categoryDescription" class="form-label">Description</label>
                                    <textarea class="form-control" id="categoryDescription" 
                                              name="categoryDescription" rows="1" 
                                              placeholder="Devices and gadgets"></textarea>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Add Category</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- Logout button -->
    <div class="container mt-5 text-center">
        <form action="LogOutController" method="post">
            <button type="submit" class="btn btn-danger">Log Out</button>
        </form>
    </div>

</body>
</html>
