<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Donor Management</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <jsp:include page="header.jsp"></jsp:include>
</head>  
<body class="w3-light-grey w3-content w3-margin-top w3-margin-bottom w3-round-large w3-white w3-card-4" style="max-width: 800px;">  
        <div class="w3-container w3-center w3-padding w3-margin-top">   
                <p class="w3-large"><strong>DONATOR HISTORI</strong></p>
        </div>
<table class="w3-table-all w3-margin-top">
    <thead>  
        <tr class="w3-purple">  
            <th>Bil.</th>  
            <th>Donor ID</th>  
            <th>Bank Name</th>  
            <th>Amount</th>  
            <th>Donation Date</th>  
            <th>Note</th>  
            <th>Status</th>  
            <th>Actions</th>  
        </tr>  
    </thead>  
    <tbody>  
        <!-- Sample Data - Replace with dynamic data from your backend -->  
        <tr>  
            <td>1</td>  
            <td>001</td>  
            <td>Bank A</td>  
            <td>100.00</td>  
            <td>2025-01-01</td>  
            <td>First Donation</td>  
            <td>Completed</td>  
            <td>  
                <form action="deleteDonor" method="post" onsubmit="return confirm('Are you sure you want to delete this donation?');" style="display:inline;">
                    <input type="hidden" name="donateId" value="001" />  
                    <button type="submit" class="w3-button w3-red w3-round w3-margin-bottom">Delete</button>  
                </form>  
                <form action="printReceipt.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="donateId" value="001" />
                    <button type="submit" class="w3-button w3-blue w3-round w3-margin-bottom">Print Receipt</button>
                </form>
            </td>  
        </tr>  
        <tr>  
            <td>2</td>  
            <td>002</td>  
            <td>Bank B</td>  
            <td>250.00</td>  
            <td>2025-01-05</td>  
            <td>Second Donation</td>  
            <td>Pending</td>  
            <td>  
                <form action="deleteDonor" method="post" onsubmit="return confirm('Are you sure you want to delete this donation?');" style="display:inline;">
                    <input type="hidden" name="donateId" value="002" />  
                    <button type="submit" class="w3-button w3-red w3-round w3-margin-bottom">Delete</button>  
                </form>  
                <form action="printReceipt.jsp" method="get" style="display:inline;">
                    <input type="hidden" name="donateId" value="002" />
                    <button type="submit" class="w3-button w3-blue w3-round w3-margin-bottom">Print Receipt</button>
                </form>
            </td>  
        </tr>  
        <!-- Add more donation rows as needed -->  
    </tbody>  
</table>  

<div class="w3-center w3-margin-top">  
    <a href="donatorDashboard.jsp" class="w3-button w3-purple w3-round">Kembali ke Dashboard</a>  
</div>  

</body>  
</html>