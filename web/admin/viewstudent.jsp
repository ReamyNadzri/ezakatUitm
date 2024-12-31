
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Student Management</title>  
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">  
    <style>  
        html, body {  
            height: 100%;  
        }  
        .bg-custom {  
            background: linear-gradient(to bottom right, #6a0dad, #4b0082);  
        }  
    </style>  
</head>  
<body class="bg-custom flex flex-col justify-between">  

<div class="container mx-auto flex-grow mt-10 px-4">  
    <h1 class="text-4xl font-bold text-center mb-6 text-white">Student Management</h1>  

    <div class="bg-purple-800 shadow-lg rounded-lg p-8">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Student List</h2>  
        <table class="min-w-full bg-white rounded-lg shadow-md">  
            <thead>  
                <tr class="bg-purple-600 text-white">  
                    <th class="py-2 px-4">Bil.</th>  
                    <th class="py-2 px-4">Kod Kursus</th>  
                    <th class="py-2 px-4">No Matrik</th>  
                    <th class="py-2 px-4">Nama</th>  
                    <th class="py-2 px-4">Email</th>  
                    <th class="py-2 px-4">Kata Laluan</th>  
                    <th class="py-2 px-4">Actions</th>  
                </tr>  
            </thead>  
            <tbody>  
                <!-- Sample Data - Replace with dynamic data from your backend -->  
                <tr>  
                    <td class="border px-4 py-2">1</td>  
                    <td class="border px-4 py-2">CS101</td>  
                    <td class="border px-4 py-2">2023001</td>  
                    <td class="border px-4 py-2">Ali</td>  
                    <td class="border px-4 py-2">ali@example.com</td>  
                    <td class="border px-4 py-2">password123</td>  
                    <td class="border px-4 py-2">  
                        <form action="deleteStudent" method="post" onsubmit="return confirm('Are you sure you want to delete this student?');">  
                            <input type="hidden" name="studentId" value="1" />  
                            <button type="submit" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                    </td>  
                </tr>  
                <tr>  
                    <td class="border px-4 py-2">2</td>  
                    <td class="border px-4 py-2">CS102</td>  
                    <td class="border px-4 py-2">2023002</td>  
                    <td class="border px-4 py-2">Siti</td>  
                    <td class="border px-4 py-2">siti@example.com</td>  
                    <td class="border px-4 py-2">password456</td>  
                    <td class="border px-4 py-2">  
                        <form action="deleteStudent" method="post" onsubmit="return confirm('Are you sure you want to delete this student?');">  
                            <input type="hidden" name="studentId" value="2" />  
                            <button type="submit" class="bg-red-600 text-white font-semibold py-1 px-3 rounded-md hover:bg-red-700">Delete</button>  
                        </form>  
                    </td>  
                </tr>  
                <!-- Add more student rows as needed -->  
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
