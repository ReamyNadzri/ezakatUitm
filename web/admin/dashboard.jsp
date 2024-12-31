
<%@ page contentType="text/html;charset=UTF-8" language="java" %>  
<!DOCTYPE html>  
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <meta name="viewport" content="width=device-width, initial-scale=1.0">  
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        html, body {  
            height: 100%;  
        }  
        .bg-custom {  
            background: white;  
        }  
    </style>
</head>
<body class="bg-custom flex flex-col justify-between">
    
            <jsp:include page="../header.jsp"></jsp:include>
            
<div class="container mx-auto flex-grow flex flex-col items-center justify-center mt-10 px-4">  
    <h1 class="text-4xl font-bold text-center mb-6 text-white">Admin Dashboard</h1>  

    <div class="bg-purple-800 shadow-lg rounded-lg p-8 mx-auto max-w-lg">  
        <h2 class="text-2xl font-semibold mb-4 text-white">Add Staff</h2>  
        <form action="addStaff" method="post">  
            <div class="mb-4">  
                <label for="name" class="block text-sm font-medium text-gray-200">Name</label>  
                <input type="text" id="name" name="name" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2" />  
            </div>  
            <div class="mb-4">  
                <label for="email" class="block text-sm font-medium text-gray-200">Email</label>  
                <input type="email" id="email" name="email" required class="mt-1 block w-full border border-gray-300 rounded-md shadow-sm p-2" />  
            </div>  
            <button type="submit" class="w-full bg-purple-600 text-white font-semibold py-2 rounded-md hover:bg-purple-700">Add Staff</button>  
        </form>
    </div>

    <div class="mt-8 text-center">  
        <h2 class="text-xl font-semibold mb-4 text-black">Navigate to:</h2>  
        <div class="flex flex-wrap justify-center gap-4">
            <a href="viewstaff.jsp" class="bg-purple-600 text-white font-semibold py-3 px-6 rounded-md hover:bg-purple-700">Staff</a>  
            <a href="viewstudent.jsp" class="bg-purple-600 text-white font-semibold py-3 px-6 rounded-md hover:bg-purple-700">Students</a>   
            <a href="viewdonation.jsp" class="bg-purple-600 text-white font-semibold py-3 px-6 rounded-md hover:bg-purple-700">Donations</a>  
            <a href="viewdonator.jsp" class="bg-purple-600 text-white font-semibold py-3 px-6 rounded-md hover:bg-purple-700">Donators</a>  
            <a href="viewapplication.jsp" class="bg-purple-600 text-white font-semibold py-3 px-6 rounded-md hover:bg-purple-700">Applications</a>  
        </div>  
    </div>  

    <div class="mt-6 text-center">  
        <a href="logout" class="bg-red-600 text-white font-semibold py-2 px-4 rounded-md hover:bg-red-700">Logout</a>  
    </div>  
</div>
            <jsp:include page="../Footer.jsp"></jsp:include>
    
</body>

</html>
