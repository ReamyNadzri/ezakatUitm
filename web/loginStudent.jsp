<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f3f3f7;
        color: #333;
        text-align: center;
        padding: 50px;
    }
    form {
        display: inline-block;
        background: #1c1c1e;
        padding: 30px;
        border-radius: 16px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        color: #fff;
        width: 300px;
    }
    h2 {
        color: #fff;
        font-size: 18px;
        margin-bottom: 20px;
    }
    input {
        display: block;
        margin: 15px auto;
        padding: 12px;
        width: 90%;
        border: none;
        border-radius: 8px;
        background-color: #2c2c2e;
        color: #fff;
    }
    input::placeholder {
        color: #bbb;
    }
    button {
        margin-top: 15px;
        padding: 12px 25px;
        background-color: #6a00ff;
        color: #fff;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
        font-size: 14px;
    }
    button:hover {
        background-color: #5000d1;
    }
    a {
        display: block;
        margin-top: 10px;
        font-size: 14px;
        color: #6a00ff;
        text-decoration: none;
    }
    a:hover {
        color: #5000d1;
    }
    .error {
        color: red;
        margin-bottom: 10px;
    }
</style>

</head>
<body>
    <form action="loginStudentServlet" method="post">
        <h2>Login as Student</h2>
        <input type="text" name="matricno" placeholder="Enter Matric Number" required>
        <input type="password" name="password" placeholder="Enter Password" required>
        <button type="submit">Login</button>
        <a href="studentForm.jsp">Not Register Yet? Register First</a>
    </form>

    <!-- Error message if any -->
    <c:if test="${not empty errorMessage}">
        <p class="error">${errorMessage}</p>
    </c:if>
</body>
</html>
