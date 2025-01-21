<%-- 
    Document   : Footer
    Created on : Dec 17, 2024, 2:35:50 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

    <!-- Footer Section -->
    <footer class="footer">
        <div class="footer-container">
            <!-- First Column -->
            <div class="footer-section">
                <%
                String user = (String) session.getAttribute("NAME");
                String donator = (String) session.getAttribute("USERNAME");
                    if(user == null && donator == null) { %>
                        <h3>Belum Log Masuk ?</h3>
                        <ul>
                            <li><a href="loginStudent.jsp">Pelajar</a></li>
                            <li><a href="#">Donator</a></li>
                            <li><a href="loginStaff.jsp">Staff</a></li>
                            <li><a href="admin/dashboard.jsp">Administrator</a></li>
                        </ul>
                <%}%>
            </div>

            <!-- Second Column -->
            <div class="footer-section">
                <h3>Hubungi Kami</h3>
                <p>
                    Universiti Teknologi MARA (UiTM)<br>
                    Cawangan Terengganu,<br>
                    Kampus Kuala Terengganu,<br>
                    21080 Kuala Terengganu,<br>
                    Terengganu Darul Iman,<br>
                    Malaysia.
                </p>
                <p>Tel: +6011 - 15587229</p>
                <p>Fax: +605 - 406 7712</p>
                <p>Emel: <a href="mailto:unithalakademik@uitm.edu.my">unithalakademik@uitm.edu.my</a></p>
            </div>
            
            <!-- Third Column -->
            <div class="footer-section">
                 <img src="sources/1ZakatLogoBR.png" class="footer-logo">
            </div>
        </div>

        <!-- Copyright Section -->
        <div class="footer-bottom">
            <p><b>Hak Cipta &copy AbeFiwan Expert Studios. Hak Cipta Terpelihara</b></p>
        </div>
    </footer>

<!--CSS-->
<style>
/* Footer Container */
.footer {
    background: linear-gradient(to top, #b875f3, #ffffff); /* Gradient background */
    color: #333;
    padding: 20px 0;
    font-family: google sans, sans-serif;
    font-size: 14px;
}

.footer-container {
    display: flex;
    justify-content: space-around; /* Align columns */
    flex-wrap: wrap;
    padding: 0 50px;
}

/* Footer Section Styling */
.footer-section {
    flex: 1;
    margin: 0 20px;
    min-width: 250px;
}

.footer-section h3 {
    font-weight: bold;
    color: #000;
    margin-bottom: 15px;
}

.footer-section ul {
    list-style-type: none;
    padding: 0;
}

.footer-section ul li {
    margin-bottom: 10px;
}

.footer-section ul li a {
    text-decoration: none;
    color: #333;
    transition: color 0.3s;
}

.footer-section ul li a:hover {
    color: #6f2df3; /* Highlight color on hover */
}

.footer-logo {
    margin-top: 20px;
    max-width: 300px; /* Adjust logo size */
    height: auto;
}

.footer-section p {
    margin: 5px 0;
}

.footer-section a {
    color: #333;
    text-decoration: none;
}

.footer-section a:hover {
    color: #6f2df3;
}

/* Footer Bottom Section */
.footer-bottom {
    text-align: center;
    margin-top: 20px;
    padding-top: 10px;
    border-top: 1px solid #ddd;
    color: #555;
}
</style>
