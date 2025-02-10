<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<jsp:include page="admin_header.jsp"></jsp:include>  
<%
    String updateValue = request.getParameter("update");

    // Check if the parameter exists and has a value
    if (updateValue != null && !updateValue.isEmpty()) {
%><script>alert('Kemaskini Berjaya!');</script><%
    } 
%>

<!DOCTYPE html>  
<html>  
<head>  
    <title>Admin Dashboard - Zakat UiTM</title>  
    
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
    <style>  
        div {
            font-family: 'Product Sans', sans-serif;
        }
        .main-content {
            flex: 1;
            padding: 20px;
            background-color: #ffffff; /* Changed to white */
            align-self: center;
            width: 90%; /* Set width to 70% */
            margin: 0 auto; /* Center the content */
            height:110vh
        } 
        
        .welcome-message {  
            margin: 20px 0;  
            font-size: 24px;  
            font-weight: bold;  
        }  
        .tab-container {  
            display: flex;  
            border-bottom: 1px solid #ccc;  
            margin-bottom: 20px;  
        }  
        .tab {  
            padding: 10px 20px;  
            cursor: pointer;  
            background-color: #AF65C2;  
            color: white;  
            border: 1px solid #ccc;  
            border-bottom: none;  
            margin-right: 5px;  
            font-size: 18px;  
            border-radius: 5px 5px 0 0;  
            transition: background-color 0.3s;  
        }  
        .tab:hover {  
            background-color: #9B30FF;  
        }  
        .tab-content {  
            display: none;  
            padding: 20px;  
            border: 1px solid #ccc;  
            border-radius: 0 5px 5px 5px;  
        }  
        .tab-content.active {  
            display: block;  
        }  
        .profile-info {  
            margin: 10px 0;  
        }  
        .update-button {  
            margin-top: 20px;  
        }  
        .status-approved {  
            color: green;  
        }  
        .status-rejected {  
            color: red;  
        }  
        .status-pending {  
            color: orange;  
        } 
        .pagination-controls {
            margin-top: 20px;
            text-align: center;
        }

        .pagination-controls button {
            margin: 0 5px;
            padding: 5px 10px;
            cursor: pointer;
        }

        .pagination-controls select {
            padding: 5px;
        }

        .pagination-controls span {
            margin-left: 10px;
        }
        
    </style>  
    <script>  
        function openTab(tabName) {  
            var i, tabcontent, tablinks;  
            tabcontent = document.getElementsByClassName("tab-content");  
            for (i = 0; i < tabcontent.length; i++) {  
                tabcontent[i].style.display = "none";  
            }  
            tablinks = document.getElementsByClassName("tab");  
            for (i = 0; i < tablinks.length; i++) {  
                tablinks[i].className = tablinks[i].className.replace(" active", "");  
            }  
            document.getElementById(tabName).style.display = "block";  
            event.currentTarget.className += " active";  
        }  
        document.addEventListener("DOMContentLoaded", function () {
            const table = document.querySelector("#zakat table tbody");
            const rows = Array.from(table.querySelectorAll("tr"));
            const prevButton = document.getElementById("prevButton");
            const nextButton = document.getElementById("nextButton");
            const rowsPerPageSelect = document.getElementById("rowsPerPage");
            const pageInfo = document.getElementById("pageInfo");

            let currentPage = 1;
            let rowsPerPage = parseInt(rowsPerPageSelect.value);

            function updateTable() {
                // Hide all rows
                rows.forEach(row => row.style.display = "none");

                // Calculate start and end index for the current page
                const startIndex = (currentPage - 1) * rowsPerPage;
                const endIndex = startIndex + rowsPerPage;

                // Show rows for the current page
                for (let i = startIndex; i < endIndex && i < rows.length; i++) {
                    rows[i].style.display = "";
                }

                // Update pagination controls
                prevButton.disabled = currentPage === 1;
                nextButton.disabled = endIndex >= rows.length;
                pageInfo.textContent = `Page ${currentPage} of ${Math.ceil(rows.length / rowsPerPage)}`;
            }

            // Event listeners for pagination controls
            prevButton.addEventListener("click", () => {
                if (currentPage > 1) {
                    currentPage--;
                    updateTable();
                }
            });

            nextButton.addEventListener("click", () => {
                if (currentPage * rowsPerPage < rows.length) {
                    currentPage++;
                    updateTable();
                }
            });

            rowsPerPageSelect.addEventListener("change", () => {
                rowsPerPage = parseInt(rowsPerPageSelect.value);
                currentPage = 1; // Reset to the first page
                updateTable();
            });

            // Initial table update
            updateTable();
        });
        
    </script>  
