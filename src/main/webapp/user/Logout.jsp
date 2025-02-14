<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session != null) {
        session.invalidate();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="3;url=../index.jsp" />
    <title>Logging Out</title>
    <style>
        /* Center the body content */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }

        /* Container for the message */
        .container {
            text-align: center;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
        }

        h1 {
            color: #4CAF50; /* Green for success */
            font-size: 24px;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        /* Optional: styling for navigation (NavSide.jsp) inclusion */
        .nav-side {
            margin-bottom: 20px;
        }

    </style>
</head>
<body>

    <div class="container">
        
        <h3>You have been logged out successfully!</h3>
        <p>Redirecting to the home page...</p>
    </div>
</body>
</html>
