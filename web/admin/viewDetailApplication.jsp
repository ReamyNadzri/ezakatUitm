<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"></jsp:include>
<!DOCTYPE html>

<head>
    <title>Permohonan Zakat</title>
    <meta name="viewport">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <style>
        #bantuankewangan {
            display: none; /* Hide inputs by default */
        }
        .box {
            width: 150px;
            height: 50px;
            display: inline-block;
            margin: 10px;
            text-align: center;
            line-height: 50px;
            cursor: pointer;
        }
        .selected {
            background-color: green;
            color: white !important;
            border-color: green;
        }
        .category-box {
            width: 120px;
            height: 50px;
            line-height: 50px;
            text-align: center;
            margin: 10px;
            cursor: pointer;
        }
        .hidden {
            display: none;
        }
        /* Style for the overlay */
        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 999;
        }
        /* Style for the popup */
        #popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            text-align: center;
        }
        /* Popup buttons */
        #popup button {
            margin: 10px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        #popup button#confirmSubmit {
            background-color: #4CAF50;
            color: white;
        }

        .flex-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }
        .flex-item {
            flex: 1;
        }
        .centered-button-container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <%
        String doc1 = ((String) request.getAttribute("TRANSCRIPTDOC")).replace("\\", "/");
        String doc2 = ((String) request.getAttribute("STUDENTLETTER")).replace("\\", "/");
        String doc3 = ((String) request.getAttribute("ICDOC")).replace("\\", "/");
        String doc4 = ((String) request.getAttribute("ELECTRONICAPPLIANCE"));
        if(doc4 != null){
        doc4 = doc4.replace("\\", "/");
        }else{
        doc4 = "TIDAK MEMOHON";
        }
        String doc5 = ((String) request.getAttribute("KOLEJDOC"));
        if(doc5 != null){
        doc5 = doc5.replace("\\", "/");
        }else{
        doc4 = "TIDAK MEMOHON";
        }
        String doc6 = ((String) request.getAttribute("ENTRYSESSIONDOC"));
        if(doc6 != null){
        doc6 = doc6.replace("\\", "/");
        }else{
        doc4 = "TIDAK MEMOHON";
        }
        String doc7 = ((String) request.getAttribute("YURANDOC"));
        if(doc7 != null){
        doc7 = doc7.replace("\\", "/");
        }else{
        doc4 = "TIDAK MEMOHON";
        }
        String doc8 = ((String) request.getAttribute("COSTDOC"));
        if(doc8 != null){
        doc8 = doc8.replace("\\", "/");
        }else{
        doc4 = "TIDAK MEMOHON";
        }
        String doc9 = ((String) request.getAttribute("REASONDOC"));
        if(doc9 != null){
        doc9 = doc9.replace("\\", "/");
        }else{
        doc4 = "TIDAK MEMOHON";
        }
    %>
  
    <div class="w3-container w3-row w3-white" style="background: #f3e8fd">
        <div class="w3-container w3-col" style="width: 10%; height: 100px;">
        </div>
        <div class="w3-container w3-col" style="width: 80%;">
            <div class="w3-container w3-round-large w3-margin w3-card flex-container" style="padding-left:50px; padding-top:10px; box-shadow: 0 0px 15px rgba(128, 0, 128, 1.0);">
                <!-- Maklumat Terperinci Permohonan Zakat -->
                <div class="w3-panel w3-row w3-cell flex-item">
                    <h3>Maklumat Terperinci Permohonan Zakat</h3>
                    <hr>
                    <div class="w3-cell">
                        ID Permohonan
                        <br>No. Matrik &emsp;&emsp;  <!--studentID-->
                        <br>Nama
                        <br>Email
                        <br>Kampus
                        <hr><!-- maklumat pelajar -->
                        CGPA Terkini
                        <br>GPA Terkini
                        <br>Tahun Graduasi
                        <hr><!-- maklumat bank -->
                        Nombor Bank
                        <br>Nama Bank
                        <hr>
                        Surat Transcript
                        <br>Student Letter
                        <br>Dokumen IC
                    </div>
                    <div class="w3-cell">
                        &emsp;:&emsp; ${APPLYID}
                        <br>&emsp;:&emsp; ${MATRICNO}
                        <br>&emsp;:&emsp; ${NAME}
                        <br>&emsp;:&emsp; ${EMAIL}
                        <br>&emsp;:&emsp; ${CAMPUS}
                        <hr><!-- maklumat pelajar -->
                        &emsp;:&emsp; ${CGPA}
                        <br>&emsp;:&emsp; ${GPA}
                        <br>&emsp;:&emsp; ${GRADYEAR}
                        <hr><!-- maklumat bank -->
                        &emsp;:&emsp; ${BANKNO}
                        <br>&emsp;:&emsp; ${BANKNAME}
                        <hr>
                        &emsp;:&emsp; <a href="<%=doc1%>" target="_blank">Download</a>
                        <br>&emsp;:&emsp; <a href="<%=doc2%>" target="_blank">Download</a>
                        <br>&emsp;:&emsp; <a href="<%=doc3%>" target="_blank">Download</a>
                    </div>
                </div>
                <!-- Maklumat Permohonan Zakat yang Dipilih -->
                <div class="w3-panel w3-row w3-cell flex-item">
                    <h3>Maklumat Permohonan Zakat yang Dipilih</h3>
                    <hr>
                    <caption>ZAKAT KOLEJ</caption>
                    <div class="w3-cell">
                        Nama Kolej
                        <br>Jumlah Bayaran
                        <br>Borang Elektrik
                        <br>Borang Kolej
                    </div>
                    <div class="w3-cell">
                        &emsp;:&emsp; ${KOLEJNAME != null && KOLEJNAME != '' ? KOLEJNAME : 'TIDAK MEMOHON'}
                        <br>&emsp;:&emsp; ${TOTALKOLEJ != null && TOTALKOLEJ != '0.0' ? TOTALKOLEJ : 'TIDAK MEMOHON'}
                        <% if(doc4 != "TIDAK MEMOHON"){%>
                            <br>&emsp;:&emsp; <a href="<%=doc4%>" target="_blank">Download</a>
                        <%}else{%><br><%}%>
                        <% if(doc5 != null){%>
                            <br>&emsp;:&emsp; <a href="<%=doc5%>" target="_blank">Download</a>
                        <%}else{%><br><%}%>
                    </div>
                    <hr>
                    <caption>ZAKAT YURAN</caption>
                    <div class="w3-cell">
                        Yuran Kolej
                        <br>Borang Semester
                        <br>Resit Yuran
                    </div>
                    <div class="w3-cell">
                        &emsp;:&emsp; ${TOTALYURAN != null && TOTALYURAN != '0.0' ? TOTALYURAN : 'TIDAK MEMOHON'}
                        <% if(doc6 != null){%>
                            <br>&emsp;:&emsp; <a href="<%=doc6%>" target="_blank">Download</a>
                        <%}else{%><br><%}%>
                        <% if(doc7 != null){%>
                            <br>&emsp;:&emsp; <a href="<%=doc7%>" target="_blank">Download</a>
                        <%}else{%><br><%}%>
                    </div>
                    <hr>
                    <caption>ZAKAT MAKAN</caption>
                    <div class="w3-cell">
                        Nama Cafe
                    </div>
                    <div class="w3-cell">
                        &emsp;&emsp;:&emsp;${CAFE != null && CAFE != '0.0' ? 
                                            (CAFE.toLowerCase() == 'rrcafe' ? 'RR Cafe (Kiosk)' : 
                                            (CAFE.toLowerCase() == 'cafelestari' ? 'Cafe Lestari' : CAFE)) 
                                            : 'TIDAK MEMOHON'}
                    </div>
                    <hr>
                    <caption>ZAKAT MUSIBAH</caption>
                    <div class="w3-cell">
                        Sebab-sebab
                        <br>Tarikh Musibah
                        <br>Jumlah Kerugian
                        <br>Dokumen Kerugian
                        <br>Surat Sebab
                    </div>
                    <div class="w3-cell">
                        &emsp;:&emsp; ${REASON != null && REASON != '' ? REASON : 'TIDAK MEMOHON'}
                        <br>&emsp;:&emsp; ${MUSIBAHDATE != null && MUSIBAHDATE != '' ? MUSIBAHDATE : 'TIDAK MEMOHON'}
                        <br>&emsp;:&emsp; ${TOTALCOST != null && TOTALCOST != '0.0' ? TOTALCOST : 'TIDAK MEMOHON'}
                        <% if(doc8 != null){%>
                            <br>&emsp;:&emsp; <a href="<%=doc8%>" target="_blank">Download</a>
                        <%}else{%><br><%}%>
                        <% if(doc9 != null){%>
                            <br>&emsp;:&emsp; <a href="<%=doc9%>" target="_blank">Download</a>
                        <%}else{%><br><%}%>
                    </div>
                </div>
            </div>
            <div class="centered-button-container">
                <a class="w3-button w3-purple w3-hover w3-round-large" href="viewapplication.jsp">KEMBALI</a>
            </div>
        </div>
    </div>
</body>