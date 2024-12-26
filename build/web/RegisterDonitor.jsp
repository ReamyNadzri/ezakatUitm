<%-- 
    Document   : RegisterDonitor
    Created on : Dec 18, 2024, 12:44:51 AM
    Author     : user
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Form Donitor</title>
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
<head>
    <title>State and City Selection</title>
    <script>
        // Cities based on states in Malaysia
        const stateCities = {
            "Johor": ["Johor Bahru", "Muar", "Batu Pahat", "Kluang"],
            "Kedah": ["Alor Setar", "Sungai Petani", "Kulim"],
            "Kelantan": ["Kota Bharu", "Pasir Mas", "Tanah Merah"],
            "Melaka": ["Melaka City", "Ayer Keroh", "Alor Gajah"],
            "Negeri Sembilan": ["Seremban", "Port Dickson", "Nilai"],
            "Pahang": ["Kuantan", "Bentong", "Temerloh"],
            "Penang": ["George Town", "Butterworth", "Bukit Mertajam"],
            "Perak": ["Ipoh", "Taiping", "Teluk Intan"],
            "Perlis": ["Kangar"],
            "Sabah": ["Kota Kinabalu", "Sandakan", "Tawau"],
            "Sarawak": ["Kuching", "Miri", "Sibu", "Bintulu"],
            "Selangor": ["Shah Alam", "Petaling Jaya", "Klang", "Kajang"],
            "Terengganu": ["Kuala Terengganu", "Dungun", "Kemaman"],
            "Kuala Lumpur": ["Bukit Bintang", "Cheras", "Setapak"],
            "Putrajaya": ["Presint 1", "Presint 2", "Presint 3"],
            "Labuan": ["Victoria"]
        };

        // Function to populate cities based on selected state
        function populateCities() {
            const stateDropdown = document.getElementById("state");
            const cityDropdown = document.getElementById("city");
            const selectedState = stateDropdown.value;

            // Clear previous city options
            cityDropdown.innerHTML = '<option value="">-- Select City --</option>';

            // Add new city options based on selected state
            if (selectedState in stateCities) {
                stateCities[selectedState].forEach(city => {
                    const option = document.createElement("option");
                    option.value = city;
                    option.textContent = city;
                    cityDropdown.appendChild(option);
                });
            }
        }
    </script>
</head>
<body>
  <script>
    window.onload = function () {
        const modal = document.getElementById('registerModal');
        setTimeout(() => {
            modal.style.display = 'block';
            modal.classList.add('show'); // Add animation effect
        }, 500); // Opens the form after 0.5 seconds
    };
</script>

    <!-- Register Modal -->
    <div id="registerModal" class="modal">
        <div class="modal-content">
            <div class="tajuk">
                <h2>Daftar Sebagai Penyumbang Sekarang</h2>
            </div>
            <!-- Student Registration Form -->
            <form action="successRegisterStudent.jsp" method="post">
                <input type="text" name="username" placeholder="Username..." required>
                <input type="text" name="phone_number" placeholder="Nombor Telefon (without '-')..." required>
                <input type="text" name="ic_number" placeholder="No. Kad Pengenalan (tanpa '-')..." required>
                

                                <!-- State Dropdown -->
                   
                   <select name="state" id="state" required onchange="populateCities()">
                       <option value="">-- Select State --</option>
                       <option value="Johor">Johor</option>
                       <option value="Kedah">Kedah</option>
                       <option value="Kelantan">Kelantan</option>
                       <option value="Melaka">Melaka</option>
                       <option value="Negeri Sembilan">Negeri Sembilan</option>
                       <option value="Pahang">Pahang</option>
                       <option value="Penang">Penang</option>
                       <option value="Perak">Perak</option>
                       <option value="Perlis">Perlis</option>
                       <option value="Sabah">Sabah</option>
                       <option value="Sarawak">Sarawak</option>
                       <option value="Selangor">Selangor</option>
                       <option value="Terengganu">Terengganu</option>
                       <option value="Kuala Lumpur">Kuala Lumpur</option>
                       <option value="Putrajaya">Putrajaya</option>
                       <option value="Labuan">Labuan</option>
                   </select>
                       <!-- City Dropdown -->
                 
                    <select name="city" id="city" required>
                        <option value="">-- Select City --</option>
                    </select>

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
