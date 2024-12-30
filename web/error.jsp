<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: sans-serif;
            background-color: #f4f4f4;
            color: #333;
            padding: 20px;
            text-align: center;
        }

        .error-message {
            background-color: #ffe6e6;
            border: 1px solid #ffcccc;
            padding: 15px;
            margin: 20px auto;
            max-width: 600px;
            border-radius: 5px;
        }

        .error-message h2 {
            color: #c00;
        }

        .error-message p {
            margin-bottom: 10px;
        }

        .return-link {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #5cb85c;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .return-link:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="error-message">
        <h2>Oops! An Error Occurred</h2>
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
            <p><%= errorMessage %></p>
        <%
            } else {
        %>
            <p>An unexpected error occurred. Please try again.</p>
            <%= request.getAttribute("errorMessage") %>
        <%
            }
        %>
    </div>
    <a href="your-page.html" class="return-link">Return to Form</a>
</body>
</html>