<%-- 
    Document   : Receipt
    Created on : Dec 17, 2024, 1:24:53 PM
    Author     : user
--%>
<jsp:include page="header.jsp"></jsp:include>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Invoice - Zakat Management System</title>
        <script>
            // Print Page Function
            function printPage() {
                window.print();
            }
        </script>
    </head>
    <body>
        <!-- Invoice Container -->
        <div class="invoice-container">
            <!-- Header Section -->
            <div class="header">
                <img src="1ZakatLogoBR.png" class="logo">
                <h1>INVOICE</h1>
            </div>

            <!-- Content Section -->
            <div class="content">
                <div>
                    <p1>Date: <strong>15/12/2024</strong></p1><br>
                    <p1>Invoice from:</p1>
                </div>
                <div>
                    <p>Pay to:</p>
                    <p>Universiti Teknologi MARA (UiTM)</p>
                    <p>Cawangan Terengganu</p>
                    <p>Kampus Kuala Terengganu</p>
                    <p>21080 Kuala Terengganu</p>
                    <p>Terengganu Darul Iman, Malaysia</p>
                    <p>Email: unithalewalpelajar@uitm.edu.my</p>
                </div>
            </div>

            <!-- Table Section -->
            <table>
                <tr>
                    <th>Bank</th>
                    <th>Description</th>
                    <th>Amaun</th>
                </tr>
                <tr>
                    <td>Maybank</td>
                    <td>Lain-Lain...</td>
                    <td>RM XXXX.XX</td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: right; font-weight: bold;">Jumlah Pembayaran</td>
                    <td>RM XXXX.XX</td>
                </tr>
            </table>

            <!-- Note -->
            <div class="note">
                NOTE: This is a computer-generated receipt and does not require a physical signature.
            </div>

            <!-- Buttons -->
            <div class="buttons">
                <a href="previousPage.jsp" class="button back">Back</a>
                <button class="button" onclick="printPage()">Cetak</button>
            </div>
        </div>
    </body>
</html>

<!-- CSS -->
<style>
    /* Page Styles */
            body {
                font-family: google sans, sans-serif;
                background-color: #cc33ff;
                margin: 0;
                padding: 20px;
            }

            .invoice-container {
                width: 80%;
                margin: 0 auto;
                background-color: #ffffff;
                color: #262626;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0px 0px 30px rgba(0, 0, 0, 0.5);
            } 
             
            /* Header Section */
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #262626;
                padding-bottom: 10px;
                margin-bottom: 20px;
            }
            
            .logo {
                max-width: 200px;
                height: auto;
                margin-bottom: 10px;
            }
            
            .header h1 {
                font-size: 28px;
                color: #262626;
            }

            /* Content Section */
            .content {
                display: flex;
                justify-content: space-between;
                margin-bottom: 30px;
            }
            
            .content p1 {
                margin: 5px 0;
                text-align: left;
            }
            
            .content p {
                margin: 5px 0;
                text-align: right;
            }

            /* Table Styles */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            table, th, td {
                border: 1px solid #ccc;
            }

            th, td {
                padding: 12px;
                text-align: center;
                color: #000;
                background-color: #f5f5f5;
            }

            th {
                background-color: #ddd;
                font-weight: bold;
            }

            /* Note */
            .note {
                text-align: center;
                font-size: 14px;
                margin: 30px 30px;
                color: #262626;
            }

            /* Buttons */
            .buttons {
                display: flex;
                justify-content: center;
                gap: 20px;
            }

            .button {
                padding: 10px 20px;
                font-size: 16px;
                color: #fff;
                background-color: #6f2df3;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s;
                text-decoration: none;
            }

            .button:hover {
                background-color: #8c42ff;
            }

            .button.back {
                background-color: #595959;
            }

            .button.back:hover {
                background-color: #777;
            }
</style>