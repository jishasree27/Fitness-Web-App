<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
      .container {
    width: 80%;
    max-width: 900px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: relative;  /* Relative to its normal position */
    top: -650px !important;  /* Moves the container 50px down */
    left: 120px !important;    /* Keeps the container centered */
}
        .header {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        .content {
            text-align: center;
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #45a049;
        }
        a {
            color: #fff;
            text-decoration: none;
        }
        .error-message {
            color: #e74c3c;
            font-size: 1.2em;
        }
         footer {
        margin-top: 30px;
        padding: 10px;
        color: white;
        text-align: center;
        border-radius: 0 0 10px 10px;
        position: sticky;
        top: 0;
}
    </style>
</head>
<body>
   <jsp:include page="NavSide.jsp" />
    <div class="container">
  
        
        <div class="header">
            <h2>Error Occured</h2> <!-- Change title if needed -->
        </div>

        <div class="content">
            <h3 class="error-message">Login to View</h3>
            <h3>Thank You..</h3>
        </div>
        
        <div style="text-align: center;">
            <button type="button"><a href="TrainerDashboard.jsp">Home</a></button>
        </div>
    </div>

    <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
