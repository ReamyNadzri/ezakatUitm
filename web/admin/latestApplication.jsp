<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  
<%@ page import="com.zakat.model.Application" %>  

<%  
    Application latestApplication = null; // Renamed variable to avoid conflict  
    Connection connection = null;  
    Statement stmt = null;  
    ResultSet rs = null;  

    try {  
        // Establishing the database connection  
        connection = DBConnection.getConnection();  
        stmt = connection.createStatement();  
        
        // Query to get the latest application  
        String query = "SELECT APPLYID, STUDENTID, BANTUANMAKAN, CGPA, GPA, " +  
                       "BANTUANKEWANGAN, BANTUANKEWANGANNAMA, BANTUANKEWANGANNILAI, " +  
                       "GRADYEAR, STUDENTLETTER, TRANSCRIPT, ICDOC, BANKNO, BANKNAME " +  
                       "FROM APPLICATION " +  
                       "ORDER BY APPLYID DESC LIMIT 1"; // Get the latest application  
        
        rs = stmt.executeQuery(query);  

        if (rs.next()) {  
            latestApplication = new Application();  
            // Populate the application object with values from the result set  
            latestApplication.setApplyID(rs.getString("APPLYID"));  
            latestApplication.setStudentId(rs.getString("STUDENTID"));  
            latestApplication.setBantuanMakan(rs.getString("BANTUANMAKAN"));  
            latestApplication.setCGPA(rs.getDouble("CGPA"));  
            latestApplication.setGPA(rs.getDouble("GPA"));  
            latestApplication.setBantuanKewangan(rs.getString("BANTUANKEWANGAN"));  
            latestApplication.setBantuanKewanganNama(rs.getString("BANTUANKEWANGANNAMA"));  
            latestApplication.setBantuanKewanganNilai(rs.getString("BANTUANKEWANGANNILAI"));  
            latestApplication.setGradYear(rs.getInt("GRADYEAR"));  
            latestApplication.setStudentLetter(rs.getString("STUDENTLETTER"));  
            latestApplication.setTranscriptDoc(rs.getString("TRANSCRIPT"));  
            latestApplication.setIcDoc(rs.getString("ICDOC"));  
            latestApplication.setBankNo(rs.getString("BANKNO"));  
            latestApplication.setBankName(rs.getString("BANKNAME"));  
        }  
    } catch (SQLException e) {  
        e.printStackTrace(); // Log error for debugging  
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
    <title>Latest Application Details</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
</head>  
<body class="bg-gray-100">  

<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-md">  
    <h1 class="text-3xl font-bold mb-4">Latest Application Details</h1>  

    <table class="min-w-full">  
        <tbody>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Application ID:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getApplyID() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Student ID:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getStudentId() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Bantuan Makan:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getBantuanMakan() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">CGPA:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getCGPA() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">GPA:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getGPA() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Bantuan Kewangan:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getBantuanKewangan() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Bantuan Kewangan Nama:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getBantuanKewanganNama() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Bantuan Kewangan Nilai:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getBantuanKewanganNilai() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Graduation Year:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getGradYear() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Student Letter:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getStudentLetter() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Transcript Document:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getTranscriptDoc() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">IC Document:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getIcDoc() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Bank Number:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getBankNo() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold">Bank Name:</td>  
                <td class="border px-4 py-2"><%= latestApplication != null ? latestApplication.getBankName() : "Not Found" %></td>  
            </tr>  
        </tbody>  
    </table>  

    <div class="mt-6 text-center">  
        <a href="dashboard.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Back to Dashboard</a>  
    </div>  
</div>  

</body>  
</html>