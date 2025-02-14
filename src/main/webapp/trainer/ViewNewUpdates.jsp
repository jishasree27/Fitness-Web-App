<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.NewUpdatePojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Uploaded Content</title>
<style>
    body {
         font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }
.container {
    position: relative; /* Change to absolute or fixed if needed */
    margin: 20px auto;
    padding: 20px;
    width: 90%;
    max-width: 1200px;
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    left: 100px; /* Adjusts horizontal position */
    top: -600px; /* Moves container upwards */
}

    .table {
        width: 100%;
        border-collapse: collapse;
    }
    .table th, .table td {
        text-align: left;
        padding: 8px;
        border: 1px solid #dee2e6;
    }
    .table th {
        background-color: #343a40;
        color: #ffffff;
    }
    .table-hover tbody tr:hover {
        background-color: #f1f3f5;
    }
    img {
        border-radius: 4px;
    }
    .btn {
        padding: 5px 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .btn-primary {
        background-color: #007bff;
        color: #ffffff;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .btn-danger {
        background-color: #dc3545;
        color: #ffffff;
    }
    .btn-danger:hover {
        background-color: #c82333;
    }
    .text-center {
        text-align: center;
    }
    .mt-4 {
        margin-top: 1.5rem;
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

    <div class="container">
        <% 
            String loggedInUser = (String) session.getAttribute("user");
            HomeDao uDao = new HomeDao();
            List<NewUpdatePojo> updatesList = uDao.getAllUpdates();
            
            if (loggedInUser == null) { 
        %>
            <div class="text-center mt-4">
                 <p style="color: red; text-align: center;">Please log in to view and upload videos.</p>
            </div>
        <% 
            } else if (updatesList != null && !updatesList.isEmpty()) { 
        %>             
            <h4 class="text-center">Uploaded Content</h4>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Trainer Name</th>
                        <th scope="col">Expertise</th>
                        <th scope="col">Feedback</th>
                        <th scope="col">Description</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        for (NewUpdatePojo update : updatesList) {
                            if (update.getUserId() != null && update.getUserId().equals(loggedInUser)) {
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
                        <td><%= update.getTrainerName() %></td>
                        <td><%= update.getExpertise() %></td>
                        <td><%= update.getFeedback() %></td>
                        <td><%= update.getDescription() %></td>
                        <td>
                            <form action="updateNew" method="get" style="display:inline;">
                                <input type="hidden" name="classId" value="<%= update.getClassId() %>">
                                <button type="submit" class="btn btn-sm btn-primary">Update</button>
                            </form>
                            <form action="deleteUpdate" method="post" style="display:inline;">
                                <input type="hidden" name="classId" value="<%= update.getClassId() %>">
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <% 
                            }
                        } 
                    %>
                </tbody>
            </table>
        <%  
            } else { 
        %> 
            <div class="text-center mt-4">
                 <p style="color: red; text-align: center;">No updates found for your account.</p>
            </div>
        <% 
            } 
        %>
    </div>
<footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
