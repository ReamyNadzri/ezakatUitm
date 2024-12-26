<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <!-- Button to Open Modal -->
    <button id="openModal">Register As Student</button>

    <!-- Register Modal -->
    <div id="registerModal" class="modal">
        <div class="modal-content">
            <div class="tajuk">
                <h2>Daftar Sebagai Pelajar Sekarang</h2>
            </div>
            <!-- Student Registration Form -->
            <form action="successRegisterStudent.jsp" method="post">
                <input type="text" name="name" placeholder="Nama Penuh..." required>
                <input type="text" name="matric_number" placeholder="No. Matrik..." required>
                <input type="text" name="ic_number" placeholder="No. Kad Pengenalan (tanpa '-')..." required>
                
                <!-- Select element for course code -->
                <div class="selek">
                    <select name="course_code" required>
                        <option value="" disabled selected>Pilih Program Pengajian Anda...</option>
                        <option value="CS101">CDCS110 - Diploma Sains Komputer</option>
                        <option value="CS102">CDCS230 - Sarjana Muda Sains Komputer (Kepujian)</option>
                        <option value="CS103">CDCS264 - Sarjana Muda Sistem Maklumat (Kepujian) Pengkomputeran Perniagaan</option>
                        <option value="CS104">CDCS267 - Sarjana Muda Sains (Kepujian) Matematik Pemodelan dan Analitik</option>
                        <option value="CS104">CDCS270 - Sarjana Muda Sains Komputer (Kepujian) Pengkomputeran Mudah Alih</option>
                    </select>
                </div>
                
                <input type="text" name="campus" placeholder="Kampus..." required>
                <input type="text" name="phone_number" placeholder="Nombor Telefon (without '-')..." required>
                <input type="email" name="email" placeholder="Email..." required>
                <input type="password" name="password" placeholder="Password..." required>
                
                <div class="button-container">
                    <button type="button" class="close-btn" id="closeModal">Kembali</button>
                    <button type="submit" class="register-btn">Daftar</button>
                </div>
            </form>
        </div>
    </div>
    <!-- Pop-up Success Message -->
    <div id="popup" class="popup">
        <div class="popup-content">
            <div class="checkmark">&#10003;</div>
            <p>User successfully registered!</p>
            <button onclick="window.location.reload();" class="button">Kembali Semula</button>
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
         // Show the popup when the page loads
        window.onload = function() {
            var successMessage = "<%= request.getAttribute("successMessage") %>";
            if (successMessage && successMessage.trim() !== "null") {
                document.getElementById('popup').style.display = 'block';
            }
        };
    </script>
</body>
</html>
