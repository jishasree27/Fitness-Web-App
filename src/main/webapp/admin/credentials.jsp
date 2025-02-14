<!DOCTYPE html>
<%@ page import="training.pack.Tpojo.razorpaypojo" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Credentials</title>
    <style>
     /* General Page Styling */
/* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    color: #333;
    margin: 0;
    padding: 0;
}

/* Form Container */
.form-container {
    position: absolute;
    top: 100px; /* Adjust for better positioning */
    left: 50%;
    transform: translateX(-50%);
    width: 500px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.form-container h2 {
    text-align: center;
    color: #444;
    margin-bottom: 20px;
}

label {
    font-size: 16px;
    margin-bottom: 8px;
    display: block;
    color: #555;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #5500cb;
    color: white;
    padding: 12px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    width: 100%;
    transition: background 0.3s ease-in-out;
}

input[type="submit"]:hover {
    background-color: grey;
}

input[type="text"]:focus {
    border-color: #4CAF50;
}

/* Credentials Table Styling */
.form-container2 {
    position: absolute;
    top: 800px; /* Position the table properly */
    left: 50%;
    transform: translateX(-50%);
    width: 80%;
    max-width: 600px;
    margin-top: 40px;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
}

.table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.table th, .table td {
    padding: 12px;
    border: 1px solid #ddd;
    text-align: left;
}

.table th {
    background-color: #5500cb;
    color: white;
    font-weight: bold;
}

.table td {
    background-color: #ffffff;
    color: #333;
}

/* Delete Button */
.delete-btn {
    background-color: #5500cb;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
    transition: background 0.3s ease-in-out;
}

.delete-btn:hover {
    background-color: grey;
}

/* No Credentials Message */
.form-container2 p {
    font-size: 16px;
    font-weight: bold;
    color: red;
    text-align: center;
}

/* Responsive Design */
@media (max-width: 768px) {
    .form-container,
    .form-container2 {
        width: 90%;
        padding: 15px;
        position: static;
        transform: none;
        margin: 20px auto;
    }

    input[type="submit"], .delete-btn {
        font-size: 14px;
        padding: 10px;
    }
}
footer{
position:relative;
top:1200px;


}
</style>

</head>
<body>
<div>
    
    <jsp:include page="adminNavside.jsp" />
  </div>

   

    <div class="form-container">
     <h2>RazorPay Credentials</h2>
        <form action="SubmitCredentialsServlet" method="POST">
            <label for="accountHolder">Account Holder Name:</label>
            <input type="text" id="accountHolder" name="accountHolder" required><br>

            <label for="merchantId">Merchant ID:</label>
            <input type="text" id="merchantId" name="merchantId" required><br>

            <label for="publicApiKey">Public API Key:</label>
            <input type="text" id="publicApiKey" name="publicApiKey" required><br>

            <label for="privateApiKey">Private API Key:</label>
            <input type="text" id="privateApiKey" name="privateApiKey" required><br>

            <input type="submit" value="Submit">
        </form><br><br>
       
    <form action="ViewCredentialsServlet" method="GET">
        <input type="submit" value="View Credentials">
    </form>
</div>
        <% razorpaypojo rp = (razorpaypojo) request.getAttribute("razorpayDetails"); %>
 <div class="form-container2">
<% if (rp != null) { %>
    <table class="table">
        <tr><th>Account Holder</th><td><%= rp.getAccountHolderName() %></td></tr>
        <tr><th>Merchant ID</th><td><%= rp.getMerchantId() %></td></tr>
        <tr><th>Public API Key</th><td><%= rp.getPublicApiKey() %></td></tr>
        <tr><th>Private API Key</th><td><%= rp.getPrivateApiKey() %></td></tr>
    </table>
     <form action="DeleteCredentialsServlet" method="POST">
            <input type="hidden" name="userId" value="<%= rp.getUserId() %>">
            <input type="submit" value="Delete Credentials" class="delete-btn">
        </form>
<% } else { %>
    <p style="color: red; text-align: center;">No credentials found.</p>
<% } %>

</div>
  <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
