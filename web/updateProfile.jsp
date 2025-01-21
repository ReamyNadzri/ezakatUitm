<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  <jsp:include page="header.jsp"></jsp:include>  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <link rel="stylesheet" href="style.css">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <title>Update Profile - Zakat UiTM</title>  
    <style>  
        

        .container {  
            width: 40%; /* Set width to 40% */  
            padding: 20px;  
            background-color: #fff;  
            border-radius: 10px;  
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);  
            border: 8px solid #800080; /* Thicker purple border */  
            text-align: center;  
            margin: auto;  
        }  

        .title {  
            text-align: center;  
            margin-bottom: 20px;  
            font-size: 24px;  
            font-weight: bold;  
            color: #000;  
        }  

        .form {  
            display: flex;  
            flex-direction: column;  
            align-items: center;  
        }  

        .form-group {  
            width: 100%; /* Ensure form groups take full width */  
            margin-bottom: 15px;  
            text-align: left; /* Align labels and inputs to the left */  
        }  

        label {  
            margin-bottom: 5px;  
            font-weight: bold;  
            display: block; /* Ensure labels are on their own line */  
        }  

        input {  
            width: 100%; /* Full width */  
            padding: 10px;  
            font-size: 14px;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
            box-sizing: border-box; /* Include padding and border in element's total width */  
        }  

        .update-button {  
            background-color: #800080; /* Purple color */  
            color: white;  
            border: none;  
            padding: 10px;  
            border-radius: 5px;  
            font-size: 16px;  
            cursor: pointer;  
            width: 100%; /* Full width */  
        }  

        .update-button:hover {  
            background-color: #550055; /* Darker purple on hover */  
        }  

        .back-button {  
            margin-top: 10px;  
            width: 100%;  
            padding: 10px;  
            background-color: #666;  
            color: white;  
            border: none;  
            border-radius: 5px;  
            font-size: 14px;  
            cursor: pointer;  
        }  

        .back-button:hover {  
            background-color: #444;  
        }  
    </style>  
</head>  
<body>  <br><Br><br><br>
    <div class="container">  
        <h2 class="title">Update Profile</h2>  
        <%  

            String matricno = (String) session.getAttribute("MATRICNO"); // Assume student ID is stored in session  

            if (matricno != null) {  
                Connection conn = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    // Load Oracle JDBC Driver  
                    conn = DBConnection.getConnection();  
                    String sql = "SELECT * FROM student WHERE matricno = ?";  
                    stmt = conn.prepareStatement(sql);  
                    stmt.setString(1, matricno);  
                    rs = stmt.executeQuery();  

                    if (rs.next()) {  
                        String name = rs.getString("name");  
                        String email = rs.getString("email");  
                        String phoneNum = rs.getString("phoneNum");  
                        String address = rs.getString("address");  
        %>  
                        <form class="form" action="processUpdate.jsp" method="post">  
                            <div class="form-group">  
                                <label for="name">Name:</label>  
                                <input type="text" id="name" name="name" value="<%= name %>" required>  
                            </div>  
                            <div class="form-group">  
                                <label for="email">Email:</label>  
                                <input type="email" id="email" name="email" value="<%= email %>" required>  
                            </div>  
                            <div class="form-group">  
                                <label for="phoneNum">Phone Number:</label>  
                                <input type="text" id="phoneNum" name="phoneNum" value="<%= phoneNum %>" required>  
                            </div>  
                            <div class="form-group">  
                                <label for="address">Address:</label>  
                                <input type="text" id="address" name="address" value="<%= address %>" required>  
                            </div>  
                            <input type="hidden" name="matricno" value="<%= matricno %>">  
                            <button type="submit" class="update-button">Update</button>  
                        </form>  
        <%  
                    } else {  
                        out.println("<p class='text-danger'>No student found with the provided ID.</p>");  
                    }  
                } catch (SQLException e) {  
                    out.println("<p class='text-danger'>Error retrieving profile information: " + e.getMessage() + "</p>");  
                } finally {  
                    // Close resources  
                    if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }  
                    if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }  
                }  
            } else {  
                out.println("<p class='text-danger'>No student ID found in session.</p>");  
            }  
        %>  
        <br>  
        <a href="studentDashboard.jsp" class="back-button">Back</a>  
    </div>  
</body>  
<jsp:include page="Footer.jsp"></jsp:include>  
</html>