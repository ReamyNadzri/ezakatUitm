
<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<jsp:include page="admin_header.jsp"></jsp:include>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        html, body {  
            height: 100%;  
        }  
        .bg-custom {  
            background: white;  
        }  
    </style>
    
    <%
    String staffNo = (String) session.getAttribute("STAFFNO");
    String adminNo =  (String) session.getAttribute("ADMNOIC");
    boolean adminAccess = (Boolean) session.getAttribute("ADMIN");
    
    if (staffNo == null && adminNo == null) {
        // Redirect to login page if no session exists
        %>
        <script>alert('Log masuk terlebih dahulu!!!');
        window.location.href = 'index.jsp';
        </script>
        <%
        return;
    }
    %>
    
    
</head>
<body>
</body>

</html>
