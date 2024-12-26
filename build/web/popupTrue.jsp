<%-- 
    Document   : popupTrue
    Created on : Dec 18, 2024, 2:06:38 AM
    Author     : user
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User Registration Popup</title>
        <link rel="stylesheet" href="style.css">
    </head>

    <body>
        <button class="openpopup" onclick="showpopup()">Popup?</button></strong>
        <!-- Modal Overlay -->
        <div id="popupModal" class="modal-overlay">
            <div class="modal-box">
                <!-- Warning Icon -->
                <img src="1check.png" class="seru" alt="warning">
                
                <!-- Warning Text -->
                <div class="modal-text">User successfully registered!</div>

                <!-- Back Button -->
                <button type="button" class="back" onclick="closepopup()">Kembali Semula</button>
            </div>
        </div>

        <!-- JavaScript to Trigger the Modal -->
        <script>
            // Function to Show the Popup
             function showpopup() {
                document.getElementById("popupModal").style.display = "block";
            }

            // Function to Close the Popup
            function closepopup() {
                document.getElementById("popupModal").style.display = "none";
            }
        </script>
    </body>
</html>


<!-- CSS -->
<style>
            /* Modal Background Overlay */
            .modal-overlay {
                display: none; /* Hidden by default */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.7); /* Semi-transparent background */
                z-index: 1000;
            }

            /* Modal Box */
            .modal-box {
                background: #2b2b2b; /* Dark background color */
                width: 400px;
                padding: 30px;
                margin: 100px auto;
                border-radius: 15px;
                text-align: center;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
                position: relative;
            }
            
            .seru {
                display: flex;
                margin: 0 auto;
                max-width: 200px;
                height: auto;
            }
            
            /* Message Text */
            .modal-text {
                color: #ffffff; /* White text */
                font-family: google sans, sans-serif;
                font-size: 18px;
                margin-top: 50px;
                margin-bottom: 30px;
                text-align: center;
            }

            /* Button Style */
            .back {
                background: #8d48ff; /* Purple button */
                color: #ffffff;
                border: none;
                padding: 10px 20px;
                border-radius: 10px;
                font-size: 16px;
                cursor: pointer;
                text-decoration: none;
                display: inline-block;
            }

            .modal-button:hover {
                background: #6b35d4;
            }
</style>
