<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.Connection" %>  
<%@ page import="java.sql.Statement" %>  
<%@ page import="java.sql.ResultSet" %>  
<%@ page import="java.sql.SQLException" %>  
<%@ page import="com.zakat.model.DBConnection" %>  
<%@ page import="com.zakat.model.Donator" %>  

<jsp:include page="admin_header.jsp"></jsp:include> 
<%  
    String donatorID = request.getParameter("DONATORID");  
    Donator donator = null;  
    Connection connection = null;  
    Statement stmt = null;  
    ResultSet rs = null;  

    try {  
        connection = DBConnection.getConnection();  
        stmt = connection.createStatement();  
        String query = "SELECT DONATORID, USERNAME, EMAIL, PHONENUM, NOIC, STATE, CITY, PASSWORD FROM DONATOR WHERE DONATORID = '" + donatorID + "'";  
        rs = stmt.executeQuery(query);  

        if (rs.next()) {  
            donator = new Donator();  
            donator.setDonatorID(rs.getString("DONATORID"));  
            donator.setUsername(rs.getString("USERNAME"));  
            donator.setEmail(rs.getString("EMAIL"));  
            donator.setPhoneNum(rs.getString("PHONENUM"));  
            donator.setNoic(rs.getString("NOIC"));  
            donator.setState(rs.getString("STATE"));  
            donator.setCity(rs.getString("CITY"));  
            donator.setPassword(rs.getString("PASSWORD")); // Assuming you may want to use it, though typically not displayed.  
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
    <title>Donator Details</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
</head>  
<body class="bg-purple-800">  

<div class="container mx-auto mt-10 p-6 rounded-lg shadow-md" style="background: #7C3AED;">  
    <h1 class="text-3xl font-bold mb-4 text-center text-white">Tentang Penyumbang</h1>  

    <table class="min-w-full">  
        <tbody>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Donator ID:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getDonatorID() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Username:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getUsername() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Email:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getEmail() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Phone Number:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getPhoneNum() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">No IC:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getNoic() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">State:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getState() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">City:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getCity() : "Not Found" %></td>  
            </tr>  
            <tr>  
                <td class="border px-4 py-2 font-semibold bg-white">Password:</td>  
                <td class="border px-4 py-2 bg-white"><%= donator != null ? donator.getPassword() : "Not Found" %></td> <!-- Typically should not display the password -->  
            </tr>  
        </tbody>  
    </table>  

    <div class="mt-6 text-center">  
        <a href="viewdonator.jsp" class="bg-purple-800 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Kembali</a>  
    </div>  
</div>  

</body>  
</html>