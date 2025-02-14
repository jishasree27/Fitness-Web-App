<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="training.pack.Tpojo.VideoPojo" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.Base64" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Transaction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
   <script
    src="https://unpkg.com/@lyket/widget@latest/dist/lyket.js?apiKey=pt_e94b9856e2acf955797bb581b62078"
  ></script>
<style>
#saveText {
  font-size: 15px;
  color: black;
  margin-top: 10px;
  transition: color 0.3s ease;
  padding-right: 15px;
  display: flex; /* Use flexbox for centering */
  justify-content: center; /* Horizontally center */
  align-items: center; /* Vertically center */
  height: 100%; /* Ensures it takes up the full height of the button */
  padding-left:13px;
}
.save-icon {

  width: 50px;
  height: 60px;
  background-color: white;
  position: relative;
  clip-path: polygon(0% 0%, 100% 0%, 100% 80%, 50% 100%, 0% 80%);
  cursor: pointer;
  transition: background-color 0.3s ease;
  margin: 0 auto;
  display: flex; /* Use flexbox for centering content */
  justify-content: center; /* Center content horizontally */
  align-items: center; /* Center content vertically */
  box-shadow: 0 0 0 2px black; /* Adds a black border around the shape */
}
</style>
</head>
<body>


<% 
    String videoId = request.getParameter("videoId");
    VideoPojo video = null;
    SessionFactory factory = new Configuration()
            .configure("hibernate.cfg.xml")
            .addAnnotatedClass(VideoPojo.class)
            .buildSessionFactory();
    Session session1 = null;  // Declare session variable only once
    Transaction transaction = null;

    try {
        session1 = factory.openSession();  // Assign the session here
        transaction = session1.beginTransaction();

        // Fetch video details from the database using videoId
        video = session1.get(VideoPojo.class, Integer.parseInt(videoId));

        // Commit the transaction
        session1.getTransaction().commit();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        factory.close();
    }
    String loggedInUser = (String) session.getAttribute("user"); 
%>


<div class="btn-container">
    <!-- Like Button with Twitter Template -->
   <form action="updateProfile" method="post" onsubmit="saveLikedProfile(event, '<%= videoId %>', '<%= video.getTitle() %>')">
    <button class="like" type="submit" id="like<%= videoId %>">
        <div
            data-lyket-type="like"
            data-lyket-id="twitter-button_<%= videoId %>"
            data-lyket-namespace="portfolio"
            data-lyket-template="twitter"
        ></div>
        <p id="saveText_<%= videoId %>"></p>
    </button>
    <input type="hidden" name="trainerId" value="<%= videoId %>">
</form>

<script>
// Save liked profile to sessionStorage or localStorage
function saveLikedProfile(event, videoId, profileTitle) {
    event.preventDefault(); // Prevent form submission

    // Create an object with profile details
    const profile = { videoId, title: profileTitle };

    // Retrieve current liked profiles from sessionStorage (or localStorage)
    let likedProfiles = JSON.parse(sessionStorage.getItem('likedProfiles')) || [];

    // Add the new liked profile to the list (if not already liked)
    if (!likedProfiles.some(profile => profile.videoId === videoId)) {
        likedProfiles.push(profile);

        // Save the updated list back to sessionStorage (or localStorage)
        sessionStorage.setItem('likedProfiles', JSON.stringify(likedProfiles));
    }

    // Optionally, update the button state (toggle like)
    const button = document.getElementById('like' + videoId);
    button.innerHTML = '<i class="fas fa-heart"></i> Liked';  // Change the text or icon

    // Optionally, submit the form after storing
    event.target.submit();
}
</script>


    <form action="updateProfile" method="post">
        <input type="hidden" name="trainerId" value="<%= videoId %>">
        <button class="save-icon" type="button" id="saveIcon_<%= videoId %>">
            <p id="saveText_<%= videoId %>"><i class="fas fa-download"></i></p>
        </button>
    </form>

    <script>
    // Add interactivity to the save icon (e.g., toggle color on click)
    const saveIcon = document.getElementById('saveIcon_<%= videoId %>');
    const saveText = document.getElementById('saveText_<%= videoId %>');

    // Check if the state is stored in localStorage and apply it
    const savedState = localStorage.getItem('saveIconState_' + '<%= videoId %>');
    if (savedState === 'black') {
        saveIcon.style.backgroundColor = 'black';
        saveText.style.color = 'white';
    } else {
        saveIcon.style.backgroundColor = 'white';
        saveText.style.color = 'black';
    }

    saveIcon.addEventListener('click', () => {
        // Toggle background color of the save icon
        if (saveIcon.style.backgroundColor === 'black') {
            saveIcon.style.backgroundColor = 'white';
            saveText.style.color = 'black';
            localStorage.setItem('saveIconState_' + '<%= videoId %>', 'white'); // Store state as white
        } else {
            saveIcon.style.backgroundColor = 'black';
            saveText.style.color = 'white';
            localStorage.setItem('saveIconState_' + '<%= videoId %>', 'black'); // Store state as black
        }
    });
    </script>

    <!-- Share Button -->
    <form action="updateProfile" method="post"  >
        <input type="hidden" name="trainerId" value="<%= videoId %>">
        <button class="btn btn-info" type="button" id="btn_<%= videoId %>" >
            <i class="fas fa-share"></i> Share
        </button>
    </form>

    <form action="updateProfile" method="post" onsubmit="changeButtonLabel(event, '<%= videoId %>', '<%= loggedInUser %>')">
        <input type="hidden" name="share" value="cart">
        <input type="hidden" name="trainerId" value="<%= videoId %>">
        <button class="btn btn-danger" type="submit" id="btn-add-to-cart_<%= videoId %>">
            <i class="fas fa-shopping-cart"></i> Add to Cart
        </button>
    </form>

    <script>
    // Variable to track button state
    let isAddedToCart_<%= videoId %> = false;

    // Function to handle form submission and change button label
    function changeButtonLabel(event, videoId, userId) {
        if (!isAddedToCart_<%= videoId %>) {  // Only change label if not already added
            event.preventDefault();  // Prevent default form submission

            const button = document.getElementById('btn-add-to-cart_' + videoId);
            button.innerHTML = '<i class="fas fa-check"></i> Added to Cart';  // Update button text
            isAddedToCart_<%= videoId %> = true;  // Set state to 'added'

            // Store the current state so it persists during form submission
            sessionStorage.setItem('buttonState_' + videoId + '_' + userId, 'added');

            // Delay submission to allow UI update
            setTimeout(() => {
                event.target.submit();  // Submit the form
            }, 100);
        }
    }

    // Reset button state when the DOM is fully loaded
    document.addEventListener('DOMContentLoaded', function() {
        const button = document.getElementById('btn-add-to-cart_<%= videoId %>');
        const storedState = sessionStorage.getItem('buttonState_' + '<%= videoId %>' + '_' + '<%= loggedInUser %>');

        if (storedState === 'added') {
            button.innerHTML = '<i class="fas fa-check"></i> Added to Cart';
            isAddedToCart_<%= videoId %> = true; // Ensure the button state is updated even after a reload
        } else {
            button.innerHTML = '<i class="fas fa-shopping-cart"></i> Add to Cart';
        }
    });
    </script>
</div>



</body>
</html>