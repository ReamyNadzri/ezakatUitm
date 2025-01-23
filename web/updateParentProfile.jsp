<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>  
<html>  
<head>  <jsp:include page="header.jsp"></jsp:include>  
    <title>Kemaskini Profile Keluarga - Zakat UiTM</title>  
    <jsp:include page="header.jsp"></jsp:include>  
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">  
    <style>  
   
        .container {  
            width: 80%; /* Increased width to accommodate side-by-side inputs */  
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

        .form-row {  
            display: flex;  
            justify-content: space-between;  
            width: 100%;  
            margin-bottom: 15px;  
        }  

        .form-group {  
            width: 48%; /* Each input field takes 48% of the row width */  
            text-align: left;  
        }  

        label {  
            margin-bottom: 5px;  
            font-weight: bold;  
            display: block; /* Ensure labels are on their own line */  
        }  

        input, textarea {  
            width: 100%; /* Full width */  
            padding: 10px;  
            font-size: 14px;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
            box-sizing: border-box; /* Include padding and border in element's total width */  
        }  

        textarea {  
            height: 100px; /* Set a fixed height for the address textarea */  
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
<body>  <br><br><br><br>
    <div class="container">  
        <h2 class="title">Kemaskini Profile Keluarga</h2>  
        <%  
            String name = (String) session.getAttribute("STUDENTID"); // Assume student ID is stored in session  

            if (name != null) {  
                Connection conn = null;  
                PreparedStatement stmt = null;  
                ResultSet rs = null;  

                try {  
                    // Load Oracle JDBC Driver  
                    
                    conn = DBConnection.getConnection();
                    String sql = "SELECT * FROM family WHERE STUDENTID = ?";  
                    stmt = conn.prepareStatement(sql);  
                    stmt.setString(1, name);  
                    rs = stmt.executeQuery();  

                    if (rs.next()) {   
                        String fName = rs.getString("fName");  
                        String fWork = rs.getString("fWork");  
                        String grossIncomeF = rs.getString("grossIncomeF");  
                        String fPhoneNum = rs.getString("fPhoneNum");  
                        String mName = rs.getString("mName");  
                        String mWork = rs.getString("mWork");  
                        String grossIncomeM = rs.getString("grossIncomeM");  
                        String mPhoneNum = rs.getString("mPhoneNum");  
                        String maritalStatus = rs.getString("maritalStatus");  
                        String guardianRelay = rs.getString("guardianRelay");  
                        String guardianWork = rs.getString("guardianWork");  
                        String guardianPhoneNum = rs.getString("guardianPhoneNum");  
                        String address = rs.getString("address");  
                        String postcode = rs.getString("postcode");  
        %>  
                        <form action="processUpdateFamily.jsp" method="post">  
                            <div class="form-row">  
                                <div class="form-group">  
                                    <label for="fName">Nama Bapa:</label>  
                                    <input type="text" id="fName" name="fName" value="<%= fName %>" required>  
                                </div>  
                                <div class="form-group">  
                                    <label for="fWork">Pekerjaan Bapa:</label>  
                                    <input type="text" id="fWork" name="fWork" value="<%= fWork %>" required>  
                                </div>  
                            </div>  
                            <div class="form-row">  
                                <div class="form-group">  
                                    <label for="grossIncomeF">Gaji Kasar Bapa (RM):</label>  
                                    <input type="number" id="grossIncomeF" name="grossIncomeF" value="<%= grossIncomeF %>" required>  
                                </div>  
                                <div class="form-group">  
                                    <label for="fPhoneNum">No Telefon Bapa:</label>  
                                    <input type="tel" id="fPhoneNum" name="fPhoneNum" value="<%= fPhoneNum %>" required>  
                                </div>  
                            </div>  
                            <div class="form-row">  
                                <div class="form-group">  
                                    <label for="mName">Nama Ibu:</label>  
                                    <input type="text" id="mName" name="mName" value="<%= mName %>" required>  
                                </div>  
                                <div class="form-group">  
                                    <label for="mWork">Pekerjaan Ibu:</label>  
                                    <input type="text" id="mWork" name="mWork" value="<%= mWork %>" required>  
                                </div>  
                            </div>  
                            <div class="form-row">  
                                <div class="form-group">  
                                    <label for="grossIncomeM">Gaji Kasar Ibu (RM):</label>  
                                    <input type="number" id="grossIncomeM" name="grossIncomeM" value="<%= grossIncomeM %>" required>  
                                </div>  
                                <div class="form-group">  
                                    <label for="mPhoneNum">No Telefon Ibu:</label>  
                                    <input type="tel" id="mPhoneNum" name="mPhoneNum" value="<%= mPhoneNum %>" required>  
                                </div>  
                            </div>  
                            <div class="form-row">  
                                <div class="form-group">  
                                    <label for="maritalStatus">Status Perkahwinan Ibu Bapa:</label>  
                                    <input type="text" id="maritalStatus" name="maritalStatus" value="<%= maritalStatus %>" required>  
                                </div>  
                                <div class="form-group">  
                                    <label for="guardianRelay">Nama Waris Terdekat:</label>  
                                    <input type="text" id="guardianRelay" name="guardianRelay" value="<%= guardianRelay %>" required>  
                                </div>  
                            </div>  
                            <div class="form-row">  
                                <div class="form-group">  
                                    <label for="guardianWork">Pekerjaan Waris Terdekat:</label>  
                                    <input type="text" id="guardianWork" name="guardianWork" value="<%= guardianWork %>" required>  
                                </div>  
                                <div class="form-group">  
                                    <label for="guardianPhoneNum">No Telefon Waris Terdekat:</label>  
                                    <input type="tel" id="guardianPhoneNum" name="guardianPhoneNum" value="<%= guardianPhoneNum %>" required>  
                                </div>  
                            </div>  
                            <div class="form-group">  
                                <label for="address">Alamat:</label>  
                                <textarea id="address" name="address" required><%= address %></textarea>  
                            </div>  
                            <div class="form-row">  
                                <div class="form-group">  
                                    <label for="postcode">Poskod:</label>  
                                    <input type="text" id="postcode" name="postcode" value="<%= postcode %>" required>  
                                </div>  
                            </div>  
                            <input type="hidden" name="STUDENTID" value="<%= name %>">  
                            <button type="submit" class="update-button">Kemaskini</button>  
                        </form>  
        <%  
                    } else {  
                        %>
                        <form action='processInsertFamily.jsp' method='post'>  
                            <div class='form-row'>  
                            <div class='form-group'>  
                                <label for='fName'>Nama Bapa:</label>  
                                <input type='text' id='fName' name='fName' required>  
                            </div>  
                            <div class='form-group'>  
                                <label for='fWork'>Pekerjaan Bapa:</label>  
                                <input type='text' id='fWork' name='fWork' required>  
                            </div>  
                        </div>  
                        <div class='form-row'>  
                            <div class='form-group'>  
                                <label for='grossIncomeF'>Gaji Kasar Bapa (RM):</label>  
                                <input type='number' id='grossIncomeF' name='grossIncomeF' required>  
                            </div>  
                            <div class='form-group'>  
                                <label for='fPhoneNum'>No Telefon Bapa:</label>  
                                <input type='tel' id='fPhoneNum' name='fPhoneNum' required>  
                            </div>  
                        </div>  
                        <div class='form-row'>  
                            <div class='form-group'>  
                                <label for='mName'>Nama Ibu:</label>  
                                <input type='text' id='mName' name='mName' required>  
                            </div>  
                            <div class='form-group'>  
                                <label for='mWork'>Pekerjaan Ibu:</label>  
                                <input type='text' id='mWork' name='mWork' required>  
                            </div>  
                        </div>  
                        <div class='form-row'>  
                            <div class='form-group'>  
                                <label for='grossIncomeM'>Gaji Kasar Ibu (RM):</label>  
                                <input type='number' id='grossIncomeM' name='grossIncomeM' required>  
                            </div>  
                            <div class='form-group'>  
                                <label for='mPhoneNum'>No Telefon Ibu:</label>  
                                <input type='tel' id='mPhoneNum' name='mPhoneNum' required>  
                            </div>  
                        </div>  
                        <div class='form-row'>  
                            <div class='form-group'>  
                                <label for='maritalStatus'>Status Perkahwinan Ibu Bapa:</label>  
                                <input type='text' id='maritalStatus' name='maritalStatus' required>  
                            </div>  
                            <div class='form-group'>  
                                <label for='guardianRelay'>Nama Waris Terdekat:</label>  
                                <input type='text' id='guardianRelay' name='guardianRelay' required>  
                            </div>  
                        </div>  
                        <div class='form-row'>  
                            <div class='form-group'>  
                                <label for='guardianWork'>Pekerjaan Waris Terdekat:</label>  
                                <input type='text' id='guardianWork' name='guardianWork' required>  
                            </div>  
                            <div class='form-group'>  
                                <label for='guardianPhoneNum'>No Telefon Waris Terdekat:</label>  
                                <input type='tel' id='guardianPhoneNum' name='guardianPhoneNum' required>  
                            </div>  
                        </div>  
                        <div class='form-group'>  
                            <label for='address'>Alamat:</label>  
                            <textarea id='address' name='address'></textarea>  
                        </div>  
                        <div class='form-row'>  
                            <div class='form-group'>  
                                <label for='postcode'>Poskod:</label>  
                                <input type='text' id='postcode' name='postcode' required>  
                            </div>  
                        </div>  
                        <input type='hidden' name='STUDENTID' value="<%= name %>">  
                        <button type='submit' class='update-button'>Simpan</button>  
                        </form>
                        
                        <% 
                    }  
                } catch (SQLException e) {  
                    out.println("<p class='text-danger'>Error retrieving profile information: " + e.getMessage() + "</p>");  
                }finally {  
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
        <a href="index.jsp" class="back-button">Back</a>  
    </div>  
</body>  
<jsp:include page="Footer.jsp"></jsp:include>  
</html>