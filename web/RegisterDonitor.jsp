<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>  
<jsp:include page="header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">  
    <title>Register Form Donator</title>  
    <style>  
        body {  
            background-size: cover;  
            background-position: center;  
            background-repeat: no-repeat;  
            background-attachment: fixed;  
            justify-content: center;  
            align-items: center;  
            margin: 0;  
        }  

        .container {  
            width: 80%;  
            max-width: 1000px;  
            padding: 20px;  
            background-color: #fff;  
            border-radius: 10px;  
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);  
            border: 8px solid #800080; /* Thicker purple border */  
            margin: auto;  
            margin-top: 5%;  
        }  

        .title {  
            text-align: center;  
            margin-bottom: 20px;  
            font-size: 24px;  
            font-weight: bold;  
            color: #000;  
        }  

        .form-row {  
            display: flex;  
            justify-content: space-between;  
            margin-bottom: 15px;  
        }  

        .form-column {  
            width: 48%;  
        }  

        label {  
            display: block;  
            margin-bottom: 15px; /* Increased gap between label and input */  
            font-weight: bold;  
        }  

        input, select {  
            width: 100%;  
            padding: 10px;  
            font-size: 14px;  
            border: 1px solid #ccc;  
            border-radius: 5px;  
            box-sizing: border-box;  
            margin-bottom: 20px; /* Increased gap between input fields */  
        }  

        .register-button {  
            background-color: #800080; /* Purple color */  
            color: white;  
            border: none;  
            padding: 10px;  
            border-radius: 5px;  
            font-size: 16px;  
            cursor: pointer;  
            width: 100%;  
        }  

        .register-button:hover {  
            background-color: #550055; /* Darker purple on hover */  
        }  

        .back-button {  
            margin-top: 10px;  
            width: 100%;  
            padding: 10px;  
            background-color: #666;  
            color: white;  
            border: none;  
            border-radius: 5px;  
            font-size: 14px;  
            cursor: pointer;  
        }  

        .back-button:hover {  
            background-color: #444;  
        }  

        .button-container {  
            display: flex;  
            justify-content: space-between;  
            margin-bottom: 20px;  
        }  

        .button-container button {  
            width: 48%;  
            padding: 10px;  
            font-size: 16px;  
            cursor: pointer;  
            border: none;  
            border-radius: 5px;  
        }  

        .button-container button:first-child {  
            background-color: #800080; /* Purple color */  
            color: white;  
        }  

        .button-container button:last-child {  
            background-color: #666; /* Gray color */  
            color: white;  
        }  

        .button-container button:hover {  
            opacity: 0.9;  
        }  
    </style>  
</head>  
<body>  
    <div class="container">  
        <!-- Button Container for Donator and Student Registration -->  
        <div class="button-container">  
            <button type="button" onclick="window.location.href='studentForm.jsp'">Daftar Sebagai Pelajar</button>  
        </div>  

        <h2 class="title">Daftar Sebagai Penyumbang</h2>  
        <form method="post" action="donatorRegisterServlet">  
            <div class="form-row">  
                <!-- Left Column -->  
                <div class="form-column">  
                    <label for="username">Username:</label>  
                    <input type="text" id="username" name="username" required>  

                    <label for="noic">IC Number:</label>  
                    <input type="text" id="noic" name="noic" placeholder="IC Number..." required maxlength="12" pattern="\d{12}" title="Enter a valid 12-digit IC Number">  

                    <label for="donorEmail">Email Donator:</label>  
                    <input type="email" id="donorEmail" name="email" required>  

                    <label for="password">Password:</label>  
                    <input type="password" id="password" name="password" required>  
                </div>  

                <!-- Right Column -->  
                <div class="form-column">  
                    <label for="donorPhone">Nombor Telefon:</label>  
                    <input type="text" id="donorPhone" name="phonenum" required>  

                    <label for="state">Negeri:</label>  
                    <select id="state" name="state" required onchange="populateCities()">  
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

                    <label for="city">Bandar:</label>  
                    <select id="city" name="city" required>  
                        <option value="">-- Select City --</option>  
                    </select>  
                </div>  
            </div>  

            <button type="submit" class="register-button">Daftar</button>  
            <button type="button" onclick="window.location.href='index.jsp'" class="back-button">Kembali</button>  
        </form>  
    </div>  

    <script>  
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

        function populateCities() {  
            const state = document.getElementById("state").value;  
            const cityDropdown = document.getElementById("city");  
            cityDropdown.innerHTML = '<option value="">-- Select City --</option>';  

            if (stateCities[state]) {  
                stateCities[state].forEach(city => {  
                    const option = document.createElement("option");  
                    option.value = city;  
                    option.textContent = city;  
                    cityDropdown.appendChild(option);  
                });  
            }  
        }  
                    </script>  <br><br><br><br>
    <jsp:include page="Footer.jsp"></jsp:include>  
</body>  
</html>