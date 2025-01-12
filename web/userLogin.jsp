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
    <title>Student Login</title>
   
    <style>
    body {
        background-size: cover; /* Ensures the image covers the entire page */
        background-position: center; /* Centers the image */
        background-repeat: no-repeat; /* Prevents tiling of the image */
        background-attachment: fixed; /* Keeps the image fixed while scrolling */
        
  
 
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      .container {
        width: 350px;
        padding: 20px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border: 8px solid #800080; /* Thicker purple border */
       
        text-align: center;
      }

      .title {
        text-align: center;
        margin-bottom: 20px;
        font-size: 24px;
        font-weight: bold;
        color: #000;
      }

      .form {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      label {
        margin-bottom: 5px;
        font-weight: bold;
        width: 100%;
        text-align: left;
      }

      input {
        margin-bottom: 15px;
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 100%; /* Full width */
        box-sizing: border-box;
      }

      .login-button {
        background-color: #800080; /* Purple color */
        color: white;
        border: none;
        padding: 10px;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        width: 100%; /* Full width */
      }

      .login-button:hover {
        background-color: #550055; /* Darker purple on hover */
      }

      .back-button {
        margin-top: 10px;
        width: 100%;
        padding: 10px;
        background-color: #666;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
      }

      .back-button:hover {
        background-color: #444;
      }


</style>

</head>
<body ><br><Br><br><br><br>
    <div class="w3-container container w3-center" style="margin-left: 40%; margin-bottom:2%; margin-top: 2%">
    <h2 class="title">Log Masuk</h2>
    <form class="form" action="form" method="post">
      <label for="username">Username:</label>
      <input type="text" id="username" name="matricno" placeholder="Masukkan Nombor Matrik/Pengenalan" required>
      
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" placeholder="Masukkan kata laluan" required>
      
      <button type="submit" class="login-button">Log Masuk</button><br>
      <a href="studentForm.jsp">Tidak berdaftar? Tekan disini</a>
    </form>
    <button href="index.jsp" class="back-button">Back</button>
  </div>

    <!-- Error message if any -->
    <c:if test="${not empty errorMessage}">
        <p class="error">${errorMessage}</p>
    </c:if>
</body><br><br><br>

        <jsp:include page="Footer.jsp"></jsp:include>
 
</html>
