<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>  
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Register Form Donator</title>  
    <style>  
        /* Styling for the modal */  
        .tajuk {  
            text-align: center;  
            font-size: 24px;  
            margin-bottom: 15px;  
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
            padding: 20px;  
            border-radius: 8px;  
            width: 90%;  
            max-width: 500px;  
            color: white;  
            animation: fadeIn 0.3s ease-out;  
        }  
        .modal-content input,  
        .modal-content select {  
            display: block;  
            width: 90%;  
            margin: 10px auto;  
            padding: 10px;  
            border: none;  
            border-radius: 10px;  
            font-size: 16px;  
            background-color: #f2f2f2;  
            color: #333;  
        }  
        .modal-content input:focus,  
        .modal-content select:focus {  
            outline: none;  
            border: 2px solid #6a1b9a;  
        }  
        .button-container {  
            text-align: center;  
        }  
        .button-container button {  
            margin: 10px 5px;  
            width: 120px;  
            padding: 10px;  
            border: none;  
            border-radius: 4px;  
            font-size: 16px;  
            cursor: pointer;  
        }  
        .register-btn {  
            background-color: purple;  
            color: white;  
        }  
        .close-btn {  
            background-color: gray;  
            color: white;  
        }  
        @keyframes fadeIn {  
            from {  
                opacity: 0;  
                transform: translate(-50%, -60%);  
            }  
            to {  
                opacity: 1;  
                transform: translate(-50%, -50%);  
            }  
        }  
    </style>  
</head>  
<body>  
    <!-- Register Modal -->  
    <div id="registerModal" class="modal">  
        <div class="modal-content">  
            <div class="tajuk">  
                <h2>Daftar Sebagai Penyumbang Sekarang</h2>  
            </div>  
            <form method="post" action="donatorRegisterServlet">  
                <input type="text" name="username" placeholder="Username..." required maxlength="50">  
                <input type="text" name="phone_number" placeholder="Phone Number..." required pattern="\d{10,13}" title="Enter a valid phone number">  
                <input type="text" name="ic_number" placeholder="IC Number..." required maxlength="12" pattern="\d{12}" title="Enter a valid 12-digit IC Number">  
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

                <!-- City Dropdown (Initially empty) -->  
                <select name="city" id="city" required>  
                    <option value="">-- Select City --</option>  
                </select>  

                <input type="email" name="email" placeholder="Email..." required maxlength="50">  
                <input type="password" name="password" placeholder="Password..." required minlength="6">  

                <div class="button-container">  
                    <button type="button" class="close-btn" onclick="closeModal()">Kembali</button>  
                    <button type="submit" class="register-btn">Daftar</button>  
                </div>  
            </form>  
        </div>  
    </div>  

    <script>  
        // Data for states and cities  
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

        // Function to populate the cities based on the selected state  
        function populateCities() {  
            const state = document.getElementById("state").value;  
            const cityDropdown = document.getElementById("city");  
            cityDropdown.innerHTML = '<option value="">-- Select City --</option>'; // Reset city options  

            if (stateCities[state]) {  
                stateCities[state].forEach(city => {  
                    const option = document.createElement("option");  
                    option.value = city;  
                    option.textContent = city;  
                    cityDropdown.appendChild(option);  
                });  
            }  
        }  

        // Open the modal  
        function openModal() {  
            const modal = document.getElementById('registerModal');  
            modal.style.display = 'block';  
        }  

        // Close the modal  
        function closeModal() {  
            const modal = document.getElementById('registerModal');  
            modal.style.display = 'none';  
        }  

        // Automatically open the modal when the page loads  
        window.onload = function() {  
            openModal();  
        }  
    </script>  
</body>  
</html>