<!DOCTYPE html>
<html>
<head>
    <title>Logged Out</title>
    <!-- Include W3.CSS -->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body {
            background: #7E57C2; /* Medium-toned purple */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .center-content {
            text-align: center;
            max-width: 400px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        h1 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 15px;
            color: #fff;
        }
        .redirect-timer {
            font-size: 16px;
            margin-top: 10px;
            color: #e0e0e0;
        }
        .w3-button {
            background: #9575CD; /* Soft purple for the button */
            color: #fff;
            border: none;
            border-radius: 20px;
            padding: 10px 20px;
            font-size: 14px;
            transition: background 0.3s ease;
        }
        .w3-button:hover {
            background: #673AB7; /* Slightly darker purple on hover */
        }
        .w3-text-grey {
            color: #e0e0e0 !important;
        }
    </style>
    <script>
        // Timer for automatic redirection
        setTimeout(function() {
            window.location.href = "index.jsp";
        }, 5000); // Redirect after 5 seconds
    </script>
</head>
<body>

    <!-- Center the content -->
    <div class="center-content">
        <h1>You have been logged out</h1>
        <p class="redirect-timer">
            You will be redirected to the home page in <strong>5 seconds</strong>.
        </p>
        <p class="w3-text-grey">If you don't want to wait, click the button below:</p>
        <form action="index.jsp">
            <button type="submit" class="w3-button">
                Go to Home Page Now
            </button>
        </form>
    </div>

</body>
</html>