<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.*" %>
<%@ page import="Admin.pack.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Updates</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 80%;
        margin: 50px auto;
        padding: 20px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .table thead {
        background-color: #343a40;
        color: white;
    }

    .table th, .table td {
        padding: 10px;
        text-align: center;
        border: 1px solid #dee2e6;
    }

    .table-hover tbody tr:hover {
        background-color: #f1f1f1;
    }

    img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 5px;
    }

    .btn {
        padding: 5px 10px;
        border: none;
        cursor: pointer;
        font-size: 14px;
        border-radius: 4px;
    }

    .btn-primary {
        background-color: #007bff;
        color: white;
    }

    .btn-danger {
        background-color: #dc3545;
        color: white;
    }

    .btn:hover {
        opacity: 0.8;
    }

    .text-center {
        text-align: center;
    }

    .mt-4 {
        margin-top: 20px;
    }
</style>

<body>
 <div>
            <!-- Sidebar includes links to other sections like Users, Settings, etc. -->
            <jsp:include page="adminNavside.jsp" />
        </div>
    <div class="container">
        <%
            // Fetch the updates only if the user is logged in
            AdminDao uDao = new AdminDao();
            List<AdminPojo> updatesList = uDao.getAdminUpdates();

            if (updatesList != null && !updatesList.isEmpty()) { 
        %>             
            <h2 class="text-center">Uploaded Videos</h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Title</th>
                        <th scope="col">Update</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (AdminPojo update : updatesList) {
                            // Only display updates that belong to the logged-in user
                            // Assuming you will filter here based on the logged-in user, like if (update.getUserId() == loggedInUserId)
                            
                            // Convert image to Base64 if it exists
                            String base64Image = (update.getImage() != null) 
                                ? Base64.getEncoder().encodeToString(update.getImage()) 
                                : null;
                    %>
                    <tr>
                        <td>
                            <% if (base64Image != null) { %>
                                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Instructor Photo" style="width:100px;height:100px;">
                            <% } else { %>
                                <span>No Image</span>
                            <% } %>
                        </td>
                        <td><%= update.getTitle() %></td>
                        <td><%= update.getUpdate() %></td>
                        <td>
						  
						    <!-- Update Form (using POST method) -->
						    <form action="updateAdmin" method="get" style="display:inline;">
						        <input type="hidden" name="id" value="<%= update.getId() %>">
						        <button type="submit" class="btn btn-sm btn-primary">Update</button>
						    </form>
						    
						    <!-- Delete Form (using POST method) -->
						    <form action="deleteAdmin" method="post" style="display:inline;">
						        <input type="hidden" name="id" value="<%= update.getId() %>">
						        <button type="submit" class="btn btn-sm btn-danger">Delete</button>
						    </form>
					

                        </td>
                    </tr>
                    <% 
                        } 
                    %>
                </tbody>
            </table>
        <%  
            } else { 
        %> 
            <div class="text-center mt-4">
                <p style="text-align: center;">No updates found for your account.</p>
            </div>
        <% } %>
    </div>
</body>

</html>
