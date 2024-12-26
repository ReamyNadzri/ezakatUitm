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
        
        .ayah {
            text-align: left;
        }
        
        .ibu {
            text-align: left;
        }
        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #111;
            border-radius: 10px;
            padding: 30px;
            width: 500px;
            color: white;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.3);
            max-height: 80%;  /* Max height to prevent it from overflowing the viewport */
            overflow-y: auto;  /* Enables vertical scrolling if the content overflows */
            padding-bottom: 20px; /* Padding for the scrollable area */
        }
        .modal-content h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }
        .modal-content input,
        .modal-content label {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #333;
            color: white;
        }
        .modal-content label {
            font-size: 14px;
            margin-top: 5px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
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
        .upload-section {
            text-align: center;
            margin: 20px 0;
        }
        /* Profile image styling */
        .profile-img-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 2px solid #fff;
            background-color: #bbb;
        }
    </style>
</head>
<body>
    <!-- Button to Open Modal -->
    <button id="openModalBtn" style="margin: 20px; padding: 10px 20px;">Kemaskini Profil</button>

    <!-- Update Profile Modal -->
    <div id="updateProfileModal" class="modal">
        <div class="modal-content">
            <h2>Kemaskini Profil Ibu Bapa</h2>
            <!-- Form Submission to JSP -->
            <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                <!-- Other Profile Fields -->
                <div clas="ayah">
                <h2>Bapa</h2>
                </div>
                <input type="text" name="nameBapa" value="<%= request.getAttribute("nameBapa") != null ? request.getAttribute("nameBapa") : "" %>" placeholder="Nama Bapa..." required>
                <input type="text" name="pekerjaanBapa" value="<%= request.getAttribute("pekerjaanBapa") != null ? request.getAttribute("pekerjaanBapa") : "" %>" placeholder="Pekerjaan Bapa..." required>
                <input type="number" name="phone_numberDad" value="<%= request.getAttribute("phone_numberDad") != null ? request.getAttribute("phone_numberDad") : "" %>" placeholder="Nombor Telefon Bapa(tanpa -)" required>
                <input type="text" name="alamatBapa" value="<%= request.getAttribute("alamatBapa") != null ? request.getAttribute("alamatBapa") : "" %>" placeholder="Alamat..." required>
                <input type="text" name="pendapatanBapa" value="<%= request.getAttribute("pendapatanBapa") != null ? request.getAttribute("pendapatanBapa") : "" %>" placeholder="Pendapatan Bapa(sebulan)..." required><br>
                <div class="ibu">
                <h2>Ibu</h2>
                </div>
                 <input type="text" name="nameIbu" value="<%= request.getAttribute("nameIbu") != null ? request.getAttribute("nameIbu") : "" %>" placeholder="Nama Ibu..." required>
                <input type="text" name="pekerjaanIbu" value="<%= request.getAttribute("pekerjaanIbu") != null ? request.getAttribute("pekerjaanIbu") : "" %>" placeholder="Pekerjaan Ibu..." required>
                <input type="number" name="phone_numberIbu" value="<%= request.getAttribute("phone_numberIbu") != null ? request.getAttribute("phone_numberIbu") : "" %>" placeholder="Nombor Telefon Ibu(tanpa -)" required>
                <input type="text" name="pendapatanIbu" value="<%= request.getAttribute("pendapatanIbu") != null ? request.getAttribute("pendapatanIbu") : "" %>" placeholder="Pendapatan Ibu(sebulan)..." required>
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

        // Preview the selected profile image
        function previewProfileImage(event) {
            const file = event.target.files[0];
            const reader = new FileReader();
            reader.onload = function (e) {
                const profileImage = document.getElementById('profileImage');
                profileImage.src = e.target.result; // Set the new image as the profile image
            };
            reader.readAsDataURL(file);
        }
    </script>
</body>
</html>

