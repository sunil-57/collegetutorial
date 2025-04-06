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

    <!-- Logout button -->
    <div class="container mt-5 text-center">
        <form action="LogOutController" method="post">
            <button type="submit" class="btn btn-danger">Log Out</button>
        </form>
    </div>

</body>
</html>
