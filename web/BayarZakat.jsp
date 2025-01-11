<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Pembayaran Zakat</title>
    <jsp:include page="header.jsp"></jsp:include>
    <style>
        /* Additional container */
        .outer-container {
            background-color: #6f2df3; /* warne pepel */
            padding: 20px;
            border-radius: 25px;
        }
        .button {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>

<body class="w3-light-grey">
    <div class="w3-container w3-center w3-panel w3-light-grey">
        <div class="outer-container w3-card-4" style="margin-left:20%; margin-top:6%; margin-bottom:2%; width:60%;">
            <div class="w3-white w3-padding-large w3-round-large w3-center w3-card-4">
                <h1 class="w3-text-black"><b>Pembayaran Zakat</b></h1>
                <!-- Form -->
                <form action="warndonation.jsp" method="post" id="bayarzakat" class="w3-container">
                    <!-- Bahagi 2 container -->
                    <div class="w3-row-padding">
                        <!-- Left column -->
                        <div class="w3-half">
                            <p class="w3-text-black">Pilih Nama Bank :</p>
                            <select name="bank" class="w3-select w3-border w3-round-large w3-light-grey" required>
                                <option value="" disabled selected>Nama Bank...</option>
                                <option value="Bank Islam">Bank Islam</option>
                                <option value="Maybank">Maybank</option>
                                <option value="CIMB">CIMB</option>
                                <option value="Hong Leong Bank">Hong Leong Bank</option>
                                <option value="RHB Bank">RHB Bank</option>
                                <option value="Ambank">Ambank</option>
                                <option value="Affin Bank">Affin Bank</option>
                            </select>
                            <br><br>
                            <input type="number" name="amaun" id="amaun" placeholder="Amaun..." class="w3-input w3-border w3-round-large w3-light-grey" required> <br>
                            <input type="date" name="tarikh" id="tarikh" class="w3-input w3-border w3-round-large w3-light-grey" readonly> <br>
                            <input type="text" name="nota" placeholder="Nota..." class="w3-input w3-border w3-round-large w3-light-grey"> <br>
                        </div>
                        <!-- Right column -->
                        <div class="w3-half">
                            <p class="w3-text-black">Bukti Pembayaran :</p>
                            <input type="file" name="fileUpload" class="w3-input w3-border w3-round-large w3-light-grey">
                            <p class="w3-text-black">Pembayaran boleh dilakukan pada bank:</p>
                            <img src="sources/1qr.jpg" class="w3-image w3-border w3-border-purple w3-round-large" style="width:100%; max-width:300px;">
                            <p class="w3-text-black"><b>XXXXXXXXXXXXXX <br> (Bank Islam)</b></p>
                        </div>
                    </div>
                    <div class="button">
                        <a href="index.jsp" class="w3-button w3-round-large w3-dark-grey">Kembali</a>
                        <button type="submit" class="w3-button w3-round-large w3-purple">Bayar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Replace date dgn current date
        document.getElementById('tarikh').value = new Date().toISOString().slice(0, 10);
    </script>
</body>
<div class="w3-border">
    <jsp:include page="Footer.jsp"></jsp:include>
</div>
</html>