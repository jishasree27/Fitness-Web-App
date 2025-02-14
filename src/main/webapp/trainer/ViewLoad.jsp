<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.ViewProfilePojo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitness Freaks Essentials</title>
<style>
/* Body and container styling */
body {
     font-family: 'Poppins', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    margin: 20px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.text-center {
    text-align: center;
}

.mt-3 {
    margin-top: 1rem;
}

.mt-4 {
    margin-top: 2rem;
}

/* Instructor image styling */
.instructor-img img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    object-fit: cover;
}

/* Button styling */
.btn {
    display: inline-block;
    background-color: #007bff;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    font-size: 1rem;
    transition: background-color 0.3s ease;
    margin: 5px;
}

.btn:hover {
    background-color: #0056b3;
}

/* Update and Delete buttons */
.btn-update {
    background-color: #28a745;
}

.btn-update:hover {
    background-color: #218838;
}

.btn-delete {
    background-color: #dc3545;
}

.btn-delete:hover {
    background-color: #c82333;
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
        HomeDao homeDao = new HomeDao();  
        List<ViewProfilePojo> viewList = null;

        try {
            viewList = homeDao.getAllProfile();  
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (loggedInUser == null) {
    %>
        <div class="text-center mt-4">
             <p style="color: red; text-align: center;">Please log in to view and enroll in courses.</p>
        </div>
    <% 
        } else if (viewList != null && !viewList.isEmpty()) { 
            boolean found = false;
            for (ViewProfilePojo view : viewList) {
                if (view.getUserId() != null && view.getUserId().equals(loggedInUser)) {
                    found = true;
                    String base64Image = (view.getImage() != null) ? 
                        new String(java.util.Base64.getEncoder().encode(view.getImage())) : "";
    %>
    <div class="logo">
        <img src="https://media.istockphoto.com/id/1035561592/vector/vector-design-element-for-the-fitness-center.jpg?s=612x612&amp;w=0&amp;k=20&amp;c=k3yyyEcqeivby9iE7gZIk33PAjtDqNsdEdYiMjw7qsM=" 
             alt="Fitness Freaks" 
             width="50" 
             height="50">
    </div>

    <div class="content mt-4">
        <h1 class="title text-center">Fitness Freaks Essentials</h1>

        <div class="instructor-info mt-3">
            <div class="instructor-img">
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Instructor Photo" />
            </div>
            <div class="instructor-details text-center mt-3">
                <p><strong>Instructor:</strong> <%= view.getName() %></p>
                <p><strong>Role:</strong> Top Instructor</p>
            </div>
        </div>

      <div class="course-details mt-4">
    <p><strong>Course:</strong> <%= view.getDetails() %></p>
    <p><strong>Date:</strong> <%= view.getDate() %></p>
    <p><strong>Time:</strong> From <%= view.getFtime() %> to <%= view.getTtime() %></p>
    <p><strong>Payment:</strong> <%= view.getPaymentDetails() %></p>
    <p><strong>Offer:</strong> <%= view.getOffer() %></p> <!-- Corrected here -->
</div>


        <div class="text-center mt-3">
            <a href="UpdateProfile.jsp?id=<%= view.getId() %>" class="btn btn-update">Update</a>
            <form action ="DeleteProfile" method ="post"><button type="submit">Delete</button></form>
        </div>
    </div>
    <% 
                }
            }
            if (!found) { 
    %>
        <div class="text-center mt-4">
            <p style="color: red; text-align: center;">No courses available for your account.</p>
        </div>
    <% 
            }
        } else { 
    %>
        <div class="text-center mt-4">
             <p style="color: red; text-align: center;">No courses available to display.</p>
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
