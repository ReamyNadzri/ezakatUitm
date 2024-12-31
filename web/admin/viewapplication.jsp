
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Zakat Application Management</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
    <style>  
        html, body {  
            height: 100%;  
        }  
        .bg-custom {  
            background: linear-gradient(to bottom right, #6a0dad, #4b0082);  
        }  
        .status-approved {  
            color: green;  
        }  
        .status-rejected {  
            color: red;  
        }  
        .status-pending {  
            color: orange;  
        }  
    </style>  
</head>  
<body class="bg-custom flex flex-col justify-between">  

<div class="container mx-auto flex-grow mt-10 px-4">  
    <h1 class="text-4xl font-bold text-center mb-6 text-white">Zakat Application Management</h1>  

    <div class="bg-purple-800 shadow-lg rounded-lg p-8">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Zakat Applications List</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-600 text-white">  
                    <th class="py-2 px-4">Bil.</th>  
                    <th class="py-2 px-4">Tarikh</th>  
                    <th class="py-2 px-4">No Matrik</th>  
                    <th class="py-2 px-4">Nama</th>  
                    <th class="py-2 px-4">Permohonan</th>  
                    <th class="py-2 px-4">Amaun</th>  
                    <th class="py-2 px-4">Status</th>  
                    <th class="py-2 px-4">Actions</th>  
                </tr>  
            </thead>  
            <tbody>  
                <!-- Sample Data - Replace with dynamic data from your backend -->  
                <tr>  
                    <td class="border px-4 py-2">1</td>  
                    <td class="border px-4 py-2">15/01/2024</td>  
                    <td class="border px-4 py-2">2023001</td>  
                    <td class="border px-4 py-2">Ali Bin Ahmad</td>  
                    <td class="border px-4 py-2">Zakat Yuran</td>  
                    <td class="border px-4 py-2">RM 500.00</td>  
                    <td class="border px-4 py-2">  
                        <span class="status-approved">Approved</span>  
                    </td>  
                    <td class="border px-4 py-2">  
                        <form action="deleteZakatApplication" method="post" onsubmit="return confirm('Are you sure you want to delete this application?');">  
                            <input type="hidden" name="applicationId" value="1" />  
                            <button type="submit" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                    </td>  
                </tr>
                <tr>  
                    <td class="border px-4 py-2">2</td>  
                    <td class="border px-4 py-2">20/01/2024</td>  
                    <td class="border px-4 py-2">2023002</td>  
                    <td class="border px-4 py-2">Alisha Binti Ali</td>  
                    <td class="border px-4 py-2">Zakat Makan</td>  
                    <td class="border px-4 py-2">RM 300.00</td>  
                    <td class="border px-4 py-2">  
                        <span class="status-rejected">Rejected</span>  
                    </td>  
                    <td class="border px-4 py-2">  
                        <form action="deleteZakatApplication" method="post" onsubmit="return confirm('Are you sure you want to delete this application?');">  
                            <input type="hidden" name="applicationId" value="2" />  
                            <button type="submit" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                    </td>
                    </tr>  
                <tr>  
                    <td class="border px-4 py-2">3</td>  
                    <td class="border px-4 py-2">25/01/2024</td>  
                    <td class="border px-4 py-2">2023003</td>  
                    <td class="border px-4 py-2">Abu Bin Bakar</td>  
                    <td class="border px-4 py-2">Zakat Kolej</td>  
                    <td class="border px-4 py-2">RM 400.00</td>  
                    <td class="border px-4 py-2">  
                        <span class="status-pending">Pending</span>  
                    </td>  
                    <td class="border px-4 py-2">  
                        <form action="deleteZakatApplication" method="post" onsubmit="return confirm('Are you sure you want to delete this application?');">  
                            <input type="hidden" name="applicationId" value="3" />  
                            <button type="submit" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                    </td>  
                </tr>  
                <!-- Add more application rows as needed -->  
            </tbody>  
        </table>  
    </div>  

    <div class="mt-6 text-center">  
        <a href="dashboard.jsp" class="bg-purple-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-purple-700">Back to Dashboard</a>  
    </div>  
</div>  

<jsp:include page="../Footer.jsp"></jsp:include>

</body>  
</html>