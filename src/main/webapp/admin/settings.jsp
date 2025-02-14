<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fpojo.Fpojo" %>
<%@ page import="training.pack.Tpojo.*" %>
<%@ page import="User.pack.Pojo.*" %>
<%@ page import="com.fdao.Fdao" %>
<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.*" %>
<%@ page import="Admin.pack.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Settings</title>
</head>
<style>
/* Global Styles */
body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    color: #444; /* Default text color */
}

/* Content Container */
.content {
    margin-left: 250px; /* To avoid overlap with the sidebar */
    padding: 20px;
    background-color: #fff;
    color: #333; /* Slightly darker for contrast */
     text-align: center;
}

/* Form and Profile Container */
.form-container {
    width: 60%;
    margin: 20px auto;
    padding: 25px;
    background-color: #ffffff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    color: #2c3e50; /* Dark pastel blue-gray */
     text-align: center;
}

/* Profile Header */
.settings-header {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
}

.settings-header img {
    max-width: 120px;
    border-radius: 50%;
    margin-bottom: 15px;
}

.settings-header h1 {
    font-size: 2rem;
    color: #1a5276; /* Deep pastel blue */
}

.settings-header h4 {
    font-size: 1.2rem;
    color: #5d6d7e; /* Soft muted blue */
    margin-bottom: 10px;
}

/* Form Styling */
form {
    display: flex;
    flex-direction: column;
    gap: 15px;
     text-align: center;
}

form label {
    font-size: 1rem;
    color: #34495e; /* Dark slate blue */
    font-weight: 500;
}

form input {
    padding: 12px;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 100%;
    transition: border-color 0.3s ease-in-out;
    color: #333; /* Dark text inside input fields */
}

form input:focus {
    border-color: #007bff;
    outline: none;
}

/* Buttons */
form button, .settings-content button {
    padding: 12px 20px;
    font-size: 1rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
    color: white;
}

form button {
    background-color: #3498db; /* Soft pastel blue */
}

form button:hover {
    background-color: #2980b9;
}

/* Settings Content Section */
.settings-content {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

.settings-content button {
    background-color: #2ecc71; /* Pastel green */
}

.settings-content button:hover {
    background-color: #27ae60;
}

.settings-content form button {
    background-color: #e74c3c; /* Soft red */
}

.settings-content form button:hover {
    background-color: #c0392b;
}

/* Responsive Styling */
@media (max-width: 768px) {
    .form-container {
        width: 90%;
    }

    .content {
        margin-left: 0;
        padding: 15px;
    }

    .settings-content {
        flex-direction: column;
        align-items: center;
        gap: 10px;
    }

    .settings-content button,
    .settings-content form button {
        width: 100%;
    }
}
/* Center all text inside the profile container */
.profile-details {
    text-align: center;
}

/* Center table content */
.profile-details table {
    margin: 0 auto; /* Center table horizontally */
    border-collapse: collapse;
    width: 60%;
}

/* Style table for better readability */
.profile-details th, .profile-details td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

/* Responsive fix */
@media (max-width: 768px) {
    .profile-details table {
        width: 90%;
    }
}


 

</style>
<body>
    <div>
        <jsp:include page="adminNavside.jsp" />
    </div>
  <div class="content">
    <div class="admin-container">
        <div class="settings-header text-center">
            <img src="https://media.istockphoto.com/id/1035561592/vector/vector-design-element-for-the-fitness-center.jpg?s=612x612&w=0&k=20&c=k3yyyEcqeivby9iE7gZIk33PAjtDqNsdEdYiMjw7qsM=" alt="Fitness Freaks Logo">
            <h1>Admin Settings</h1>
        </div>

     <%
    // Assuming getAdminDetails() returns a List<AdminDetails>
    List<AdminDetails> adminList = (List<AdminDetails>) session.getAttribute("detailsList");

    if (adminList == null || adminList.isEmpty()) {
        // Fetch the list from the database if it's not in session
        AdminDao homeDao = new AdminDao();
        adminList = homeDao.getAdminDetails();
        session.setAttribute("detailsList", adminList); // Store the list in session
    }
%>

<% if (adminList != null && !adminList.isEmpty()) { %>
    <div class="profile-header">
         <h1>Welcome, <%= adminList.get(0).getName() %></h1>
    </div>

    <div class="profile-details">
     
        <table class="table">
            <tr>
                <th>Name</th>
                <td><%= adminList.get(0).getName() %></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><%= adminList.get(0).getEmail() %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= adminList.get(0).getPhone() %></td>
            </tr>
            <tr>
                <th>Gender</th>
                <td><%= adminList.get(0).getGender() %></td>
            </tr>
            <tr>
                <th>Designation</th>
                <td><%= adminList.get(0).getDesignation() %></td>
            </tr>
        </table>
    </div>

<% } else { %>
     <p style="color: red; text-align: center;">No admin details available.</p>
<% } %>


</body>
</html>
