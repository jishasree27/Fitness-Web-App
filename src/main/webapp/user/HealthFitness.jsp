<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.HealthPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Updates</title>
  <script
    src="https://unpkg.com/@lyket/widget@latest/dist/lyket.js?apiKey=pt_e94b9856e2acf955797bb581b62078"
  ></script>
<style>
    body {
        font-family: poppins, sans-serif;
        background-color: white;
    }

    .update-section {
        background-color: white;
        border: 1px solid #ddd;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 8px;
        max-width: 800px; /* Limit the width of the update section */
        margin: 0 auto; /* Center the update section */
    }

    .update-section h3 {
        margin-top: 0;
        text-align: center;
    }

    .update-section .image-container {
        text-align: center;
        margin-bottom: 15px;
    }

    .update-section img {
        width: 150px;
        height: 150px;
        border-radius: 8px;
    }

    .update-section p {
        font-size: 16px;
        line-height: 1.5;
        margin-bottom: 10px;
    }

    .update-section .heading {
        font-weight: bold;
        margin-top: 10px;
    }

    .search-bar {
        display: flex;
        align-items: center;
        position: relative;
        width: 300px; /* Adjust width as needed */
        margin: 20px auto;
    }

    footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }

    .search-bar {
        position: relative;
        width: 100%;
        max-width: 400px; /* Adjust as needed */
        margin: 0 auto;
    }

    .search-bar input {
        width: 100%;
        padding: 10px 15px;
        border: 2px solid #E5F4F6;
        border-radius: 20px;
        font-size: 16px;
        outline: none;
        transition: 0.3s ease-in-out;
    }

    .search-bar input:focus {
        border-color: #B2E4E6; /* Slightly darker shade for focus */
        box-shadow: 0 0 5px rgba(179, 228, 230, 0.5);
    }

    .search-icon { 
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }

    .search-results {
        width: 100%;
        background: white;
        border: 2px solid #E5F4F6;
        border-radius: 10px;
        position: absolute;
        top: 100%;
        left: 0;
        z-index: 10;
        display: none;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
    .image-container img {
    width: 300px; /* Adjust the width as needed */
    height: 300px; /* Adjust the height as needed */
    margin-right: 15px;
    object-fit: cover; /* Ensures the image maintains its aspect ratio */
    border-radius: 5px; /* Optional: adds rounded corners */
}
    
</style>

</head>
<body>
    <div>
        <jsp:include page="userNavSide.jsp" />
    </div>

    <div>
     <div class="search-bar">
  <input type="text" name="searchQuery" id="searchQuery" placeholder="Search..." autocomplete="off" onkeyup="search()" />
  <span class="search-icon">&#x1F50D;</span>
  <div class="search-results" id="searchResults" style="display: none;"></div>
</div>
        <% 
            String loggedInUser = (String) session.getAttribute("user");
            HomeDao uDao = new HomeDao();
            List<HealthPojo> hList = uDao.getAllHealth();
            
            if (loggedInUser == null) { 
        %>
            <div class="text-center mt-4">
                <p style="color: red; text-align: center;">Please log in to view and upload videos.</p>
            </div>
        <% 
            } else if (hList != null && !hList.isEmpty()) { 
        %>
        <center>
        <h2 class="text-center">health & Fitness</h2>
        </center>
        <% 
            for (HealthPojo health : hList) {
                String base64Image = (health.getImage() != null) 
                    ? Base64.getEncoder().encodeToString(health.getImage()) 
                    : null;
        %>
        <div class="update-section">
            <div class="image-container">
                <% if (base64Image != null) { %>
                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Instructor Photo">
                <% } else { %>
                    <span>No Image</span>
                <% } %>
            </div>

            <h3><%= health.getTrainerName() %></h3>
            
            <p class="heading">Food Control Ideas:</p>
            <p><%= health.getFoodControlIdeas() %></p>

            <p class="heading">Days To Follow:</p>
            <p><%= health.getDaysToFollow() %></p>

            <p class="heading">Daily Routine:</p>
            <p><%= health.getDailyRoutine() %></p>
            
               <form action="LikeServlet" method="post" onsubmit="saveLikedProfile(event, '<%= health.getId() %>')">
				            <div data-lyket-type="like" data-lyket-id="twitter-button_<%= health.getId() %>" data-lyket-namespace="portfolio" data-lyket-template="twitter"></div>
			                <input type="hidden" name="trainerId" value="<%= health.getId() %>">
				    </form>
        </div>

        <% 
            } 
        %>
        
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
    <script type="text/javascript">
        function search() {
            let filter = document.getElementById('searchQuery').value.toUpperCase(); // Correct input field id

            // Get all the update-section elements (equivalent to "card" class in the original code)
            let items = document.querySelectorAll('.update-section');

            // Loop through all elements and hide those that don't match the filter
            for (let i = 0; i < items.length; i++) {
                let trainerName = items[i].querySelector('h3').textContent; // Trainer name in h3
                let foodControl = items[i].querySelector('.heading').textContent || ""; // Food Control Ideas
                let value = trainerName + " " + foodControl; // Combine the fields to search

                if (value.toUpperCase().indexOf(filter) > -1) {
                    items[i].style.display = ""; // Show the item if it matches the filter
                } else {
                    items[i].style.display = "none"; // Hide the item if it doesn't match
                }
            }
        }
    </script>
    
    
     <footer>
    
    <jsp:include page="footer.jsp" />
  </footer>
    
</body>
</html>
