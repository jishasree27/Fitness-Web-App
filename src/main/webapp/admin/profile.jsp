<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.*" %>
<%@ page import="Admin.pack.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Form Toggle</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f9;
        }

        .content {
            width: 100%;
            max-width: 900px;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }

        .toggle {
            position: relative;
            text-align: right;
        }

        .toggle-btn, .toggle form button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        .toggle-btn:hover, .toggle form button:hover {
            background-color: #45a049;
        }

        .form-container {
            display: none;
            background-color: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            position: absolute;
            top: 50px;
            right: 0;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container h3 {
            margin-top: 0;
        }

        .form-container input, .form-container select {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
        }

        .form-container button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #45a049;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 10%;
            margin-bottom: 10px;
        }

        .profile-header h1 {
            font-size: 1.8em;
            color: #301934;
        }

        .profile-details {
            margin: 20px 0;
        }

        .profile-details table {
            width: 100%;
            border-collapse: collapse;
        }

        .profile-details th, .profile-details td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .profile-details th {
            background-color: #f9f9f9;
            font-weight: bold;
        }

        .profile-actions {
            text-align: center;
            margin-top: 20px;
        }

        .profile-actions button {
            padding: 10px 20px;
            background-color: #301934;
            color: white;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .profile-actions button:hover {
            opacity: 0.9;
        }

        .logout-button {
            display: inline-flex;
            align-items: center;
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .logout-button img {
            width: 20px;
            height: 20px;
            margin-right: 8px;
        }

        .logout-button:hover {
            background-color: #c82333;
        }
        .toggle form {
    margin-top: 20px; /* Adds a gap between the buttons */
}

.toggle-btn {
    margin-bottom: 10px; /* Adds space below the "Toggle Admin Form" button */
}
        
    </style>
    <script>
        function toggleForm() {
            const formContainer = document.getElementById("adminForm");
            formContainer.style.display = formContainer.style.display === "none" || formContainer.style.display === ""
                ? "block"
                : "none";
        }
    </script>
</head>
<body>
    <div class="content">
        <jsp:include page="adminNavside.jsp" />

        <div class="admin-container">
            <div class="settings-header text-center">
                <h1>Admin Settings</h1>
            </div>

            <% 
                List<AdminDetails> adminList = (List<AdminDetails>) session.getAttribute("detailsList");

                if (adminList == null || adminList.isEmpty()) {
                    AdminDao homeDao = new AdminDao();
                    adminList = homeDao.getAdminDetails();
                    session.setAttribute("detailsList", adminList);
                }
            %>

            <% if (adminList != null && !adminList.isEmpty()) { %>
                <div class="profile-header">
                    <h1>Welcome, <%= adminList.get(0).getName() %></h1>
                </div>

                <div class="profile-details">
                    <h2>Admin Profile Details</h2>
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
                         <th>Account Details</th>
                   <td>
    <button onclick="window.location.href='credentials.jsp'" style="background-color: rgb(85, 0, 203); color: white; border: none; padding: 8px 12px; border-radius: 5px; cursor: pointer;">View Credentials</button>
</td>
                </tr>
                    </table>
                </div>

                <a href="logout.jsp" class="logout-button">
                    <img src="https://cdn-icons-png.flaticon.com/128/18792/18792990.png" alt="logout">
                    <span>Logout</span>
                </a>

                <div class="toggle">
                    <button class="toggle-btn" onclick="toggleForm()">Toggle Admin Form</button>
                    <form action="adminView" method="get">
                        <button type="submit">Edit Details</button>
                    </form>
                    <div id="adminForm" class="form-container">
                        <h3>Admin Details</h3>
                        <form action="submitAdminDetails" method="post">
                            <input type="text" name="name" placeholder="Name" required>
                            <input type="number" name="age" placeholder="Age" required>
                            <input type="date" name="dob" placeholder="Date of Birth" required>
                            <input type="text" name="designation" placeholder="Designation" required>
                            <input type="email" name="email" placeholder="Email" required>
                            <select name="gender" required>
                                <option value="" disabled selected>Select Gender</option>
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                            <input type="tel" name="phone" placeholder="Phone" required pattern="[0-9]{10}" title="Enter a valid 10-digit phone number">
                            <button type="submit">Submit</button>
                        </form>
                    </div>
                </div>
            <% } else { %>
                 <p style="color: red; text-align: center;">No admin details available.</p>
            <% } %>
        </div>
    </div>
</body>
</html>
