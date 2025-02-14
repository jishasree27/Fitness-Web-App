<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="training.pack.Tdao.*" %>
<%@ page import="Admin.pack.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Admin Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #e0f7fa; /* Light blue background for the page */
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }
        .container h1 {
            text-align: center;
            color: #00796b; /* Teal color for the header */
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        .form-group input,
        .form-group select,
        .form-group button {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            margin-top: 5px;
        }
        .form-group input:focus,
        .form-group select:focus,
        .form-group button:focus {
            outline: none;
            border-color: #00796b;
        }
        .form-group button {
            background-color: #00796b; /* Teal color for the button */
            color: white;
            cursor: pointer;
            border: none;
        }
        .form-group button:hover {
            background-color: #004d40; /* Darker teal for hover effect */
        }
        .admin-detail {
            background-color: #f1f8e9; /* Light green background for individual admin detail section */
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .admin-detail input {
            background-color: #f0f4c3; /* Light yellow background for input fields */
        }
    </style>
</head>
<body>
 <div >
            <!-- Sidebar includes links to other sections like Users, Settings, etc. -->
            <jsp:include page="adminNavside.jsp" />
        </div>
    <div class="container">
        <h1>Update Admin Details</h1>

        <%
            // Fetch the list from the request attribute
            List<AdminDetails> adminList = (List<AdminDetails>) request.getAttribute("detailsList");

            if (adminList != null) {
                for (AdminDetails admin : adminList) {
        %>
                    <div class="admin-detail">
                        <form action="updateDetail" method="POST">
                            <input type="hidden" id="id" name="id" value="<%= admin.getId() %>" required><br>

                            <div class="form-group">
                                <label for="name">Name:</label>
                                <input type="text" id="name" name="name" value="<%= admin.getName() %>" required><br>
                            </div>

                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="text" id="email" name="email" value="<%= admin.getEmail() %>" required><br>
                            </div>

                            <div class="form-group">
                                <label for="designation">Designation:</label>
                                <input type="text" id="designation" name="designation" value="<%= admin.getDesignation() %>" required><br>
                            </div>

                            <div class="form-group">
                                <label for="dob">Date of Birth:</label>
                                <input type="text" id="dob" name="dob" value="<%= admin.getDob() %>" required><br>
                            </div>

                            <div class="form-group">
                                <label for="gender">Gender:</label>
                                <input type="text" id="gender" name="gender" value="<%= admin.getGender() %>" required><br>
                            </div>

                            <div class="form-group">
                                <label for="age">Age:</label>
                                <input type="text" id="age" name="age" value="<%= admin.getAge() %>" required><br>
                            </div>

                            <div class="form-group">
                                <button type="submit">Update</button>
                            </div>
                        </form>
                    </div>
        <%
                }
            } else {
        %>
               <p style="text-align: center;">No admin details available.</p>
        <%
            }
        %>
    </div>

</body>
</html>
