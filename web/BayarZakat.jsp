
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <title>Pembayaran Zakat</title>
        <div class="" style="">
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
                justify-content: center;
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
            
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 30%;
                padding: 20px;
                background-color: white;
                z-index: 1000;
                text-align: center;
            }
            .popup.success {
                border-color: #4CAF50;
            }
            .popup.error {
                border-color: #f44336;
            }
            
            #overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.5);
                z-index: 999;
            }
            
            #popupwarn {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 30%;
                padding: 20px;
                background-color: white;
                z-index: 1000;
                text-align: center;
            }
            
        </style>
    </head>

    <body>
        <div class="w3-container w3-center w3-panel w3-light-grey">
            <div class="form-card w3-center">
                <h1><b>Pembayaran Zakat</b></h1>
                <!-- Form -->
               <form action="BayarServlet" method="post" id="bayarzakat">
                    <p>Pilih Nama Bank :</p>
                <select name="bank" required> <option value="" disabled selected>Nama Bank...</option>
                    <option value="Bank Islam">Bank Islam</option>
                    <option value="Maybank">Maybank</option>
                    <option value="CIMB">CIMB</option>
                    <option value="Hong Leong Bank">Hong Leong Bank</option>
                    <option value="RHB Bank">RHB Bank</option>
                    <option value="Ambank">Ambank</option>
                    <option value="Affin Bank">Affin Bank</option>
                </select> <br><br>
                <input type="number" name="amaun" id="amaun" placeholder="Amaun..." required>
                <input type="date" name="tarikh" id="tarikh" required>
                <input type="text" name="lainlain" placeholder="Lain-lain...">
                Bukti Pembayaran : <br><br>
                <input type="file" name="fileUpload" placeholder="Bukti pembayaran...">
                <p>Pembayaran boleh dilakukan pada bank: <br>
                <img src="sources/1qr.jpg" class="qr-img"> <br>
                <b>XXXXXXXXXXXXXX <br> (Bank Islam)</b></p>
                <div class="form-buttons">
                    <div class="action-buttons">
                        <a href="index.jsp"> <button type="button" class="back-btn">Kembali</button></a>
                        <a href="Receipt.jsp"> <button type="submit" class="pay-btn">Bayar</button></a>
                    </div>
                </div>
               </form>
            </div>
        </div>
        
        <!-- Popup -->
        <div id="overlay"></div>
        <div class="w3-panel w3-card-4" id="popupwarn" style="width: 30%;">
            <img src="sources/1seru.png" alt="" style="width: 30%;">
            <h5><B>SILA SEMAK DENGAN TELITI!</B></h5>
            <p>Pihak UiTM tidak akan bertanggungjawab<br> jikalau terdapat sebarang kesalahan teknikal<br>atau kecuaian pelajar</p>
            <button class="w3-button" id="hantar">Hantar!</button>
            <button class="w3-button w3-border" id="kembali">Kembali</button>
        </div>
        
        <div id="popup" class="popup">
            <img src="sources/1check.png" alt="" style="width: 30%;">
            <h5><B>Pembayaran Berjaya Dihantar !</B></h5>
            <b>Cetak Receipt ?</b>
            <a href="Receipt.jsp"> <button class="w3-button" type="button">Cetak</button></a>
            <a href="BayarZakat.jsp"> <button class="w3-button" type="button">Kembali</button></a>
        </div>
        
        <script>
            
            // currentdate
            document.getElementById('tarikh').value = new Date().toISOString().slice(0, 10);
            
            // popup 1st
            // Get elements
            const form = document.getElementById('bayarzakat');
            const popupwarn = document.getElementById('popupwarn');
            const overlay = document.getElementById('overlay');
            const confirmBtn = document.getElementById('hantar');
            const cancelBtn = document.getElementById('kembali');

            // Intercept form submission
            form.addEventListener('submit', function(event) {
                event.preventDefault(); // Stop the form from submitting
                popupwarn.style.display = 'block'; // Show the popup
                overlay.style.display = 'block'; // Show the overlay
            });

            // Handle confirmation
            confirmBtn.addEventListener('click', function() {
                popupwarn.style.display = 'none';
                overlay.style.display = 'none';
                form.submit(); // Submit the form manually
            });

            // Handle cancellation
            cancelBtn.addEventListener('click', function() {
                popupwarn.style.display = 'none';
                overlay.style.display = 'none';
            });
            
            
            // popup 2nd
            function showPopup(message, type) {
                var popup = document.getElementById('popup');
                popup.textContent = message;
                popup.className = 'popup ' + type;
                popup.style.display = 'block';

                // Hide the popup after 3 seconds
                setTimeout(function() {
                    popup.style.display = 'none';
                }, 3000);
            }

            // Check the status attribute and show the appropriate message
            window.onload = function() {
                var status = '<%= request.getAttribute("status") %>';
                if (status === "success") {
                    showPopup('Data successfully retrieved!', 'success');
                } else if (status === "failed") {
                    showPopup('Failed to retrieve data.', 'error');
                }
            }
        </script>
        
    </body>
    <div class="w3-border" >
        <jsp:include page="Footer.jsp"></jsp:include>
    </div>
</html>