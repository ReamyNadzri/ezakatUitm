<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.zakat.model.DBConnection"%>
<%@page import="java.sql.Connection"%>
<head>
    <title>Zakat UiTM</title>
    <meta name="viewport">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Product+Sans&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
</head>
<%  
                                    double donateday = 0;
                                    double donatemonth = 0;
                                    double donateyear = 0;
              
                                    try {  
                                        Connection connection = DBConnection.getConnection();  //untuk retrieve data dari database dan display dalam form jumlah pemberi zakat
                                        String sql = "SELECT SUM(AMOUNT) AS DAY FROM DONATION WHERE TRUNC(DONATIONDATE) = TRUNC(SYSDATE)";  
                                        PreparedStatement stmt = connection.prepareStatement(sql);  
                                        ResultSet rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            donateday = rs.getDouble("DAY");  
                                        }  
                                         sql = "SELECT SUM(AMOUNT) AS MONTH FROM DONATION WHERE TO_CHAR(DONATIONDATE, 'MM-YYYY') = TO_CHAR(SYSDATE, 'MM-YYYY')";  
                                         stmt = connection.prepareStatement(sql);  
                                         rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            donatemonth = rs.getDouble("MONTH");  
                                        } 
                                        sql = "SELECT SUM(AMOUNT) AS YEAR FROM DONATION";  
                                         stmt = connection.prepareStatement(sql);  
                                         rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            donateyear = rs.getDouble("YEAR");  
                                        }
                                        
                                        rs.close();  
                                        stmt.close();  
                                        connection.close();  
                                    } catch (SQLException e) {  
                                        e.printStackTrace();  
                                        out.println("Error retrieving donor count: " + e.getMessage());  
                                    }  

                                %> 

<body>
    
    <style>
        .mySlides {display:none;}
    
 
        .background-container {
            position: relative;
            height: 35vh;
            background: url('sources/zakat.jpg') no-repeat center;
            background-size: cover;
            background-color: rgba(0, 0, 0, 0.5);
            opacity: 0.8;
        }
        .background-container1 {
            position: relative;
            height: 25vh;

        }
        .background-container .content {
            position: absolute;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -10%);
            text-align: center;
            color: white;
        }


    </style>
    <div class="w3-animate-top" style="position: fixed; width: 100%; z-index: 999">
        <jsp:include page="header.jsp"></jsp:include>
        </div>
    
    <div class="w3-row">
        <div class="w3-container w3-col" style="width: 10%; height: 120px;">

        </div>

        <br><br><br><br>
        <div class="w3-border w3-animate-top" style="height: auto">
            <!--<div class="w3-section w3-display-container" style="height: 300px; margin-top: 1%;">
                
                <img class="mySlides w3-image" src="sources/1.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
                <img class="mySlides w3-image" src="sources/2.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
                <img class="mySlides w3-image" src="sources/3.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
                <img class="mySlides w3-image" src="sources/4.jpg" style="width:100%;opacity:80%;height: 300px; object-fit: cover;">
            </div>-->
            
            <div class="background-container">
                <div class="content">
                    <h1 style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">Jom Bayar Zakat Dengan Mudah!</h1>
                    <p style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
                    Dengan platform pembayaran zakat online, anda boleh menunaikan kewajipan agama tanpa perlu keluar rumah.
                    Proses yang selamat, pantas, dan telus memastikan zakat anda disalurkan kepada asnaf yang berhak. Jom tunaikan tanggungjawab kita dengan mudah dan tepat pada masanya!
                    Bayar zakat sekarang, ringankan beban mereka yang memerlukan.</p>
                    <a href="BayarZakat.jsp">
                        <button class="w3-button w3-border w3-light-grey">Lunaskan Tanggungjawab Anda</button>
                    </a>
                </div>
            </div>
            
        </div>
        <div class="" style="background-color: #f8f0ff;">
            <div class="container w3-center" style="background-color: #f8f0ff;">
                <div class="row p-4">
                    <div class="col-md-4 d-flex flex-column align-items-center">
                        <div class="row">
                            <div class="col-12">
                                <p><b>Kutipan Zakat Hari Ini</b></p>
                                <h3 class="num"><% out.print(donateday);%></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex flex-column align-items-center">
                        <div class="row">
                            <div class="col-12">
                                <p><b>Kutipan Zakat Bulan Ini</b></p>
                                <h3 class="num"><% out.print(donatemonth);%></h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 d-flex flex-column align-items-center">
                        <div class="row">
                            <div class="col-12">
                                <p><b>Kutipan Zakat Tahun Ini</b></p>
                                <h3 class="num"><% out.print(donateyear);%></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="background-container1 w3-center w3-border" style="height:32%; padding-top:3%">
            <div class="content">
                <h1>Masih Belum Memohon Zakat?</h1>
                <p>Jangan lepaskan peluang untuk mendapatkan bantuan yang berhak anda terima! Jika anda tergolong dalam asnaf yang layak,<br>segeralah memohon zakat untuk meringankan beban hidup.
                    Zakat adalah hak anda yang disediakan untuk membantu dalam pelbagai keperluan seperti pendidikan<br>
                Ayuh, mohon zakat sekarang dan manfaatkan bantuan yang disediakan!</p>
                <%
                String staff = (String) session.getAttribute("USERNAME");
                if(staff!=null) {
                %>
                <a href="mohonzakat.jsp">
                    <button class="w3-button w3-border w3-light-grey" disabled>Permohonan Zakat Hanya Untuk Pelajar</button>
                </a>
                <%}else{%>
                <a href="mohonzakat.jsp">
                    <button class="w3-button w3-border w3-light-grey">Mohon Zakat</button>
                </a>
                <%}%>
            </div>
        </div>
    

        <div class="container mt-5 p-3" style="width: 80%; background-color: #f0f0f0;">
            <div class="row">
                <div class="col-md-4 d-flex flex-column align-items-center mb-4">
                    <img src="sources/iklan1.png" class="img-fluid" alt="Image 1">
                    <h3 class="mt-3" style="color: purple; font-weight: bold;">BAYAR</h3>
                    <p>Jom bayar zakat dan bantu golongan asnaf</p>
                    <button class="btn btn-primary">BAYAR SEKARANG</button>
                </div>
                
                <div class="col-md-4 d-flex flex-column align-items-center mb-4">
                    <img src="sources/iklan2.jpg" class="img-fluid" alt="Image 2">
                    <h3 class="mt-3" style="color: purple; font-weight: bold;">SEMAK</h3>
                    <p>Semak profil anda dgn cepat</p>
                    <button class="btn btn-primary">SEMAK MAKLUMAT PERIBADI</button>
                </div>
                <div class="col-md-4 d-flex flex-column align-items-center mb-4">
                    <img src="sources/iklan3.jpg" class="img-fluid" alt="Image 3">
                    <h3 class="mt-3" style="color: purple; font-weight: bold;">TERIMA</h3>
                    <p>Mohon zakat jika anda adalah golongan asnaf</p>
                    <button class="btn btn-primary">MOHON SEKARANG</button>
                </div>
            </div>
        </div><br>
   </div>
    <jsp:include page="Footer.jsp"></jsp:include>
    
    <script type="text/javascript">
      $(".num").counterUp({
        delay: 15,
        time: 3000
      });
    </script>

       
</body>