<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
						<label for="categoryName">Category Name</label> <input type="text"
							class="form-control" id="categoryName" name="categoryName"
							placeholder="e.g. Electronics" required>
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
</body>
</html>