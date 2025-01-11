<!DOCTYPE html>
<jsp:include page="admin_header.jsp"></jsp:include>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
        }

        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            width: 250px;
            height: 100%;
            background-color:  #6a1b9a;
            padding-top: 20px;
            overflow: hidden;
        }

        .sidebar h2 {
            color: #ecf0f1;
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 15px;
            text-align: center;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #ecf0f1;
            font-size: 18px;
            display: block;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .sidebar ul li a:hover {
            background-color: #34495e;
            color: #1abc9c;
        }

        .content {
            margin-left: 250px;
            padding: 20px;
            transition: margin-left 0.3s ease-in-out;
        }

        .header {
            background-color: #2980b9;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 24px;
        }

        .cards {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .card {
            flex: 1;
            min-width: 200px;
            max-width: 300px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .card h3 {
            margin-top: 0;
            color: #2980b9;
        }

        .card p {
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Staff Menu</h2>
        <ul>
            <li><a href="#">Dashboard</a></li>
            <li><a href="#">Manage Staff</a></li>
            <li><a href="#">Attendance</a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Settings</a></li>
            <li><a href="#">Logout</a></li>
        </ul>
    </div>

    <div class="content">
        <div class="header">Staff Dashboard</div>
        <div class="cards">
            <div class="card">
                <h3>Staff Overview</h3>
                <p>Track all staff activities and key metrics.</p>
            </div>
            <div class="card">
                <h3>Attendance</h3>
                <p>Monitor attendance records and trends.</p>
            </div>
            <div class="card">
                <h3>Reports</h3>
                <p>Generate and analyze reports easily.</p>
            </div>
        </div>
    </div>
</body>
</html>
