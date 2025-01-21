<%@ page import="com.zakat.model.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %> 
<jsp:include page="admin_header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        html, body {
            height: 100%;
        }
        .bg-custom {
            background: white;
        }
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            padding: 16px;
            transition: transform 0.2s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(3, minmax(300px, 1fr));
            gap: 16px;
            padding: 16px;
        }
    </style>

    <% 
        // Session validation and access control
        String staffNo = (String) session.getAttribute("STAFFNO");
        String adminNo = (String) session.getAttribute("ADMNOIC");
        Boolean adminAccess = (Boolean) session.getAttribute("ADMIN");
        
        if (staffNo == null && adminNo == null) {
    %>
        <script>
            alert('Log masuk terlebih dahulu!!!');
            window.location.href = 'index.jsp';
        </script>
    <%
            return;
        }
    %>
</head>

<body class="bg-gray-100">
    <div class="container mx-auto p-8">
        <div class="text-center mb-8">
            <p class="text-gray-600 underline">Segalanya Bermula Disini.</p>
            <p id="quote" class="text-gray-500 mt-1 italic"></p>
        </div>
        
        <script>
            // Array of quotes
            const quotes = [
                "Cara terbaik untuk mencari diri sendiri adalah dengan menghilangkan diri dalam melayani orang lain. - Mahatma Gandhi",
                "Berbakti kepada orang lain adalah sewa yang anda bayar untuk tempat tinggal anda di Bumi. - Muhammad Ali",
                "Tindakan kebaikan yang paling kecil lebih berharga daripada niat terbesar. - Oscar Wilde",
                "Menolong satu orang mungkin tidak mengubah seluruh dunia, tetapi ia boleh mengubah dunia bagi seorang orang. - unknown",
                "Tidak ada seorangpun yang menjadi miskin karena memberi. - Anne Frank",
                "Tujuan hidup bukan untuk bahagia. Tujuan hidup adalah untuk berguna, bermoral, berbelas kasihan, dan memberikan kesan bahawa anda telah hidup dengan baik. - Ralph Waldo Emerson",
                "Kita mencari nafkah dengan apa yang kita dapatkan, tetapi kita membuat hidup dengan apa yang kita berikan. - Winston Churchill",
                "Ketika memberi, tangan di atas lebih baik daripada tangan di bawah. - Tun Dr. Mahathir Mohamad"
            ];

            // Function to get a random quote
            function getRandomQuote() {
                const randomIndex = Math.floor(Math.random() * quotes.length);
                return quotes[randomIndex];
            }

            // Display the random quote
            document.getElementById('quote').innerText = getRandomQuote();
        </script>
        
        <!-- Donation Summary Section -->
        <div class="grid-container">
            <!-- Total Donation Chart -->
            <div class="card">
                <h2 class="text-2xl font-semibold flex items-center">
                    <span class="material-icons text-green-500 text-center">Jumlah Sumbangan Terkini</span>
                </h2>
                <canvas id="donationChart"></canvas>
                <script>
                    <%
                        double totalDonation = 0;
                        double donorDonation = 0;
                        double studentDonation = 0;
                        try {  
                            Connection connection = DBConnection.getConnection(); 

                            // Fetch total donations
                            String totalSql = "SELECT SUM(amount) AS total FROM DONATION";  
                            PreparedStatement totalStmt = connection.prepareStatement(totalSql);  
                            ResultSet totalRs = totalStmt.executeQuery();  
                            if (totalRs.next()) {  
                                totalDonation = totalRs.getDouble("total");  
                            }  
                            totalRs.close();  
                            totalStmt.close();

                            // Fetch donations from donors
                            String donorSql = "SELECT SUM(amount) AS total FROM DONATION WHERE donatorid IS NOT NULL";  
                            PreparedStatement donorStmt = connection.prepareStatement(donorSql);  
                            ResultSet donorRs = donorStmt.executeQuery();  
                            if (donorRs.next()) {  
                                donorDonation = donorRs.getDouble("total");  
                            }  
                            donorRs.close();  
                            donorStmt.close();

                            // Fetch donations from students
                            String studentSql = "SELECT SUM(amount) AS total FROM DONATION WHERE studentid IS NOT NULL";  
                            PreparedStatement studentStmt = connection.prepareStatement(studentSql);  
                            ResultSet studentRs = studentStmt.executeQuery();  
                            if (studentRs.next()) {  
                                studentDonation = studentRs.getDouble("total");  
                            }  
                            studentRs.close();  
                            studentStmt.close();

                            connection.close();
                        } catch (SQLException e) {  
                            e.printStackTrace();  
                            out.println("Error retrieving donation amounts: " + e.getMessage());  
                        }  
                    %>
                    const totalDonation = <%= totalDonation %>;
                    const donorDonation = <%= donorDonation %>;
                    const studentDonation = <%= studentDonation %>;

                    const ctx = document.getElementById('donationChart').getContext('2d');
                    const donationChart = new Chart(ctx, {
                        type: 'doughnut',
                        data: {
                            labels: ['Jumlah Sumbangan', 'Sumbangan Penyumbang', 'Sumbangan Pelajar'],
                            datasets: [{
                                label: 'Amount',
                                data: [totalDonation, donorDonation, studentDonation],
                                backgroundColor: ['#4caf50', '#2196f3', '#ff9800'],
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: 'top'
                                },
                                title: {
                                    display: true,
                                }
                            }
                        }
                    });
                </script>
            </div>

            <!-- Total Donators Table -->
            <div class="card">
                <div class="card" style="margin-top: 40px;">
                <h2 class="text-2xl font-semibold mb-4 flex items-center">
                    <span class="material-icons text-blue-500">Jumlah Pemberi Zakat Terkini</span>
                </h2>
                <table class="table-auto w-full text-left border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="px-4 py-2 border">Deskripsi</th>
                            <th class="px-4 py-2 border">Bilangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 py-2 border">Jumlah Penyumbang Zakat</td>
                            <td class="px-4 py-2 border font-bold text-blue-500">
                                <%
                                    int donorCount = 0;  
                                    try {  
                                        Connection connection = DBConnection.getConnection();  
                                        String sql = "SELECT COUNT(*) AS total FROM DONATOR";  
                                        PreparedStatement stmt = connection.prepareStatement(sql);  
                                        ResultSet rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            donorCount = rs.getInt("total");  
                                        }  
                                        rs.close();  
                                        stmt.close();  
                                        connection.close();  
                                    } catch (SQLException e) {  
                                        e.printStackTrace();  
                                        out.println("Error retrieving total donor : " + e.getMessage());  
                                    }  
                                    out.print(donorCount);  
                                %>  
                            </td>
                        </tr>
                    </tbody>
                </table>
                </div>
                            
            <!-- Total Applications Table -->
            <div class="card" style="margin-top: 40px;">
                <h2 class="text-2xl font-semibold mb-4 flex items-center">
                    <span class="material-icons text-yellow-500">Jumlah Permohonan Terkini</span>
                </h2>
                <table class="table-auto w-full text-left border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="px-4 py-2 border">Deskripsi</th>
                            <th class="px-4 py-2 border">Bilangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 py-2 border">Jumlah Permohonan</td>
                            <td class="px-4 py-2 border font-bold text-yellow-500">
                                <%
                                    int applicationCount = 0;  
                                    try {  
                                        Connection connection = DBConnection.getConnection();  
                                        String sql = "SELECT COUNT(*) AS total FROM APPLICATION";  
                                        PreparedStatement stmt = connection.prepareStatement(sql);  
                                        ResultSet rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            applicationCount = rs.getInt("total");  
                                        }  
                                        rs.close();  
                                        stmt.close();  
                                        connection.close();  
                                    } catch (SQLException e) {  
                                        e.printStackTrace();  
                                        out.println("Error retrieving total application in the system : " + e.getMessage());  
                                    }  
                                    out.print(applicationCount);  
                                %>  
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>

            <!-- Total Students Table -->
            <div class="card">
                <div class="card" style="margin-top: 40px;">
                <h2 class="text-2xl font-semibold mb-4 flex items-center">
                    <span class="material-icons text-green-500">Jumlah Pelajar Berdaftar</span>
                </h2>
                <table class="table-auto w-full text-left border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="px-4 py-2 border">Deskripsi</th>
                            <th class="px-4 py-2 border">Bilangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 py-2 border">Jumlah Pelajar</td>
                            <td class="px-4 py-2 border font-bold text-green-500">
                                <%
                                    int student = 0;  
                                    try {  
                                        Connection connection = DBConnection.getConnection();  
                                        String sql = "SELECT COUNT(*) AS total FROM STUDENT";  
                                        PreparedStatement stmt = connection.prepareStatement(sql);  
                                        ResultSet rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            student = rs.getInt("total");  
                                        }  
                                        rs.close();  
                                        stmt.close();  
                                        connection.close();  
                                    } catch (SQLException e) {  
                                        e.printStackTrace();  
                                        out.println("Error retrieving student count: " + e.getMessage());  
                                    }  
                                    out.print(student);  
                                %>  
                            </td>
                        </tr>
                    </tbody>
                </table>
                </div>

            <!-- Total Staff Table -->
            <div class="card" style="margin-top: 40px;">
                <h2 class="text-2xl font-semibold mb-4 flex items-center">
                    <span class="material-icons text-indigo-500">Jumlah Kakitangan Terkini</span>
                </h2>
                <table class="table-auto w-full text-left border-collapse border border-gray-300">
                    <thead>
                        <tr class="bg-gray-200">
                            <th class="px-4 py-2 border">Deskripsi</th>
                            <th class="px-4 py-2 border">Bilangan</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="px-4 py-2 border">Jumlah Kakitangan</td>
                            <td class="px-4 py-2 border font-bold text-indigo-500">
                                <%
                                    int staff = 0;  
                                    try {  
                                        Connection connection = DBConnection.getConnection();  
                                        String sql = "SELECT COUNT(*) AS total FROM STAFF";  
                                        PreparedStatement stmt = connection.prepareStatement(sql);  
                                        ResultSet rs = stmt.executeQuery();  
                                        if (rs.next()) {  
                                            staff = rs.getInt("total");  
                                        }  
                                        rs.close();  
                                        stmt.close();  
                                        connection.close();  
                                    } catch (SQLException e) {  
                                        e.printStackTrace();  
                                        out.println("Error retrieving staff count: " + e.getMessage());  
                                    }  
                                    out.print(staff);  
                                %>  
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            </div>
        </div>
    </div>
</body>
</html>