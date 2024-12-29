<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error - Login Staff Failed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            text-align: center;
            padding: 50px;
        }
        .error {
            color: red;
            font-size: 20px;
        }
        a {
            text-decoration: none;
            color: purple;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <h2>Login Failed</h2>
    <p class="error">${errorMessage}</p>
    <p><a href="loginStaff.jsp">Try again</a></p>
</body>
</html>
