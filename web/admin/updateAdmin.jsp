<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.PreparedStatement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  

<!DOCTYPE html>  
<html lang="en">
    <jsp:include page="admin_header.jsp"></jsp:include>
<head>  
    <meta charset="UTF-8">  
    <title>Update Admin</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
</head>
<style>
    .bg-custom {  
            background: linear-gradient(to bottom right, #6a0dad, #4b0082);  
        } 
</style>
<body class="bg-gray-100">  

<div class="bg-purple-800 shadow-lg rounded-lg p-8">  
    <h2 class="text-4xl font-bold text-center mb-6 text-black">Update Admin Details</h2>  

    <%  
        int adminId = Integer.parseInt(request.getParameter("ADMINID")); // Get the admin ID from the request  
        Connection conn = null;  
        PreparedStatement stmt = null;  
        ResultSet rs = null;  

        try {  
            conn = DBConnection.getConnection();  
            String sql = "SELECT ADMINID, USERNAME, PHONENUM FROM ADMIN WHERE ADMINID = ?";  
            stmt = conn.prepareStatement(sql);  
            stmt.setInt(1, adminId);  
            rs = stmt.executeQuery();  

            if (rs.next()) {  
    %>  
    <form action="actionAdminServlet" method="post" class="bg-white p-6 rounded shadow-md">  
        <input type="hidden" name="action" value="update">  
        <input type="hidden" name="ADMINID" value="<%= rs.getInt("ADMINID") %>">  

        <div class="mb-4">  
            <label class="block text-gray-700">Username:</label>  
            <input type="text" name="username" value="<%= rs.getString("USERNAME") %>" required class="border rounded w-full py-2 px-3">  
        </div>  
        <div class="mb-4">  
            <label class="block text-gray-700">Phone Number:</label>  
            <input type="text" name="phoneNum" value="<%= rs.getString("PHONENUM") %>" required class="border rounded w-full py-2 px-3">  
        </div>  
        <div class="mb-4">  
            <label class="block text-gray-700">Password:</label>  
            <input type="password" name="password" required class="border rounded w-full py-2 px-3">  
        </div>  
        <button type="submit" class="bg-blue-500 text-white rounded py-2 px-4">Update Admin</button>  
        <a href="viewadmin.jsp" class="ml-4 text-blue-500">Cancel</a>  
    </form>  
    <%  
            } else {  
                out.println("<p>Admin not found!</p>");  
            }  
        } catch (SQLException e) {  
            out.println("<p>Error retrieving admin details: " + e.getMessage() + "</p>");  
        } finally {  
            // Handle resource cleanup  
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }  
        }  
    %>  
</div>  

</body>  
</html>