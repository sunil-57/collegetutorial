<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Web Application</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-size: 0.9rem;
        }
        .navbar-custom {
            background-color: transparent; /* No background color */
        }
        .navbar-nav .nav-link {
            color: black; /* Set navigation links to black */
        }
        .navbar-nav .nav-link:hover {
            color: #007bff; /* Add hover effect for links */
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-custom navbar-light mb-4">
        <div class="container">
            <a class="navbar-brand" href="#"><strong>College Tutorial</strong></a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pages/Dashboard.jsp">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pages/ViewCategories.jsp"">Categories</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="LogOutController">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
