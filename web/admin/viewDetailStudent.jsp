<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  
<%@ page import="com.zakat.model.Student" %>  

<jsp:include page="admin_header.jsp"></jsp:include> 
<%  
    String studentId = request.getParameter("STUDENTID");  
    Student student = null;  
    Connection connection = null;  
    Statement stmt = null;  
    ResultSet rs = null;  

    try {  
        connection = DBConnection.getConnection();  
        stmt = connection.createStatement();  
        String query = "SELECT STUDENTID, PASSWORD, MATRICNO, NAME, INCOME, COURSECODE, COURSENAME, CAMPUS, EMAIL, PHONENUM, ADDRESS FROM STUDENT WHERE STUDENTID = '" + studentId + "'";  
        rs = stmt.executeQuery(query);  

        if (rs.next()) {  
            student = new Student();  
            student.setStudentId(rs.getString("STUDENTID"));  
            student.setPassword(rs.getString("PASSWORD")); // Assuming you may want to use it, though typically not displayed.  
            student.setMatricno(rs.getString("MATRICNO"));  
            student.setName(rs.getString("NAME"));  
            student.setIncome(rs.getInt("INCOME"));  
            student.setCourceCode(rs.getString("COURSECODE"));  
            student.setCourseName(rs.getString("COURSENAME"));  
            student.setCampus(rs.getString("CAMPUS"));  
            student.setEmail(rs.getString("EMAIL"));  
            student.setPhoneNum(rs.getString("PHONENUM"));  
            student.setAddress(rs.getString("ADDRESS"));  
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
<body class="bg-gray-100">  

<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">  
    <h1 class="text-3xl font-bold mb-4">Student Details</h1>  

    <table class="min-w-full">  
        <tbody>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Student ID:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getStudentId() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Password:</td>  
                <td class="border px-4 py-2">[hidden]</td> <!-- Typically should not display the password -->  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Matrik No:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getMatricno() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Name:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getName() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Income:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getIncome() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Course Code:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getCourceCode() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Course Name:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getCourseName() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Campus:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getCampus() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Email:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getEmail() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Phone Number:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getPhoneNum() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Address:</td>  
                <td class="border px-4 py-2"><%= student != null ? student.getAddress() : "Not Found" %></td>  
            </tr>  
        </tbody>  
    </table>  

    <div class="mt-6 text-center">  
        <a href="viewstudent.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Back to Student List</a>  
        <a href="viewDetailFamily.jsp?STUDENTID=<%= student != null ? student.getStudentId() : "" %>" class="bg-green-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-green-700 ml-4">Go to Family Details</a>  
    </div>  
</div>  

</body>  
</html>