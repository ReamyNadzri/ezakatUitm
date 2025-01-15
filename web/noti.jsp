<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Donation Notification</title>
    <jsp:include page="header.jsp"></jsp:include>
</head>
<body class="w3-light-grey">
    <div class="w3-container w3-center w3-panel w3-light-grey" style="margin-top: 10%;">
        <div class="w3-card-4 w3-white w3-padding-large w3-round-large w3-center" style="max-width: 500px; margin: auto;">
            <c:choose>
                <c:when test="${status == 'success'}">
                    <img src="sources/1check.png" class="w3-image w3-round-large" style="width:40%; max-width:300px;">
                    <p>Pembayaran Zakat anda telah berjaya dilakukan !</p>
                    <p>Terima kasih atas sumbangan anda</p>
                    <a href="index.jsp" class="w3-button w3-border w3-border-purple w3-round-large">Kembali ke Laman Utama</a>
                    <a href="Receipt.jsp" class="w3-button w3-purple w3-round-large">Cetak Resit</a>       
                </c:when>
                <c:when test="${status == 'successD'}">
                    <img src="sources/1check.png" class="w3-image w3-round-large" style="width:40%; max-width:300px;">
                    <p>Profil anda berjaya dikemaskini !</p>
                    <a href="donatorProfile.jsp" class="w3-button w3-purple w3-round-large">Kembali ke Profil</a>
                </c:when>
                <c:when test="${status == 'failedD'}">
                    <img src="sources/1seru.png" class="w3-image w3-round-large" style="width:40%; max-width:300px;">
                    <p>Profil anda gagal dikemaskini !</p>
                    <a href="donatorProfile.jsp" class="w3-button w3-purple w3-round-large">Kembali ke Profil</a>
                </c:when>
                <c:otherwise>
                    <img src="sources/1seru.png" class="w3-image w3-round-large" style="width:40%; max-width:300px;">
                    <p>Pembayaran Zakat anda gagal dilakukan !</p>
                    <p>Sila cuba lagi atau hubungi pihak sokongan</p>
                    <a href="BayarZakat.jsp" class="w3-button w3-border w3-border-purple w3-round-large">Kembali ke Pembayaran</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>