
<%@page import="javax.faces.model.DataModel"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.zakat.model.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<jsp:include page="admin_header.jsp"></jsp:include>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Zakat Application Management</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
    <style>  
  
        .bg-custom {  
            background: linear-gradient(to bottom right, #6a0dad, #4b0082);  
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
    </style>  
</head>  
<body class="bg-custom flex flex-col justify-between">  
    
<%
    try{
    Connection connection = DBConnection.getConnection();
    
    Statement stmt = connection.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT A.APPLYID, S.NAME AS STUDENT_NAME,A.STATUS, Z.ZAKATNAME AS ZAKATNAME, S.MATRICNO AS MATRICNO,  Z.ZAKATNAME AS ZAKAT_CATEGORY, Z.DESCRIPTION "
    + "FROM APPLICATION A JOIN STUDENT S ON A.STUDENTID = S.STUDENTID JOIN ZAKAT_CATEGORY Z ON A.ZAKATID = Z.ZAKATID ORDER BY A.APPLYID DESC");
    %>

<div class="container mx-auto flex-grow mt-10 px-4">  
    <h1 class="text-4xl font-bold text-center mb-6 text-white">Zakat Application Management</h1>  

    <div class="bg-purple-800 shadow-lg rounded-lg p-8">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Zakat Applications List</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-600 text-white">  
                    <th class="py-2 px-4">Bil.</th>  
                    <th class="py-2 px-4">Tarikh</th>  
                    <th class="py-2 px-4">No Matrik</th>  
                    <th class="py-2 px-4">Nama</th>  
                    <th class="py-2 px-4">Permohonan</th>  
                    <th class="py-2 px-4">Status</th>  
                    <th class="py-2 px-4">Actions</th>  
                </tr>  
            </thead>  
            <tbody>  
                <!-- Sample Data - Replace with dynamic data from your backend -->  
                <%
                    while (rs.next()){
                    %>
                <tr>  
                    <form action="actionApplicationServlet" method="post" onsubmit="return confirm('Are you sure you want to view or delete this application?');">  
                    <td class="border px-4 py-2"><%=rs.getString("APPLYID")%></td>  
                    <td class="border px-4 py-2"><%=rs.getString("DESCRIPTION")%></td>  
                    <td class="border px-4 py-2"><%=rs.getString("MATRICNO")%></td>  
                    <td class="border px-4 py-2"><%=rs.getString("STUDENT_NAME")%><button type="submit" name="action" value="view" class="w3-right bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">View Details</button> </td>   
                    <td class="border px-4 py-2"><%=rs.getString("ZAKATNAME")%></td>   
                    <% if(rs.getString("STATUS").equals("BERJAYA")){%>
                        <td class="border px-4 py-2 status-approved"><%=rs.getString("STATUS")%></td>
                        <%
                        }else if(rs.getString("STATUS").equals("DISEMAK")){ %>
                        <td class="border px-4 py-2 status-pending"><%=rs.getString("STATUS")%></td> <%
                        }else if(rs.getString("STATUS").equals("DITOLAK")){ %>
                        <td class="border px-4 py-2 status-rejected"><%=rs.getString("STATUS")%></td> <%
                        }%>
                    <td class="border px-4 py-2">  
                        
                            <input type="hidden" name="APPLYID" value='<%=rs.getString("APPLYID")%>' />  
                            <button type="submit" name="action" value="success" class="bg-green-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-green-700">Success</button>
                            <button type="submit" name="action" value="semak" class="bg-yellow-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-yellow-700">Pending</button>
                            <button type="submit" name="action" value="reject" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Reject</button>
                            <button type="submit" name="action" value="delete" class="w3-right bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                    </td>  
                </tr>
                <%
                    }
                        rs.close();
                        stmt.close();
                    }catch (SQLException e){
                        out.println(e.getMessage());

                    }catch(Exception e){
                        out.println(e.getMessage());
                    }
                    %>
                
                <!-- Add more application rows as needed -->  
            </tbody>  
        </table>  
    </div>  

    <div class="mt-6 text-center">  
        <a href="dashboard.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Back to Dashboard</a>  
    </div>  
</div>  

</body>  
</html>