</head>  

<body>  
    <!-- Main Content -->  
    <div class="main-content"><br>

        <!-- Tab Container -->  
        <div class="tab-container">  
            <%  
                String adminusername = (String) session.getAttribute("ADMUSERNAME"); 
                String adminID = (String) session.getAttribute("ADMNOIC");
                if (adminusername != null) {  
            %>    
               <div class="tab" onclick="openTab('permohonan')"><i class="fas fa-user"></i> PERMOHONAN ZAKAT</div>  
                <div class="tab" onclick="openTab('berjaya')"><i class="fas fa-user"></i>  BERJAYA</div>  
                <div class="tab" onclick="openTab('batal')"><i class="fas fa-user"></i>  BATAL</div>  
                <div class="tab" onclick="openTab('semak')"><i class="fas fa-user"></i>  DISEMAK</div>
                <div class="tab" onclick="openTab('belum dikemaskini')"><i class="fas fa-user"></i>  BELUM SELESAI</div>
             
            <%  
                } 
            %>  
              
        </div> 
           <%
    try{
    Connection connection = DBConnection.getConnection();
    
    Statement stmt = connection.createStatement();
    ResultSet rs =  stmt.executeQuery("SELECT A.APPLYID, S.NAME AS STUDENT_NAME, A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO, Z.ZAKATNAME AS ZAKAT_CATEGORY,  TO_CHAR(Z.DESCRIPTION, 'DD-MM-YYYY') AS DESCRIPTION , A.REASON AS REASON " +  
            "FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID " +  
            "ORDER BY A.APPLYID DESC");
    %>
            
        <div id="permohonan" class="tab-content" style="display: block">  
            <div class="profile-header">  
                <div class="rounded-lg p-8">  
                    <h2 class="text-2xl font-semibold mb-4">PERMOHONAN ZAKAT</h2>  
                    <table class="min-w-full bg-white rounded-lg shadow-md">  
                       <thead>  
                        <tr class="bg-purple-500 text-white">  
                            <th class="py-2 px-4">Bil.</th>  
                            <th class="py-2 px-4">Tarikh</th>  
                            <th class="py-2 px-4">No Matrik</th>  
                            <th class="py-2 px-4">Nama</th>  
                            <th class="py-2 px-4">Permohonan</th>  
                            <th class="py-2 px-4">Status</th>  
                            <th class="py-2 px-4">Tindakan</th>  
                            <th class="py-2 px-4">Sebab</th> <!-- Added column for "Sebab" -->  
                        </tr>  
                    </thead>  
                    <tbody id="zakatTableBody">  
                        <%  
                        int count = 1;  
                        while (rs.next()) {  
                        %>  
                        <tr>  
                            <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Adakah anda pasti untuk melakukan perubahan ini?');">  
                                <td class="border px-4 py-2 text-center"><%= count++ %></td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("DESCRIPTION") %></td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("MATRICNO") %></td>  
                                <td class="border px-4 py-2 text-center">  
                                    <%= rs.getString("STUDENT_NAME") %>  
                                    <button type="submit" name="action" value="view" class="w3-right bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">Lihat Lebih Teliti</button>   
                                </td>   
                                <td class="border px-4 py-2 text-center"><%= rs.getString("ZAKATNAME") %></td>   
                                <% if (rs.getString("STATUS").equals("BERJAYA")) { %>  
                                    <td class="border px-4 py-2 status-approved text-center"><%= rs.getString("STATUS") %></td>  
                                <% } else if (rs.getString("STATUS").equals("DISEMAK")) { %>  
                                    <td class="border px-4 py-2 status-pending text-center"><%= rs.getString("STATUS") %></td>   
                                <% } else if (rs.getString("STATUS").equals("DITOLAK")) { %>  
                                    <td class="border px-4 py-2 status-rejected text-center"><%= rs.getString("STATUS") %></td>   
                                <% } else if (rs.getString("STATUS").equals("BELUM SELESAI")) { %>  
                                    <td class="border px-4 py-2 text-center status-pending"><%= rs.getString("STATUS") %></td>  
                                <% } %>  
                               <td class="border px-4 py-4 flex justify-center items-center space-x-2">  
                                    <input type="hidden" name="APPLYID" value='<%= rs.getString("APPLYID") %>' />  
                                    <button type="submit" name="action" value="success" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700"><i class="fas fa-check"></i></button>  
                                    <button type="submit" name="action" value="semak" class="bg-yellow-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-yellow-700"><i class="fas fa-search"></i></button>  
                                    <button type="submit" name="action" value="reject" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-times"></i></button>  
                                    <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-trash"></i></button>  
                                    <button type="submit" name="action" value="waiting" class="bg-blue-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-blue-700"><i class="fas fa-clock"></i></button>  
                                </td>
                                <td class="border px-4 py-2 text-center w-48"><%= rs.getString("REASON") %></td> <!-- Displaying the reason -->
                            </form>  
                        </tr>               
                        <%  
                        }  
                        rs.close();  
                        stmt.close();  
                    } catch (SQLException e) {  
                        out.println(e.getMessage());  
                    } catch(Exception e) {  
                        out.println(e.getMessage());  
                    }  
                    %>  
                    </tbody>  
                    </table>  
                    <div class="pagination-controls">  
                        <button id="prevButton" disabled>Previous</button>  
                        <button id="nextButton">Next</button>  
                        <select id="rowsPerPage">  
                            <option value="5">5</option>  
                            <option value="10">10</option>  
                            <option value="15">15</option>  
                        </select>  
                        <span id="pageInfo"></span>  
                    </div>  
                </div>   
            </div>  
        </div>
                                
       <div id="berjaya" class="tab-content">   
    <%  
    try {  
                            Connection connection = DBConnection.getConnection();  
                            Statement stmt = connection.createStatement();  
                            ResultSet rs = stmt.executeQuery("SELECT A.APPLYID, S.NAME AS STUDENT_NAME, A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO,  TO_CHAR(Z.DESCRIPTION, 'DD-MM-YYYY') AS DESCRIPTION , A.REASON AS REASON " +  
                                "FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID " +  
                                "WHERE A.STATUS = 'BERJAYA' ORDER BY A.APPLYID DESC");  
    %>   

    <div class="profile-header">  
        <div class="rounded-lg p-8">  
            <h2 class="text-2xl font-semibold mb-4">BERJAYA PERMOHONAN</h2>  
            <table class="min-w-full bg-white rounded-lg shadow-md">  
               <thead>  
                    <tr class="bg-purple-500 text-white">  
                        <th class="py-2 px-4">Bil.</th>  
                        <th class="py-2 px-4">Tarikh</th>  
                        <th class="py-2 px-4">No Matrik</th>  
                        <th class="py-2 px-4">Nama</th>  
                        <th class="py-2 px-4">Permohonan</th>  
                        <th class="py-2 px-4">Status</th>  
                        <th class="py-2 px-4">Tindakan</th>  
                        <th class="py-2 px-4">Sebab</th> <!-- Added column for "Sebab" -->  
                    </tr>  
                </thead>  
                <tbody id="zakatTableBody">  
                    <%  
                        int count = 1;   
                        while (rs.next()) {   
                    %>  
                            <tr>  
                                <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Adakah anda pasti untuk melakukan perubahan ini?');">  
                                    <td class="border px-4 py-2 text-center"><%= count++ %></td>  
                                    <td class="border px-4 py-2 text-center"><%= rs.getString("DESCRIPTION") %></td>  
                                    <td class="border px-4 py-2 text-center"><%= rs.getString("MATRICNO") %></td>  
                                    <td class="border px-4 py-2 text-center">  
                                        <%= rs.getString("STUDENT_NAME") %>  
                                        <button type="submit" name="action" value="view" class="w3-right bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">Lihat Lebih Teliti</button>  
                                    </td>  
                                    <td class="border px-4 py-2 text-center"><%= rs.getString("ZAKATNAME") %></td>   
                                    <td class="border px-4 py-2 status-approved text-center"><%= rs.getString("STATUS") %></td>  <!-- Assuming only 'BERJAYA' will be shown here -->  
                                    
                                    <td class="border px-4 py-4 flex justify-center items-center space-x-2">  
                                        <input type="hidden" name="APPLYID" value='<%= rs.getString("APPLYID") %>' />  
                                        <button type="submit" name="action" value="success" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700"><i class="fas fa-check"></i></button>  
                                        <button type="submit" name="action" value="semak" class="bg-yellow-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-yellow-700"><i class="fas fa-search"></i></button>  
                                        <button type="submit" name="action" value="reject" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-times"></i></button>  
                                        <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-trash"></i></button>  
                                        <button type="submit" name="action" value="waiting" class="bg-blue-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-blue-700"><i class="fas fa-clock"></i></button> <!-- New button for Waiting List -->  
                                    </td>  
                                    <td class="border px-4 py-2 text-center w-64"><%= rs.getString("REASON") %></td> <!-- Displaying the reason -->  
                                </form>  
                            </tr>  
                    <%  
                        }  
                        rs.close();  
                        stmt.close();  
                    } catch (SQLException e) {  
                        out.println(e.getMessage());  
                    } catch (Exception e) {  
                        out.println(e.getMessage());  
                    }  
                    %>  

                    <!-- Add more application rows as needed -->  
                </tbody>  
            </table>  
            <div class="pagination-controls">  
                <button id="prevButton" disabled>Previous</button>  
                <button id="nextButton">Next</button>  
                <select id="rowsPerPage">  
                    <option value="5">5</option>  
                    <option value="10">10</option>  
                    <option value="15">15</option>  
                </select>  
                <span id="pageInfo"></span>  
            </div>  
        </div>   
    </div>  
