<%@ page contentType="text/html;charset=UTF-8" language="java" %>   
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>  
<html lang="ms">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Isi Maklumat Peribadi</title>  
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">  
    <style>  
        /* Custom styles for the layout */  
        .form-container {  
            max-height: 100vh; /* Limit height to 100% of the viewport height */  
            overflow: hidden; /* Disable scrolling */  
        }  
        .flex-section {  
            display: flex; /* Use flexbox for layout */  
            justify-content: space-between; /* Space between the two sections */  
            margin-bottom: 10px; /* Space between rows */  
        }  
        .half-width {  
            flex: 1; /* Take equal space */  
            margin-right: 5px; /* Space between columns */  
        }  
        .half-width:last-child {  
            margin-right: 0; /* Remove margin for the last child */  
        }  
        label {  
            font-size: 0.9rem; /* Smaller font size for labels */  
        }  
        input, select {  
            font-size: 0.9rem; /* Smaller font size for inputs and selects */  
        }  
    </style>  
</head>  
<body class="bg-gray-100 p-4">  
    <div class="container mx-auto bg-white p-4 rounded-lg shadow-lg form-container">  
        <h1 class="text-xl font-bold mb-2">Isi Maklumat Peribadi</h1>  
        <form action="successMaklumat.jsp" method="post">  
            <div class="flex-section">    
                <div class="half-width">
                    <h2 class="text-lg font-semibold mt-2">Masukkan Nombor Matrik</h2>
                    <input type="text" name="matricno" class="border rounded p-1 w-full mb-2" required>
                    <h2 class="text-lg font-semibold mt-2">1. Maklumat Bapa</h2>  
                    <label>Nama:</label>  
                    <input type="text" name="fName" class="border rounded p-1 w-full mb-2" required>  
                    <label>Pekerjaan:</label>  
                    <input type="text" name="fWork" class="border rounded p-1 w-full mb-2" required>  
                    <label>Pendapatan Kasar (Bapa):</label>  
                    <input type="number" name="grossIncomeM" class="border rounded p-1 w-full mb-2" required>   
                    <label>No. Telefon:</label>  
                    <input type="text" name="fPhoneNum" class="border rounded p-1 w-full mb-2" required>  
                </div>  
                <div class="half-width">  
                    <h2 class="text-lg font-semibold mt-2">2. Maklumat Ibu</h2>  
                    <label>Nama:</label>  
                    <input type="text" name="mName" class="border rounded p-1 w-full mb-2" required>  
                    <label>Pekerjaan:</label>  
                    <input type="text" name="mWork" class="border rounded p-1 w-full mb-2" required>  
                    <label>Pendapatan Kasar (Ibu):</label>  
                    <input type="number" name="grossIncomeF" class="border rounded p-1 w-full mb-2" required>  
                    <label>No. Telefon:</label>  
                    <input type="text" name="mPhoneNum" class="border rounded p-1 w-full mb-2" required>  
                </div>  
            </div>  

            <div class="flex-section">  
                <div class="half-width">  
                    <h2 class="text-lg font-semibold mt-2">3. Maklumat Penjaga</h2>  
                    <label>Nama:</label>  
                    <input type="text" name="guardianRelay" class="border rounded p-1 w-full mb-2" required>  
                    <label>Pekerjaan:</label>  
                    <input type="text" name="guardianWork" class="border rounded p-1 w-full mb-2" required>  
                    <label>No. Telefon:</label>  
                    <input type="text" name="guardianPhoneNum" class="border rounded p-1 w-full mb-2" required>  
                </div>  
                <div class="half-width">  
                    <h2 class="text-lg font-semibold mt-2">4. Maklumat Lain</h2>  
                    <label>Status Perkahwinan Ibu & Bapa:</label>  
                    <select name="maritalStatus" required class="border rounded p-1 w-full mb-2">  
                        <option value="" disabled selected>Pilih Status Perkahwinan Ibu Bapa Anda...</option>  
                        <option value="Berkahwin">Berkahwin</option>  
                        <option value="Bercerai">Bercerai</option>  
                    </select>   
                    <label>Alamat:</label>  
                    <input type="text" name="address" class="border rounded p-1 w-full mb-2" required>  
                    <label>Poskod:</label>  
                    <input type="text" name="postcode" class="border rounded p-1 w-full mb-2" required>     
                </div>  
            </div>  

            <button type="submit" class="bg-blue-500 text-white rounded p-2">Hantar</button>  
        </form>  
    </div>  
</body>  
</html>