<%@page import="java.sql.ResultSet"%>
<%@page import="com.zakat.model.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<html>
<head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <!-- Bootstrap JS (optional, for responsive functionality) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
     <jsp:include page="header.jsp"></jsp:include>
    <style>
        .progress-step {
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #cb9cd8;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
            position: relative;
            z-index: 1;
        }
        
        .progress-label {
            position: absolute;
            top: 45px;
            font-size: 14px;
            color: #6c757d;
            width: 100px;
            text-align: center;
            
        }
        
        .progress-step.active {
            background-color: #AF65C2;
        }
        
        .progress-step.completed {
            background-color: #AF65C2;
        }
        
        .progress-line {
            width: 100px;
            height: 3px;
            background-color: #dee2e6;
            margin: 0 -10px;
        }
        
        .progress-line.active {
            background-color: #AF65C2;
        }
        
        .card {
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            border: none;
        }

        .form-section {
            display: none;
        }

        .form-section.active {
            display: block;
        }

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
            background-color: #6c757d;
            color: white !important;
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
        }    </style>
</head>
<%
    String matricNumber = (String) session.getAttribute("MATRICNO");
    String studentid = (String) session.getAttribute("studentid");
    String name = (String) session.getAttribute("NAME");
    String campus = (String) session.getAttribute("CAMPUS");
    String email = (String) session.getAttribute("EMAIL");
    if (matricNumber == null) {
        // Redirect to login page if no session exists
        %>
        <script>alert('Log masuk terlebih dahulu sebelum membuat permohonan!');
        window.location.href = 'userLogin.jsp';
        </script>
        <%
        return;
    }
    String sql = "SELECT * FROM FAMILY WHERE STUDENTID = ?";
    PreparedStatement pstmt = DBConnection.getConnection().prepareStatement(sql);
    pstmt.setString(1,studentid);
    ResultSet rs = pstmt.executeQuery();
    if(!rs.next()){
    // Redirect to login page if no session exists
        %>
        <script>alert('Sila Lengkapkan Maklumat Keluarga sebelum membuat permohonan!');
        window.location.href = 'studentDashboard.jsp';
        </script>
        <%
        return;
    }
    
    %>
