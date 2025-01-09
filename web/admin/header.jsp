<!DOCTYPE html>
<html>
<head>
    <title>Zakat UiTM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Custom styles */
        .header-container {
            width: 80%; /* 10% margin on left and right */
            margin: 0 auto; /* Center the container */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0; /* Add padding for spacing */
        }
        .w3-top {
            background-color: #AF65C2; /* Lighter purple background */
            color: white; /* Text color */
        }
        .w3-bar a {
            color: white;
        }
        .w3-bar a:hover {
            background-color: #9B30FF; /* Darker purple for hover effect */
        }
        /* Style for icons */
        .w3-bar a i {
            margin-right: 8px; /* Add space between icon and text */
        }
    </style>
</head>
    <%
        String logoutMessage = (String) request.getSession().getAttribute("logoutMessage");
        if (logoutMessage != null) {
    %>
        <script>
            alert("<%= logoutMessage %>");
        </script>
    <%
            request.getSession().removeAttribute("logoutMessage");
        }
    %>
<body>
    <!-- Header -->
    <div class="w3-top w3-card-4" style="z-index:999">
        <div class="header-container">
            <!-- Logo on the left -->
            <a href="index.jsp" class="w3-bar-item w3-button w3-padding-large">
                <img src="sources/1ZakatLogoBR.png" alt="Logo" style="height:40px;">
            </a>
            <!-- Right side links -->
            <div class="w3-right w3-hide-small">
                <%
                    String user = (String) session.getAttribute("NAME");
                    if(user != null) {
                %>
                        <span class="w3-padding-large">Assalamu'alaikum, <%= user %></span>
                        <!-- Dashboard Button with Icon -->
                        <a href="dashboard.jsp" class="w3-button w3-border-bottom w3-padding-large">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                        </a>
                        <!-- Logout Button with Icon -->
                        <a href="logoutAll" class="w3-button w3-border-bottom w3-padding-large">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                <%
                    } else {
                %>
                        <!-- Login Button with Icon -->
                        <a href="loginStudent.jsp" class="w3-button w3-border-bottom w3-padding-large">
                            <i class="fas fa-sign-in-alt"></i> Login
                        </a>
                <%
                    }
                %>
            </div>
        </div>
    </div>
    <!-- Rest of your page content goes here -->
</body>
</html>