<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>  
<html>  
<head>  
    <title>Donator Dashboard - Zakat UiTM</title>  
    <jsp:include page="header.jsp"></jsp:include>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">  
</head>  

<body>  
    <!-- Main Content -->  
    <div class="w3-container w3-padding-32">  
        <div class="w3-container w3-center">  
            <h1>Donator Dashboard</h1>  
        </div>  
        <div class="w3-container w3-center w3-padding">  
            <%  
                String staff = (String) session.getAttribute("USERNAME"); 
                if (staff != null) {  
            %>  
                <p class="w3-large">Welcome to your dashboard, <%= staff %>!</p>  
            <%  
                } else {  
            %>  
                <p class="w3-large">Welcome to the Donator Dashboard!</p>  
            <%  
                }  
            %>  
        </div>  

        <!-- Button Container -->  
        <div class="w3-center w3-padding">  
            <%  
                if (staff != null) {  
            %>    
                <button class="w3-button w3-purple w3-padding-large w3-margin" onclick="location.href='donatorProfile.jsp'"><i class="fas fa-user"></i> Profile</button>  
                <button class="w3-button w3-purple w3-padding-large w3-margin" onclick="location.href='donationHistory.jsp'"><i class="fas fa-history"></i> Donation History</button>  
            <%  
                } else {  
            %>  
                <button class="w3-button w3-purple w3-padding-large w3-margin" onclick="location.href='loginDonator.jsp'"><i class="fas fa-sign-in-alt"></i> Login</button>  
            <%  
                }  
            %>  
        </div>     
    </div>  
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>
