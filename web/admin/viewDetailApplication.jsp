<%-- 
    Document   : viewDetailApplication
    Created on : 12 Jan 2025, 10:55:31 pm
    Author     : rahim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<%
    
    %>



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
        <!--applyID, studentID, zakatID, siblings, applyDate(current), totalIncome, studentLetter, transcriptDoc, icDoc, gradDate, entryDate, bankName, bankNum-->
        <div class="w3-container w3-col" style="width: 80%;">
        
            <div class="w3-container w3-round-large w3-margin w3-card w3-row" style="padding-left:50px ; padding-top:25px">
                <div class="w3-container w3-cell">
                    <div class="w3-panel w3-row w3-cell w3-green">
                        <h3>Maklumat Terperinci Permohonan Zakat</h3>
                        <HR>
                        <div class="w3-cell w3-red">
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
                        <div class="w3-cell w3-blue">  <!--select * from student where studentID = (name)-->
                            &emsp;:&emsp; ${APPLYID}
                            <br>&emsp;:&emsp; ${MATRICNO}
                            <br>&emsp;:&emsp; ${NAME}
                            <br>&emsp;:&emsp; <%=session.getAttribute("EMAIL")%>
                            <br>&emsp;:&emsp; <%=session.getAttribute("CAMPUS")%>
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
                </div>
                <hr>
                <div class="w3-panel w3-cell w3-yellow">
                    <div class="w3-container w3-cell">
                        <div class="w3-cell">
                            Nama
                            <br>No. Matrik &emsp;&emsp;  <!--studentID-->
                            <br>Email
                            <br>Kampus
                        </div>
                        <div class="w3-cell">  <!--select * from student where studentID = (name)-->
                            :&emsp; <%=session.getAttribute("NAME")%>
                            <br>:&emsp; <%=session.getAttribute("MATRICNO")%>
                            <br>:&emsp; <%=session.getAttribute("EMAIL")%>
                            <br>:&emsp; <%=session.getAttribute("CAMPUS")%>
                        </div>
                    </div>
                </div>
                <form action="addzakat.do" method="post" id="zakatForm" enctype="multipart/form-data">
                    <div class="w3-col w3-margin-bottom">
                        <div class="w3-cell w3-panel">
                            <b>Sesi Tawaran</b><br>
                            <select class="form-control" name='applyID' value="OKT2024-FEB2025" required>  <!--tukar dgn gradDate-->
                                        <option value='OKT2024-FEB2025'>OKT2024-FEB2025</option>
                                        
                                    </select>
                        </div> <!--applyID-->
                        <div class="w3-cell w3-panel">
                            <b>Semester Semasa <span style="color: red;">*</span></b><br>
                            <input class="w3-input w3-border w3-round-large" type="text" name="currentSemester" id="" value="" size="50%" required>
                        </div>
                    </div>
                    <div class="w3-col w3-margin-bottom">
                        <div class="w3-cell w3-panel">
                            <b>Keputusan Terkini CGPA <span style="color: red;">*</span></b><br>
                            <input class="w3-input w3-border w3-round-large" type="text" name="currentCgpa" id="" value="" size="50%" required>
                        </div>
                        <div class="w3-cell w3-panel">
                            <b>Keputusan Terkini GPA <span style="color: red;">*</span></b><br>
                            <input class="w3-input w3-border w3-round-large" type="text" name="currentGpa" id="" value="" size="50%" required>
                        </div>
                    </div>
                    <div class="w3-col w3-margin-bottom">
                        <div class="w3-panel">
                            Adakah anda mendapat bantuan insentif Makanan UiTM (RM 120)<span style="color: red;">*</span>
                            <input class="w3-radio" style="margin-left: 20px;" type="radio" name="insentifmakanan" value="Ya" id=""> Ya
                            <input class="w3-radio" style="margin-left: 20px;" type="radio" name="insentifmakanan" value="Tidak" id=""> Tidak
                        </div>
                        <div class="w3-panel">
                            Adakah anda mendapat bantuan kewangan (PTPTN, JPA, MARA dll)<span style="color: red;">*</span>
                            <input class="w3-radio" style="margin-left: 10px;" onclick="toggleInputs()" type="radio" name="bantuan" value="Ya" id="yesBantuan"> Ya
                            <input class="w3-radio" style="margin-left: 20px;" onclick="toggleInputs()" type="radio" name="bantuan" value="Tidak" id="noBantuan"> Tidak
                        </div>
                        <!--hidden menu-->
                        <div id="bantuankewangan" class="w3-col">
                            <div class="w3-cell w3-panel">
                                <b>Jika ada, nyatakan dari mana: </b><br>
                                <input class="w3-input w3-border w3-round-large" type="text" name="namaBantuan" value="" id="" size="50%" >
                            </div>
                            <div class="w3-cell w3-panel">
                                <b>Jumlah per/sem: (RM) </b><br>
                                <input class="w3-input w3-border w3-round-large" type="text" name="jumlahBantuan" value="" id="" size="50%" >
                            </div>
                        </div> 
                        
                    </div>
                    <div class="w3-col w3-margin-bottom">
                        <div class="w3-panel">
                            <h3 for="">Muat Naik Dokumen Penting!</h3><hr>
                            <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                <caption><i>Berikut adalah dokumen yang harus dimuat naik<br><B>i. Student letter </B>(yang telah disahkan oleh pensyarah atau HEP) <br> <b>ii. Transcript Semasa</b> (yang telah disahkan oleh pensyarah atau HEP) <br> <b>iii. Salinan Kad Pengenalan </b>(yang telah disahkan oleh pensyarah atau HEP) <br><br>Pastikan keseluruhan dokumen anda memenuhi kriteria supaya permohonan anda tidak ditolak</i></caption>
                            </div><br>
                            <div class="w3-cell">
                                <b>Sila masukkan dokumen <i>student letter</i></b><span style="color: red;">*</span>
                                <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                    <input class="pad w3-input" type="file" name="file1" accept=".pdf" required>
                                </div><br>
                            </div>
                            <div class="w3-cell" style="width:25px"></div>
                            <div class="w3-cell">
                                <b>Sila masukkan dokumen transcript</b><span style="color: red;">*</span>
                                <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                    <input class="pad w3-input" type="file" name="file2" accept=".pdf" required>
                                </div><br>
                            </div>
                        
                        </div>
                        <div class="w3-panel">
                            <div class="w3-cell">
                                <b>Sila masukkan dokumen KP. depan & belakang</b><span style="color: red;">*</span>
                                <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                    <input class="pad w3-input" type="file" name="file3" accept=".pdf" required>
                                </div><br>
                            </div>
                            <div class="w3-col" style="">
                                <div class="w3-cell">
                                    <b>Pilih tahun graduasi <span style="color: red;">*</span></b><br>
                                    <select class="w3-input" name='gradYear' value="2025">  <!--tukar dgn gradDate-->
                                        <option value='2025'>2025</option>
                                        <option value='2026'>2026</option>
                                        <option value='2027'>2027</option>
                                        <option value='2028'>2028</option>
                                        <option value='2029'>2029</option>
                                        <option value='2030'>2030</option>
                                    </select>
                                </div>
                                <div class="w3-cell" style="width:30px"></div>
                                <div class="w3-cell" >
                                        <b>Nama Bank: <span style="color: red;">*</span></b><br>
                                        <select class="w3-input" name='bankName'>  <!--tukar dgn gradDate-->
                                            <option value='Maybank (Malayan Banking Berhad)'>Maybank (Malayan Banking Berhad)</option>
                                            <option value='CIMB Bank'>CIMB Bank</option>
                                            <option value='RHB Bank'>RHB Bank</option>
                                            <option value='Hong Leong Bank'>Hong Leong Bank</option>
                                            <option value='Bank Islam Malaysia Berhad'>Bank Islam Malaysia Berhad</option>
                                            <option value='Ambank (AmBank Group)'>Ambank (AmBank Group)</option>
                                            <option value='Affin Bank'>Affin Bank</option>
                                        </select>
                                </div>
                                <div class="w3-cell" style="width:30px"></div>
                                <div class="w3-cell">
                                    <b>Nombor Bank <span style="color: red;">*</span></b><br>
                                    <input class="w3-input w3-border w3-round-large" style="width: 300px;" type="text" name="bankNo" id="" size="50%">
                                </div>
                            </div>
                        </div>
              
                        
                    </div>
                    <div class="w3-col w3-margin-bottom"><hr>
                        <div class="w3-panel">
                            <h3>Permohonan zakat</h3>
                        </div>
                        <div class="w3-panel">
                            <!-- Additional Inputs -->
                            <div id="" class="w3-margin-top ">
                                <h3 for="">Zakat Musibah Details:</h3><hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i><b>Zakat musibah</b> merujuk kepada bantuan kewangan atau sumbangan bagi meringankan beban pelajar bencana seperti banjir, kebakaran, atau gempa bumi. Contohnya, bantuan diberikan kepada mangsa banjir yang kehilangan rumah, keluarga miskin akibat gempa bumi, atau menyediakan makanan dan pakaian kepada mangsa kebakaran.</caption></i>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <b>Sila nyatakan sebab permohonan anda dibawah: <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="reason" value="TIDAK MEMOHON" id="" size="50%" required>
                                    </div>
                                    <div class="w3-cell" style="padding-left: 25px;">
                                        <b>Jumlah kerosakkan (RM): <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="totalLost" value="0.0" id="" size="50%" required>
                                    </div>
                                    <div class="w3-margin-top">
                                        <b>Tarikh berlaku musibah: <span style="color: red;">*</span></b>
                                        <input class="w3-input w3-date" type="date" id="tarikhmusibah" name="tarikhmusibah">
                                    </div>
                                </div>
                                
                                <br>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen kerugian dibawah</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="file4" accept=".pdf">
                                    </div><br>
                                </div>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen sebab dibawah</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="file5" accept=".pdf">
                                    </div><br>
                                </div>
                            
                            
                            </div>
                            <div id="" class="w3-margin-top">
                                <h3 for="musibahDetails">Zakat Yuran Details:</h3><hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan <b>Zakat Yuran</b> ini adalah membantu pelajar yang kurang berkemampuan menampung kos pendidikan, termasuk yuran universiti, atau keperluan akademik lain, agar mereka dapat meneruskan pembelajaran tanpa halangan kewangan.</i></caption>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    
                                    <div class="w3-cell" style="">
                                        <b>Jumlah yuran (RM): <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="yuran" value="0" id="" size="50%" required>
                                    </div>
                                </div>
                                
                                <br>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan resit yuran</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="file6" accept=".pdf" >
                                    </div><br>
                                </div>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen surat tawaran</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="file7" accept=".pdf" >
                                    </div><br>
                                </div>
                                   
                            </div>
                            <div id="" class="w3-margin-top">
                                <h3 for="musibahDetails">Zakat Kolej Details:</h3>
                                <hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan <b>Zakat Kolej</b> ini adalah membantu pelajar yang kurang berkemampuan menampung kos pendidikan, termasuk yuran universiti, atau keperluan akademik lain, agar mereka dapat meneruskan pembelajaran tanpa halangan kewangan.</i></caption>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <b>Pilih kolej anda <span style="color: red;">*</span></b><br>
                                        <select class="w3-input" name='kolej' value="Tidak Memilih" selected>
                                            <option value='kerawang'>Kerawang</option>
                                            <option value='sutera'>Sutera</option>
                                        </select>
                                    </div>
                                    <div class="w3-cell" style="padding-left: 25px;">
                                        <b>Jumlah bayaran kolej (RM): <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="totalKolej" value="0" id="" size="50%" required>
                                    </div>
                                    
                                </div>
                                
                                <br>
                                <div class="w3-cell w3-panel w3-margin-top">
                                    <b>Sila masukkan borang elektrik</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="file8" accept=".pdf">
                                    </div><br>
                                </div>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen permohonan kolej yang berjaya</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="file9" accept=".pdf">
                                    </div><br>
                                </div>
                            </div>
                            <div id="" class="w3-margin-top">
                                <h3 for="musibahDetails">Zakat Makanan Details:</h3>
                                <hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan utamanya adalah untuk memastikan golongan pelajar dan mereka yang memerlukan tidak menghadapi kelaparan atau kekurangan makanan. Contohnya, bantuan zakat digunakan untuk menyediakan pek makanan kepada keluarga para pelajar atau memberi baucar makanan kepada mereka yang memerlukan.</i></caption>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <b>Pilih cafe berdekatan anda <span style="color: red;">*</span></b><br>
                                        <select class="w3-input" name='cafe' value="Cafe">
                                            <option value='TIDAK MEMOHON'>Sila Pilih</option>
                                            <option value='cafelestari'>Cafe Lestari</option>
                                            <option value='rrcafe'>RR Cafe (Kiosk)</option>
                                        </select>
                                    </div>
                                    
                                </div>
                            
                            </div>
                        </div>
                    </div>
                    <div class="w3-panel w3-center w3-col" style="margin-bottom: 3%">
                        <button class="w3-button w3-border w3-green w3-cell" name="MOHON" type="submit" onclick="">MOHON</button>
                        <button class="w3-button w3-border w3-border-green w3-cell w3-margin-left" href="#">KEMBALI</button>
                    </div>
                </form>
                
                
                <!--popup and copy all style-->
                <div id="overlay"></div>
                <!-- Popup -->
                <div class="w3-panel w3-card-4" id="popup" style="width: 30%;">
                    <img src="sources/alarm.gif" alt="" style="width: 30%;">
                    <h5><B>SILA SEMAK DENGAN TELITI!</B></h5>
                    <p>Pihak UiTM tidak akan bertanggungjawab<br> jikalau terdapat sebarang kesalahan teknikal<br>atau kecuaian pelajar</p>
                    <button class="w3-button" id="confirmSubmit">Hantar!</button>
                    <button class="w3-button w3-border" id="cancelSubmit">Kembali</button>
                </div>
                
            </div>
        </div>
        <div class="w3-container w3-col" style="width: 10%; height: 100px;">
            
        </div>
    </div>
</body>