<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<jsp:include page="header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <link rel="stylesheet" href="style.css">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <title>Login - Zakat UiTM</title>  
   
    <style>  
        * {  
            margin: 0;  
            padding: 0;  
            box-sizing: border-box;  
            font-family: sans-serif;  
        }  
        .login-container {  
            display: flex;  
            justify-content: center;  
            align-items: center;  
            height: 100vh;  
            background-color: #f4f4f4;  
        }  
        .login-form {  
            background: #1c1c1e;  
            padding: 30px;  
            border-radius: 16px;  
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);  
            color: #fff;  
            width: 400px;  
            text-align: center;  
        }  
        h2 {  
            color: #fff;  
            font-size: 18px;  
            margin-bottom: 20px;  
        }  
        .role-selection {  
            display: flex;  
            justify-content: space-between;  
            margin-bottom: 20px;  
        }  
        .role-selection label {  
            flex: 1;  
            text-align: center;  
            padding: 10px;  
            background-color: #2c2c2e;  
            border-radius: 8px;  
            cursor: pointer;  
            margin: 0 5px;  
        }  
        .role-selection input[type="radio"] {  
            display: none; /* Hide the radio buttons */  
        }  
        .role-selection input[type="radio"]:checked + label {  
            background-color: #6a00ff; /* Highlight selected role */  
            color: #fff;  
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
        .button-container {  
            display: flex;  
            justify-content: space-between;  
            margin-top: 20px;  
        }  
        button {  
            padding: 12px 25px;  
            background-color: #6a00ff;  
            color: #fff;  
            border: none;  
            border-radius: 8px;  
            cursor: pointer;  
            font-weight: bold;  
            font-size: 14px;  
            flex: 1;  
            margin: 0 5px;  
        }  
        button:hover {  
            background-color: #5000d1;  
        }  
        .error {  
            color: red;  
            margin-bottom: 10px;  
        }  
    </style>  
</head>  
<body>  
    <div class="login-container">  
        <form action="form" method="post" class="login-form">  
            <h2>Log Masuk</h2>  
            <div class="role-selection">  
                <input type="radio" name="userType" value="student" id="student" checked>  
                <label for="student">Student</label>  
                <input type="radio" name="userType" value="donor" id="donor">  
                <label for="donor"  onclick="window.location.href='loginDonator.jsp'">Donor</label>  
            </div>  
            <input type="text" name="matricno" placeholder="Masukkan Nombor Matrik" required>  
            <input type="password" name="password" placeholder="Masukkan Password" required>  
            <div class="button-container">  
                <button type="button" onclick="window.location.href='index.jsp'">Cancel</button>  
                <button type="submit">Login</button>  
            </div>  
        </form>  

        <!-- Error message if any -->  
        <c:if test="${not empty errorMessage}">  
            <p class="error">${errorMessage}</p>  
        </c:if>  
    </div>  

    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>