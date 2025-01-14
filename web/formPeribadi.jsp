<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">  
    <title>Student Information Form</title>  
    <style>  
        body {  
            font-family: Arial, sans-serif;  
            background-color: #f4f4f4;  
            margin: 0;  
            padding: 20px;  
        }  
        h2 {  
            text-align: center;  
            color: #333;  
        }  
        .form-container {  
            background-color: #fff;  
            padding: 20px;  
            border-radius: 8px;  
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);  
            max-width: 600px;  
            margin: auto;  
        }  
        label {  
            display: block;  
            margin-bottom: 8px;  
            font-weight: bold;  
            color: #555;  
        }  
        input[type="text"],  
        input[type="number"],  
        textarea {  
            width: 100%;  
            padding: 10px;  
            margin-bottom: 15px;  
            border: 1px solid #ccc;  
            border-radius: 4px;  
            box-sizing: border-box;  
        }  
        input[type="submit"],  
        .pagination button {  
            background-color: #5cb85c;  
            color: white;  
            border: none;  
            padding: 10px 15px;  
            border-radius: 4px;  
            cursor: pointer;  
            font-size: 16px;  
            margin: 5px;  
        }  
        input[type="submit"]:hover,  
        .pagination button:hover {  
            background-color: #4cae4c;  
        }  
        .pagination {  
            text-align: center;  
            margin-top: 20px;  
        }  
        .hidden {  
            display: none;  
        }  
    </style>  
    <script>  
        function showSection(sectionId) {  
            // Hide all sections  
            var sections = document.querySelectorAll('.form-section');  
            sections.forEach(function(section) {  
                section.classList.add('hidden');  
            });  
            // Show the selected section  
            document.getElementById(sectionId).classList.remove('hidden');  
        }  
    </script>  
</head>  
<body>  
    <h2>Student Information Form</h2>  
    <div class="form-container">  
        <form action="dbMaklumatKeluarga" method="post">  
            <div class="form-section" id="section1">  
                <h3>1. Nama Pelajar</h3>  
                <label for="name">Nama:</label>  
                <input type="text" id="name" name="name" required>  
            </div>  

            <div class="form-section hidden" id="section2">  
                <h3>2. Maklumat Bapa</h3>  
                <label for="fName">Nama Bapa:</label>  
                <input type="text" id="fName" name="fName" required>  

                <label for="fWork">Pekerjaan Bapa:</label>  
                <input type="text" id="fWork" name="fWork" required>  

                <label for="fPhoneNum">Nombor Telefon Bapa:</label>  
                <input type="text" id="fPhoneNum" name="fPhoneNum" required>  
            </div>  

            <div class="form-section hidden" id="section3">  
                <h3>3. Maklumat Ibu</h3>  
                <label for="mName">Nama Ibu:</label>  
                <input type="text" id="mName" name="mName" required>  

                <label for="mWork">Pekerjaan Ibu:</label>  
                <input type="text" id="mWork" name="mWork" required>  

                <label for="mPhoneNum">Nombor Telefon Ibu:</label>  
                <input type="text" id="mPhoneNum" name="mPhoneNum" required>  
            </div>  

            <div class="form-section hidden" id="section4">  
                <h3>4. Maklumat Penjaga</h3>  
                <label for="guardianRelay">Nama Penjaga:</label>  
                <input type="text" id="guardianRelay" name="guardianRelay" required>  

                <label for="guardianWork">Pekerjaan Penjaga:</label>  
                <input type="text" id="guardianWork" name="guardianWork" required>  

                <label for="guardianPhoneNum">Nombor Telefon Penjaga:</label>  
                <input type="text" id="guardianPhoneNum" name="guardianPhoneNum" required>  
            </div>  

            <div class="form-section hidden" id="section5">  
                <h3>5. Maklumat Lain-lain</h3>  
                <label for="maritalStatus">Status Perkahwinan:</label>  
                <input type="text" id="maritalStatus" name="maritalStatus" required>  

                <label for="address">Alamat:</label>  
                <textarea id="address" name="address" required></textarea>  

                <label for="postcode">Poskod:</label>  
                <input type="text" id="postcode" name="postcode" required>  

                <label for="grossIncomeM">Pendapatan Kasar (Ibu):</label>  
                <input type="number" id="grossIncomeM" name="grossIncomeM" required>  

                <label for="grossIncomeF">Pendapatan Kasar (Bapa):</label>  
                <input type="number" id="grossIncomeF" name="grossIncomeF" required>  

                <input type="submit" value="Hantar">  <!-- Submit button in the last section -->  
            </div>  

            <div class="pagination">  
                <button type="button" onclick="showSection('section1')">1</button>  
                <button type="button" onclick="showSection('section2')">2</button>  
                <button type="button" onclick="showSection('section3')">3</button>  
                <button type="button" onclick="showSection('section4')">4</button>  
                <button type="button" onclick="showSection('section5')">5</button>  
            </div>  
        </form>  
    </div>  

    <script>  
        // Show the first section by default  
        showSection('section1');  
    </script>  
</body>  
</html>