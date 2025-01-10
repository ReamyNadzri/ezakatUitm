<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>  
<jsp:include page="header.jsp"></jsp:include>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Register Form Donator</title>  
    <style>  
        body {  
            display: flex;  
            justify-content: center;  
            align-items: center;  
            height: 100vh;  
            margin: 0;  
            background-color: #f8f9fa;  
        }  
        .modal {  
            display: block; /* Show modal by default */  
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
            background-color: #fff; /* White background */  
            padding: 20px;  
            margin-top: 3%;  
            border-radius: 8px;  
            width: 100%; /* Increased width */  
            max-width: 1000px; /* Limit maximum width */  
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);  
        }  
        h2 {  
            text-align: center;  
            color: #333;  
            margin-bottom: 20px; /* Add margin below the heading for spacing */  
        }  
        table {  
            width: 100%;  
            border-collapse: collapse;  
        }  
        td {  
            padding: 10px;  
            vertical-align: top;  
        }  
        input, select {  
            width: 100%; /* Make inputs wider */  
            padding: 10px;  
            border: 1px solid #ccc;  
            border-radius: 4px;  
            font-size: 14px;  
        }  
        button {  
            padding: 10px;  
            background-color: #6a00ff; /* Purple background */  
            color: white;  
            border: none;  
            border-radius: 4px;  
            cursor: pointer;  
            font-size: 16px;  
            margin-top: 10px;  
            margin-right: 10px; /* Space between buttons */  
        }  
        button:hover {  
            background-color: #5000d1; /* Darker purple on hover */  
        }  
        .close-btn {  
            background-color: gray;  
        }  
        .close-btn:hover {  
            background-color: #444;  
        }  
        /* New styles for button container */  
        .button-container {  
            display: flex; /* Use flexbox for alignment */  
            justify-content: space-between; /* Space between buttons */  
            margin-top: 10px; /* Add some margin above the buttons */  
        }  
        .button-container button {  
            width: 48%; /* Set width to allow space between buttons */  
        }  
        /* New styles for side-by-side fields */  
        .side-by-side {  
            display: flex; /* Use flexbox for alignment */  
            justify-content: space-between; /* Space between fields */  
        }  
        .side-by-side select {  
            width: 48%; /* Set width to allow space between selects */  
        }  
        /* New styles for button selection */  
        .button-selection {  
            display: flex; /* Use flexbox for alignment */  
            justify-content: center; /* Center the buttons */  
            margin-bottom: 20px;  
        }  
        .button-selection button {  
            margin-right: 20px; /* Space between buttons */  
        }  
    </style>  
</head>  
<body>
    
    <div class="modal">  
        <div class="modal-content"> 
            
            <!-- Button selection for registration type -->  
            <div class="button-selection">  
                <button type="button" onclick="showStudentForm()" id="studentButton">Daftar Sebagai Pelajar</button>  
                <button type="button" onclick="showDonorForm()" id="donorButton">Daftar Sebagai Penyumbang</button>  
            </div>
            
    <div class="container">  
        <div class="header">  
            <h2>Daftar Sebagai Penyumbang Sekarang</h2>  
        </div>    
        <form method="post" action="donatorRegisterServlet">  
           <table>  
                        <tr>  
                            <td><label for="username">Username:</label></td>  
                            <td><input type="text" id="donorName" name="username" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="noic">IC Number:</label></td>  
                            <td><input type="text" name="noic" placeholder="IC Number..." required maxlength="12" pattern="\d{12}" title="Enter a valid 12-digit IC Number"> </td>  
                        </tr>  
                        <tr>  
                            <td><label for="donorEmail">Email Donator:</label></td>  
                            <td><input type="email" id="donorEmail" name="email" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="password">Password:</label></td>  
                            <td><input type="password" id="password" name="password" required></td>  
                        </tr>   
                        <tr>  
                            <td><label for="donorPhone">Nombor Telefon:</label></td>  
                            <td><input type="text" id="donorPhone" name="phoneNum" required></td>  
                        </tr>  
                        <tr>  
                            <td><label for="state">Negeri:</label></td>  
                            <td>  
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
                            </td>  
                        </tr>  
                        <tr>  
                            <td><label for="city">Bandar:</label></td>  
                            <td>  
                                <select name="city" id="city" required>  
                                    <option value="">-- Select City --</option>  
                                </select>  
                            </td>  
                        </tr>  
                    </table>
            <div class="button-container">  
                <button type="submit" class="register-btn">Daftar</button>  
                <button type="button" class="close-btn" onclick="closeModal()">Kembali</button>  
            </div>  
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
        
        function showStudentForm() {  
            // Redirect to the donor registration page  
            window.location.href = 'studentForm.jsp'; // Change this to your desired page  
        }  

        function closeModal() {  
            // Logic to close modal if needed  
        }  
    </script>  
</body>  
</html>