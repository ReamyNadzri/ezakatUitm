<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Invoice - Zakat Management System</title>
    <jsp:include page="header.jsp"></jsp:include>
    <script>
        // Print Page Function
        function printPage() {
            window.print();
        }
    </script>
</head>
<body class="w3-light-grey">
    <!-- Full Receipt Invoice -->
    <div class="w3-container w3-card-4 w3-margin w3-white w3-round-large w3-padding">
        <!-- Header -->
        <div class="w3-row-padding w3-border-bottom">
            <div class="w3-half">
                <img src="sources/1ZakatLogoBR.png" class="w3-image" style="max-width:200px;">
            </div>
            <div class="w3-half w3-right-align">
                <h1 class="w3-text-black"><b>INVOICE</b></h1>
            </div>
        </div>

        <!-- Tengoh2 -->
        <div class="w3-row-padding w3-margin-top">
            <div class="w3-half">
                <p>Date: <strong>15/12/2024</strong></p>
                <p>Invoice from:</p>
            </div>
            <div class="w3-half w3-right-align">
                <p>Pay to:</p>
                Universiti Teknologi MARA (UiTM)<br>
                Cawangan Terengganu <br>
                Kampus Kuala Terengganu <br>
                21080 Kuala Terengganu <br>
                Terengganu Darul Iman, Malaysia <br>
                Email: unithalewalpelajar@uitm.edu.my <br><br>
            </div>
        </div>

        <!-- Table -->
        <div class="w3-responsive">
            <table class="w3-table-all w3-centered w3-margin-bottom">
                <thead>
                    <tr class="w3-light-grey">
                        <th>Bank</th>
                        <th>Description</th>
                        <th>Amaun</th>
                    </tr>
                </thead>
                <tr>
                    <td>Maybank</td>
                    <td>Lain-Lain...</td>
                    <td>RM XXXX.XX</td>
                </tr>
                <tr>
                    <td colspan="2" class="w3-right-align w3-bold">Jumlah Pembayaran</td>
                    <td>RM XXXX.XX</td>
                </tr>
            </table>
        </div>

        <!-- Note -->
        <div class="w3-center w3-small w3-margin-top w3-margin-bottom">
            NOTE: This is a computer-generated receipt and does not require a physical signature.
        </div>

        <!-- Button -->
        <div class="w3-center w3-margin-top w3-margin-bottom">
            <a href="index.jsp" class="w3-button w3-dark-grey w3-round-large">Kembali</a>
            <button class="w3-button w3-purple w3-round-large" onclick="printPage()">Cetak</button>
        </div>
    </div>
</body>
</html>