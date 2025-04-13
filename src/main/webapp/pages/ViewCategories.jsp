<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Categories</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-size: 0.9rem;
}

h2 {
	font-size: 1.3rem;
}

.form-control, textarea {
	font-size: 0.85rem;
	padding: 0.3rem 0.5rem;
}

.btn {
	font-size: 0.85rem;
	padding: 0.4rem 0.75rem;
}

label {
	font-weight: 500;
	margin-bottom: 0.2rem;
}
</style>
</head>
<body>
	<div class="container mt-4 mb-5">

		<!-- Display message if there is any -->
		<c:if test="${not empty errorMessage}">
			<div class="alert alert-${messageType} py-2 px-3 mb-3" role="alert">
				${errorMessage}</div>
		</c:if>

		<h2 class="mb-3">Available Categories</h2>

		<ul class="list-group mb-4">
			<c:forEach var="category" items="${categories}">
				<li class="list-group-item py-2 px-3">${category.name}</li>
			</c:forEach>
		</ul>

		<!-- Category Table -->
		<div class="table-responsive">
			<table class="table table-sm table-striped table-hover">
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
							<td>${category.categoryId}</td>
							<td>${category.name}</td>
							<td><c:choose>
									<c:when test="${not empty category.description}">
										${category.description}
									</c:when>
									<c:otherwise>
										<span class="text-muted">No description</span>
									</c:otherwise>
								</c:choose></td>
							<td>
								<!-- Edit Button -->
								<button class="btn btn-sm btn-warning mb-1" data-toggle="modal"
									data-target="#editModal${category.categoryId}">Edit</button> <!-- Delete Form -->
								<form
									action="${pageContext.request.contextPath}/CategoryController"
									method="post" style="display: inline;">
									<input type="hidden" name="action" value="delete"> <input
										type="hidden" name="categoryId" value="${category.categoryId}">
									<button type="submit" class="btn btn-sm btn-danger"
										onclick="return confirm('Are you sure you want to delete ${category.name}?')">
										Delete</button>
								</form>
							</td>
						</tr>

						<!-- Edit Modal -->
						<div class="modal fade" id="editModal${category.categoryId}"
							tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Edit Category: ${category.name}</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form
										action="${pageContext.request.contextPath}/CategoryController"
										method="post">
										<div class="modal-body">
											<input type="hidden" name="action" value="update"> <input
												type="hidden" name="categoryId"
												value="${category.categoryId}">
											<div class="row">
												<div class="col-md-6">
													<div class="mb-3">
														<label>Name</label> <input type="text"
															class="form-control" name="categoryName"
															value="${category.name}" required>
													</div>
												</div>
												<div class="col-md-6">
													<div class="mb-3">
														<label>Description</label>
														<textarea class="form-control" name="categoryDescription"
															rows="2">${category.description}</textarea>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-primary">Save
												Changes</button>
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

	<!-- Bootstrap JS (if not already included elsewhere) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
