<%-- 
    Document   : BayarZakat
    Created on : Dec 15, 2024, 12:39:40 AM
    Author     : user
--%>


<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Pembayaran Zakat</title>
    <div class="w3-border w3-border-blue" style="height:8%">
        <jsp:include page="header.jsp"></jsp:include>
    </div>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: google sans, sans-serif;
        }



        /* Form card styling */
        .form-card {
            background: #1c1c1c; /* Dark gray/black background */
            color: #fff;
            padding: 30px;
            border-radius: 25px;
            margin-left:30%;
            margin-top:5%;
            width: 40%;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.8);
            border: 20px solid #6f2df3; /* Purple border */

        }

        /* Form heading */
        .form-card h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #fff;
        }

        /* Input fields */
        form input[type="text"],
        form input[type="number"],
        form input[type="date"],
        form input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 10px;
            border: none;
            background: #3d3d3d; /* Darker background for inputs */
            color: #fff;
            font-size: 16px;
        }

        form input::placeholder {
            color: #9a9a9a;
        }

        /* Paragraph for bank details */
        form p {
            margin: 15px 0;
            font-size: 14px;
            line-height: 1.5;
        }

        /* Form buttons */
        .form-buttons {
            margin-top: 15px;
        }

        .upload-btn {
            background: #6f2df3; /* Purple */
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .upload-btn:hover {
            background: #551bbf; /* Darker purple */
        }

        /* Action buttons */
        .action-buttons {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

         .qr-img {
            width: 50%;
            margin-top: 10px;
            margin-bottom: 5px;
            max-width: 300px;
            height: auto;
            border-radius: 15px;
            border: none;
        }

        .back-btn,
        .pay-btn {
            flex: 1;
            padding: 10px;
            font-size: 16px;
            border-radius: 10px;
            border: none;
            cursor: pointer;
        }

        .back-btn {
            background: #3d3d3d; /* Dark gray */
            color: #fff;
        }

        .back-btn:hover {
            background: #555555;
        }

        .pay-btn {
            background: #6f2df3; /* Purple */
            color: #fff;
        }

        .pay-btn:hover {
            background: #551bbf;
        }
    </style>
</head>

<body>
    <div class="w3-container w3-center w3-panel w3-light-grey">
        <div class="form-card w3-center">
            <h2>Pembayaran Zakat</h2>
            <!-- Form -->
            <form action="bayarZakat.do" method="post" enctype="multipart/form-data">
                <input type="text" name="bank" placeholder="Nama Bank..." required>
                <input type="number" name="amaun" placeholder="Amaun..." required>
                <input type="date" name="tarikh" required>
                <input type="text" name="lainlain" placeholder="Lain-lain...">
                <p>Pembayaran boleh dilakukan pada bank: <br>
                <img src="1qr.jpg" class="qr-img"> <br>
                <b>XXXXXXXXXXXXXX <br> (Bank Islam)</b></p>
                <!-- Buttons -->
                <div class="form-buttons">
                    <!--<input type="file" name="bayar" class="upload-btn" required> -->
                    <div class="action-buttons">
                        <button type="button" class="back-btn" onclick="window.history.back()">Kembali</button>
                        <button type="submit" class="pay-btn">Bayar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<div class="w3-border" >
        <jsp:include page="Footer.jsp"></jsp:include>
    </div>
</html>