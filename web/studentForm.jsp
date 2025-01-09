<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Form Student</title>
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
        padding: 15px;
        margin-top: 50px;
        border-radius: 8px;
        width: 50%; /* Adjusted width */
        max-width: 500px; /* Limit maximum width */
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
        width: 100%; /* Make inputs wider */
        max-width: 400px; /* Restrict maximum width */
        margin: 8px auto;
        padding: 6px;
        border: none;
        border-radius: 6px;
        font-size: 14px; /* Ensure the font size matches for consistency */
        background-color: #3d3d3d;
    }
    .selek {
        align-self: left;
    }
    .modal-content .button-container {
        text-align: center; /* Center-align the buttons */
    }
    .modal-content button {
        margin: 8px 5px;
        width: 90px; /* Smaller button size */
        padding: 6px;
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
    .checkmark {
        font-size: 50px;
        color: #00FF00;
        margin-bottom: 10px;
    }
    .popup-content {
        background-color: #1b1b1b;
        color: white;
        width: 300px;
        padding: 20px;
        border-radius: 10px;
        text-align: center;
        margin: 15% auto;
        position: relative;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
    }
    .popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        z-index: 9999;
    }
</style>

</head>
<body>
    <sql:setDataSource var="myDatasource"
                driver="oracle.jdbc.OracleDriver"
                url="jdbc:oracle:thin:@localhost:1521:XE"
                user="zakatdb"
                password="zakatdb" />
    
    <c:set var="studentId" value="${param.studentId}" />
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
            
  <!-- Register Modal -->  
<div id="registerModal" class="modal">  
    <div class="modal-content">  
        <div class="tajuk">  
            <h2>Daftar Sebagai Pelajar Sekarang</h2>  
        </div>  
        <!-- Student Registration Form -->  
        <form action="successRegisterStudent.jsp" method="post" onsubmit="return handleFormSubmit();">   
            <input type="text" name="matricno" placeholder="No. Matrik..." required>  
            <input type="text" name="name" placeholder="Nama Penuh..." required>  
            <input type="number" name="income" placeholder="Pendapatan..." required>  
            
            <!-- Select element for course code -->  
            <div class="selek">  
                <select name="courseCode" required>  
                    <option value="" disabled selected>Pilih Kod Kursus Anda...</option>  
                    <option value="CDCS110">CDCS110</option>  
                    <option value="CDCS230">CDCS230</option>  
                    <option value="CDCS264">CDCS264</option>  
                    <option value="CDCS267">CDCS267</option>  
                    <option value="CDCS270">CDCS270</option>  
                </select>  
            </div>  
            <div class="selek">  
                <select name="courseName" required>  
                    <option value="" disabled selected>Pilih Nama Program Pengajian Anda...</option>  
                    <option value="Diploma Sains Komputer">CDCS110 - Diploma Sains Komputer</option>  
                    <option value="Sarjana Muda Sains Komputer (Kepujian)">CDCS230 - Sarjana Muda Sains Komputer (Kepujian)</option>  
                    <option value="Sarjana Muda Sistem Maklumat (Kepujian) Pengkomputeran Perniagaan">CDCS264 - Sarjana Muda Sistem Maklumat (Kepujian) Pengkomputeran Perniagaan</option>  
                    <option value="Sarjana Muda Sains (Kepujian) Matematik Pemodelan dan Analitik">CDCS267 - Sarjana Muda Sains (Kepujian) Matematik Pemodelan dan Analitik</option>  
                    <option value="Sarjana Muda Sains Komputer (Kepujian) Pengkomputeran Mudah Alih">CDCS270 - Sarjana Muda Sains Komputer (Kepujian) Pengkomputeran Mudah Alih</option>  
                </select>  
            </div>  
            
            <select name="campus" required>  
                <option value="" disabled selected>Pilih Kampus Anda...</option>  
                <option value="UiTM Kuala Terengganu">UiTM Kuala Terengganu</option>  
                <option value="UiTM Dungun">UiTM Dungun</option>  
                <option value="UiTM Bukit Besi">UiTM Bukit Besi</option>  
            </select>  
            <input type="text" name="phoneNum" placeholder="Nombor Telefon (without '-')..." required>  
            <input type="text" name="address" placeholder="Alamat..." required>  
            <input type="email" name="email" placeholder="Email..." required>  
            <input type="password" name="password" placeholder="Password..." required>  
            
            <div class="button-container">  
                <button type="button" class="back" onclick="window.location.href='studentForm.jsp';">Kembali</button> 
                <button type="submit" class="register-btn">Daftar</button>  
            </div>  
        </form>  
    </div>  
</div>  

<script>  
    const modal = document.getElementById('registerModal');  
    const closeModalBtn = document.getElementById('closeModal');  

    // Automatically show modal when page loads  
    window.onload = function () {  
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

    function handleFormSubmit() {  
        // This function will be called when the form is submitted  
        // You can add any additional validation here if needed  
        return true; // Allow form submission  
    }  
</script>
</body>
</html>
