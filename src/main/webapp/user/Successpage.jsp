<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Saved Successfully</title>
    <style>
        /* Include the CSS from above */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }

        .container {
            padding-top:50px;
            background-color:white;
            padding: 20px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h1 {
            color: #2ac0d4;
            font-size: 24px;
        }
    </style>
</head>
<div>
    
    <jsp:include page="userNavSide.jsp" />
  </div>
<body>

    <div class="container">
        <h1>Successfully Done</h1>
    </div>
</body>
</html>
