<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  
<%@ page import="com.zakat.model.Staff" %>  

<jsp:include page="admin_header.jsp"></jsp:include> 
<%  
    String staffid = request.getParameter("STAFFID");  
    Staff s = null;  
    Connection connection = null;  
    Statement stmt = null;  
    ResultSet rs = null;  

    try {  
        connection = DBConnection.getConnection();  
        stmt = connection.createStatement();  
        String query = "SELECT STAFFID, STAFFNO, PASSWORD, NAME, PHONENUM, EMAIL, CAMPUS FROM STAFF WHERE STAFFID = '" + staffid + "'";
        rs = stmt.executeQuery(query);  

        if (rs.next()) {  
            s = new Staff();  
            s.setStaffId(rs.getString("STAFFID"));  
            s.setStaffNo(rs.getString("STAFFNO")); // Assuming you may want to use it, though typically not displayed.  
            s.setPassword(rs.getString("PASSWORD"));  
            s.setName(rs.getString("NAME"));  
            s.setPhoneNum(rs.getString("PHONENUM"));  
            s.setEmail(rs.getString("EMAIL"));  
            s.setCampus(rs.getString("CAMPUS")); 
        }  
    } catch (SQLException e) {  
        e.printStackTrace();  
    } finally {  
        // Close resources  
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
        if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }  
    }  
%>  

<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Student Details</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
</head>  
<body class="bg-purple-800">  

<div class="container mx-auto mt-10 p-6 rounded-lg shadow-md" style="background: #7C3AED;">  
    <h1 class="text-3xl font-bold mb-4 text-center text-white">Tentang Kakitangan</h1>  

    <table class="min-w-full">  
        <tbody>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Staff ID:</td>  
                <td class="border px-4 py-2 bg-white"><%= s != null ? s.getStaffId() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Password:</td>  
                <td class="border px-4 py-2 bg-white"><%= s != null ? s.getPassword() : "Not Found" %></td>
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Staff No:</td>  
                <td class="border px-4 py-2 bg-white"><%= s != null ? s.getStaffNo() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Name:</td>  
                <td class="border px-4 py-2 bg-white"><%= s != null ? s.getName() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Phone Number :</td>  
                <td class="border px-4 py-2 bg-white"><%= s != null ? s.getPhoneNum() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Email :</td>  
                <td class="border px-4 py-2 bg-white"><%= s != null ? s.getEmail() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Campus :</td>  
                <td class="border px-4 py-2 bg-white"><%= s != null ? s.getCampus() : "Not Found" %></td>  
            </tr>  
        </tbody>  
    </table>  

    <div class="mt-6 text-center">  
        <a href="viewstaff.jsp" class="bg-purple-800 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Kembali</a>  
    </div>  
</div>  

</body>  
</html>