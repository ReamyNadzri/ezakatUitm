<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="style.css">
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
                <form action="BayarServlet" method="post" id="bayarzakat" class="w3-container">
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
                            <input type="date" name="tarikh" id="tarikh" class="w3-input w3-border w3-round-large w3-light-grey" required> <br>
                            <input type="text" name="lainlain" placeholder="Lain-lain..." class="w3-input w3-border w3-round-large w3-light-grey"> <br>
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

    <!-- Popup -->
    <div id="overlay" class="w3-overlay" style="display:none;"></div>
    <div class="w3-panel w3-card-4 w3-white" id="popupwarn" style="width:30%; display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); z-index:1000;">
        <img src="sources/1seru.png" alt="" style="width:30%;">
        <h5><b>SILA SEMAK DENGAN TELITI!</b></h5>
        <p>Pihak UiTM tidak akan bertanggungjawab<br> jikalau terdapat sebarang kesalahan teknikal<br>atau kecuaian pelajar</p>
        <button class="w3-button w3-green" id="hantar">Hantar!</button>
        <button class="w3-button w3-border" id="kembali">Kembali</button>
    </div>

    <div id="popup" class="w3-panel w3-card-4 w3-white w3-center" style="width:30%; display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); z-index:1000;">
        <img src="sources/1check.png" alt="" style="width:30%;">
        <h5><b>Pembayaran Berjaya Dihantar !</b></h5>
        <b>Cetak Receipt ?</b>
        <a href="Receipt.jsp"><button class="w3-button" type="button">Cetak</button></a>
        <a href="BayarZakat.jsp"><button class="w3-button" type="button">Kembali</button></a>
    </div>

    <script>
        // currentdate
        document.getElementById('tarikh').value = new Date().toISOString().slice(0, 10);

        // popup 1st
        const form = document.getElementById('bayarzakat');
        const popupwarn = document.getElementById('popupwarn');
        const overlay = document.getElementById('overlay');
        const confirmBtn = document.getElementById('hantar');
        const cancelBtn = document.getElementById('kembali');

        form.addEventListener('submit', function(event) {
            event.preventDefault();
            popupwarn.style.display = 'block';
            overlay.style.display = 'block';
        });

        confirmBtn.addEventListener('click', function() {
            popupwarn.style.display = 'none';
            overlay.style.display = 'none';
            form.submit();
        });

        cancelBtn.addEventListener('click', function() {
            popupwarn.style.display = 'none';
            overlay.style.display = 'none';
        });

        // popup 2nd
        function showPopup(message, type) {
            var popup = document.getElementById('popup');
            popup.textContent = message;
            popup.className = 'w3-panel w3-card-4 w3-white ' + type;
            popup.style.display = 'block';

            setTimeout(function() {
                popup.style.display = 'none';
            }, 3000);
        }

        window.onload = function() {
            var status = '<%= request.getAttribute("status") %>';
            if (status === "success") {
                showPopup('Data successfully retrieved!', 'w3-green');
            } else if (status === "failed") {
                showPopup('Failed to retrieve data.', 'w3-red');
            }
        }
    </script>
</body>
<div class="w3-border">
    <jsp:include page="Footer.jsp"></jsp:include>
</div>
</html>