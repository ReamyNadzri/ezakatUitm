<%@page import="java.sql.SQLException" %>
    <%@page import="java.sql.ResultSet" %>
        <%@page import="java.sql.PreparedStatement" %>
            <%@page import="com.zakat.model.DBConnection" %>
                <%@page import="java.sql.Connection" %>
                    <%@page import="java.sql.Timestamp" %>
                        <%@page import="java.util.ArrayList" %>
                            <%@page import="java.util.HashMap" %>
                                <%@page import="java.util.Map" %>
                                    <% // Handle comment submission if (request.getMethod().equals("POST") &&
                                        request.getParameter("commentSubmit") !=null) { String
                                        commentName=request.getParameter("commentName"); String
                                        commentEmail=request.getParameter("commentEmail"); String
                                        commentText=request.getParameter("commentText"); if (commentName !=null &&
                                        !commentName.trim().isEmpty() && commentText !=null &&
                                        !commentText.trim().isEmpty()) { try { Connection
                                        conn=DBConnection.getConnection(); String
                                        insertSql="INSERT INTO COMMENT (NAME, EMAIL, COMMENTTEXT) VALUES (?, ?, ?)" ;
                                        PreparedStatement pstmt=conn.prepareStatement(insertSql); pstmt.setString(1,
                                        commentName.trim()); pstmt.setString(2, commentEmail !=null &&
                                        !commentEmail.trim().isEmpty() ? commentEmail.trim() : null); pstmt.setString(3,
                                        commentText.trim()); pstmt.executeUpdate(); pstmt.close(); conn.close(); //
                                        Redirect to avoid form resubmission response.sendRedirect("index.jsp#comments");
                                        return; } catch (SQLException e) { e.printStackTrace(); } } } %>

                                        <head>
                                            <title>Zakat UiTM</title>
                                            <meta name="viewport">
                                            <link rel="stylesheet" href="style.css">
                                            <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
                                            <link rel="stylesheet"
                                                href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
                                            <link
                                                href="https://fonts.googleapis.com/css2?family=Product+Sans&display=swap"
                                                rel="stylesheet">
                                            <script
                                                src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                                            <script
                                                src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.js"></script>
                                            <script
                                                src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
                                        </head>
                                        <% double donateday=0; double donatemonth=0; double donateyear=0; boolean
                                            studentApplication=false; String studID=(String)
                                            session.getAttribute("STUDENTID"); try { Connection
                                            connection=DBConnection.getConnection(); //untuk retrieve data dari database
                                            dan display dalam form jumlah pemberi zakat String
                                            sql="SELECT SUM(AMOUNT) AS DAY FROM DONATION WHERE TRUNC(DONATIONDATE) = TRUNC(SYSDATE)"
                                            ; PreparedStatement stmt=connection.prepareStatement(sql); ResultSet
                                            rs=stmt.executeQuery(); if (rs.next()) { donateday=rs.getDouble("DAY"); }
                                            sql="SELECT SUM(AMOUNT) AS MONTH FROM DONATION WHERE "
                                            + "TO_CHAR(DONATIONDATE, 'MM-YYYY') = TO_CHAR(SYSDATE, 'MM-YYYY')" ;
                                            stmt=connection.prepareStatement(sql); rs=stmt.executeQuery(); if
                                            (rs.next()) { donatemonth=rs.getDouble("MONTH"); }
                                            sql="SELECT SUM(AMOUNT) AS YEAR FROM DONATION" ;
                                            stmt=connection.prepareStatement(sql); rs=stmt.executeQuery(); if
                                            (rs.next()) { donateyear=rs.getDouble("YEAR"); } String studentApp=(String)
                                            session.getAttribute("STUDENTID"); if(studentApp !=null){ String
                                            notiSql="SELECT *" +"FROM (SELECT A.STATUS FROM APPLICATION A JOIN STUDENT S
                                            ON A.STUDENTID=S.STUDENTID WHERE A.STUDENTID=? AND A.STATUS='BERJAYA' ORDER
                                            BY A.APPLYID DESC)" +"WHERE ROWNUM=1"; PreparedStatement
                                            pstmt=connection.prepareStatement(notiSql);
                                            pstmt.setInt(1,Integer.parseInt(studentApp)); rs=pstmt.executeQuery();
                                            if(rs.next()){ studentApplication=true; } }else{ rs.close(); stmt.close();
                                            connection.close(); } } catch (SQLException e) { e.printStackTrace();
                                            out.println("Error retrieving donor count: " + e.getMessage());  
                                    }  
                                    
                                    // Retrieve comments
                                    ArrayList<Map<String, Object>> comments = new ArrayList<>();
                                    try {
                                        Connection connection = DBConnection.getConnection();
                                        String commentSql = " SELECT COMMENTID, NAME, EMAIL, COMMENTTEXT, COMMENTDATE
                                            FROM COMMENT ORDER BY COMMENTDATE DESC"; PreparedStatement
                                            stmt=connection.prepareStatement(commentSql); ResultSet
                                            rs=stmt.executeQuery(); while (rs.next()) { Map<String, Object> comment =
                                            new HashMap<>();
                                                comment.put("id", rs.getInt("COMMENTID"));
                                                comment.put("name", rs.getString("NAME"));
                                                comment.put("email", rs.getString("EMAIL"));
                                                comment.put("text", rs.getString("COMMENTTEXT"));
                                                comment.put("date", rs.getTimestamp("COMMENTDATE"));
                                                comments.add(comment);
                                                }

                                                rs.close();
                                                stmt.close();
                                                connection.close();
                                                } catch (SQLException e) {
                                                e.printStackTrace();
                                                }

                                                %>

                                                <body>

                                                    <style>
                                                        .mySlides {
                                                            display: none;
                                                        }


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

                                                        /* Position the toast in the top-right corner */
                                                        .toast-container {
                                                            position: fixed;
                                                            top: 20px;
                                                            right: 20px;
                                                            z-index: 1050;
                                                        }

                                                        /* Comment Section Styles */
                                                        .comment-section {
                                                            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                                                            padding: 60px 20px;
                                                            margin-top: 40px;
                                                        }

                                                        .comment-container {
                                                            max-width: 900px;
                                                            margin: 0 auto;
                                                        }

                                                        .comment-form {
                                                            background: white;
                                                            padding: 30px;
                                                            border-radius: 15px;
                                                            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                                                            margin-bottom: 40px;
                                                        }

                                                        .comment-form h2 {
                                                            color: #764ba2;
                                                            margin-bottom: 20px;
                                                            font-weight: bold;
                                                        }

                                                        .comment-input {
                                                            width: 100%;
                                                            padding: 12px 15px;
                                                            margin-bottom: 15px;
                                                            border: 2px solid #e0e0e0;
                                                            border-radius: 8px;
                                                            font-size: 14px;
                                                            transition: all 0.3s ease;
                                                        }

                                                        .comment-input:focus {
                                                            outline: none;
                                                            border-color: #764ba2;
                                                            box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
                                                        }

                                                        .comment-textarea {
                                                            min-height: 120px;
                                                            resize: vertical;
                                                            font-family: inherit;
                                                        }

                                                        .comment-submit-btn {
                                                            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                                                            color: white;
                                                            padding: 12px 40px;
                                                            border: none;
                                                            border-radius: 25px;
                                                            font-size: 16px;
                                                            font-weight: bold;
                                                            cursor: pointer;
                                                            transition: all 0.3s ease;
                                                            box-shadow: 0 4px 15px rgba(118, 75, 162, 0.3);
                                                        }

                                                        .comment-submit-btn:hover {
                                                            transform: translateY(-2px);
                                                            box-shadow: 0 6px 20px rgba(118, 75, 162, 0.4);
                                                        }

                                                        .comments-display {
                                                            background: white;
                                                            padding: 30px;
                                                            border-radius: 15px;
                                                            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
                                                        }

                                                        .comments-display h3 {
                                                            color: #764ba2;
                                                            margin-bottom: 25px;
                                                            font-weight: bold;
                                                        }

                                                        .comment-card {
                                                            background: #f8f9fa;
                                                            padding: 20px;
                                                            border-radius: 10px;
                                                            margin-bottom: 15px;
                                                            border-left: 4px solid #764ba2;
                                                            transition: all 0.3s ease;
                                                        }

                                                        .comment-card:hover {
                                                            transform: translateX(5px);
                                                            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
                                                        }

                                                        .comment-header {
                                                            display: flex;
                                                            justify-content: space-between;
                                                            align-items: center;
                                                            margin-bottom: 10px;
                                                        }

                                                        .comment-author {
                                                            font-weight: bold;
                                                            color: #764ba2;
                                                            font-size: 16px;
                                                        }

                                                        .comment-date {
                                                            color: #6c757d;
                                                            font-size: 12px;
                                                        }

                                                        .comment-text {
                                                            color: #333;
                                                            line-height: 1.6;
                                                            margin: 0;
                                                        }

                                                        .no-comments {
                                                            text-align: center;
                                                            color: #6c757d;
                                                            padding: 40px;
                                                            font-style: italic;
                                                        }
                                                    </style>
                                                    <div class="w3-animate-top"
                                                        style="position: fixed; width: 100%; z-index: 999">
                                                        <jsp:include page="header.jsp"></jsp:include>
                                                    </div>

                                                    <!-- Toast Notification -->

                                                    <div class="toast-container" id="toastContainer"
                                                        style="display: none;">
                                                        <br><br><!-- comment -->
                                                        <a href="studentDashboard.jsp">
                                                            <div id="myToast" class="toast" role="alert"
                                                                aria-live="assertive" aria-atomic="true"
                                                                data-bs-delay="5000">
                                                                <div class="toast-header">
                                                                    <strong class="me-auto">Notifikasi</strong>
                                                                    <small> - Just now</small>
                                                                    <button type="button" class="btn-close"
                                                                        data-bs-dismiss="toast"
                                                                        aria-label="Close"></button>
                                                                </div>
                                                                <div class="toast-body">
                                                                    Tahniah Permohonan Baharu Anda Telah Berjaya!!<br>
                                                                    Tekan disini untuk lihat!
                                                                </div>
                                                            </div>
                                                        </a>
                                                    </div>

                                                    <!-- Audio for sound effect -->
                                                    <audio id="notificationSound">
                                                        <source src="sources/noti.mp3" type="audio/mpeg">
                                                        Your browser does not support the audio element.
                                                    </audio>

                                                    <!-- Bootstrap JS and dependencies -->
                                                    <script
                                                        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
                                                    <script
                                                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>


                                                    <div class="w3-row">
                                                        <div class="w3-container w3-col"
                                                            style="width: 10%; height: 120px;">

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
                                                                    <h1
                                                                        style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
                                                                        Jom Bayar Zakat Dengan Mudah!</h1>
                                                                    <p
                                                                        style="text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);">
                                                                        Dengan platform pembayaran zakat online, anda
                                                                        boleh
                                                                        menunaikan kewajipan agama tanpa perlu keluar
                                                                        rumah.
                                                                        Proses yang selamat, pantas, dan telus
                                                                        memastikan
                                                                        zakat anda disalurkan kepada asnaf yang berhak.
                                                                        Jom
                                                                        tunaikan tanggungjawab kita dengan mudah dan
                                                                        tepat
                                                                        pada masanya!
                                                                        Bayar zakat sekarang, ringankan beban mereka
                                                                        yang
                                                                        memerlukan.</p>
                                                                    <a href="BayarZakat.jsp">
                                                                        <button
                                                                            class="w3-button w3-border w3-light-grey">Lunaskan
                                                                            Tanggungjawab Anda</button>
                                                                    </a>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="" style="background-color: #f8f0ff;">

                                                            <div class="container w3-center"
                                                                style="background-color: #f8f0ff;">
                                                                <div class="row p-4">
                                                                    <div
                                                                        class="col-md-4 d-flex flex-column align-items-center">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <p><b>Kutipan Zakat Hari Ini (RM)</b>
                                                                                </p>
                                                                                <h3 class="num">
                                                                                    <% out.print(donateday);%>
                                                                                </h3>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div
                                                                        class="col-md-4 d-flex flex-column align-items-center">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <p><b>Kutipan Zakat Bulan Ini (RM)</b>
                                                                                </p>
                                                                                <h3 class="num">
                                                                                    <% out.print(donatemonth);%>
                                                                                </h3>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div
                                                                        class="col-md-4 d-flex flex-column align-items-center">
                                                                        <div class="row">
                                                                            <div class="col-12">
                                                                                <p><b>Kutipan Zakat Tahun Ini (RM)</b>
                                                                                </p>
                                                                                <h3 class="num">
                                                                                    <% out.print(donateyear);%>
                                                                                </h3>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="background-container1 w3-center w3-border"
                                                            style="height:32%; padding-top:3%">
                                                            <div class="content">
                                                                <h1>Masih Belum Memohon Zakat?</h1>
                                                                <p>Jangan lepaskan peluang untuk mendapatkan bantuan
                                                                    yang
                                                                    berhak anda terima! Jika anda tergolong dalam asnaf
                                                                    yang
                                                                    layak,<br>segeralah memohon zakat untuk meringankan
                                                                    beban hidup.
                                                                    Zakat adalah hak anda yang disediakan untuk membantu
                                                                    dalam pelbagai keperluan seperti pendidikan<br>
                                                                    Ayuh, mohon zakat sekarang dan manfaatkan bantuan
                                                                    yang
                                                                    disediakan!</p>
                                                                <% String donor=(String)
                                                                    session.getAttribute("USERNAME"); if(donor!=null) {
                                                                    %>
                                                                    <a href="mohonzakat.jsp">
                                                                        <button
                                                                            class="w3-button w3-border w3-light-grey"
                                                                            disabled>Permohonan Zakat Hanya Untuk
                                                                            Pelajar</button>
                                                                    </a>
                                                                    <%}else{%>
                                                                        <a href="mohonzakat.jsp">
                                                                            <button
                                                                                class="w3-button w3-border w3-light-grey">Mohon
                                                                                Zakat</button>
                                                                        </a>
                                                                        <%}%>
                                                            </div>
                                                        </div>

                                                        <button id="showToast" class="btn btn-primary m-3"
                                                            style="display:none">Show Notification</button>
                                                        <div class="container mt-5 p-3"
                                                            style="width: 80%; background-color: #f0f0f0;">
                                                            <div class="row">
                                                                <div
                                                                    class="col-md-4 d-flex flex-column align-items-center mb-4">
                                                                    <img src="sources/iklan1.png" class="img-fluid"
                                                                        alt="Image 1">
                                                                    <h3 class="mt-3"
                                                                        style="color: purple; font-weight: bold;">BAYAR
                                                                    </h3>
                                                                    <p>Jom bayar zakat dan bantu golongan asnaf</p>
                                                                    <a class="btn btn-primary"
                                                                        href="BayarZakat.jsp">BAYAR
                                                                        SEKARANG</a>
                                                                </div>

                                                                <div
                                                                    class="col-md-4 d-flex flex-column align-items-center mb-4">
                                                                    <img src="sources/iklan2.jpg" class="img-fluid"
                                                                        alt="Image 2">
                                                                    <h3 class="mt-3"
                                                                        style="color: purple; font-weight: bold;">SEMAK
                                                                    </h3>
                                                                    <p>Semak profil anda dgn cepat</p>
                                                                    <% if(donor!=null) { %>
                                                                        <a class="btn btn-primary"
                                                                            href="donatorUpdProfile.jsp">SEMAK MAKLUMAT
                                                                            PERIBADI</a>
                                                                        <%}else{%>
                                                                            <a class="btn btn-primary"
                                                                                href="updateProfile.jsp">SEMAK MAKLUMAT
                                                                                PERIBADI</a>
                                                                            <%}%>
                                                                </div>
                                                                <div
                                                                    class="col-md-4 d-flex flex-column align-items-center mb-4">
                                                                    <img src="sources/iklan3.jpg" class="img-fluid"
                                                                        alt="Image 3">
                                                                    <h3 class="mt-3"
                                                                        style="color: purple; font-weight: bold;">TERIMA
                                                                    </h3>
                                                                    <p>Mohon zakat jika anda adalah golongan asnaf</p>
                                                                    <% if(donor!=null) { %>
                                                                        <a class="btn btn-primary disabled"
                                                                            href="#">Permohonan Zakat Hanya Untuk
                                                                            Pelajar</a>
                                                                        <%}else{%>
                                                                            <a class="btn btn-primary"
                                                                                href="mohonzakat.jsp">MOHON SEKARANG</a>
                                                                            <%}%>
                                                                </div>
                                                            </div>
                                                        </div><br>
                                                    </div>

                                                    <!-- Comment Section -->
                                                    <div class="comment-section" id="comments">
                                                        <div class="comment-container">
                                                            <!-- Comment Form -->
                                                            <div class="comment-form">
                                                                <h2>📝 Tinggalkan Komen Anda</h2>
                                                                <form method="POST" action="index.jsp#comments">
                                                                    <input type="text" name="commentName"
                                                                        class="comment-input" placeholder="Nama Anda *"
                                                                        required maxlength="255">
                                                                    <input type="email" name="commentEmail"
                                                                        class="comment-input"
                                                                        placeholder="Email (Pilihan)" maxlength="255">
                                                                    <textarea name="commentText"
                                                                        class="comment-input comment-textarea"
                                                                        placeholder="Tulis komen anda di sini... *"
                                                                        required maxlength="1000"></textarea>
                                                                    <button type="submit" name="commentSubmit"
                                                                        class="comment-submit-btn">Hantar Komen</button>
                                                                </form>
                                                            </div>

                                                            <!-- Comments Display -->
                                                            <div class="comments-display">
                                                                <h3>💬 Komen Terkini (<%= comments.size() %>)</h3>

                                                                <% if (comments.isEmpty()) { %>
                                                                    <div class="no-comments">
                                                                        Tiada komen lagi. Jadilah yang pertama untuk
                                                                        berkongsi pendapat anda!
                                                                    </div>
                                                                    <% } else { %>
                                                                        <% for (Map<String, Object> comment : comments)
                                                                            { %>
                                                                            <div class="comment-card">
                                                                                <div class="comment-header">
                                                                                    <span class="comment-author">
                                                                                        <%= comment.get("name") %>
                                                                                    </span>
                                                                                    <span class="comment-date">
                                                                                        <%= new
                                                                                            java.text.SimpleDateFormat("dd/MM/yyyy
                                                                                            HH:mm").format((Timestamp)comment.get("date"))
                                                                                            %>
                                                                                    </span>
                                                                                </div>
                                                                                <p class="comment-text">
                                                                                    <%= comment.get("text") %>
                                                                                </p>
                                                                            </div>
                                                                            <% } %>
                                                                                <% } %>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <jsp:include page="Footer.jsp"></jsp:include>

                                                    <script type="text/javascript">
                                                        $(".num").counterUp({
                                                            delay: 15,
                                                            time: 3000
                                                        });
                                                        function showNotification() {
                                                            // Show the toast container
                                                            document.getElementById('toastContainer').style.display = 'block';

                                                            // Initialize and show the toast
                                                            var toastEl = document.getElementById('myToast');
                                                            var toast = new bootstrap.Toast(toastEl);

                                                            var audio = document.getElementById('notificationSound');
                                                            audio.play();
                                                            toast.show();
                                                        }

                                                        // Add click event listener to the button
                                                        document.getElementById('showToast').addEventListener('click', function () {
                                                            showNotification();
                                                        });

        <% if (studentApplication == true) {  %>
                                                            showNotification();
                                                            document.getElementById('checkntg').style.display = 'block';
        <% }%>
                                                    </script>


                                                </body>