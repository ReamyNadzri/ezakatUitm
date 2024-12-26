<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
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
            <h2>Kemaskini Profil</h2>
            <!-- Form Submission to JSP -->
            <form action="updateProfile.jsp" method="post" enctype="multipart/form-data">
                <!-- Profile Image Section -->
                <div class="profile-img-container">
                    <!-- Default Profile Image (or existing one) -->
                    <img src="<%= request.getAttribute("profileImage") != null ? request.getAttribute("profileImage") : "default-profile.jpg" %>" id="profileImage" class="profile-img" alt="Profile Picture">
                </div>

                <!-- File input for updating profile picture -->
                <div class="upload-section">
                    <label for="profile_picture">Kemaskini Profil Gambar</label>
                    <input type="file" name="profile_picture" id="profile_picture" accept="image/*" onchange="previewProfileImage(event)">
                </div>

                <!-- Other Profile Fields -->
                <input type="text" name="name" value="<%= request.getAttribute("name") != null ? request.getAttribute("name") : "" %>" placeholder="Nama Penuh..." required>
                <input type="text" name="matric_number" value="<%= request.getAttribute("matric_number") != null ? request.getAttribute("matric_number") : "" %>" placeholder="Nombor Matrik..." readonly>
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
                <input type="text" name="campus" value="<%= request.getAttribute("campus") != null ? request.getAttribute("campus") : "" %>" placeholder="Kampus..." required>
                <input type="text" name="phone_number" value="<%= request.getAttribute("phone_number") != null ? request.getAttribute("phone_number") : "" %>" placeholder="Nombor Telefon (tanpa -)" required>
                <input type="email" name="email" value="<%= request.getAttribute("email") != null ? request.getAttribute("email") : "" %>" placeholder="Email..." required>
                <input type="password" name="password" placeholder="Password..." required>
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
