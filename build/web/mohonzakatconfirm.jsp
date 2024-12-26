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
    </style>
</head>


<body>

    
    <div class="w3-border w3-border-blue" style="width: 100%; height: 7%">
        <iframe src="header.html" frameborder="0" style="width: 100%;"></iframe>
    </div>

    <div class="w3-container w3-row">
        <div class="w3-container w3-col" style="width: 10%; height: 100px;">

            

        </div>

        <!--applyID, studentID, zakatID, siblings, applyDate(current), totalIncome, studentLetter, transcriptDoc, icDoc, gradDate, entryDate, bankName, bankNum-->

        <div class="w3-container w3-col" style="width: 80%;">
        
            <div class="w3-container w3-round-large w3-margin w3-card w3-col" style="padding-left:50px ; padding-top:25px">
                
                <div class="w3-panel">
                    <h2>Pemohonan zakat bagi sesi OKT2024/FEB2025</h2>
                    <HR>

                    <div class="w3-cell">
                        Nama
                        <br>No. Matrik &emsp;&emsp;  <!--studentID-->
                        <br>No. KP
                        <br>Kampus
                    </div>
                    <div class="w3-cell">  <!--select * from student where studentID = (name)-->
                        :&emsp; - insert here
                        <br>:&emsp; - insert here
                        <br>:&emsp; - insert here
                        <br>:&emsp; - insert here
                    </div>
                </div>
                <hr>
                <form action="" method="post" enctype="multipart/form-data">
                    <div class="w3-col w3-margin-bottom">
                        <div class="w3-cell w3-panel">
                            <b>Sesi Tawaran</b><br>
                            <input class="w3-input w3-border w3-round-large" type="text" name="applyID" id="" size="50%" value="OKT2024/FEB2025" disabled>
                        </div> <!--applyID-->
                        <div class="w3-cell w3-panel">
                            <b>Semester Semasa <span style="color: red;">*</span></b><br>
                            <input class="w3-input w3-border w3-round-large" type="text" name="currentSemester" id="" size="50%" required>
                        </div>
                    </div>
                    <div class="w3-col w3-margin-bottom">
                        <div class="w3-cell w3-panel">
                            <b>Keputusan Terkini CGPA <span style="color: red;">*</span></b><br>
                            <input class="w3-input w3-border w3-round-large" type="text" name="currentCgpa" id="" size="50%" required>
                        </div>
                        <div class="w3-cell w3-panel">
                            <b>Keputusan Terkini GPA <span style="color: red;">*</span></b><br>
                            <input class="w3-input w3-border w3-round-large" type="text" name="currentGpa" id="" size="50%" required>
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
                                <input class="w3-input w3-border w3-round-large" type="text" name="namaBantuan" id="" size="50%" required>
                            </div>
                            <div class="w3-cell w3-panel">
                                <b>Jumlah per/sem: (RM) </b><br>
                                <input class="w3-input w3-border w3-round-large" type="text" name="jumlahBantuan" id="" size="50%" required>
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
                                    <input class="pad w3-input" type="file" name="dokumentStudentLetter" accept=".pdf" required>
                                </div><br>
                            </div>
                            <div class="w3-cell" style="width:25px"></div>
                            <div class="w3-cell">
                                <b>Sila masukkan dokumen transcript</b><span style="color: red;">*</span>
                                <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                    <input class="pad w3-input" type="file" name="dokumentTranscript" accept=".pdf" required>
                                </div><br>
                            </div>
                        
                        </div>
                        <div class="w3-panel">
                            <div class="w3-cell">
                                <b>Sila masukkan dokumen KP. depan & belakang</b><span style="color: red;">*</span>
                                <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                    <input class="pad w3-input" type="file" name="dokumenKP" accept=".pdf" required>
                                </div><br>
                            </div>
                            <div class="w3-col" style="">
                                <div class="w3-cell">
                                    <b>Pilih tahun graduasi <span style="color: red;">*</span></b><br>
                                    <select class="w3-input" name='gradYear'>  <!--tukar dgn gradDate-->
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
                                        <select class="w3-input" name='bankName' required>  <!--tukar dgn gradDate-->
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
                                    <input class="w3-input w3-border w3-round-large" style="width: 300px;" type="text" name="bankNo" id="" size="50%" required>
                                </div>
                            </div>
                        </div>


              
                        
                    </div>



                    <div class="w3-col w3-margin-bottom"><hr>
                        <div class="w3-panel">
                            <h3>Tujuan memohon bantuan zakat UiTM</h3>
                        </div>
                        <div class="w3-panel">
                            <div id="musibah" class="w3-border w3-round-large w3-hover-green box" onclick="selectBox('musibah')">Zakat Musibah
                                
                            </div>
                            <div id="yuran" class="w3-border w3-round-large w3-hover-green box" onclick="selectBox('yuran')">Zakat Yuran

                            </div>
                            <div id="kolej" class="w3-border w3-round-large w3-hover-green box" onclick="selectBox('kolej')">Zakat Kolej

                            </div>
                            <div id="makan" class="w3-border w3-round-large w3-hover-green box" onclick="selectBox('makan')">Zakat Makan

                            </div>

                            <!-- Additional Inputs -->
                            <div id="musibahInputs" class="w3-margin-top hidden">

                                <h3 for="musibahDetails">Zakat Musibah Details:</h3><hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i><b>Zakat musibah</b> merujuk kepada bantuan kewangan atau sumbangan bagi meringankan beban pelajar bencana seperti banjir, kebakaran, atau gempa bumi. Contohnya, bantuan diberikan kepada mangsa banjir yang kehilangan rumah, keluarga miskin akibat gempa bumi, atau menyediakan makanan dan pakaian kepada mangsa kebakaran.</caption></i>
                                </div>

                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <b>Sila nyatakan sebab permohonan anda dibawah: <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="reason" id="" size="50%" required>
                                    </div>
                                    <div class="w3-cell" style="padding-left: 25px;">
                                        <b>Jumlah kerosakkan (RM): <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="totalLost" id="" size="50%" required>
                                    </div>
                                    <div class="w3-margin-top">
                                        <b>Tarikh berlaku musibah: <span style="color: red;">*</span></b>
                                        <input class="w3-input w3-date" type="date" id="tarikhmusibah" name="tarikhmusibah" required>
                                    </div>
                                </div>
                                
                                <br>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen kerugian dibawah</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="dokumenkerugian" accept=".pdf" required>
                                    </div><br>
                                </div>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen sebab dibawah</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="dokumensebab" accept=".pdf" required>
                                    </div><br>
                                </div>
                            
                            
                            </div>
                            <div id="yuranInputs" class="w3-margin-top hidden">

                                <h3 for="musibahDetails">Zakat Yuran Details:</h3><hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan <b>Zakat Yuran</b> ini adalah membantu pelajar yang kurang berkemampuan menampung kos pendidikan, termasuk yuran universiti, atau keperluan akademik lain, agar mereka dapat meneruskan pembelajaran tanpa halangan kewangan.</i></caption>
                                </div>

                                <div class="w3-col w3-margin-bottom">
                                    
                                    <div class="w3-cell" style="">
                                        <b>Jumlah yuran (RM): <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="yuran" id="" size="50%" required>
                                    </div>

                                </div>
                                
                                <br>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan resit yuran</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="resityuran" accept=".pdf" required>
                                    </div><br>
                                </div>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen surat tawaran</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="surattawaran" accept=".pdf" required>
                                    </div><br>
                                </div>
                                   
                            </div>
                            <div id="kolejInputs" class="w3-margin-top hidden">

                                <h3 for="musibahDetails">Zakat Kolej Details:</h3>
                                <hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan <b>Zakat Kolej</b> ini adalah membantu pelajar yang kurang berkemampuan menampung kos pendidikan, termasuk yuran universiti, atau keperluan akademik lain, agar mereka dapat meneruskan pembelajaran tanpa halangan kewangan.</i></caption>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <b>Pilih kolej anda <span style="color: red;">*</span></b><br>
                                        <select class="w3-input" name='kolej'>
                                            <option value='kerawang'>Kerawang</option>
                                            <option value='sutera'>Sutera</option>
                                        </select>
                                    </div>
                                    <div class="w3-cell" style="padding-left: 25px;">
                                        <b>Jumlah bayaran kolej (RM): <span style="color: red;">*</span></b><br>
                                        <input class="w3-input w3-border w3-round-large" type="text" name="totalKolej" id="" size="50%" required>
                                    </div>
                                    
                                </div>
                                
                                <br>
                                <div class="w3-cell w3-panel w3-margin-top">
                                    <b>Sila masukkan borang elektrik</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="borangElektrik" accept=".pdf" required>
                                    </div><br>
                                </div>
                                <div class="w3-cell w3-panel">
                                    <b>Sila masukkan dokumen permohonan kolej yang berjaya</b><span style="color: red;">*</span>
                                    <div class="w3-hover-shadow w3-card w3-round-large w3-padding">
                                        <input class="pad w3-input" type="file" name="permohonanKolej" accept=".pdf" required>
                                    </div><br>
                                </div>

                            </div>
                            <div id="makanInputs" class="w3-margin-top hidden">

                                <h3 for="musibahDetails">Zakat Makanan Details:</h3>
                                <hr>
                                <div class="w3-panel w3-border w3-padding w3-card w3-small">
                                    <caption><i>Tujuan utamanya adalah untuk memastikan golongan pelajar dan mereka yang memerlukan tidak menghadapi kelaparan atau kekurangan makanan. Contohnya, bantuan zakat digunakan untuk menyediakan pek makanan kepada keluarga para pelajar atau memberi baucar makanan kepada mereka yang memerlukan.</i></caption>
                                </div>
                                <div class="w3-col w3-margin-bottom">
                                    <div class="w3-cell">
                                        <b>Pilih cafe berdekatan anda <span style="color: red;">*</span></b><br>
                                        <select class="w3-input" name='cafe'>
                                            <option value='cafelestari'>Cafe Lestari</option>
                                            <option value='rrcafe'>RR Cafe (Kiosk)</option>
                                        </select>
                                    </div>
                                    
                                </div>
                            
                            </div>
                        </div>
                    </div>

                    <div class="w3-panel w3-center">
                        <input class="w3-input w3-border w3-green" name="HANTAR PERMOHONAN" type="submit" onclick="">
                        <button class="w3-button w3-border w3-border-green" href="#">KEMBALI</button>
                    </div>
                </form>
            </div>
            



        </div>
        <div class="w3-container w3-col" style="width: 10%; height: 100px;">

            

        </div>

        <script>
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