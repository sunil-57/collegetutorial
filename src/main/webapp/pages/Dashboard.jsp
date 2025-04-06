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
                    
                    <!-- Add New Category Form -->
                    <form action="${pageContext.request.contextPath}/CategoryController" method="post" class="mb-4">
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
                    
                    <!-- Category Table -->
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead class="thead-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="category" items="${categories}">
                                    <tr>
                                        <td>${category.id}</td>
                                        <td>${category.name}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty category.description}">
                                                    ${category.description}
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="text-muted">No description</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <!-- Edit Button -->
                                            <button class="btn btn-sm btn-warning" data-bs-toggle="modal" 
                                                    data-bs-target="#editModal${category.id}">
                                                <i class="bi bi-pencil"></i> Edit
                                            </button>
                                            
                                            <!-- Delete Form -->
                                            <form action="${pageContext.request.contextPath}/CategoryController" method="post" style="display:inline;">
                                                <input type="hidden" name="action" value="delete">
                                                <input type="hidden" name="categoryId" value="${category.id}">
                                                <button type="submit" class="btn btn-sm btn-danger" 
                                                        onclick="return confirm('Are you sure? This will delete ${category.name} category')">
                                                    <i class="bi bi-trash"></i> Delete
                                                </button>
                                            </form>
                                        </td>
                                    </tr>
                                    
                                    <!-- Edit Modal -->
                                    <div class="modal fade" id="editModal${category.id}" tabindex="-1">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Edit Category: ${category.name}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="${pageContext.request.contextPath}/CategoryController" method="post">
                                                    <div class="modal-body">
                                                        <input type="hidden" name="action" value="update">
                                                        <input type="hidden" name="categoryId" value="${category.id}">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Name</label>
                                                                    <input type="text" class="form-control" 
                                                                           name="categoryName" value="${category.name}" required>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <div class="mb-3">
                                                                    <label class="form-label">Description</label>
                                                                    <textarea class="form-control" 
                                                                              name="categoryDescription" rows="3">${category.description}</textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                        <button type="submit" class="btn btn-primary">Save Changes</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
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
