<%@page import="javax.faces.model.DataModel"%>  
<%@page import="java.util.List"%>  
<%@page import="java.sql.SQLException"%>  
<%@page import="java.sql.Statement"%>  
<%@page import="java.sql.ResultSet"%>  
<%@page import="java.sql.PreparedStatement"%>  
<%@page import="com.zakat.model.DBConnection"%>  
<%@page import="java.sql.Connection"%>  
<%@page contentType="text/html;charset=UTF-8" language="java" %>  
<jsp:include page="admin_header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>View Student</title>  
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
    try {  
        Connection connection = DBConnection.getConnection();  
        Statement stmt = connection.createStatement();  
        ResultSet rs = stmt.executeQuery("SELECT STUDENTID, COURSECODE, MATRICNO, NAME, EMAIL, PASSWORD FROM STUDENT");  
%>  

<div class="container mx-auto flex-grow mt-8 px-4">   

    <div class="shadow-lg rounded-lg p-8" style="background: #7C3AED;">  
        <h2 class="text-3xl font-semibold mb-4 text-white text-center">Jumlah Pelajar Terdaftar</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-500 text-white">  
                    <th class="py-2 px-4">Bil.</th>  
                    <th class="py-2 px-4">Kod Kursus</th>  
                    <th class="py-2 px-4">No Matrik</th>  
                    <th class="py-2 px-4">Nama</th>  
                    <th class="py-2 px-4">Email</th>  
                    <th class="py-2 px-4">Kata Laluan</th> 
                    <th class="py-2 px-4">Tindakan</th>  
                </tr>  
            </thead>  
            <tbody>  
                <%  
                    while (rs.next()) {  
                %>  
                <tr>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("STUDENTID") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("COURSECODE") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("MATRICNO") %></td>  
                    <td class="border px-4 py-2 text-center"><%= rs.getString("NAME") %></td>   
                    <td class="border px-4 py-2 text-center"><%= rs.getString("EMAIL") %></td>  
                    <td class="border px-4 py-2 text-center ">[ HIDDEN ]</td>
                    <td class="border px-4 py-2">  
                       <div class="flex space-x-2">  
                            <form action="actionStudentServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this Student?');">  
                                <input type="hidden" name="STUDENTID" value='<%= rs.getString("STUDENTID") %>' />  
                                <button type="submit" name="action" value="delete" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700"><i class="fas fa-trash"></i> Delete</button>  
                            </form>  
                            <a href="viewDetailStudent.jsp?STUDENTID=<%= rs.getString("STUDENTID") %>" class="bg-blue-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-blue-700"><i class="fa fa-eye"></i> View</a>  
                        </div>   
                    </td>  
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
            </tbody>  
        </table>  
    </div>    

    <!-- Next and Previous Buttons -->  
    <div class="mt-6 flex justify-between">  
        <a href="previousPage.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Previous</a>  
        <a href="nextPage.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Next</a>  
    </div>  
</div>  

</body>  
</html>