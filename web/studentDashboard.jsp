<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Retrieve matric number from session
    String matricNumber = (String) session.getAttribute("matricNumber");
    if (matricNumber == null) {
        // Redirect to login page if no session exists
        response.sendRedirect("loginStudent.jsp");
        return;
    }

    // JDBC settings
    String jdbcURL = "jdbc:mysql://localhost:3306/zakat_system";
    String dbUser = "root";
    String dbPassword = "";

    // Variables to store student's name and email
    String fullName = "";
    String email = "";

    // Database connection and query
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        String query = "SELECT name, email FROM studentregister WHERE matricNumber = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, matricNumber);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            fullName = resultSet.getString("name");
            email = resultSet.getString("email");
        } else {
            // If no data found, set default messages
            fullName = "Unknown Student";
            email = "Email not found";
        }

        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        fullName = "Error fetching data";
        email = "Error fetching data";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Arial', sans-serif;
            display: flex;
            height: 100vh;
            color: #fff;
            background-color: #1b1b3a;
        }
        .sidebar {
            width: 260px;
            background-color: #2c2c54;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
        }
        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #fff;
            font-size: 1.8em;
        }
        .sidebar a {
            text-decoration: none;
            color: #bbb;
            display: block;
            padding: 12px 15px;
            margin: 8px 0;
            border-radius: 5px;
            font-size: 1.1em;
            transition: all 0.3s;
        }
        .sidebar a:hover {
            background-color: #6c5ce7;
            color: #fff;
        }
        .sidebar .logout {
            margin-top: auto;
            background-color: #d63031;
            color: #fff;
            font-weight: bold;
        }
        .sidebar .logout:hover {
            background-color: #ff7675;
        }
        .content {
            flex-grow: 1;
            padding: 40px;
            background-color: #1b1b3a;
        }
        .content h1 {
            font-size: 2.2em;
            margin-bottom: 20px;
            color: #6c5ce7;
        }
        .content p {
            font-size: 1.2em;
            margin-bottom: 10px;
        }
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }
        .card {
            background-color: #2c2c54;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: calc(33.333% - 20px);
            color: #fff;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .card h2 {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: #6c5ce7;
        }
        .card p {
            font-size: 1em;
            color: #bbb;
        }
        @media (max-width: 768px) {
            .card {
                width: 100%;
            }
        }
    </style>
</head>
<script>
        // Check if success is true and show a popup
        window.onload = function() {
            const success = '<%= request.getAttribute("success") %>';
            if (success.equals("success")) {
                alert('Data saved successfully!');
            }
        };
    </script>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Dashboard</h2>
        <a href="studentDashboard.jsp">Home</a>
        <a href="viewProfile.jsp">View Profile</a>
        <a href="viewCourses.jsp">View Courses</a>
        <a href="changePassword.jsp">Change Password</a>
        <a href="contactSupport.jsp">Contact Support</a>
        <a href="logoutStudentServlet" class="logout">Logout</a>
    </div>

    <!-- Content -->
    <div class="content">
        <h1>Welcome to Your Dashboard</h1>
        <p><strong>Name:</strong> <%= fullName %></p>
        <p><strong>Email:</strong> <%= email %></p>
        <p>Use the sidebar to navigate through your dashboard.</p>

        <!-- Cards Section -->
        <div class="card-container">
            <div class="card">
                <h2>Profile</h2>
                <p>View and update your personal information.</p>
                <a href="viewProfile.jsp" style="color: #6c5ce7; text-decoration: underline;">Go to Profile</a>
            </div>
            <div class="card">
                <h2>Courses</h2>
                <p>Check out your enrolled courses and details.</p>
                <a href="viewCourses.jsp" style="color: #6c5ce7; text-decoration: underline;">Go to Courses</a>
            </div>
            <div class="card">
                <h2>Support</h2>
                <p>Contact support for any assistance you need.</p>
                <a href="contactSupport.jsp" style="color: #6c5ce7; text-decoration: underline;">Contact Support</a>
            </div>
        </div>
    </div>
</body>
</html>
