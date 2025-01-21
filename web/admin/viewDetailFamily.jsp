<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  
<%@ page import="com.zakat.model.Family" %>  

<jsp:include page="admin_header.jsp"></jsp:include> 
<%  
    String studentId = request.getParameter("STUDENTID");  
    Family family = null;  
    Connection connection = null;  
    Statement stmt = null;  
    ResultSet rs = null;  

    try {  
        connection = DBConnection.getConnection();  
        stmt = connection.createStatement();  
        String query = "SELECT F.STUDENTID, F.FNAME, F.FWORK, F.FPHONENUM, F.MNAME, F.MWORK, F.MPHONENUM, " +  
                       "F.GUARDIANRELAY, F.GUARDIANWORK, F.GUARDIANPHONENUM, F.MARITALSTATUS, " +  
                       "F.ADDRESS, F.POSTCODE, F.GROSSINCOMEM, F.GROSSINCOMEF " +  
                       "FROM FAMILY F " +  
                       "WHERE F.STUDENTID = '" + studentId + "'";  
        
        rs = stmt.executeQuery(query);  

        if (rs.next()) {  
            family = new Family();  
            family.setStudentId(rs.getString("STUDENTID"));  
            family.setFName(rs.getString("FNAME"));  
            family.setFWork(rs.getString("FWORK"));  
            family.setFPhoneNum(rs.getString("FPHONENUM"));  
            family.setMName(rs.getString("MNAME"));  
            family.setMWork(rs.getString("MWORK"));  
            family.setMPhoneNum(rs.getString("MPHONENUM"));  
            family.setGuardianRelay(rs.getString("GUARDIANRELAY"));  
            family.setGuardianWork(rs.getString("GUARDIANWORK"));  
            family.setGuardianPhoneNum(rs.getString("GUARDIANPHONENUM"));  
            family.setMaritalStatus(rs.getString("MARITALSTATUS"));  
            family.setAddress(rs.getString("ADDRESS"));  
            family.setPostcode(rs.getString("POSTCODE"));  
            family.setGrossIncomeM(rs.getInt("GROSSINCOMEM"));  
            family.setGrossIncomeF(rs.getInt("GROSSINCOMEF"));  
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
    <title>Family Details</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
</head>  
<body class="bg-gray-100">  

<div class="container mx-auto mt-10 p-6 bg-white rounded-lg shadow-md" style="background: #7C3AED;">  
    <h1 class="text-3xl font-bold mb-4">Family Details</h1>  

    <table class="min-w-full">  
        <tbody>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Student ID:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getStudentId() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Father's Name:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getFName() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Father's Work:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getFWork() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Father's Phone Number:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getFPhoneNum() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Mother's Name:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getMName() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Mother's Work:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getMWork() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Mother's Phone Number:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getMPhoneNum() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Guardian's Relationship:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getGuardianRelay() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Guardian's Work:</td>  
                <td class="border px-4 py-2 bg-white "><%= family != null ? family.getGuardianWork() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Guardian's Phone Number:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getGuardianPhoneNum() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Marital Status:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getMaritalStatus() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Address:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getAddress() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Postcode:</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getPostcode() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Gross Income (Mother):</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getGrossIncomeM() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Gross Income (Father):</td>  
                <td class="border px-4 py-2 bg-white"><%= family != null ? family.getGrossIncomeF() : "Not Found" %></td>  
            </tr>  
        </tbody>  
    </table>  

    <div class="mt-6 text-center">  
        <a href="viewstudent.jsp" class="bg-purple-800 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Kembali</a>  
    </div>  
</div>  

</body>  
</html>