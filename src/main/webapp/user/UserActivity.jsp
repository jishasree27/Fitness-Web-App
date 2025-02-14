<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Activity Log</title>
    <style>
  body {
    font-family: poppins, sans-serif;
    margin: 20px;
    background-color: white;  /* Slight background color to make it soft */
}

.container {
    width: 80%;
    max-width: 800px;  /* Increased the max-width to make it bigger */
    margin: 0 auto;
    padding: 30px;
    background-color: #fff;  /* Background color for the container */
    border-radius: 8px;  /* Rounded corners */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);  /* Light shadow for depth */
    text-align: center;
    margin-top:50px;
}

h2 {
    color: #333;
    margin-bottom: 20px;
}

.activity-details {
    text-align: left;
    font-size: 16px;
    color: #444;
}

.activity-details p {
    margin-bottom: 15px;
}

.activity-details span {
    font-weight: bold;
    color: #2ac0d4;  /* Color for the labels */
}

.button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 20px;
    border-radius: 5px;
}

.button:hover {
    background-color: #45a049;
}

.activity-log {
    margin-top: 20px;
    text-align: left;
}

.log-entry {
    margin-bottom: 10px;
}
    footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }


    </style>
</head>
<body>
 <jsp:include page="userNavSide.jsp" />

<% 
    // Get session attributes
    String loggedInUser = (String) session.getAttribute("user");
    String inTime = (String) session.getAttribute("inTime");
    String outTime = (String) session.getAttribute("outTime");
    String sessionDate = (String) session.getAttribute("sessionDate");

    // Default message in case session attributes are not set
    if (loggedInUser == null) {
    	loggedInUser = "N/A";
    }
    if (inTime == null) {
        inTime = "N/A";
    }
  
    if (sessionDate == null) {
        sessionDate = "N/A";
    }
%>

<div class="container">
    <h2>Session Activity Details</h2>

    <div class="activity-details">
        <p><span>Username:</span> <%= loggedInUser %></p>
        <p><span>Session Date:</span> <%= sessionDate %></p>
        <p><span>IN Time:</span> <%= inTime %></p>
      
    </div>

</div>
 <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
