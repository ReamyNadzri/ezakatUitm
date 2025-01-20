<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<jsp:include page="header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <title>Register Form</title>  
    <style>  
        body {  
            background-size: cover;  
            background-position: center;  
            background-repeat: no-repeat;  
            background-attachment: fixed;  
            justify-content: center;  
            align-items: center;  
            height: 100vh;  
            margin: 0;  
        }  

        .container {  
            width: 80%;  
            max-width: 1000px;  
            padding: 20px;  
            background-color: #fff;  
            border-radius: 10px;  
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);  
            border: 8px solid #800080; /* Thicker purple border */  
            margin: auto;  
            margin-top: 5%;  
        }  

        .title {  
            text-align: center;  
            margin-bottom: 20px;  
            font-size: 24px;  
            font-weight: bold;  
            color: #000;  
        }  

        .form-row {  
            display: flex;  
            justify-content: space-between;  
            margin-bottom: 15px;  
        }  

        .form-column {  
            width: 48%;  
        }  

        label {  
            display: block;  
            margin-bottom: 15px; /* Increased gap between label and input */  
            font-weight: bold;  
        }  

        input, select {  
            width: 100%;  
            padding: 10px;  
            font-size: 14px;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
            box-sizing: border-box;  
            margin-bottom: 20px; /* Increased gap between input fields */  
        }  

        .register-button {  
            background-color: #800080; /* Purple color */  
            color: white;  
            border: none;  
            padding: 10px;  
            border-radius: 5px;  
            font-size: 16px;  
            cursor: pointer;  
            width: 100%;  
        }  

        .register-button:hover {  
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

        .button-container {  
            display: flex;  
            justify-content: space-between;  
            margin-bottom: 20px;  
        }  

        .button-container button {  
            width: 48%;  
            padding: 10px;  
            font-size: 16px;  
            cursor: pointer;  
            border: none;  
            border-radius: 5px;  
        }  

        .button-container button:first-child {  
            background-color: #800080; /* Purple color */  
            color: white;  
        }  

        .button-container button:last-child {  
            background-color: #666; /* Gray color */  
            color: white;  
        }  

        .button-container button:hover {  
            opacity: 0.9;  
        }  
    </style>  
</head>  
<body>  
    <sql:setDataSource var="myDatasource"  
                driver="oracle.jdbc.OracleDriver"  
                url="jdbc:oracle:thin:@localhost:1521:XE"  
                user="zakatdb"  
                password="zakatdb" />  

    <c:set var="matricno" value="${param.matricno}" />  
    <c:set var="name" value="${param.name}" />  
    <c:set var="income" value="${param.income}" />  
    <c:set var="courseCode" value="${param.courseCode}" />  
    <c:set var="courseName" value="${param.courseName}" />  
    <c:set var="campus" value="${param.campus}" />  
    <c:set var="phoneNum" value="${param.phoneNum}" />  
    <c:set var="email" value="${param.email}" />  
    <c:set var="password" value="${param.password}" />  
    <c:set var="address" value="${param.address}" />    

    <div class="container">  
        <!-- Button Container for Donator and Student Registration -->  
        <div class="button-container ml-2">  
            <button type="button" onclick="window.location.href='RegisterDonitor.jsp'">Daftar Sebagai Penyumbang</button>  
        </div>  

        <h2 class="title">Daftar Sebagai Pelajar</h2>  
        <form class="w3-container" method="post" action="studentRegisterServlet">  
            <div class="form-row">  
                <!-- Left Column -->  
                <div class="form-column">  
                    <label for="matricno">No. Matrik:</label>  
                    <input type="text" id="matricno" name="matricno" required>  
                    
                    <label for="name">Nama Penuh:</label>  
                    <input type="text" id="name" name="name" required>  

                    <label for="phoneNum">Nombor Telefon:</label>  
                    <input type="text" id="phoneNum" name="phoneNum" required>  

                    <label for="email">Email:</label>  
                    <input type="email" id="email" name="email" required>  

                    <label for="password">Password:</label>  
                    <input type="password" id="password" name="password" required>  
                </div>  

                <!-- Right Column -->  
                <div class="form-column">  
                    <label for="income">Pendapatan Ibu Bapa:</label>  
                    <input type="number" id="income" name="income" required>  

                    <label for="courseCode">Kod Program:</label>  
                    <select id="courseCode" name="courseCode" required>  
                        <option value="" disabled selected>Pilih Kod Program Pengajian Anda...</option>  
                        <option value="CDCS110">CDCS110</option>  
                        <option value="CDCS230">CDCS230</option>  
                        <option value="CDCS264">CDCS264</option>  
                        <option value="CDCS267">CDCS267</option>  
                        <option value="CDCS270">CDCS270</option>  
                    </select>  

                    <label for="courseName">Nama Program:</label>  
                    <select id="courseName" name="courseName" required>  
                        <option value="" disabled selected>Pilih Nama Program Pengajian Anda...</option>  
                        <option value="Diploma Sains Komputer">Diploma Sains Komputer</option>  
                        <option value="Sarjana Muda Sains Komputer (Kepujian)">Sarjana Muda Sains Komputer (Kepujian)</option>  
                        <option value="Sarjana Muda Sistem Maklumat (Kepujian) Pengkomputeran Perniagaan">Sarjana Muda Sistem Maklumat (Kepujian) Pengkomputeran Perniagaan</option>  
                        <option value="Sarjana Muda Sains (Kepujian) Matematik Pemodelan dan Analitik">Sarjana Muda Sains (Kepujian) Matematik Pemodelan dan Analitik</option>  
                        <option value="Sarjana Muda Sains Komputer (Kepujian) Pengkomputeran Mudah Alih">Sarjana Muda Sains Komputer (Kepujian) Pengkomputeran Mudah Alih</option>  
                    </select>  

                    <label for="campus">Kampus:</label>  
                    <select id="campus" name="campus" required>  
                        <option value="" disabled selected>Pilih Kampus Anda...</option>  
                        <option value="UiTM Kuala Terengganu">UiTM Kuala Terengganu</option>  
                        <option value="UiTM Dungun">UiTM Dungun</option>  
                        <option value="UiTM Bukit Besi">UiTM Bukit Besi</option>  
                    </select>  

                    <label for="address">Alamat:</label>  
                    <input type="text" id="address" name="address" required>  
                </div>  
            </div>  

            <div class="g-recaptcha" data-sitekey="6Lfgv70qAAAAAK23Mjj-gfPwpHt10S6CRTtlFMao"></div>
            <br/>
            <button type="submit" class="register-button">Daftar</button>  
            <button type="button" onclick="window.location.href='index.jsp'" class="back-button">Kembali</button>  
        </form>  
    </div>  
    <script type="text/javascript">
        var onloadCallback = function() {
          alert("grecaptcha is ready!");
        };
      </script>
    
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>