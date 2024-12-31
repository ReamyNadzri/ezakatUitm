<head>
    <title>Zakat UiTM</title>
    <meta name="viewport">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>


<body>
    
    <style>
        .mySlides {display:none;}
        .container {
            display: flex;
            flex-wrap: wrap;
            }

        .card {
            flex: 1;
            
            
            background-size: cover;
            background-position: center;
            position: relative;
 
            justify-content: center;
            align-items: center;
            }

        .content {
            text-align: center;
            color: white;
            background-color: rgba(0, 0, 0, 0.5); /* Semi-transparent background for text */
            padding: 20px;
            border-radius: 8px;
            }


    </style>
    <div class="w3-animate-top" style="position: fixed; width: 100%; z-index: 999">
        <jsp:include page="header.jsp"></jsp:include>
        </div>
    
    <div class="w3-container w3-row">
        <div class="w3-container w3-col" style="width: 10%; height: 100px;">

        </div>

    
        <div class="w3-container w3-col" style="width: 80%; height: auto">
            <!--<div class="w3-section w3-display-container" style="height: 300px; margin-top: 1%;">
                
                <img class="mySlides w3-image" src="sources/1.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
                <img class="mySlides w3-image" src="sources/2.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
                <img class="mySlides w3-image" src="sources/3.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
                <img class="mySlides w3-image" src="sources/4.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
            </div>-->
            <br><BR><br><br>
            <div class="w3-container w3-col w3-center w3-border card content w3-animate-zoom" style="padding-left: 10%; padding-right: 10%; padding-top:20px; height:28%; background-image: url('sources/zakat.jpg');">

                <h1 class="w3-center ">Jom Bayar Zakat Dengan Mudah!!</h1><br>
                <p>Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy,
                Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy, </p>
                <a href="BayarZakat.jsp">
                    <button class="w3-button w3-border w3-light-grey">Lunaskan Tanggungjawab Anda</button>
                </a>

            </div>
            
            <div class="w3-container w3-col w3-center w3-border w3-animate" style="padding-left: 10%; padding-right: 10%; padding-top:20px; height:28%">

                <h1 class="w3-center">Masih Belum Memohon Zakat?</h1>
                <p>Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy,
                Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy, </p>
                <a href="mohonzakat.jsp">
                    <button class="w3-button w3-border w3-light-grey">Mohon Zakat</button>
                </a>

            </div>
            
            
            
            
            <div class="w3-container w3-col w3-border w3-animate" style="padding-left: 10%; padding-right: 10%; padding-top:20px; height:40%">

                <h1 class="w3-center">Kategori Zakat Yang Anda Perlu Tahu</h1><hr>
                <div class="w3-container w3-cell">
                    <h2 style="margin-top:3%">Zakat Kolej</h2>
                    <p>Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy,<br> Dummy texy, 
                        Dummy texy, Dummy texy, Dummy texy, 
                    </p>
                </div>
                <div class="w3-container w3-cell" style="width: 20%;">
                    <h4 style="padding-top: 30px;">Mohon Sekarang Di Bawah!</h4><br>
                    <button class="w3-button w3-border">Pautan Permohonan Zakat Kolej</button><br><br>
                    
                </div>

            </div>
            <div class="w3-container w3-col w3-border w3-animate" style="padding-left: 10%; padding-right: 10%; padding-top:20px; height:30%">

                <div class="w3-container w3-cell"  style="width: 20%;">
                    <h4 style="padding-top: 30px;">Mohon Sekarang Di Bawah!</h4><br>
                    <button class="w3-button w3-border">Pautan Permohonan Zakat Musibah</button><br><br>
                    <button class="w3-button w3-border w3-light-grey">Ketahui Lebih Lanjut</button>
                    
                </div>
                <div class="w3-container w3-cell" style="text-align: right;">
                    <h2>Zakat Musibah</h2>
                    <p>Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy,<br> Dummy texy, 
                        Dummy texy, Dummy texy, Dummy texy, 
                    </p>
                </div>

            </div>
            <div class="w3-container w3-col w3-border w3-animate" style="padding-left: 10%; padding-right: 10%; padding-top:20px; height:30%">

                <div class="w3-container w3-cell " >
                    <h2>Zakat Yuran</h2>
                    <p>Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy,<br> Dummy texy, 
                        Dummy texy, Dummy texy, Dummy texy, 
                    </p>
                </div>
                <div class="w3-container w3-cell" style="width: 20%;">
                    <h4 style="padding-top: 30px;">Mohon Sekarang Di Bawah!</h4><br>
                    <button class="w3-button w3-border">Pautan Permohonan Zakat Yuran</button><br><br>
                    <button class="w3-button w3-border w3-light-grey">Ketahui Lebih Lanjut</button>
                </div>

            </div>
            <div class="w3-container w3-col w3-border w3-animate" style="padding-left: 10%; padding-right: 10%; padding-top:20px; height:30%">

                <div class="w3-container w3-cell"  style="width: 20%;">
                    <h4 style="padding-top: 30px;">Mohon Sekarang Di Bawah!</h4><br>
                    <button class="w3-button w3-border">Pautan Permohonan Zakat Makanan</button><br><br>
                    <button class="w3-button w3-border w3-light-grey">Ketahui Lebih Lanjut</button>
                    
                </div>
                <div class="w3-container w3-cell" style="text-align: right;">
                    <h2>Zakat Makanan</h2>
                    <p>Dummy texy, Dummy texy, Dummy texy, Dummy texy, Dummy texy,<br> Dummy texy, 
                        Dummy texy, Dummy texy, Dummy texy, 
                    </p>
                </div>

            </div>

        </div>


        <div class="w3-container w3-col w3-right" style="width: 10%; height: 100px;">
                
        </div>
   </div>
    <jsp:include page="Footer.jsp"></jsp:include>
    


      <!--- image ads animation--->
<script>
    var myIndex = 0;
    carousel();
    
    function carousel() {
      var i;
      var x = document.getElementsByClassName("mySlides");
      for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";  
      }
      myIndex++;
      if (myIndex > x.length) {myIndex = 1}    
      x[myIndex-1].style.display = "block";  
      setTimeout(carousel, 5000); // Change image every 2 seconds
    }
    </script>
       
</body>