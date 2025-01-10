<%-- 
    Document   : LoginDonator
    Created on : Dec 18, 2024, 12:04:04 AM
    Author     : user
--%>
<jsp:include page="header.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form Student</title>
    <style>
        /* Styling for the modal */
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
        .modal-content input {
            display: block;
            width: 90%;
            margin: 10px auto;
            padding: 8px;
            border: none;
            border-radius: 4px;
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
        .modal-content .login-btn {
            background-color: purple;
            color: white;
        }
        .modal-content .close-btn {
            background-color: gray;
            color: white;
        }
        .modal-content .register-link {
            display: block;
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }
        .modal-content .register-link a {
            color: purple;
            text-decoration: none;
            font-weight: bold;
        }
        .modal-content .register-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <!-- Button to Open Modal -->
    <br><br><br><br><button id="openLoginModal">Login as Donator</button>

    <!-- Login Modal -->
    <div id="loginModal" class="modal">
        <div class="modal-content">
            <h2 style="text-align:center;">Login Donitor</h2>
            <!-- Login Form -->
            <form action="loginDonator.jsp" method="post">
                <input type="email" name="Email" placeholder="Email..." required>
                <input type="password" name="password" placeholder="Password..." required>
                <div class="button-container">
                    <button type="button" class="close-btn" id="closeLoginModal">Kembali</button>
                    <button type="submit" class="login-btn">Login</button>
                </div>
                <!-- Link to Register Form -->
                <div class="register-link">
                    Anda Belum Mendaftar? <a href="RegisterDonitor.jsp" id="openRegisterForm">Daftar Sekarang</a>
                </div>
            </form>
        </div>
    </div>

    <script>
        const loginModal = document.getElementById('loginModal');
        const openLoginModalBtn = document.getElementById('openLoginModal');
        const closeLoginModalBtn = document.getElementById('closeLoginModal');
        const openRegisterFormLink = document.getElementById('openRegisterForm');

        openLoginModalBtn.onclick = function () {
            loginModal.style.display = 'block';
            setTimeout(() => loginModal.classList.add('show'), 10); // Add the "show" class to trigger animation
        };
        closeLoginModalBtn.onclick = function () {
            loginModal.classList.remove('show'); // Remove the "show" class for reverse animation
            setTimeout(() => loginModal.style.display = 'none', 300); // Delay hiding the modal to match animation
        };

        window.onclick = function (event) {
            if (event.target === loginModal) {
                loginModal.classList.remove('show');
                setTimeout(() => loginModal.style.display = 'none', 300);
            }
        };

        // Redirect to Register Form JSP
        openRegisterFormLink.onclick = function () {
            loginModal.classList.remove('show');
            setTimeout(() => {
                loginModal.style.display = 'none';
                window.location.href = "RegisterDonitor.jsp"; // Redirect to register form (use JSP page)
            }, 300);
        };
    </script>
</body>
</html>