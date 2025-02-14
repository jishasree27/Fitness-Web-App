<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.HealthPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Uploaded Health Content</title>
<!-- Add Bootstrap for styling -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  body {
   font-family: 'Poppins', sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}
.container h4{
 color:black;
}

.container {
    max-width: 800px; /* Reduced container width */
    position:relative;
    top: -600px; /* Adjust top margin to move it upwards */
    left: 100px;
}

.table {
    width: 70%; /* Reduced the table width to 80% of the container */
   
}

.table td, .table th {
    word-wrap: break-word;
}

.btn {
    margin-right: 10px;
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
            List<HealthPojo> hList = uDao.getAllHealth();
            
            if (loggedInUser == null) { 
        %>
        <div class="text-center mt-4">
             <p style="color: red; text-align: center;">Please log in to view and upload health content.</p>
        </div>
        <% 
            } else if (hList != null && !hList.isEmpty()) { 
        %>             
        <h4 class="text-center">Uploaded Content</h4>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Image</th>
                    <th scope="col">Trainer Name</th>
                    <th scope="col">Food Control Ideas</th>
                    <th scope="col">Days To Follow</th>
                    <th scope="col">Daily Routine</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (HealthPojo health : hList) {
                        if (health.getUserId() != null && health.getUserId().equals(loggedInUser)) {
                            String base64Image = (health.getImage() != null) 
                                ? Base64.getEncoder().encodeToString(health.getImage()) 
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
                    <td><%= health.getTrainerName() %></td>
                    <td><%= health.getFoodControlIdeas() %></td>
                    <td><%= health.getDaysToFollow() %></td>
                    <td><%= health.getDailyRoutine() %></td>
                    <td>
                        <form action="updatehealth" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= health.getId() %>">
                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                        </form>
                        <form action="deletehealth" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= health.getId() %>">
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
            <p style="color: red; text-align: center;">No health advices found for your account.</p>
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
