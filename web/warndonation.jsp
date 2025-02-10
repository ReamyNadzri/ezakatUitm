<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Confirmation</title>
    <jsp:include page="header.jsp"></jsp:include>
    <style>
      .button {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 20px;
        }
    </style>
</head>
<body class="w3-light-grey">
    <div class="w3-container w3-center w3-panel w3-light-grey" style="margin-top: 10%;">
        <div class="w3-card-4 w3-white w3-padding-large w3-round-large w3-center" style="max-width: 500px; margin: auto;">
            <img src="sources/1seru.png" class="w3-image w3-round-large" style="width:40%; max-width:300px;">
            <h2 class="w3-text-black"><b>Sila Semak Dengan Teliti !</b></h2>
            <p>Pihak UiTM tidak akan bertanggungjawab <br> jikalau terdapat sebarang kesalahan teknikal <br> atau kecuaian pengguna</p>
            <form action="BayarServlet" method="post">
                <input type="hidden" name="bank" value="${param.bank}">
                <input type="hidden" name="amaun" value="${param.amaun}">
                <input type="hidden" name="tarikh" value="${param.tarikh}">
                <input type="hidden" name="nota" value="${param.nota}">
                <div class="button">
                    <button type="button" onclick="window.history.back();" class="w3-button w3-border w3-border-purple w3-round-large">Kembali</button>
                    <button type="submit" class="w3-button w3-green w3-round-large">Hantar !</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>