</div>
        
                                
                                

        <!-- Tab Content -->  
        
         <div id="batal" class="tab-content">   

    <%  

    try {  
                            Connection connection = DBConnection.getConnection();  
                            Statement stmt = connection.createStatement();  
                            ResultSet rs = stmt.executeQuery("SELECT A.APPLYID, S.NAME AS STUDENT_NAME, A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO,  TO_CHAR(Z.DESCRIPTION, 'DD-MM-YYYY') AS DESCRIPTION , A.REASON AS REASON " +  
                                "FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID " +  
                                "WHERE A.STATUS = 'DITOLAK' ORDER BY A.APPLYID DESC");  
    %>  

    <div class="profile-header">  
        <div class="rounded-lg p-8">  
            <h2 class="text-2xl font-semibold mb-4">BATAL PERMOHONAN</h2>  
            <table class="min-w-full bg-white rounded-lg shadow-md">  
               <thead>  
                    <tr class="bg-purple-500 text-white">  
                        <th class="py-2 px-4">Bil.</th>  
                        <th class="py-2 px-4">Tarikh</th>  
                        <th class="py-2 px-4">No Matrik</th>  
                        <th class="py-2 px-4">Nama</th>  
                        <th class="py-2 px-4">Permohonan</th>  
                        <th class="py-2 px-4">Status</th>  
                        <th class="py-2 px-4">Tindakan</th>  
                        <th class="py-2 px-4">Sebab</th> <!-- Added column for "Sebab" -->  
                    </tr>  
                </thead>  
                <tbody id="zakatTableBody">  
                    <%  
                        int count = 1;   
                        while (rs.next()) {   
                    %>  
                            <tr>  
                                <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Adakah anda pasti untuk melakukan perubahan ini?');">  
                                    <td class="border px-4 py-2 text-center"><%= count++ %></td>  
                                    <td class="border px-4 py-2 text-center"><%= rs.getString("DESCRIPTION") %></td>  
                                    <td class="border px-4 py-2 text-center"><%= rs.getString("MATRICNO") %></td>  
                                    <td class="border px-4 py-2 text-center">  
                                        <%= rs.getString("STUDENT_NAME") %>  
                                        <button type="submit" name="action" value="view" class="w3-right bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">Lihat Lebih Teliti</button>  
                                    </td>  
                                    <td class="border px-4 py-2 text-center"><%= rs.getString("ZAKATNAME") %></td>   
                                    <td class="border px-4 py-2 status-rejected text-center"><%= rs.getString("STATUS") %></td>  

                                    <td class="border px-4 py-4 flex justify-center items-center space-x-2">  
                                        <input type="hidden" name="APPLYID" value='<%= rs.getString("APPLYID") %>' />  
                                        <button type="submit" name="action" value="success" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700"><i class="fas fa-check"></i></button>  
                                        <button type="submit" name="action" value="semak" class="bg-yellow-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-yellow-700"><i class="fas fa-search"></i></button>  
                                        <button type="submit" name="action" value="reject" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-times"></i></button>  
                                        <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-trash"></i></button>  
                                        <button type="submit" name="action" value="waiting" class="bg-blue-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-blue-700"><i class="fas fa-clock"></i></button>  
                                    </td>  
                                    <td class="border px-4 py-2 text-center w-64"><%= rs.getString("REASON") %></td> <!-- Displaying the reason -->  
                                </form>  
                            </tr>  
                    <%  
                        }  
                        rs.close();  
                        stmt.close();  
                    } catch (SQLException e) {  
                        out.println(e.getMessage());  
                    } catch (Exception e) {  
                        out.println(e.getMessage());  
                    }  
                    %>  

                    <!-- Add more application rows as needed -->  
                </tbody>  
            </table>  
            <div class="pagination-controls">  
                <button id="prevButton" disabled>Previous</button>  
                <button id="nextButton">Next</button>  
                <select id="rowsPerPage">  
                    <option value="5">5</option>  
                    <option value="10">10</option>  
                    <option value="15">15</option>  
                </select>  
                <span id="pageInfo"></span>  
            </div>  
        </div>   
    </div>  
