<!DOCTYPE html>
<html>
<title>eZAKAT UiTM Admin Page</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.0/css/all.css">
<link href="https://fonts.cdnfonts.com/css/product-sans" rel="stylesheet">
<body style="font-family: 'Product Sans', sans-serif; background:white;">
    <% 
        String staff = (String) session.getAttribute("STAFFID");
    %>
<style>
  h1, h2, h3, h4, h5{
    font-family: 'Product Sans', sans-serif;
    
  }
  </style>

  <!-- Banner -->

  <div class="w3-row">
    <div class="w3-col w3-container" style="width: 18%">
      <img class="w3-col w3-row-padding" style="width: 150px; margin-left: 120px; margin-top: 15px;" src='../sources/1ZakatLogoBR.png'>
    </div>
    <div class="w3-col" style="width:80%; padding-top: 20px">
        <h2 style=" font-size:35px; position:relative; bottom:10px">
            <% if(staff != null) {
                out.println("Staff");
            } else {
                out.println("Admin");
            }
            %>
            <b>Dashboard</b></h2>
    </div>
    <div class="w3-col w3-container" style="width:10%"></div>
  </div>

  <!-- Tajuk -->


<%
    if(staff!=null) {
%>
  <!-- Bar utk admin -->
<div style="background-color: #AF65C2">
  <div class="w3-bar w3-27374D" style="background-color: #AF65C2; font-weight: bold; margin:0 auto; width:80%;height:75px">
    <a href="dashboard.jsp" class="w3-bar-item w3-button" style="width:16.66%;height:auto">
    <div class="w3-left"><i class="fas fa-home w3-xlarge" style="padding: 10px 0px;position:relative;right:2px;top:10px;height:60px"></i></div><br>
    HALAMAN UTAMA</a>
    <div class="w3-dropdown-hover" style="width: 16.66%;">
      <button class="w3-button" style="width: 100%;">
      <div class="w3-left"><i class="fas fa-book w3-xlarge" style="padding: 10px 0px;;position:relative;right:-10px;top:10px;height:60px"></i></div><br>
      TENTANG</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4" >
        <a href='viewapplication.jsp' class="w3-bar-item w3-button">PERMOHONAN</a>
        <a href='viewdonation.jsp' class="w3-bar-item w3-button">SUMBANGAN</a>
        <!--<a href='viewstaff.jsp' class="w3-bar-item w3-button">KAKITANGAN</a>-->
        <a href='viewstudent.jsp' class="w3-bar-item w3-button">PELAJAR</a>
        <a href='viewdonator.jsp' class="w3-bar-item w3-button">PENNYUMBANG</a>
        <!--<a href='viewadmin.jsp' class="w3-bar-item w3-button">ADMIN</a>-->
      </div>
    </div>
   

<!--    <div class="w3-dropdown-hover" style="width: 16.66%;">
      <button class="w3-button" style="width: 100%;">
      <div class="w3-left"><i class="fas fa-cog w3-xlarge" style="padding: 10px 0px;;position:relative;right:-28px;top:10px;height:60px"></i></div><br>
      TETAPAN</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <input name='reSize1' type='button' class="w3-bar-item w3-button" value='&nbsp;Reset&nbsp;'
          onclick="resizeText(2)" />
        <input name='reSize' type='button' class="w3-bar-item w3-button" value='&nbsp;Zoom In&nbsp;'
          onclick="resizeText(1)" />
        <input name='reSize2' type='button' class="w3-bar-item w3-button" value='&nbsp;Zoom Out&nbsp;'
          onclick="resizeText(-1)" />
      </div>
    </div>-->
    <a href='logoutAdminStaff' class="w3-bar-item w3-button w3-right" style="width: 16.66%;">
    <div class="w3-left"><i class="fas fa-lock w3-xlarge" style="padding: 10px 0px;position:relative;right:-30px;top:10px;height:60px"></i></div><br>
    LOG KELUAR</a>
  </div>
</div>
  
  <%} else {%>
  
  <!-- Bar utk staff -->
  <div style="background-color: #AF65C2">
  <div class="w3-bar w3-27374D" style="background-color: #AF65C2; font-weight: bold; margin:0 auto; width:80%;height:75px">
    <a href="dashboard.jsp" class="w3-bar-item w3-button" style="width:16.66%;height:auto">
    <div class="w3-left"><i class="fas fa-home w3-xlarge" style="padding: 10px 0px;position:relative;right:2px;top:10px;height:60px"></i></div><br>
    HALAMAN UTAMA</a>
    <div class="w3-dropdown-hover" style="width: 16.66%;">
      <button class="w3-button" style="width: 100%;">
      <div class="w3-left"><i class="fas fa-book w3-xlarge" style="padding: 10px 0px;;position:relative;right:-10px;top:10px;height:60px"></i></div><br>
      TENTANG</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4" >
        <a href='viewdonation.jsp' class="w3-bar-item w3-button">SUMBANGAN</a>
        <a href='viewstaff.jsp' class="w3-bar-item w3-button">KAKITANGAN</a>
        <a href='viewstudent.jsp' class="w3-bar-item w3-button">PELAJAR</a>
        <a href='viewdonator.jsp' class="w3-bar-item w3-button">PENYUMBANG</a>
        <a href='viewadmin.jsp' class="w3-bar-item w3-button">ADMIN</a>
      </div>
    </div>
      
        <div class="w3-dropdown-hover" style="width: 16.66%;">  
           <a href="permohonanDash.jsp" style="width: 100%; text-decoration: none;">  
               <button class="w3-button" style="width: 100%;">  
                   <div class="w3-left">  
                       <i class="fas fa-file w3-xlarge" style="padding: 10px 0; position: relative; right: -10px; top: 10px; height: 60px;"></i>  
                   </div><br>  
                   PERMOHONAN  
               </button>  
           </a>  
       </div>  
      
      <div class="w3-dropdown-hover" style="width: 16.66%;">  
           <a href="viewapplication.jsp" style="width: 100%; text-decoration: none;">  
               <button class="w3-button" style="width: 100%;">  
                   <div class="w3-left">  
                       <i class="fas fa-file w3-xlarge" style="padding: 10px 0; position: relative; right: -10px; top: 10px; height: 60px;"></i>  
                   </div><br>  
                   PERMOHONAN TERKINI  
               </button>  
           </a>  
       </div>  
      

    <div class="w3-dropdown-hover" style="width: 16.66%;">
      <button class="w3-button" style="width: 100%;">
      <div class="w3-left"><i class="fas fa-cog w3-xlarge" style="padding: 10px 0px;;position:relative;right:-28px;top:10px;height:60px"></i></div><br>
      TETAPAN</button>
      <div class="w3-dropdown-content w3-bar-block w3-card-4">
        <button class="w3-bar-item w3-button" onclick="resetText()">Reset</button>
        <button class="w3-bar-item w3-button" onclick="resizeText(1)">Zoom In</button>
        <button class="w3-bar-item w3-button" onclick="resizeText(-1)">Zoom Out</button>
      </div>
    </div>
    <a href='logoutAdminStaff' class="w3-bar-item w3-button w3-right" style="width: 16.66%;">
    <div class="w3-left"><i class="fas fa-lock w3-xlarge" style="padding: 10px 0px;position:relative;right:-30px;top:10px;height:60px"></i></div><br>
    LOG KELUAR</a>
  </div>
</div>
<%}%>
<script type="text/javascript">
    function resizeText(factor) {
        // Get the root HTML element
        var rootElement = document.documentElement;

        // Get the current font size
        var currentFontSize = window.getComputedStyle(rootElement).fontSize;
        var newFontSize = parseFloat(currentFontSize) + factor;

        // Set the new font size
        rootElement.style.fontSize = newFontSize + 'px';
    }

    function resetText() {
        // Reset the font size to the default value
        document.documentElement.style.fontSize = '';
    }
</script>
