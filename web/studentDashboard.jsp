<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <div class="w3-border w3-border-blue" style="height:8%">
            <jsp:include page="header.jsp"></jsp:include>
    </div>
    <style>
        * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: google sans, sans-serif;
            }

        /* Header styling */
        .header {
            background: linear-gradient(to right, #6a1b9a, #8e24aa);
            color: white;
            padding: 10px 100px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header .welcome {
            font-size: 20px;
        }

        .header .nav-buttons button {
            background-color: #4a148c;
            color: white;
            border: none;
            padding: 8px 16px;
            margin-left: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .header .nav-buttons button:hover {
            background-color: #6a1b9a;
        }

        /* Main content styling */
        .content {
            text-align: center;
            margin: 20px 0;
        }

        .carousel {
            position: relative;
            margin: 0 auto;
            width: 80%;
            height: 300px;
            background: #ccc;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .carousel .arrow {
            font-size: 24px;
            color: white;
            background-color: rgba(0, 0, 0, 0.5);
            border: none;
            padding: 10px;
            border-radius: 50%;
            cursor: pointer;
        }

        .cards {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            width: 150px;
            text-align: center;
            padding: 20px;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card img {
            width: 100px;
            height: 100px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <div class="header">
        <div class="welcome">Hi, Student!</div>
        <div class="nav-buttons">
            <button>About Zakat</button>
            <button>Profile</button>
            <button>Logout</button>
        </div>
    </div>

    <div class="content">
        <div class="carousel">
            <button class="arrow">&#8249;</button>
            <div class="carousel-content">Content Here</div>
            <button class="arrow">&#8250;</button>
        </div>

        <div class="cards">
            <div class="card">
                <img src="sources/zakat.jpg" alt="Zakat Musibah">
                <div>Zakat Musibah</div>
            </div>
            <div class="card">
                <img src="sources/zakat.jpg" alt="Zakat Kolej">
                <div>Zakat Kolej</div>
            </div>
            <div class="card">
                <img src="sources/zakat.jpg" alt="Zakat Yuran">
                <div>Zakat Yuran</div>
            </div>
            <div class="card">
                <img src="sources/zakat.jpg" alt="Zakat Makan">
                <div>Zakat Makan</div>
            </div>
        </div>
    </div>


</body>
 <jsp:include page="Footer.jsp"></jsp:include>
</html>