</div>
                                
     <!-- Tab Content -->  
        
  <div id="semak" class="tab-content">   
    <%  
    try {  
                            Connection connection = DBConnection.getConnection();  
                            Statement stmt = connection.createStatement();  
                            ResultSet rs = stmt.executeQuery("SELECT A.APPLYID, S.NAME AS STUDENT_NAME, A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO,  TO_CHAR(Z.DESCRIPTION, 'DD-MM-YYYY') AS DESCRIPTION , A.REASON AS REASON " +  
                                "FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID " +  
                                "WHERE A.STATUS = 'DISEMAK' ORDER BY A.APPLYID DESC");  
    %>  

    <div class="profile-header">  
        <div class="rounded-lg p-8">  
            <h2 class="text-2xl font-semibold mb-4">DISEMAK PERMOHONAN</h2>  
            <table class="min-w-full bg-white rounded-lg shadow-md">  
                <thead>  
                    <tr class="bg-purple-500 text-white">  
                        <th class="py-2 px-4">Bil.</th>  
                        <th class="py-2 px-4">Tarikh</th>  
                        <th class="py-2 px-4">No Matrik</th>  
                        <th class="py-2 px-4">Nama</th>  
                        <th class="py-2 px-4">Permohonan</th>  
                        <th class="py-2 px-4">Status</th>  
                        <th class="py-2 px-4">Tindakan</th>  
                        <th class="py-2 px-4">Sebab</th> <!-- Added column for "Sebab" -->  
                    </tr>  
                </thead>  
                <tbody id="zakatTableBody">  
                    <%  
                        int count = 1;   
                        while (rs.next()) {   
                    %>  
                        <tr>  
                            <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Adakah anda pasti untuk melakukan perubahan ini?');">  
                                <td class="border px-4 py-2 text-center"><%= count++ %></td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("DESCRIPTION") %></td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("MATRICNO") %></td>  
                                <td class="border px-4 py-2 text-center">  
                                    <%= rs.getString("STUDENT_NAME") %>  
                                    <button type="submit" name="action" value="view" class="w3-right bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">Lihat Lebih Teliti</button>  
                                </td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("ZAKATNAME") %></td>   
                                <td class="border px-4 py-2 status-pending text-center"><%= rs.getString("STATUS") %></td>  

                                <td class="border px-4 py-4 flex justify-center items-center space-x-2">  
                                    <input type="hidden" name="APPLYID" value='<%= rs.getString("APPLYID") %>' />  
                                    <button type="submit" name="action" value="success" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700"><i class="fas fa-check"></i></button>  
                                    <button type="submit" name="action" value="semak" class="bg-yellow-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-yellow-700"><i class="fas fa-search"></i></button>  
                                    <button type="submit" name="action" value="reject" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-times"></i></button>  
                                    <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-trash"></i></button>  
                                    <button type="submit" name="action" value="waiting" class="bg-blue-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-blue-700"><i class="fas fa-clock"></i></button>  
                                </td>  
                                <td class="border px-4 py-2 text-center w-64"><%= rs.getString("REASON") %></td> <!-- Displaying the reason -->  
                            </form>  
                        </tr>  
                    <%  
                        }  
                        rs.close();  
                        stmt.close();  
                    } catch (SQLException e) {  
                        out.println(e.getMessage());  
                    } catch (Exception e) {  
                        out.println(e.getMessage());  
                    }  
                    %>  

                    <!-- Add more application rows as needed -->  
                </tbody>  
            </table>  
            <div class="pagination-controls">  
                <button id="prevButton" disabled>Previous</button>  
                <button id="nextButton">Next</button>  
                <select id="rowsPerPage">  
                    <option value="5">5</option>  
                    <option value="10">10</option>  
                    <option value="15">15</option>  
                </select>  
                <span id="pageInfo"></span>  
            </div>  
        </div>   
    </div>  
