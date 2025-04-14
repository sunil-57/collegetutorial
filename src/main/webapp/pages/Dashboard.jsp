<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-size: 0.9rem;
}

.card-header h4 {
	font-size: 1.1rem;
}

h1, h3 {
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
	margin-bottom: 0.2rem;
	font-weight: 500;
}
</style>
</head>
<body>
<c:set var="activePage" value="dashboard" scope="request" />
<jsp:include page="/pages/Header.jsp"/>
	<div class="container mt-4">
		<div class="text-center mb-4">
			<h1>
				Welcome,
				<c:out value="${sessionScope.userWithSession.name}" />
				!
			</h1>
			<p class="text-muted mb-1">We are glad to have you here.</p>
			<p class="text-muted">
				Your Role: <strong><c:out
						value="${sessionScope.userWithSession.role}" /></strong>
			</p>
		</div>

		<!-- Category Management -->
		<div class="card mb-4">
			<div class="card-header bg-primary text-white">
				<h4 class="mb-0">Category Management</h4>
			</div>
			<div class="card-body">
				<h3 class="mb-3">Add New Category</h3>

				<c:if test="${not empty successMessage}">
					<div class="alert alert-success py-1">
						<c:out value="${successMessage}" />
					</div>
				</c:if>
				<c:if test="${not empty errorMessage}">
					<div class="alert alert-danger py-1">
						<c:out value="${errorMessage}" />
					</div>
				</c:if>

				<form action="${pageContext.request.contextPath}/AddCategoryServlet"
					method="post" class="mb-3">
					<input type="hidden" name="action" value="add">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="categoryName">Category Name</label> <input
								type="text" class="form-control" id="categoryName"
								name="categoryName" placeholder="e.g. Electronics" required>
						</div>
						<div class="form-group col-md-6">
							<label for="categoryDescription">Description</label>
							<textarea class="form-control" id="categoryDescription"
								name="categoryDescription" rows="1"
								placeholder="e.g. Devices and gadgets"></textarea>
						</div>
					</div>
					<button type="submit" class="btn btn-success">Add Category</button>
				</form>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/pages/Footer.jsp" />
</html>
