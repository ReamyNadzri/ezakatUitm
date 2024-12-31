<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Form Staff</title>
    <style>
        /* Styling for the modal */
        .tajuk {
            text-align: center;
        }
        .modal {
            display: none; /* Hidden by default */
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
            transform: translate(-50%, -50%); /* Center the modal */
            background-color: #111;
            padding: 20px;
            border-radius: 8px;
            width: 40%;
            color: white;
            transform: translate(-50%, -50%) scale(0.8);
            opacity: 0;
            transition: transform 0.3s ease-out, opacity 0.3s ease-out;
        }
        .modal.show .modal-content {
            transform: translate(-50%, -50%) scale(1); /* Pop up effect */
            opacity: 1; /* Fade-in effect */
        }
        .modal-content input,
        .modal-content select { /* Apply the same styling to input and select */
            display: block;
            width: 90%;
            margin: 10px auto;
            padding: 8px;
            border: none;
            border-radius: 10px;
            font-size: 14px; /* Ensure the font size matches for consistency */
            background-color: #f2f2f2;
        }
        .selek {
            align-self: left;
        }
        .modal-content .button-container {
            text-align: center; /* Center-align the buttons */
        }
        .modal-content button {
            margin: 10px 5px;
            width: 100px; /* Smaller button size */
            padding: 8px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            cursor: pointer;
        }
        .modal-content .register-btn {
            background-color: purple;
            color: white;
        }
        .modal-content .close-btn {
            background-color: gray;
            color: white;
        }
    </style>
</head>
<body>
    <sql:setDataSource var="myDatasource"
                driver="oracle.jdbc.OracleDriver"
                url="jdbc:oracle:thin:@localhost:1521:XE"
                user="zakatdb"
                password="zakatdb" />
    
    <c:set var="staffId" value="${param.staffId}" />
    <c:set var="staffNo" value="${param.staffNo}" />
    <c:set var="Name" value="${param.Name}" />
    <c:set var="Password" value="${param.Password}" />
    <c:set var="PhoneNum" value="${param.PhoneNum}" />
    <c:set var="Email" value="${param.Email}" />
    <c:set var="Campus" value="${param.Campus}" />
    <!-- Button to Open Modal -->
    <button id="openModal">Register As Staff</button>

    <!-- Register Modal -->
    <div id="registerModal" class="modal">
        <div class="modal-content">
            <div class="tajuk">
                <h2>Daftar Sebagai Staf</h2>
            </div>
            <!-- Staff Registration Form -->
            <form action="successRegisterStaff.jsp" method="post">
                <input type="text" name="staffId" placeholder="ID Staf" required>
                <input type="text" name="Name" placeholder="Nama Penuh..." required>
                <input type="text" name="staffNo" placeholder="No.Staf..." required>
                <!-- Select element for campusStaff -->
               <select name="Campus" required>
                        <option value="" disabled selected>Pilih Kampus Anda Anda...</option>
                        <option value="UiTM Kuala Terengganu">UiTM Kuala Terengganu</option>
                        <option value="UiTM Dungun">UiTM Dungun</option>
                        <option value="UiTM Bukit Besi">UiTM Bukit Besi</option>
                    </select>
                <input type="text" name="PhoneNum" placeholder="Nombor Telefon (tanpa '-')..." required>
                <input type="email" name="Email" placeholder="Email..." required>
                <input type="password" name="Password" placeholder="Password..." required>
                <div class="button-container">
                    <button type="button" class="close-btn" id="closeModal">Kembali</button>
                    <button type="submit" class="register-btn">Daftar</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        const modal = document.getElementById('registerModal');
        const modalContent = document.querySelector('.modal-content');
        const openModalBtn = document.getElementById('openModal');
        const closeModalBtn = document.getElementById('closeModal');

        openModalBtn.onclick = function () {
            modal.style.display = 'block';
            setTimeout(() => modal.classList.add('show'), 10); // Add the "show" class to trigger animation
        };

        closeModalBtn.onclick = function () {
            modal.classList.remove('show'); // Remove the "show" class for reverse animation
            setTimeout(() => modal.style.display = 'none', 300); // Delay hiding the modal to match animation
        };

        window.onclick = function (event) {
            if (event.target === modal) {
                modal.classList.remove('show');
                setTimeout(() => modal.style.display = 'none', 300);
            }
        };
    </script>
</body>
</html>
