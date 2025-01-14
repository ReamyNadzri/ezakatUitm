<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Student Dashboard - Zakat UiTM</title>  
    <jsp:include page="header.jsp"></jsp:include>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">  
    <style>  
    body {  
        display: flex;  
        flex-direction: column;  
        height: 100vh;  
        margin: 0;  
    }  
    .main-content {  
        flex: 1;  
        padding: 20px;  
        background-color: #ffffff; /* Changed to white */  
        align-self: center;  
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
    .button-container {  
        margin: 20px 0;  
    }  
    .button {  
        background-color: #AF65C2;  
        color: white;  
        border: none;  
        padding: 20px 30px;  /* Increased padding for larger buttons */  
        margin: 5px;  
        cursor: pointer;  
        font-size: 18px;  /* Increased font size for better visibility */  
        border-radius: 5px;  
        transition: background-color 0.3s;  
    }  
    .button:hover {  
        background-color: #9B30FF;  
    }  
</style>  
</head>  

<body>  
    <!-- Main Content -->  
    <div class="main-content">  
        <div class="header-container">  
            <h1>Student Dashboard</h1>  
        </div>  
        <div class="welcome-message">  
            <%  
                String user = (String) session.getAttribute("NAME");  
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

        <!-- Button Container -->  
        <div class="button-container">  
            <%  
                if (user != null) {  
            %>    
                <button class="button" onclick="location.href='studentProfile.jsp'"><i class="fas fa-user"></i> Profile</button>  
                <button class="button" onclick="location.href='mohonzakat.jsp'"><i class="fas fa-user"></i> Mohon Zakat</button>  
                <button class="button" onclick="location.href='familyDetails.jsp'"><i class="fas fa-user"></i> Maklumat Keluarga</button>  
                <button class="button" onclick="location.href='formPeribadi.jsp'"><i class="fas fa-user"></i> Isi Maklumat Keluarga</button>   
            <%  
                } else {  
            %>  
                <button class="button" onclick="location.href='loginStudent.jsp'"><i class="fas fa-sign-in-alt"></i> Login</button>  
            <%  
                }  
            %>  
        </div>    
    </div>  
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>