<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  
<%@ page import="com.zakat.model.Application" %>  

<jsp:include page="admin_header.jsp"></jsp:include>  

<%  
    String applyId = "18";  // Hardcoded applyId for demonstration  
    Application app = null;  
    Connection connection = null;  
    Statement stmt = null;  
    ResultSet rs = null;  

    try {  
        // Establish database connection  
        connection = DBConnection.getConnection();  
        stmt = connection.createStatement();  

        // Prepare SQL query to fetch application with applyId = 18, excluding certain fields  
        String query = "SELECT APPLYID, STUDENTID, BANTUANMAKAN, CGPA, GPA, " +  
                       "BANTUANKEWANGAN, BANTUANKEWANGANNAMA, BANTUANKEWANGANNILAI, " +  
                       "GRADYEAR, BANKNO, BANKNAME " +  // Excluded STUDENTLETTER, TRANSCRIPT, and ICDOC  
                       "FROM APPLICATION WHERE APPLYID = '" + applyId + "'";  

        rs = stmt.executeQuery(query);  

        if (rs.next()) {  
            app = new Application();  
            app.setApplyID(rs.getString("APPLYID"));  
            app.setStudentId(rs.getString("STUDENTID"));  
            app.setBantuanMakan(rs.getString("BANTUANMAKAN"));  
            app.setCGPA(rs.getDouble("CGPA"));  
            app.setGPA(rs.getDouble("GPA"));  
            app.setBantuanKewangan(rs.getString("BANTUANKEWANGAN"));  
            app.setBantuanKewanganNama(rs.getString("BANTUANKEWANGANNAMA"));  
            app.setBantuanKewanganNilai(rs.getString("BANTUANKEWANGANNILAI"));  
            app.setGradYear(rs.getInt("GRADYEAR"));  
            app.setBankNo(rs.getString("BANKNO"));  
            app.setBankName(rs.getString("BANKNAME"));  
        }  
    } catch (SQLException e) {  
        e.printStackTrace();  // Log the error  
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
    <title>Application Details</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
</head>  
<body class="bg-purple-800">  

<div class="container mx-auto mt-10 p-6 rounded-lg shadow-md" style="background: #7C3AED;">  
    <h1 class="text-3xl font-bold mb-4 text-center text-white">Latest of Application</h1>  

    <table class="min-w-full">  
        <tbody>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Application ID:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getApplyID() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Student ID:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getStudentId() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Bantuan Makan:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getBantuanMakan() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">CGPA:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getCGPA() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">GPA:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getGPA() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Bantuan Kewangan:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getBantuanKewangan() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Bantuan Kewangan Nama:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getBantuanKewanganNama() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Bantuan Kewangan Nilai:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getBantuanKewanganNilai() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Graduation Year:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getGradYear() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Bank Number:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getBankNo() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Bank Name:</td>  
                <td class="border px-4 py-2 bg-white"><%= app != null ? app.getBankName() : "Not Found" %></td>  
            </tr>  
        </tbody>  
    </table>  

    <div class="mt-6 text-center">  
        <a href="viewapplication.jsp" class="bg-purple-800 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Back to Application List</a>  
    </div>  
</div>  

</body>  
</html>