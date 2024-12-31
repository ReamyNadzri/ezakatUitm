<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Staff Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: inline-block;
        }
        h2 {
            color: green;
        }
        p {
            font-size: 1.2em;
            color: #555;
        }
        a {
            padding: 10px 20px;
            background-color: purple;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
            display: inline-block;
        }
        a:hover {
            background-color: darkviolet;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login Successful!</h2>
        <p>Welcome, ${sessionScope.Name}!</p> <!-- Assuming student name is stored in session after login -->
        <p>You have logged in successfully.</p>
        <a href="staffDashboard.jsp">Go to Dashboard</a> <!-- Redirect to student dashboard or another page -->
    </div>
</body>
</html>
