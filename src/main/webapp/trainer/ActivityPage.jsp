<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session Activity</title>
    <style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
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

.container h3 {
    text-align: center;
    color: #333;
}

.activity-details {
    margin: 20px 0;
    font-size: 1.2em;
    color: #555;
}

.activity-details span {
    font-weight: bold;
}

.footer {
    text-align: center;
    margin-top: 40px;
}

button {
    padding: 10px 20px;
    background-color: rgb(85, 0, 203);
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: rgb(120, 0, 255);
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
 <div>
        <jsp:include page="NavSide.jsp" />
    </div>
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
    <h3>Session Activity Details</h3>

    <div class="activity-details">
        <p><span>Username:</span> <%= loggedInUser %></p>
        <p><span>Session Date:</span> <%= sessionDate %></p>
        <p><span>IN Time:</span> <%= inTime %></p>
      
    </div>

    <div class="footer">
        <button onclick="window.location.href='TrainerDashboard.jsp'">Go to Dashboard</button>
    </div>
</div>
<footer> <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
