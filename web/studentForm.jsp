<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<jsp:include page="header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Register Form</title>  
    <style>  
        body {  
            display: flex;  
            justify-content: center;  
            align-items: center;  
            height: 100vh;  
            margin: 0;  
            background-color: #f8f9fa;  
        }  
        .modal {  
            display: block; /* Show modal by default */  
            position: fixed;  
            top: 0;  
            left: 0;  
            width: 100%;  
            height: 100%;  
            background-color: rgba(0, 0, 0, 0.5);  
            z-index: 1;  
        }  
        .modal-content {  
            position: absolute;  
            top: 50%;  
            left: 50%;  
            transform: translate(-50%, -50%);  
            background-color: #fff; /* White background */  
            padding: 20px;  
            margin-top: 3%;  
            border-radius: 8px;  
            width: 100%; /* Increased width */  
            max-width: 1000px; /* Limit maximum width */  
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);  
        }  
        h2 {  
            text-align: center;  
            color: #333;  
            margin-bottom: 20px; /* Add margin below the heading for spacing */  
        }  
        table {  
            width: 100%;  
            border-collapse: collapse;  
        }  
        td {  
            padding: 10px;  
            vertical-align: top;  
        }  
        input, select {  
            width: 100%; /* Make inputs wider */  
            padding: 10px;  
            border: 1px solid #ccc;  
            border-radius: 4px;  
            font-size: 14px;  
        }  
        button {  
            padding: 10px;  
            background-color: #6a00ff; /* Purple background */  
            color: white;  
            border: none;  
            border-radius: 4px;  
            cursor: pointer;  
            font-size: 16px;  
            margin-top: 10px;  
            margin-right: 10px; /* Space between buttons */  
        }  
        button:hover {  
            background-color: #5000d1; /* Darker purple on hover */  
        }  
        .close-btn {  
            background-color: gray;  
        }  
        .close-btn:hover {  
            background-color: #444;  
        }  
        /* New styles for button container */  
        .button-container {  
            display: flex; /* Use flexbox for alignment */  
            justify-content: space-between; /* Space between buttons */  
            margin-top: 10px; /* Add some margin above the buttons */  
        }  
        .button-container button {  
            width: 48%; /* Set width to allow space between buttons */  
        }  
        /* New styles for side-by-side fields */  
        .side-by-side {  
            display: flex; /* Use flexbox for alignment */  
            justify-content: space-between; /* Space between fields */  
        }  
        .side-by-side select {  
            width: 48%; /* Set width to allow space between selects */  
        }  
        /* New styles for button selection */  
        .button-selection {  
            display: flex; /* Use flexbox for alignment */  
            justify-content: center; /* Center the buttons */  
            margin-bottom: 20px;  
        }  
        .button-selection button {  
            margin-right: 20px; /* Space between buttons */  
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

    <div class="modal">  
        <div class="modal-content">   

            <!-- Button selection for registration type -->  
            <div class="button-selection">  
                <button type="button" onclick="showStudentForm()" id="studentButton">Daftar Sebagai Pelajar</button>  
                <button type="button" onclick="showDonorForm()" id="donorButton">Daftar Sebagai Penyumbang</button>  
            </div>   
            <h2 id="formTitle">Daftar Sebagai Pelajar Sekarang</h2>   

            <!-- Student Registration Form -->  
            <form method="post" action="successRegisterStudent.jsp">  
                <div id="studentForm"> <!-- Student form section -->  
                    <table>  
                        <tr>  
                            <td><label for="matricno">No. Matrik:</label></td>  
                            <td><input type="text" id="matricno" name="matricno" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="name">Nama Penuh:</label></td>  
                            <td><input type="text" id="name" name="name" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="phoneNum">Nombor Telefon:</label></td>  
                            <td><input type="text" id="phoneNum" name="phoneNum" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="income">Pendapatan Ibu Bapa:</label></td>  
                            <td><input type="number" id="income" name="income" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="courseCode">Pilih Kod Program:</label></td>  
                            <td>  
                                <div class="side-by-side">  
                                    <select id="courseCode" name="courseCode" required>  
                                        <option value="" disabled selected>Pilih Kod Program Pengajian Anda...</option>  
                                        <option value="CDCS110">CDCS110</option>  
                                        <option value="CDCS230">CDCS230</option>  
                                        <option value="CDCS264">CDCS264</option>  
                                        <option value="CDCS267">CDCS267</option>  
                                        <option value="CDCS270">CDCS270</option>  
                                    </select>  
                                    <select name="courseName" required>  
                                        <option value="" disabled selected>Pilih Nama Program Pengajian Anda...</option>  
                                        <option value="Diploma Sains Komputer">CDCS110 - Diploma Sains Komputer</option>  
                                        <option value="Sarjana Muda Sains Komputer (Kepujian)">CDCS230 - Sarjana Muda Sains Komputer (Kepujian)</option>  
                                        <option value="Sarjana Muda Sistem Maklumat (Kepujian) Pengkomputeran Perniagaan">CDCS264 - Sarjana Muda Sistem Maklumat (Kepujian) Pengkomputeran Perniagaan</option>  
                                        <option value="Sarjana Muda Sains (Kepujian) Matematik Pemodelan dan Analitik">CDCS267 - Sarjana Muda Sains (Kepujian) Matematik Pemodelan dan Analitik</option>  
                                        <option value="Sarjana Muda Sains Komputer (Kepujian) Pengkomputeran Mudah Alih">CDCS270 - Sarjana Muda Sains Komputer (Kepujian) Pengkomputeran Mudah Alih</option>  
                                    </select>  
                                </div>  
                            </td>  
                        </tr>  
                        <tr>  
                            <td><label for="campus">Pilih Kampus:</label></td>  
                            <td>  
                                <select id="campus" name="campus" required>  
                                    <option value="" disabled selected>Pilih Kampus Anda...</option>  
                                    <option value="UiTM Kuala Terengganu">UiTM Kuala Terengganu</option>  
                                    <option value="UiTM Dungun">UiTM Dungun</option>  
                                    <option value="UiTM Bukit Besi">UiTM Bukit Besi</option>  
                                </select>  
                            </td>  
                        </tr>    
                        <tr>  
                            <td><label for="address">Alamat:</label></td>  
                            <td><input type="text" id="address" name="address" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="email">Email:</label></td>  
                            <td><input type="email" id="email" name="email" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="password">Password:</label></td>  
                            <td><input type="password" id="password" name="password" required></td>  
                        </tr>  
                    </table>  
                </div>   
                <div class="button-container">  
                    <button type="submit" class="register-btn">Daftar</button>  
                    <button type="button" class="close-btn" id="closeModal">Kembali</button>  
                </div>   
            </form>  
        </div>  
    </div>  

    <script>  
        const closeModalBtn = document.getElementById('closeModal');  
        closeModalBtn.onclick = function () {  
            // Logic to close the modal (if needed)  
            window.location.href = 'index.jsp'; // Redirect to previous page  
        };  

        function showStudentForm() {  
            document.getElementById('studentForm').style.display = 'block';  
            document.getElementById('donorForm').style.display = 'none';  
            document.getElementById('formTitle').style.display = 'block'; // Show student form title  
            document.getElementById('formTitleDonor').style.display = 'none'; // Hide donor form title  
            document.querySelector('form').action = 'successRegisterStudent.jsp'; // Set action for student form  
        }  

        function showDonorForm() {  
            // Redirect to the donor registration page  
            window.location.href = 'RegisterDonitor.jsp'; // Change this to your desired page  
        }  
    </script>  
</body>  
</html>