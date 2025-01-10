<!-- popup.jsp -->
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
    // Popup handling logic
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

    // Popup confirmation logic
    document.getElementById('hantar').addEventListener('click', function() {
        document.getElementById('popupwarn').style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
        document.getElementById('bayarzakat').submit(); // Or any other form submission logic
    });

    document.getElementById('kembali').addEventListener('click', function() {
        document.getElementById('popupwarn').style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
    });
</script>