</div>
                    
                    

     <!-- Tab Content -->  
        
  <div id="belum dikemaskini" class="tab-content">   
    <%  
    try {
        
        Connection connection = DBConnection.getConnection();  
        Statement stmt = connection.createStatement();
        connection = DBConnection.getConnection();  
        stmt = connection.createStatement();  
        // Updated SQL query to include REASON  
        ResultSet rs = stmt.executeQuery("SELECT A.APPLYID, S.NAME AS STUDENT_NAME, A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO, TO_CHAR(Z.DESCRIPTION, 'DD-MM-YYYY') AS DESCRIPTION , A.REASON AS REASON " +  
            "FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID " +  
            "WHERE A.STATUS = 'BELUM SELESAI' ORDER BY A.APPLYID DESC");  
    %>  

    <div class="profile-header">  
        <div class="rounded-lg p-8">  
            <h2 class="text-2xl font-semibold mb-4">PERMOHONAN BELUM SELESAI</h2>  
            <table class="min-w-full bg-white rounded-lg shadow-md">  
                <thead>  
                    <tr class="bg-purple-500 text-white">  
                        <th class="py-2 px-4">Bil.</th>  
                        <th class="py-2 px-4">Tarikh</th>  
                        <th class="py-2 px-4">No Matrik</th>  
                        <th class="py-2 px-4">Nama</th>  
                        <th class="py-2 px-4">Permohonan</th>  
                        <th class="py-2 px-4">Status</th>  
                        <th class="py-2 px-4">Tindakan</th>  
                        <th class="py-2 px-4">Sebab</th> <!-- Added column for "Sebab" -->  
                    </tr>  
                </thead>  
                <tbody id="zakatTableBody">  
                    <%  
                        int count = 1;   
                        while (rs.next()) {   
                    %>  
                        <tr>  
                            <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Adakah anda pasti untuk melakukan perubahan ini?');">  
                                <td class="border px-4 py-2 text-center"><%= count++ %></td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("DESCRIPTION") %></td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("MATRICNO") %></td>  
                                <td class="border px-4 py-2 text-center">  
                                    <%= rs.getString("STUDENT_NAME") %>  
                                    <button type="submit" name="action" value="view" class="w3-right bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">Lihat Lebih Teliti</button>  
                                </td>  
                                <td class="border px-4 py-2 text-center"><%= rs.getString("ZAKATNAME") %></td>   
                                <td class="border px-4 py-2 status-pending text-center"><%= rs.getString("STATUS") %></td>  

                                <td class="border px-4 py-4 flex justify-center items-center space-x-2">  
                                    <input type="hidden" name="APPLYID" value='<%= rs.getString("APPLYID") %>' />  
                                    <button type="submit" name="action" value="success" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700"><i class="fas fa-check"></i></button>  
                                    <button type="submit" name="action" value="semak" class="bg-yellow-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-yellow-700"><i class="fas fa-search"></i></button>  
                                    <button type="submit" name="action" value="reject" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-times"></i></button>  
                                    <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-trash"></i></button>  
                                    <button type="submit" name="action" value="waiting" class="bg-blue-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-blue-700"><i class="fas fa-clock"></i></button>  
                                </td>  
                                <td class="border px-4 py-2 text-center w-64"><%= rs.getString("REASON") %></td> <!-- Displaying the reason -->  
                            </form>  
                        </tr>  
                    <%  
                        }  
                        rs.close();  
                        stmt.close();  
                    } catch (SQLException e) {  
                        out.println(e.getMessage());  
                    } catch (Exception e) {  
                        out.println(e.getMessage());  
                    }  
                    %>  

                    <!-- Add more application rows as needed -->  
                </tbody>  
            </table>  
            <div class="pagination-controls">  
                <button id="prevButton" disabled>Previous</button>  
                <button id="nextButton">Next</button>  
                <select id="rowsPerPage">  
                    <option value="5">5</option>  
                    <option value="10">10</option>  
                    <option value="15">15</option>  
                </select>  
                <span id="pageInfo"></span>  
            </div>  
        </div>   
    </div>  
</div>
                                
         
        
     
    </div>
</body>  