<body class="bg-light" style="margin-top:4%">

    <div class="container py-5 w3-animate-zoom" style="height:85%">
        <form action="addzakat.do" method="POST" id="zakatForm" enctype="multipart/form-data">
        <div class="card p-4">
            <h2 class="text-center mb-4">Permohonan Zakat Bagi Sesi OKT2024/FEB2025</h2>
            
            <!-- Progress Steps -->
            <div class="d-flex justify-content-center align-items-center mb-5">
                <div class="position-relative">
                    <div class="progress-step active" data-step="1">1
                        <div class="progress-label">Maklumat Diri</div>
                    </div>
                </div>
                <div class="progress-line" data-line="1"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="2">2
                        <div class="progress-label">Maklumat Bantuan</div>
                    </div>
                </div>
                <div class="progress-line" data-line="2"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="3">3
                        <div class="progress-label">Muatnaik Dokumen</div>
                    </div>
                </div>
             
                <div class="progress-line" data-line="3"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="4">4
                        <div class="progress-label">Jenis Zakat</div>
                    </div>
                </div>
                <div class="progress-line" data-line="4"></div>
                <div class="position-relative">
                    <div class="progress-step" data-step="4">5
                        <div class="progress-label">Pengesahan</div>
                    </div>
                </div>
            </div>
            <hr>

            <!-- Form Sections -->
            <div class="px-4">
                <!-- Step 1: User Name -->
                <div class="form-section active" data-step="1">
                    <h5 class="mb-2">Maklumat Diri</h5>
                    <p class="text-muted mb-4">Sila Semak Maklumat Diri Anda</p>
                    
                    <div class="mb-4 w3-col">
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
                        <hr>
                    <div class="mb-3 w3-col">
                        <div class="w3-cell">
                            <label for="" class="form-label">Sesi Tawaran</label>
                            <select class="form-control" name='applyID' value="OKT2024-FEB2025" required>  <!--tukar dgn gradDate-->
                                        <option value='OKT2024-FEB2025'>OKT2024-FEB2025</option>
                            </select>
                        </div>
                        <div class="w3-cell" style="width:15px"></div>
                        <div class="w3-cell">
                            <label for="" class="form-label">Semester Semasa<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" name="currentSemester" id="" value="" size="50%" required>
                        </div>
                    </div>
                    <div class="mb-3 w3-col">
                        <div class="bm-3 w3-cell">
                            <label for="" class="form-label">Keputusan Terkini CGPA<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" name="currentCgpa" id="" value="" size="50%" required>
                        </div>
                        <div class="w3-cell" style="width:15px"></div>
                        <div class="w3-cell">
                            <label for="" class="form-label">Keputusan Terkini GPA<span class="text-danger">*</span></label>
                            <input class="form-control" type="text" name="currentGpa" id="" value="" size="50%" required>
                        </div>
                    </div>
                        <div class="w3-cell">
                        <label for="" class="form-label fw-medium">Pilih tahun graduasi<span class="text-danger">*</span></label>
                        <select class="form-control" name='gradYear' value="2025">  <!--tukar dgn gradDate-->
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
                        <label for="" class="form-label fw-medium">Nama Bank <span class="text-danger">*</span></label>
                            <select class="form-control" name='bankName'>  <!--tukar dgn gradDate-->
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
                        <label for="" class="form-label fw-medium">Nombor Bank<span class="text-danger">*</span></label>
                        <input class="form-control" style="width: 300px;" type="text" name="bankNo" id="" size="50%">
                    </div>
                </div>

            

                <!-- Step 2: Location -->
                <div class="form-section" data-step="2">
                    <h5 class="mb-2">Maklumat Bantuan Lain</h5>
                    <p class="text-muted mb-4"></p>
                    <div class="w3-col">

                            <div class="mb-3">
                                Adakah anda mendapat bantuan insentif Makanan UiTM (RM 120)<span style="color: red;">*</span>
                                <input class="w3-radio" style="margin-left: 20px;" type="radio" name="insentifmakanan" value="Ya" id=""> Ya
                                <input class="w3-radio" style="margin-left: 20px;" type="radio" name="insentifmakanan" value="Tidak" id=""> Tidak
                            </div>
                            <div class="mb-3">
                                Adakah anda mendapat bantuan kewangan (PTPTN, JPA, MARA dll)<span style="color: red;">*</span>
                                <input class="w3-radio" style="margin-left: 10px;" onclick="toggleInputs()" type="radio" name="bantuan" value="Ya" id="yesBantuan"> Ya
                                <input class="w3-radio" style="margin-left: 20px;" onclick="toggleInputs()" type="radio" name="bantuan" value="Tidak" id="noBantuan"> Tidak
                            </div>

                            <!--hidden menu-->
                            <div id="bantuankewangan" class="mb-3 w3-col">
                                <div class="w3-cell w3-panel">
                                    <b>Jika ada, nyatakan dari mana: </b><br>
                                    <input class="form-control" type="text" name="namaBantuan" value="" id="" size="50%" >
                                </div>
                                <div class="w3-cell w3-panel">
                                    <b>Jumlah per/sem: (RM) </b><br>
                                    <input class="form-control" type="text" name="jumlahBantuan" value="" id="" size="50%" >
                                </div>

                            </div> 

                        </div>

                    <!-- Optional Hint Text --><br>
                    <div class="mt-4 text-muted small">
                        <i class="bi bi-info-circle me-2"></i>
                        All fields marked with <span class="text-danger">*</span> are required
                    </div>
                </div>

                
                <!-- page 3 -->
                <div class="form-section" data-step="3">
                    <div class="border-bottom mb-4">
                        <h5 class="mb-2">Muat Naik Dokumen Penting</h5>
                        <p class="text-muted mb-4">Berikut adalah dokumen yang harus dimuat naik</p>
                    </div>

                    <div class="row g-4">
                      <!-- Event Date -->
                        <div class="col-12">
                            <label for="" class="form-label fw-medium">Sila masukkan dokumen <i>student letter</i><span class="text-danger">*</span></label>
                            <div class="w3-cell">
                                <div class="w3-round-large w3-padding">
                                    <input class="form-control" type="file" name="file1" accept=".pdf" required>
                                </div><br>
                            </div>
                            <label for="" class="form-label fw-medium">Sila masukkan dokumen transcript<span class="text-danger">*</span></label>
                            <div class="w3-cell">
                                <div class="w3-round-large w3-padding">
                                    <input class="form-control" type="file" name="file2" accept=".pdf" required>
                                </div><br>
                            </div>
                            <label for="" class="form-label fw-medium">Sila masukkan dokumen KP. depan & belakang<span class="text-danger">*</span></label>
                            <div class="w3-cell">
                                <div class="w3-round-large w3-padding">
                                    <input class="form-control" type="file" name="file3" accept=".pdf" required>
                                </div><br>
                            </div>
                        </div>
                    </div>
                </div>



                <!-- Step 4: Task -->
                <div class="form-section" data-step="4">
                    <!-- Header -->
                    <div class="mb-2">
                        <h5 class="mb-2">Jenis Zakat</h5>
                        
                    </div>
                    <div class="w3-col w3-margin-bottom">
                        <div class="">
                            <div id="musibah" class="w3-border w3-round-large box" onclick="selectBox('musibah')">Zakat Musibah
                                
                            </div>
                            <div id="yuran" class="w3-border w3-round-large box" onclick="selectBox('yuran')">Zakat Yuran

                            </div>
                            <div id="kolej" class="w3-border w3-round-large box" onclick="selectBox('kolej')">Zakat Kolej

                            </div>
                            <div id="makan" class="w3-border w3-round-large box" onclick="selectBox('makan')">Zakat Makan

                            </div>

                            <!-- Additional Inputs -->
                            <div id="musibahInputs" class="w3-margin-top hidden">

                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i><b>Zakat musibah</b> merujuk kepada bantuan kewangan atau sumbangan bagi meringankan beban pelajar bencana seperti banjir, kebakaran, atau gempa bumi. Contohnya, bantuan diberikan kepada mangsa banjir yang kehilangan rumah, keluarga miskin akibat gempa bumi, atau menyediakan makanan dan pakaian kepada mangsa kebakaran.</caption></i>
                                </div>

                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <label for="" class="form-label fw-medium">Sila nyatakan sebab permohonan anda dibawah<span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="reason" value="TIDAK MEMOHON" id="" size="50%">
                                    </div>
                                    <div class="w3-cell" style="padding-left: 25px;">
                                        <label for="" class="form-label fw-medium">Jumlah kerosakkan (RM)<span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="totalLost" value="0.0" id="" size="50%">
                                    </div>
                                    <div class="w3-margin-top">
                                        <label for="" class="form-label fw-medium">Tarikh berlaku musibah<span class="text-danger">*</span></label>
                                        <input class="form-control" type="date" id="tarikhmusibah" name="tarikhmusibah">
                                    </div>
                                </div>
                                
                                <br>
                                <div class="w3-cell">
                                    <label for="" class="form-label fw-medium">Sila masukkan dokumen kerugian dibawah<span class="text-danger">*</span></label>
                                    <div class=" w3-round-large w3-padding">
                                        <input class="form-control" type="file" name="file4" accept=".pdf">
                                    </div><br>
                                </div>
                                <div class="w3-cell">
                                    <label for="" class="form-label fw-medium">Sila masukkan dokumen sebab dibawah<span class="text-danger">*</span></label>
                                    <div class=" w3-round-large w3-padding">
                                        <input class="form-control" type="file" name="file5" accept=".pdf">
                                    </div><br>
                                </div>
                            
                            
                            </div>
                            <div id="yuranInputs" class="w3-margin-top hidden">

                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan <b>Zakat Yuran</b> ini adalah membantu pelajar yang kurang berkemampuan menampung kos pendidikan, termasuk yuran universiti, atau keperluan akademik lain, agar mereka dapat meneruskan pembelajaran tanpa halangan kewangan.</i></caption>
                                </div>

                                <div class="w3-col w3-margin-bottom">
                                    
                                    <div class="w3-cell" style="">
                                        <label for="" class="form-label fw-medium">Jumlah yuran (RM)<span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="yuran" value="0" id="" size="50%">
                                    </div>

                                </div>
                                
                                <br>
                                <div class="w3-cell">
                                    <label for="" class="form-label fw-medium">Sila masukkan resit yuran<span class="text-danger">*</span></label>
                                    <div class="w3-round-large w3-padding">
                                        <input class="form-control" type="file" name="file6" accept=".pdf" >
                                    </div><br>
                                </div>
                                <div class="w3-cell">
                                    <label for="" class="form-label fw-medium">Sila masukkan dokumen surat tawaran<span class="text-danger">*</span></label>
                                    <div class="w3-round-large w3-padding">
                                        <input class="form-control" type="file" name="file7" accept=".pdf" >
                                    </div><br>
                                </div>
                                   
                            </div>
                            <div id="kolejInputs" class="w3-margin-top hidden">
                                
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan <b>Zakat Kolej</b> ini adalah membantu pelajar yang kurang berkemampuan menampung kos pendidikan, termasuk yuran universiti, atau keperluan akademik lain, agar mereka dapat meneruskan pembelajaran tanpa halangan kewangan.</i></caption>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <label for="" class="form-label fw-medium">Pilih kolej anda<span class="text-danger">*</span></label>
                                        <select class="form-control" name='kolej' value="Tidak Memilih" selected>
                                            <option value='kerawang'>Kerawang</option>
                                            <option value='sutera'>Sutera</option>
                                        </select>
                                    </div>
                                    <div class="w3-cell" style="padding-left: 25px;">
                                        <label for="" class="form-label fw-medium">Jumlah bayaran kolej (RM)<span class="text-danger">*</span></label>
                                        <input class="form-control" type="text" name="totalKolej" value="0" id="" size="50%" required>
                                    </div>
                                    
                                </div>
                                
                                <br>
                                <div class="w3-cell">
                                    <label for="" class="form-label fw-medium">Sila masukkan borang elektrik<span class="text-danger">*</span></label>
                                    <div class=" w3-round-large w3-padding">
                                        <input class="form-control" type="file" name="file8" accept=".pdf">
                                    </div><br>
                                </div>
                                <div class="w3-cell">
                                    <label for="" class="form-label fw-medium">Sila masukkan dokumen permohonan kolej yang berjaya<span class="text-danger">*</span></label>
                                    <div class=" w3-round-large w3-padding">
                                        <input class="form-control" type="file" name="file9" accept=".pdf">
                                    </div><br>
                                </div>

                            </div>
                            <div id="makanInputs" class="w3-margin-top hidden">
                                
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan utamanya adalah untuk memastikan golongan pelajar dan mereka yang memerlukan tidak menghadapi kelaparan atau kekurangan makanan. Contohnya, bantuan zakat digunakan untuk menyediakan pek makanan kepada keluarga para pelajar atau memberi baucar makanan kepada mereka yang memerlukan.</i></caption>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <label for="" class="form-label fw-medium">Pilih cafe berdekatan anda<span class="text-danger">*</span></label>
                                        <select class="form-control" name='cafe' value="Cafe">
                                            <option value='TIDAK MEMOHON'>Sila Pilih</option>
                                            <option value='cafelestari'>Cafe Lestari</option>
                                            <option value='rrcafe'>RR Cafe (Kiosk)</option>
                                        </select>
                                    </div>
                                    
                                </div>
                            
                            </div>
                        </div>
                    </div>
                    
                    
                </div>

                <div class="form-section" data-step="5">
                        <img src="sources/alarm.gif" alt="" style="width: 10%;">
                        <h5 class="mb-3 bold">SILA SEMAK DENGAN TELITI!</h5>
                        <p class="text-muted">Pihak UiTM tidak akan bertanggungjawab jikalau terdapat sebarang kesalahan teknikal atau kecuaian pelajar</p></p>
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" id="termsCheck">
                            <label class="form-check-label" for="termsCheck">
                            Saya mengesahkan bahawa semua butiran yang diberikan adalah tepat, dan saya memahami bahawa saya akan dikenakan denda sekiranya terdapat sebarang kesilapan dalam butiran tersebut.
                            </label>
                        </div>
                    </div>
                </div>

                <!-- Navigation Buttons -->
                <div class="d-flex justify-content-between mt-4">
                    <button type="button" class="btn btn-outline-secondary" id="prevBtn" onclick="prevStep()">Previous</button>
                    <button type="button" class="btn btn-success" id="nextBtn" onclick="nextStep()">Next</button>
                </div>
            </div>
        </div>
        </form>
    </div>
   
        <div class="" style="margin-top: 3%">
            <jsp:include page="Footer.jsp"></jsp:include>
        </div>

    
    <script>
        let currentStep = 1;
        const totalSteps = 5;

        function updateButtons() {
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            
            prevBtn.style.display = currentStep === 1 ? 'none' : 'block';
            
          if (currentStep === totalSteps) {
                nextBtn.textContent = 'Submit';
          
            } else {
                nextBtn.textContent = 'Next';
                nextBtn.setAttribute('type', 'button'); 
            }
                    }

        function updateSteps() {
            // Update progress steps
            document.querySelectorAll('.progress-step').forEach((step, index) => {
                const stepNum = index + 1;
                if (stepNum < currentStep) {
                    step.classList.add('completed');
                    step.classList.remove('active');
                } else if (stepNum === currentStep) {
                    step.classList.add('active');
                    step.classList.remove('completed');
                } else {
                    step.classList.remove('completed', 'active');
                }
            });

            // Update progress lines
            document.querySelectorAll('.progress-line').forEach((line, index) => {
                if (index + 1 < currentStep) {
                    line.classList.add('active');
                } else {
                    line.classList.remove('active');
                }
            });

            // Show/hide form sections
            document.querySelectorAll('.form-section').forEach((section) => {
                if (parseInt(section.dataset.step) === currentStep) {
                    section.classList.add('active');
                } else {
                    section.classList.remove('active');
                }
            });

            updateButtons();
        }

       function nextStep() {
            if (currentStep < totalSteps) {
                currentStep++;
                updateSteps();
            } 
            else{
                const nextBtn = document.getElementById('nextBtn');
                    nextBtn.setAttribute('type', 'submit');
            }
        }


        function prevStep() {
            if (currentStep > 1) {
                currentStep--;
                updateSteps();
            }
        }
      

            function toggleInputs() {
                const yesCheckbox = document.getElementById('yesBantuan');
                const noCheckbox = document.getElementById('noBantuan');
                const additionalInputs = document.getElementById('bantuankewangan');
    
                if (yesCheckbox.checked) {
                    additionalInputs.style.display = 'block'; // Show inputs
                    noCheckbox.checked = false; // Uncheck "No"
                } else {
                    additionalInputs.style.display = 'none'; // Hide inputs
                }
            }
            
            let currentCategory = null; // Track the currently selected category
            function selectBox(selectedId) {
                // Get all boxes
                const boxes = document.querySelectorAll('.box');
                

                // Remove the 'selected' class from all boxes
                boxes.forEach(box => box.classList.remove('selected'));

                // Add the 'selected' class to the clicked box
                const selectedBox = document.getElementById(selectedId);
                selectedBox.classList.add('selected');
            
            

            
                // Deselect the previously selected category, if any
                if (currentCategory) {
                    document.getElementById(currentCategory).classList.remove('selected');
                    document.getElementById(currentCategory + 'Inputs').classList.add('hidden');
                }

                // Select the new category
                currentCategory = selectedId;
                document.getElementById(selectedId).classList.add('selected');
                document.getElementById(selectedId + 'Inputs').classList.remove('hidden');
            }
            
    </script>
</body>
</html>