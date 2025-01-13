<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Success</title>
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
    <script>
        // Timer for automatic redirection
        setTimeout(function() {
            window.location.href = "studentDashboard.jsp";
        }, 5000); // Redirect after 5 seconds
    </script>
</head>
<body>
    <div class="container">
        <h2>Log Masuk Berjaya!</h2>
        <p>Selamat Datang, <%=session.getAttribute("NAME")%>!</p> <!-- Assuming student name is stored in session after login -->
        <p>You have logged in successfully.</p>
        <p class="redirect-timer">
            You will be redirected to the home page in <strong>5 seconds</strong>.
        </p>
        <p class="w3-text-grey">If you don't want to wait, click the button below:</p>
        <form action="index.jsp">
            <button type="submit" class="w3-button">
                Go to Home Page Now
            </button>
        </form>
    </div>
</body>
</html>
