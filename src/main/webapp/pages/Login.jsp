<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<div class="container d-flex justify-content-center align-items-center vh-100">
		<div class="card p-4 shadow" style="width: 25rem;">
			<h3 class="text-center">Log In</h3>
			<!-- Error Message Display -->
			<c:if test="${not empty errorMessage}">
				<div class="alert alert-danger alert-dismissible fade show"
					role="alert">
					${errorMessage}
					<button type="button" class="btn-close" data-bs-dismiss="alert"
						aria-label="Close"></button>
				</div>
			</c:if>
			<form action="${pageContext.request.contextPath}/LogInController"
				method="post">
				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" id="email"
						placeholder="user@example.com" name="login_garda_deko_email">
				</div>
				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" class="form-control" id="password"
						name="login_garda_deko_password">
				</div>
				<button type="submit" class="btn btn-primary w-100">Log In</button>
			</form>
		</div>
	</div>
</body>
</html>