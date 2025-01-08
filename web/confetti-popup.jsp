<%-- 
    Document   : confetti-popup
    Created on : 8 Jan 2025, 12:19:02 am
    Author     : rahim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Application Success</title>
    <style>
        /* Popup Styles */
        .popup {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 300px;
            background: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            z-index: 1000;
            display: none; /* Hidden by default */
        }

        .popup h2 {
            color: #28a745;
            margin-bottom: 15px;
        }

        .popup button {
            margin: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-dashboard {
            background-color: #007bff;
            color: white;
        }

        .btn-index {
            background-color: #6c757d;
            color: white;
        }

        /* Confetti Styles */
        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background: #ff0;
            animation: fall 3s linear infinite;
            opacity: 0.9;
        }

        @keyframes fall {
            0% {
                transform: translateY(-100vh) rotate(0deg);
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
            }
        }
    </style>
</head>
<body>

    <button onclick="showPopup()">Apply</button>

    <!-- Popup -->
    <div class="popup" id="successPopup">
        <h2>Application Submitted!</h2>
        <p>Your application has been successfully submitted.</p>
        <button class="btn-dashboard" onclick="goToDashboard()">Go to Dashboard</button>
        <button class="btn-index" onclick="returnToIndex()">Return to Index</button>
    </div>

    <!-- Confetti Container -->
    <div id="confettiContainer"></div>

    <script>
        function showPopup() {
            // Show the popup
            const popup = document.getElementById("successPopup");
            popup.style.display = "block";

            // Generate confetti
            const confettiContainer = document.getElementById("confettiContainer");
            confettiContainer.innerHTML = ""; // Clear existing confetti

            for (let i = 0; i < 100; i++) {
                const confetti = document.createElement("div");
                confetti.classList.add("confetti");
                confetti.style.backgroundColor = getRandomColor();
                confetti.style.left = Math.random() * window.innerWidth + "px";
                confetti.style.animationDuration = Math.random() * 3 + 2 + "s";
                confetti.style.animationDelay = Math.random() * 2 + "s";
                confettiContainer.appendChild(confetti);
            }
        }

        function getRandomColor() {
            const colors = ["#FF5733", "#FFC300", "#DAF7A6", "#C70039", "#900C3F", "#581845", "#28a745"];
            return colors[Math.floor(Math.random() * colors.length)];
        }

        function goToDashboard() {
            // Redirect to Dashboard
            window.location.href = "/dashboard"; // Replace with your dashboard URL
        }

        function returnToIndex() {
            // Redirect to Index
            window.location.href = "/index"; // Replace with your index URL
        }
    </script>

</body>
</html>

