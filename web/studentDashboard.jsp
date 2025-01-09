<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Student Dashboard - Zakat UiTM</title>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">  
    <style>  
        body {  
            display: flex;  
            flex-direction: row;  
            height: 100vh;  
            margin: 0;  
        }  
        .sidebar {  
            width: 250px;  
            background-color: #AF65C2;  
            color: white;  
            padding: 15px;  
        }  
        .sidebar a {  
            color: white;  
            text-decoration: none;  
            display: block;  
            padding: 10px;  
            margin: 5px 0;  
        }  
        .sidebar a:hover {  
            background-color: #9B30FF;  
        }  
        .main-content {  
            flex: 1;  
            padding: 20px;  
            background-color: #f8f9fa;  
        }  
        .header-container {  
            width: 100%;  
            display: flex;  
            justify-content: space-between;  
            align-items: center;  
            padding: 10px 0;  
        }  
        .welcome-message {  
            margin: 20px 0;  
            font-size: 24px;  
            font-weight: bold;  
        }  
    </style>  
</head>  
<body>  
    <!-- Sidebar -->  
    <div class="sidebar">  
        <h2>Zakat UiTM</h2>  
        <%  
            String user = (String) session.getAttribute("NAME");  
            if (user != null) {  
        %>  
            <p>Assalamu'alaikum, <%= user %></p>  
            <a href="studentDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>  
            <a href="studentProfile.jsp"><i class="fas fa-user"></i> Profile</a>  
            <a href="courses.jsp"><i class="fas fa-book"></i> Courses</a>  
            <a href="grades.jsp"><i class="fas fa-graduation-cap"></i> Grades</a>  
            <a href="logoutAll"><i class="fas fa-sign-out-alt"></i> Logout</a>  
        <%  
            } else {  
        %>  
            <a href="loginStudent.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>  
        <%  
            }  
        %>  
    </div>  

    <!-- Main Content -->  
    <div class="main-content">  
        <div class="header-container">  
            <h1>Student Dashboard</h1>  
        </div>  
        <div class="welcome-message">  
            <%  
                if (user != null) {  
            %>  
                Welcome to your dashboard, <%= user %>!  
            <%  
                } else {  
            %>  
                Welcome to the Student Dashboard!  
            <%  
                }  
            %>  
        </div>  

        <!-- Additional Dashboard Content -->  
        <div class="w3-container">  
            <h3>Your Courses</h3>  
            <p>List of courses you are enrolled in will go here.</p>  
            <!-- Add more content as needed -->  
        </div>  
    </div>  
</body>  
</html>