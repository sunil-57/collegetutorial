<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>College Tutorial</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-size: 0.9rem;
}

.navbar-custom {
	background-color: transparent;
}

.navbar-nav .nav-link {
	color: black;
}

.navbar-nav .nav-link.active {
	font-weight: bold;
}

.navbar-nav .nav-link:hover {
	color: #007bff;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-custom navbar-light mb-4">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/pages/Dashboard.jsp"><strong>College Tutorial</strong></a>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a
						class="nav-link ${activePage == 'dashboard' ? 'active' : ''}"
						href="${pageContext.request.contextPath}/pages/Dashboard.jsp">Dashboard</a>
					</li>
					<li class="nav-item"><a
						class="nav-link ${activePage == 'categories' ? 'active' : ''}"
						href="${pageContext.request.contextPath}/GetCategoriesServlet?page=viewCategories">Categories</a>
					</li>
					<li class="nav-item"><a
						class="nav-link ${activePage == 'products' ? 'active' : ''}"
						href="${pageContext.request.contextPath}/GetCategoriesServlet?page=addProduct">Products</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/LogOutController">Logout</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
