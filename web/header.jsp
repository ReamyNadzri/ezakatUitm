<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Retrieve the logged-in user's email from the session
    String user = (String) session.getAttribute("NAME");
    
%>
<html>
    <head>
        <title>Zakat UiTM</title>
        <meta name="viewport">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <div class="w3-container w3-row w3-row-padding w3-card-4" style=" height: 4.5rem; background: #cfa1f7; width: 100%">
            <div class="w3-container w3-col w3-row w3-row-padding w3-card-3" style="margin-top: 8px; margin-bottom: 14px;margin-left: 10%; height: 34px; width: auto; background: #cfa1f7">
                <a href="index.jsp" class=""><img src="sources/1ZakatLogoBR.png" class="w3-images w3-cell w3-center" style="width:140px;"></a>
                
            </div>
            <div class="w3-col w3-right" style="width:30%; margin-top: 12px;">

                <div class="w3-col">
                    <%
                        if(user == null){ %>
                            <button class="w3-button w3-border w3-round-large w3-text-white w3-shadow" style="background: #b875f3">Tentang Zakat</button>
                            <a class="w3-button w3-border w3-round-large w3-purple" href="loginStudent.jsp">Log Masuk</a>
                            <% }else{ %>
                            <h4 class="w3-cell" style="padding-top: 5px;">Hai Mahasiswa! </h4><span class="w3-cell" style="padding-left: 20px"></span>
                                <a class="w3-cell w3-button w3-border w3-round-large w3-purple" style="" href="studentDashboard.jsp">Dashboard</a><span class="w3-cell" style="padding-left: 10px"></span>
                                <a class="w3-cell w3-button w3-border w3-round-large w3-purple" style="" href="loginStudent.jsp">Log Keluar</a>
                                <% } %>
                    
                   

                </div>
                
            </div>
        </div>
    </head>
