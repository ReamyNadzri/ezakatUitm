<%@ page import="java.sql.*" %>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>  
<html>  
<head>  
    <title>Student Dashboard</title>  
    <style>  
    * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: google sans, sans-serif;
            }
            

    h1 {  
        text-align: center;  
        color: #333;  
        margin-bottom: 20px;  
    }  

    table {  
        width: 80%;  
        margin: 0 auto;  
        border-collapse: collapse;  
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);  
        border-radius: 8px;  
        overflow: hidden;  
        background-color: #fff;  
    }  

    th, td {  
        padding: 12px 15px;  
        text-align: left;  
        border-bottom: 1px solid #ddd;  
    }  

    th {  
        background-color: #4CAF50;  
        color: white;  
        font-weight: bold;  
    }  

    tr:hover {  
        background-color: #f1f1f1;  
    }  

    tr:nth-child(even) {  
        background-color: #f9f9f9;  
    }  

    tr:nth-child(odd) {  
        background-color: #ffffff;  
    }  

    @media (max-width: 768px) {  
        table {  
            width: 100%;  
        }  
    }  
</style>
</head>  
<body>  
    <h1>Student Dashboard</h1>  
    <table>  
        <tr>  
            <th>ID</th>  
            <th>Name</th>  
            <th>Matric No</th>  
            <th>Email</th>
            <th>Address</th> 
        </tr>  
        <%  
            String url = "jdbc:oracle:thin:@localhost:1521:xe"; // Adjust the URL as needed  
            String user = "zakatdb"; // replace with your DB username  
            String password = "zakatdb"; // replace with your DB password  

            Connection conn = null;  
            Statement stmt = null;  
            ResultSet rs = null;  

            try {  
                Class.forName("oracle.jdbc.driver.OracleDriver");  
                conn = DriverManager.getConnection(url, user, password);  
                stmt = conn.createStatement();  
                String sql = "SELECT * FROM student";  
                rs = stmt.executeQuery(sql);  

                while (rs.next()) {  
                    int studentId = rs.getInt("studentId");  
                    String name = rs.getString("name");  
                    String matricno = rs.getString("matricno");  
                    String email = rs.getString("email");
                    String address = rs.getString("address");
        %>  
                    <tr>  
                        <td><%= studentId %></td>  
                        <td><%= name %></td>  
                        <td><%= matricno %></td>  
                        <td><%= email %></td> 
                          <td><%= address %></td>
                    </tr>  
        <%  
                }  
            } catch (Exception e) {  
                e.printStackTrace();  
            } finally {  
                try {  
                    if (rs != null) rs.close();  
                    if (stmt != null) stmt.close();  
                    if (conn != null) conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
        %>  
    </table>  
</body>
 <jsp:include page="Footer.jsp"></jsp:include>
</html>