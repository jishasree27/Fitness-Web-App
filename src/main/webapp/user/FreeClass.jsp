<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.FreeClassPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Free Live Classes</title>
 <script
    src="https://unpkg.com/@lyket/widget@latest/dist/lyket.js?apiKey=pt_e94b9856e2acf955797bb581b62078"
  ></script>
<style>
   .container {
    width: 80%; /* Adjust the width of the container */
    max-width: 1200px; /* Maximum width of the container */
    margin: 0 auto; /* Center the container horizontally */
    padding: 20px; /* Add some padding inside the container */
}

.card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px; /* Space between cards */
    justify-content: center; /* Center the cards */
    margin-top: 20px;
   
}

.card {
        width: 100%;
        max-width: 300px; /* Max width of each card */
        padding: 15px;
        border: 1px solid #ddd; /* Light gray border */
        border-radius: 8px; /* Rounded corners */
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        text-align: center; /* Center content inside the card */
        background-color: #f0f8ff; /* Changed color to a light blue */
        transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth hover effects */
    }

    .card:hover {
        transform: translateY(-5px); /* Lift the card slightly on hover */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15); /* Increase shadow on hover */
    }
.card h3 {
    font-size: 1.2rem;
    margin-bottom: 10px;
    color: #333; /* Dark text color */
}

.card p {
    font-size: 1rem;
    color: #555; /* Medium gray text */
    margin-bottom: 10px;
}

.card a {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #0056b3; /* Bootstrap primary color */
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.card a:hover {
    background-color: #0056b3; /* Darken color on hover */
}

.text-center {
    text-align: center;
}

.mt-4 {
    margin-top: 1.5rem; /* Adds space above the element */
}

    .card {
       background-color: #f0f8ff;
        border: 1px solid #ddd;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 8px;
    }

    .action-container {
        display: flex;
        align-items: center;
        gap: 10px; /* Space between the buttons */
        margin-top: 10px;
    }

    .watch-video-button {
        background-color: #007bff; /* Blue */
        color: white;
        text-decoration: none;
        padding: 8px 16px;
        border-radius: 4px;
        font-size: 14px;
    }

    .watch-video-button:hover {
        background-color: #0056b3; /* Darker blue */
    }

    .like-button {
        display: inline-block;
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
    footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }
    .watch-video-button {
    background-color: #0056b3; /* Change this to #0056b3 */
    color: white;
    text-decoration: none;
    padding: 8px 16px;
    border-radius: 4px;
    font-size: 14px;
}

.watch-video-button:hover {
    background-color: #003f7f; /* Darker blue for hover effect */
}
    
    
</style>
</head>
<body>
    <div>
        <jsp:include page="userNavSide.jsp" />
    </div>
<div class="container">
<div class="search-bar">
  <input type="text" name="searchQuery" id="searchQuery" placeholder="Search..." autocomplete="off" onkeyup="search()" />
  <span class="search-icon">&#x1F50D;</span>
  <div class="search-results" id="searchResults" style="display: none;"></div>
</div>
    <% 
        String loggedInUser = (String) session.getAttribute("user");
        HomeDao uDao = new HomeDao();
        List<FreeClassPojo> classList = uDao.getAllFreeClass();
        
        if (loggedInUser == null) { 
    %>
        <div class="text-center mt-4">
            <p style="color: red; text-align: center;">Please log in to view and upload classes.</p>
        </div>
    <% 
        } else if (classList != null && !classList.isEmpty()) { 
    %>
    
    <h2 class="text-center"> Free Live Classes</h2>
    
    <div class="card-container">
        <% 
            for (FreeClassPojo freeClass : classList) {
        %>
        <div class="card">
            <h3><%= freeClass.getTrainerName() %></h3>
            <h4><strong>Class Title:</strong> <%= freeClass.getClassTitle() %></h4>
            <p><strong>Description:</strong> <%= freeClass.getClassDescription() %></p>
            <a href="<%= freeClass.getVideoLink() %>" target="_blank">Watch Video</a>                   
       <form action="LikeServlet" method="post" onsubmit="saveLikedProfile(event, '<%= freeClass.getId() %>')">
				            <div data-lyket-type="like" data-lyket-id="twitter-button_<%= freeClass.getId() %>" data-lyket-namespace="portfolio" data-lyket-template="twitter"></div>
			                <input type="hidden" name="trainerId" value="<%= freeClass.getId() %>">
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
            <p style="color: red; text-align: center;">No free live classes found for your account.</p>
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
<script type="text/javascript">
function search() {
  let filter = document.getElementById('searchQuery').value.toUpperCase(); // Correct input field id

  // Get all the card elements inside card-container
  let items = document.querySelectorAll('.card');

  // Loop through all card items and hide those that don't match the filter
  for (var i = 0; i < items.length; i++) {
    let title = items[i].getElementsByTagName('h3')[0].getElementsByTagName('h4')[0]; // Get the h3 element inside each card
    let value = title.innerHTML || title.innerText || title.textContent; // Get the text content of the h3 element (trainer's name)

    if (value.toUpperCase().indexOf(filter) > -1) {
      items[i].style.display = ""; // Show the card if it matches the filter
    } else {
      items[i].style.display = "none"; // Hide the card if it doesn't match the filter
    }
  }
}
</script>

<footer>
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
