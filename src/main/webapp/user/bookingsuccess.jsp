<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            text-align: center;
        }
        h1 {
            color: #2ac0d4;
            margin-bottom: 20px;
        }
        p {
            font-size: 18px;
            color: #333;
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            color: #ffffff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

  <jsp:include page="userNavSide.jsp" />
<script>
function goBack() {
    window.history.back(); // This will navigate to the previous page
}
</script>
    <div class="container">
        <h1>Booking Successful!</h1>
        <p style="color: red; text-align: center;">Your class has been successfully booked. Thank you for choosing our service.</p>
       <button id="backButton"  class="btn" type="button" onclick="goBack()">Go Home</button>
    </div>
 
</body>
</html>
