<!DOCTYPE html>
<html>
<head>
    <title>eZakat Admin Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
/*            justify-content: center;  Center content vertically 
            align-items: center;  Center content horizontally 
            background-image: url(../sources/zakat1.jpg);  Path to your background image 
            background-size: cover;  Ensure the image covers the entire background 
            background-position: center;  Center the background image 
            background-repeat: no-repeat;  Prevent the image from repeating */
        }
        .content {
            flex: 1;
        }
        .footer {
            position: relative;
            bottom: 0;
            width: 100%;
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <div class="w3-container w3-center w3-purple">
        <h5>EZAKAT UITMCT 2025</h5>
    </div>
    <br>

    <div class="w3-container w3-center content">
        <img src="../sources/logouitmrasmi.png" style="max-width:500px">

        <h2>WARNING!</h2>
        <h4>Now you are in the admin zakat uitmct site.</h4>
        <h4>Please enter your information down below.</h4><br>

        <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-purple w3-large w3-round-large">Login</button> <br>
        <button onclick="window.location.href='../index.jsp'" class="w3-button w3-purple w3-large w3-round-large w3-margin">Back to Homepage</button> <!-- New button -->

        <div id="id01" class="w3-modal">
            <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

                <div class="w3-center"><br>
                    <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">&times;</span>
                    <img src="../sources/admin.jpg" alt="Avatar" style="width:100px;" class="w3-circle w3-border w3-margin-top">
                </div>

                <form class="w3-container w3-center w3-round-large" action="loginAdminStaff" method="POST"><br>
                    <b>Admin ID</b> <br> <input type="text" name="staffNo" placeholder="Masukkan AdminID" required><br><br>

                    <b>Password</b> <br> <input type="password" name="staffPass"  placeholder="Masukkan Password Admin" required><br><br>
                    <input type="submit" class="w3-center w3-round-large w3-button w3-bar w3-purple" value="Login"><br>
                    <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember My ID <br><br>
                </form>

            </div>
        </div>
    </div>
    <div class="footer w3-container w3-purple w3-center">
        <h5>EZAKAT UITMCT 2025</h5>
    </div>
</body>
</html>