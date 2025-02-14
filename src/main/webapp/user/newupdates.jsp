<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.NewUpdatePojo" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.*" %>
<%@ page import="Admin.pack.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Updates</title>
    <script src="https://unpkg.com/@lyket/widget@latest/dist/lyket.js?apiKey=pt_e94b9856e2acf955797bb581b62078"></script>
  <style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: white;
    }

    .container {
        max-width: 900px; /* Sets a maximum width for the container */
        margin: 0 auto;  /* Centers the container */
        padding: 20px;
    }

    .update-section {
        background-color: white;
        border: 1px solid #ddd;
        padding: 15px; /* Reduced padding */
        margin-bottom: 20px;
        border-radius: 8px;
    }

    .update-section h3 {
        margin-top: 0;
    }

    .update-section p {
        font-size: 16px;
        line-height: 1.5;
    }

    .update-section img {
        width: 80px; /* Reduced image size */
        height: 80px; /* Reduced image size */
        border-radius: 8px;
        margin-right: 15px;
    }

    .update-section .image-container {
        display: flex;
        align-items: center;
    }

    footer {
        margin-top: 2em;
        padding: 15px;
        position: relative;
    }

    .updates-section {
        margin-top: 20px;
    }

    .update-item {
        display: flex;
        align-items: start;
        margin-bottom: 15px;
    }

    .image-container {
        margin-right: 15px;
    }

.image-container img {
    width: 300px; /* Adjust the width as needed */
    height: 300px; /* Adjust the height as needed */
    margin-right: 15px;
    object-fit: cover; /* Ensures the image maintains its aspect ratio */
    border-radius: 5px; /* Optional: adds rounded corners */
}

    .text-container {
        flex: 1;
    }
</style>

</head>
<body>
    <div>
        <jsp:include page="userNavSide.jsp" />
    </div>

      
<center> <h2>New Updates</h2></center>
        <div>
            <%  
                String newId = request.getParameter("id");
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
            <div>
                <% 
                    for (NewUpdatePojo update : updatesList) {
                        String base64Image = (update.getImage() != null) 
                            ? Base64.getEncoder().encodeToString(update.getImage()) 
                            : null;
                %>

                <div class="update-section">
                
                    <div class="image-container">
                        <% if (base64Image != null) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Instructor Photo">
                        <% } else { %>
                            <span>No Image</span>
                        <% } %>
                        <div>
                            <h3><%= update.getTrainerName() %></h3>
                            <p><strong>Expertise:</strong> <%= update.getExpertise() %></p>
                            <p><strong>Feedback:</strong> <%= update.getFeedback() %></p>
                            <p><strong>Description:</strong> <%= update.getDescription() %></p>
                        </div>
                    </div>
                    <form action="LikeServlet" method="post" onsubmit="saveLikedProfile(event, '<%= update.getClassId() %>')">
				            <div data-lyket-type="like" data-lyket-id="twitter-button_<%= update.getClassId() %>" data-lyket-namespace="portfolio" data-lyket-template="twitter"></div>
			                <input type="hidden" name="trainerId" value="<%= update.getClassId() %>">
				    </form>
                </div>

                <% 
                    } 
                %>
            </div>
            <% 
                } else {
            %>
            <div class="text-center mt-4">
                 <p style="color: red; text-align: center;">No updates available at the moment.</p>
            </div>
            <% 
                }
            %>
        </div>
<div class="container">
    <%
        // Fetch the updates only if the user is logged in
        AdminDao aDao = new AdminDao();
        List<AdminPojo> adminList = aDao.getAdminUpdates();

        if (adminList != null && !adminList.isEmpty()) { 
    %>             
        <h2 class="text-center">Uploaded Videos</h2>
        <div class="updates-section">
            <% 
                for (AdminPojo update : adminList) {
                    // Convert image to Base64 if it exists
                    String base64Image = (update.getImage() != null) 
                        ? Base64.getEncoder().encodeToString(update.getImage()) 
                        : null;
            %>
            <div class="update-item d-flex align-items-start mb-4">
                <div class="image-container me-3">
                    <% if (base64Image != null) { %>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" 
                             alt="Instructor Photo" 
                             style="width:100px;height:100px;border-radius:10px;">
                    <% } else { %>
                        <span>No Image</span>
                    <% } %>
                </div>
                <div class="text-container">
                    <p><strong>Title:</strong> <%= update.getTitle() %></p>
                    <p><strong>Update:</strong> <%= update.getUpdate() %></p>
                </div>
            </div>
            <hr>
            <% 
                } 
            %>
        </div>
    <%  
        } 
    %> 
        
  
</div>

    <script>
        function saveLikedProfile(event, trainerId) {
            event.preventDefault(); // Prevent form submission
            let likedProfiles = JSON.parse(sessionStorage.getItem('likedProfiles')) || [];

            if (!likedProfiles.includes(trainerId)) {
                likedProfiles.push(trainerId);
                sessionStorage.setItem('likedProfiles', JSON.stringify(likedProfiles));
            }

            const button = document.getElementById('like' + trainerId);
            button.innerHTML = '<i class="fas fa-heart"></i> Liked';
        }
    </script>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
