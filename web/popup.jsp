
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Result</title>
        <style>
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: white;
                border: 2px solid #4CAF50;
                z-index: 1000;
                text-align: center;
            }
            .popup.success {
                border-color: #4CAF50;
            }
            .popup.error {
                border-color: #f44336;
            }
        </style>
    </head>
<body>
    <!-- Popup Message -->
    <div id="popup" class="popup"></div>

    <script>
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
</html>
