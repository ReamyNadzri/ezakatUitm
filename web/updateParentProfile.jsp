<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Parent Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
        }
        .modal {
            display: none;
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
            background-color: #111;
            border-radius: 10px;
            padding: 30px;
            width: 80%;
            color: white;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3);
            max-height: 80%;
            overflow-y: auto;
        }
        .modal-content h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }
        .form-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 40px;
        }
        .form-section {
            flex: 1;
        }
        .form-section h3 {
            text-align: center;
            margin-bottom: 10px;
            font-size: 1.2rem;
            text-decoration: underline;
        }
        .modal-content input,
        .modal-content select {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #333;
            color: white;
        }
        .modal-content select {
            cursor: pointer;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .modal-content button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .modal-content .back-btn {
            background-color: #666;
            color: white;
        }
        .modal-content .save-btn {
            background-color: purple;
            color: white;
        }
    </style>
</head>
<body>
    <sql:setDataSource var="myDatasource"
                driver="com.mysql.jdbc.Driver"
                url="jdbc:mysql://localhost:3306/zakat_system?zeroDateTimeBehavior=convertToNull"
                user="root"
                password="" />
    
    <c:set var="FName" value="${param.FName}" />
    <c:set var="FWork" value="${param.FWork}" />
    <c:set var="FPhoneNumber" value="${param.FPhoneNumber}" />
    <c:set var="address" value="${param.address}" />
    <c:set var="postcode" value="${param.postcode}" />
    <c:set var="GrossIncomeF" value="${param.GrossIncomeF}" />
    <c:set var="MaritialStatusF" value="${param.MaritialStatusF}" />
    <c:set var="MName" value="${param.MName}" />
    <c:set var="MWork" value="${param.MWork}" />
    <c:set var="MPhoneNumber" value="${param.MPhoneNumber}" />
    <c:set var="GrossIncomeM" value="${param.GrossIncomeM}" />
    <c:set var="MaritialStatusM" value="${param.MaritialStatusM}" />
    <c:set var="GuardianRelay" value="${param.GuardianRelay}" />
    <c:set var="GuardianWork" value="${param.GuardianWork}" />
    <c:set var="GuardianPhoneNumber" value="${param.GuardianPhoneNumber}" />
    <!-- Button to Open Modal -->
    <button id="openModalBtn" style="margin: 20px; padding: 10px 20px;">Kemaskini Profil</button>

    <!-- Update Profile Modal -->
    <div id="updateProfileModal" class="modal">
        <div class="modal-content">
            <h2>Kemaskini Profil Ibu Bapa & Penjaga</h2>
            <form action="successUpdateParentProfile.jsp" method="post" enctype="multipart/form-data">
                <div class="form-container">
                    <!-- Father Section -->
                    <div class="form-section">
                        <h3>Bapa</h3>
                        <input type="text" name="FName" value="<%= request.getAttribute("FName") != null ? request.getAttribute("FName") : "" %>" placeholder="Nama Bapa..." required>
                        <input type="text" name="FWork" value="<%= request.getAttribute("FWork") != null ? request.getAttribute("FWork") : "" %>" placeholder="Pekerjaan Bapa..." required>
                        <input type="number" name="FPhoneNumber" value="<%= request.getAttribute("FPhoneNumber") != null ? request.getAttribute("FPhoneNumber") : "" %>" placeholder="Nombor Telefon Bapa (tanpa -)" required>
                        <input type="text" name="address" value="<%= request.getAttribute("address") != null ? request.getAttribute("address") : "" %>" placeholder="Alamat..." required>
                        <input type="text" name="postcode" value="<%= request.getAttribute("postcode") != null ? request.getAttribute("postcode") : "" %>" placeholder="Poskod" required>
                        <input type="text" name="GrossIncomeF" value="<%= request.getAttribute("GrossIncomeF") != null ? request.getAttribute("GrossIncomeF") : "" %>" placeholder="Pendapatan Kasar Bapa" required>
                        <select name="MaritialStatusF" required>
                            <option value="" disabled selected>Status Perkahwinan Ayah</option>
                            <option value="Berkahwin">Berkahwin</option>
                            <option value="Duda">Duda</option>
                        </select>
                    </div>

                    <!-- Mother Section -->
                    <div class="form-section">
                        <h3>Ibu</h3>
                        <input type="text" name="MName" value="<%= request.getAttribute("MName") != null ? request.getAttribute("MName") : "" %>" placeholder="Nama Ibu..." required>
                        <input type="text" name="MWork" value="<%= request.getAttribute("MWork") != null ? request.getAttribute("MWork") : "" %>" placeholder="Pekerjaan Ibu..." required>
                        <input type="number" name="MPhoneNumber" value="<%= request.getAttribute("MPhoneNumber") != null ? request.getAttribute("MPhoneNumber") : "" %>" placeholder="Nombor Telefon Ibu (tanpa -)" required>
                        <input type="text" name="GrossIncomeM" value="<%= request.getAttribute("GrossIncomeM") != null ? request.getAttribute("GrossIncomeM") : "" %>" placeholder="Pendapatan Kasar Ibu " required>
                        <select name="MaritialStatusM" required>
                            <option value="" disabled selected>Status Perkahwinan Ibu</option>
                            <option value="Berkahwin">Berkahwin</option>
                            <option value="Duda">Janda</option>
                        </select>
                    </div>
                    
                    <!-- Guardian Section -->
                    <div class="form-section">
                        <h3>Penjaga</h3>
                        <input type="text" name="GuardianRelay" value="<%= request.getAttribute("GuardianRelay") != null ? request.getAttribute("GuardianRelay") : "" %>" placeholder="Hubungan Dengan Penjaga" required>
                        <input type="text" name="GuardianWork" value="<%= request.getAttribute("GuardianWork") != null ? request.getAttribute("GuardianWork") : "" %>" placeholder="Pekerjaan Penjaga" required>
                        <input type="number" name="GuardianPhoneNumber" value="<%= request.getAttribute("GuardianPhoneNumber") != null ? request.getAttribute("GuardianPhoneNumber") : "" %>" placeholder="Nombor Telefon Penjaga (tanpa -)" required>
                    </div>
                </div>

                <div class="button-container">
                    <button type="button" class="back-btn" id="closeModalBtn">Kembali</button>
                    <button type="submit" class="save-btn">Simpan</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // JavaScript to handle modal open/close
        const modal = document.getElementById('updateProfileModal');
        const openModalBtn = document.getElementById('openModalBtn');
        const closeModalBtn = document.getElementById('closeModalBtn');

        openModalBtn.onclick = function () {
            modal.style.display = 'block';
        };

        closeModalBtn.onclick = function () {
            modal.style.display = 'none';
        };

        window.onclick = function (event) {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        };
    </script>
</body>
</html>
