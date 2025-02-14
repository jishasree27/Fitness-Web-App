<%@ page import="training.pack.Tpojo.VideoPojo" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="java.util.Base64" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Transaction" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

   <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>
   
    <title>Book Session</title>
      <script
    src="https://unpkg.com/@lyket/widget@latest/dist/lyket.js?apiKey=pt_e94b9856e2acf955797bb581b62078"
  ></script>
    <style>
    
 body {
    font-family: 'Poppins', sans-serif;
    background-color: #f9f9f9;
    color: #333;
    margin: 0;
    padding: 0;
}


.container {
    width: 95%;  /* Full width of the screen */
    margin: 0 auto;  /* Centering content horizontally */
    text-align: center;
    background: #ffffff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    border-radius: 10px;
    box-sizing: border-box;  /* Ensures padding is included in width */
}

.video-thumbnail {
    width: 50%; /* Reduce width from 75% to 50% */
    height: auto; /* Maintain aspect ratio */
    object-fit: cover;
    margin: 15px auto; /* Adjust margin for better spacing */
    display: block;
    border-radius: 10px;
}



    .video-title {
    font-family: 'Poppins', sans-serif;
        font-size: 2em;
        margin: 20px 0;
        color: #2ac0d4;
    }

  .trainer-details {
    font-family: 'Poppins', sans-serif !important; /* Ensures font change */
    font-size: 1em; /* Reduced size */
    margin: 10px 0;
    color: #555;
    text-align: center; /* Slightly reduced line height */
    line-height: 1.6em;
    font-weight: 400;
}


   * {
    font-family: 'Poppins', sans-serif !important;
}

.description, 
.description p {
    font-family: 'Poppins', sans-serif !important;
    font-size: 1em;  /* Reduce font size slightly */
    text-align: left;
    padding: 10px;
    background-color: #f1f1f1;
    border-radius: 5px;
    font-weight: 400;
}


    .book-btn {
        padding: 12px 30px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 25px;
        font-size: 1.2em;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .book-btn:hover {
        background-color: #0056b3;
    }

    .btn {
        padding: 10px 20px;
        margin: 5px;
        border: none;
        border-radius: 5px;
        font-size: 1em;
        cursor: pointer;
        color: white;
    }

    .btn-success {
        background-color: #28a745;
    }

    .btn-warning {
        background-color: #ffc107;
        color: black;
    }

    .btn-info {
        background-color: #17a2b8;
    }

    .btn-danger {
        background-color: #dc3545;
    }

    .btn:hover {
        opacity: 0.8;
    }

    footer {
        margin-top: 30px;
        padding: 10px;
    
        color: white;
        text-align: center;
        border-radius: 0 0 10px 10px;
    }
    .btn-container {
    margin-top: 20px; /* Add space above the Like, Share, Save, and Add to Cart buttons */
    display: flex;
    justify-content: center;
    gap: 10px; /* Add space between the buttons */
}
       h1, h2 {
            color: #49afbc;
        }
        p {
            margin-bottom: 10px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            width: 50%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            resize: vertical;
        }
        textarea {
            min-height: 100px;
        }
        button[type="submit"] {
            background-color: #2ac0d4;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: grey;
        }



        @media (max-width: 768px) {
            body {
                padding-left: 10px;
            }
            .container {
                padding: 10px;
            }
        }
        
        /* Remove default button styling */
button.link-button {
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
}

/* Style for the link inside the button */
button.link-button a {
    text-decoration: none;
    color: #ffffff; /* White text color */
    background-color: #007bff; /* Bootstrap primary color */
    padding: 10px 20px; /* Add padding */
    border-radius: 5px; /* Rounded corners */
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effects */
}

/* Hover effect for the button */
button.link-button a:hover {
    background-color: grey; /* Darker shade of blue on hover */
    color: #fff; /* Keep text white */
}
.sub {
 
    justify-content: center; /* Horizontally centers the button */
    
   
}

    .container-2 {
      max-width: 1200px;
      margin: 20px auto;
      padding: 20px;
      background-color: #f9f9f9; /* Light shade background */
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
/* Styling for the button container */
.fas, .fa {
    font-family: "Font Awesome 6 Free" !important;
    font-weight: 900 !important;
}

.f-button {
    display: flex;
    gap: 10px; /* Space between buttons */
    justify-content: center; /* Center align buttons horizontally */
    margin-top: 20px; /* Add some spacing from the top */
}

/* Styling for the buttons */
.f-button button {
    background-color: #2ac0d4; /* Green background */
    border: none; /* Remove border */
    color: white; /* White text */
    padding: 10px 20px; /* Padding inside the button */
    text-align: center; /* Center align text */
    text-decoration: none; /* Remove underline from text */
    font-size: 16px; /* Font size */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth transition for hover effect */
}

/* Styling for button hover effect */
.f-button button:hover {
    background-color: grey; /* Darker green on hover */
}

/* Remove default styles for the anchor inside button */
.f-button button a {
    text-decoration: none; /* Remove underline from the link */
    color: inherit; /* Inherit color from the button */
    display: block; /* Ensure link fills the button */
}


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

#classLink {
    margin-top: 15px;
    padding: 10px;
    background-color: #f0f8ff; /* Light blue background */
    border-left: 5px solid #007bff; /* Highlight border */
    display: none; /* Initially hidden */
    width: fit-content;
    border-radius: 5px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

#classLink a {
    text-decoration: none;
    font-size: 16px;
    font-weight: bold;
    color: #007bff;
    transition: color 0.3s ease-in-out;
}

#classLink a:hover {
    color: #0056b3; /* Darker blue on hover */
    text-decoration: underline;
}

     
    </style>
</head>
<body>

<jsp:include page="userNavSide.jsp" />


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

    // Base64 encode the image if available
    String base64Image = (video != null && video.getImage() != null) ? 
                         Base64.getEncoder().encodeToString(video.getImage()) : null;
%>

<div class="container">
    <% if (video != null) { %>
        <h1 class="video-title"><%= video.getTitle() %></h1>

        <% if (base64Image != null) { %>
            <img class="video-thumbnail" src="data:image/jpeg;base64,<%= base64Image %>" alt="Video Thumbnail">
        <% } else { %>
            <p>No image available</p>
        <% } %>

        <p class="trainer-details">
            <strong>Trainer:</strong> <%= video.getName() != null ? video.getName() : "Not specified" %><br>
            <strong>Specialization:</strong> <%= video.getSpecification() != null ? video.getSpecification() : "Not specified" %><br>
            <strong>Role:</strong> Top Instructor<br>
            <strong>Demo Video:</strong>
            <% if (video.getVideo() != null) { %>
                <a href="<%= video.getVideo() %>" target="_blank">Watch Now</a>
            <% } else { %>
                 <p>Not specified</p>
            <% } %>
            <br>

            <strong>Date:</strong><%= video.getDate() != null ? video.getDate() : "Not specified" %><br>
            <strong>Time:</strong> from <%= video.getFtime() != null ? video.getFtime() : "Not specified" %> To <%= video.getTtime() != null ? video.getTtime() : "Not specified" %><br>
            <strong>Payment:</strong><%= video.getPaymentDetails() != null ? video.getPaymentDetails() : "Not specified" %><br>
            <strong>Offer:</strong><%= video.getOffer() != null ? video.getOffer() : "Not specified" %><br>
        </p>

        <div class="description">
            <h3>Description</h3>
            <p><%= video.getDetails() != null ? video.getDetails() : "No description available" %></p>
        </div>
        
           <div id="classLink" style="display: none;">
    <a href="<%= video.getClassLink() %>" target="_blank">Join Class</a>
</div>
        
        
        <div>
            <a href="javascript:void(0)" class="book-btn" onclick="toggleBookingForm()">Book Now</a>
        </div>
 
        <%
            String bookingStatus = (String) request.getAttribute("bookingStatus"); // Retrieve the booking status
        %>
        
        <% 
        String loggedInUser = (String) session.getAttribute("user"); 
    %>


    <% } else { %>
         <p style="color: red; text-align: center;">Video not found.</p>
    <% } %>

      <% 
        String loggedInUser = (String) session.getAttribute("user"); 
    %>
<!-- Hidden class link (shown after booking) -->


    <div id="bookingFormContainer" style="display: none;">
        <div class="container">
            <form action="bookNowServlet" method="post" onsubmit="return handleBooking(event)">
            
               <label for="title">Title</label>
                <input type="text" id="title" name="title" value="<%= video.getTitle() %>" required><br><br>
            
                <label for="trainer">Trainer UserId:</label>
                <input type="text" id="trainerUserId" name="trainerUserId" value="<%= video.getUserId() %>" required><br><br>

                <label for="trainer">Trainer:</label>
                <input type="text" id="trainer" name="trainer" value="<%= video.getName() %>" required><br><br>

                <label for="date">Date:</label>
                <input type="text" id="date" name="date" value="<%= video.getDate() %>" required><br><br>

                <label for="time">From Time:</label>
                <input type="text" id="Ftime" name="Ftime" value="<%= video.getFtime() %>" required> 

                <label for="time">To Time:</label>
                <input type="text" id="Ttime" name="Ttime" value="<%= video.getTtime() %>" required><br><br>
                
                 <label for="amount">Amount:</label>
                <input type="text" id="amount" name="uamount" value="<%= video.getPaymentDetails()%>" required><br><br>

                <!-- Dynamic Customer Information -->
                <label for="customerName">Customer UserId:</label>
                <input type="text" id="customerUserId" name="customerUserId" value="<%= loggedInUser %>" required><br><br>

                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" placeholder="Enter your name" required><br><br>

                <label for="customerEmail">Customer Email:</label>
                <input type="text" id="customerEmail" name="customerEmail" placeholder="Enter your email" required><br><br>
                
                
                <button id="bookButton" class="book-btn" >Book</button>
				<jsp:include page="payment.jsp" />
				
              </form>
               
</div>
 
<script>



    document.querySelector("#notifyButton").addEventListener("click", function() {
    	alert("confirmed");
        // Dynamic data passed from backend
        const userId = '<%= loggedInUser %>';
        const bookingDate = '<%= video.getDate() %>';
        const bookingTime = '<%= video.getFtime() %>';
        const bookingToTime = '<%= video.getTtime() %>';
        const trainerId = '<%= video.getUserId() %>';

        // Ensure the dynamic data is correct before proceeding
        if (!userId || !bookingDate || !bookingTime || !bookingToTime || !trainerId) {
            console.error("Missing dynamic data");
            return;
        }

        // Notification message
        const message = `You got a booking from ${userId} on ${bookingDate} at ${bookingTime} to ${bookingToTime}.`;

        // Request notification permission
        Notification.requestPermission().then(permission => {
            if (permission === 'granted') {
                // Send notification
                new Notification(`Booking Notification for Trainer ${trainerId}`, {
                    body: message,
                    icon: "https://cdn-icons-png.flaticon.com/128/6422/6422206.png"
                });
            }
        }).catch(err => {
            console.error("Notification permission error:", err);
        });
    });
</script>

        </div>
    </div>

   <script>
  
// Function to toggle the booking form visibility
    function toggleBookingForm() {
        var form = document.getElementById('bookingFormContainer');
        var button = document.querySelector('.book-btn');
        
        // Toggle visibility of the booking form
        if (form.style.display === "none") {
            form.style.display = "block";
        } else {
            form.style.display = "none";
        }
    }


    
 // Check if the booking is already done and change button text permanently
    window.onload = function() {
        // Get the videoId and userId to uniquely identify this video for the current user
        var videoId = "<%= videoId %>";
        var userId = "<%= loggedInUser %>";  // Assuming loggedInUser is passed to the JSP page

        // Check if the video has already been booked by the current user
        var bookingStatus = localStorage.getItem("bookingStatus_" + videoId + "_" + userId);

        // If booking is made, update the button text and disable it
        if (bookingStatus === "Booked") {
            document.querySelector('.book-btn').textContent = "Booked"; // Change button text to "Booked"
            document.querySelector('.book-btn').disabled = true; // Optionally disable the button after booking
            document.getElementById("classLink").style.display = "block";
        }
        checkBookingDate();
    };
    function handleBooking(event) {
        const button = document.getElementById("bookButton");

        // Change button text and disable it
        button.textContent = "Booked";
        button.disabled = true;
        button.classList.add("booked");

        // Get the videoId and userId to uniquely identify this video and user
        var videoId = "<%= videoId %>";
        var userId = "<%= loggedInUser %>";  // Assuming loggedInUser is passed to the JSP page

        // Save the booking status in localStorage for this video and user
        localStorage.setItem("bookingStatus_" + videoId + "_" + userId, "Booked");

        // Also change the "Book Now" button text to "Booked"
        document.querySelector('.book-btn').textContent = "Booked";
        document.querySelector('.book-btn').disabled = true;
        
        document.getElementById("classLink").style.display = "block";

        // Allow the form submission
        return true; // This ensures the form submits to the servlet
    }
</script>
<script>
// Function to check if the current date is past the booking date
function checkBookingDate() {
    var bookingDate = new Date("<%= video.getDate() %>"); // Assuming bookingDate is passed to the JSP page
    var currentDate = new Date();

    if (currentDate > bookingDate) {
        // If the booking date has passed, update the button text to "Expired"
        document.querySelector('.book-btn').textContent = "Expired";
        document.querySelector('.book-btn').disabled = true; // Optionally disable the button after expiration
    }
}


</script>


    


          <!-- Like Button with Twitter Template -->
 <div class="btn-container">
 
<form action="LikeServlet" method="post" onsubmit="saveLikedProfile(event, '<%= videoId %>', '<%= video.getTitle() %>')">
    <button class="like" type="submit" id="like<%= videoId %>" style="background-color: #9e9e9e; width: 100px; height: 45px; border-radius: 5px; padding: 5px; text-align: center; display: flex; justify-content: center; align-items: center; cursor: pointer;">
        <div data-lyket-type="like" data-lyket-id="twitter-button_<%= videoId %>" data-lyket-namespace="portfolio" data-lyket-template="twitter"></div>
        <p id="saveText_<%= videoId %>" style="margin: 0; color: white;">Like</p>
    </button>
    <input type="hidden" name="trainerId" value="<%= videoId %>">

</form>



<!-- Add to Cart Button -->
<form action="cartProfile" method="post" onsubmit="changeButtonLabel(event, '<%= videoId %>', '<%= loggedInUser %>')" enctype="multipart/form-data">
    <input type="hidden" name="share" value="cart">
    <input type="hidden" name="trainerId" value="<%= videoId %>" required>
 	<input type="hidden" name="trainerImage" value="<%= base64Image %>" required>   
    <input type="hidden" name="trainerName" value="<%= video.getName()%>" required>
    <input type="hidden" name="title" value="<%= video.getTitle()%>" required>
    <input type="hidden" name="date" value="<%= video.getDate()%>" required>
    <input type="hidden" name="payment" value="<%= video.getPaymentDetails()%>" required>
    <input type="hidden" name="trainersession" value="<%= video.getUserId()%>" required>
    <input type="hidden" name="usersession" value="<%= loggedInUser%>" required>
    <button class="btn btn-danger" type="submit" id="btn-add-to-cart_<%= videoId %>" style="background-color: #ff5722;">
        <i class="fas fa-shopping-cart"></i> Add to Cart
    </button>
</form>

<!-- Save Icon Button -->
<form action="saveProfile" method="post" onsubmit="changeButtonColor(event, '<%= videoId %>')">
    <input type="hidden" name="trainerId" value="<%= videoId %>" required>
    <input type="hidden" name="trainerName" value="<%= video.getName()%>" required>
    <input type="hidden" name="title" value="<%= video.getTitle()%>" required>
    <input type="hidden" name="trainersession" value="<%= video.getUserId()%>" required>
    <input type="hidden" name="usersession" value="<%= loggedInUser%>" required>
    <button class="save-icon" type="submit" id="saveIcon_<%= videoId %>" style="background-color: #4caf50;">
        <p id="saveText_<%= videoId %>">
         <i class="fa-solid fa-download"></i>  <!-- Instead of 'fas' -->

        </p>
    </button>
</form>

<script>
// Save liked profile to sessionStorage or localStorage
function saveLikedProfile(event, videoId, profileTitle) {
    event.preventDefault(); // Prevent form submission

    const profile = { videoId, title: profileTitle };
    let likedProfiles = JSON.parse(sessionStorage.getItem('likedProfiles')) || [];

    if (!likedProfiles.some(profile => profile.videoId === videoId)) {
        likedProfiles.push(profile);
        sessionStorage.setItem('likedProfiles', JSON.stringify(likedProfiles));
    }

    const button = document.getElementById('like' + videoId);
    button.innerHTML = '<i class="fas fa-heart"></i> Liked';
}

// Function to handle form submission and change button label for Add to Cart
let isAddedToCart_<%= videoId %> = false;

function changeButtonLabel(event, videoId, userId) {
    if (!isAddedToCart_<%= videoId %>) {
        event.preventDefault();
        const button = document.getElementById('btn-add-to-cart_' + videoId);
        button.innerHTML = '<i class="fas fa-check"></i> Added to Cart';
        isAddedToCart_<%= videoId %> = true;

        sessionStorage.setItem('buttonState_' + videoId + '_' + userId, 'added');

        setTimeout(() => {
            // Submit the form after making the changes
            event.target.submit();
        }, 100);
    }
}

// Function to change button color when clicked for Save Icon
function changeButtonColor(event, videoId) {
    event.preventDefault(); // Prevent form submission

    const button = document.getElementById('saveIcon_' + videoId);
    const currentColor = button.style.backgroundColor;

    // Toggle the button's background color
    if (currentColor === 'rgb(76, 175, 80)') { // Light Green (#4caf50)
        button.style.backgroundColor = 'black'; // Dark Green
        localStorage.setItem('saveButtonColor_' + videoId, 'black'); // Save dark green color in localStorage
    } else {
        button.style.backgroundColor = '#4caf50'; // Light Green
        localStorage.setItem('saveButtonColor_' + videoId, '#4caf50'); // Save light green color in localStorage
    }

    // Optionally, submit the form after changing color
    setTimeout(() => {
        event.target.submit();
    }, 100);
}

// Handle Share Button Click (without page reload)
function handleShareClick(event, videoId) {
    event.preventDefault(); // Prevent form submission
    const button = document.getElementById('btn_' + videoId);
    button.innerHTML = '<i class="fas fa-check"></i> Shared'; // Change button text to 'Shared'
    // Optionally save the share status in sessionStorage or localStorage
    sessionStorage.setItem('shared_' + videoId, 'true');
    // Simulate the form submission after making the changes
    setTimeout(() => {
        event.target.submit();
    }, 100);
}

// When the page loads, set the button color from localStorage (for Save Button)
document.addEventListener('DOMContentLoaded', function() {
    const videoId = '<%= videoId %>';
    const button = document.getElementById('saveIcon_' + videoId);

    // Retrieve the color from localStorage and apply it
    const savedColor = localStorage.getItem('saveButtonColor_' + videoId);
    if (savedColor) {
        button.style.backgroundColor = savedColor;
    }

    // Check for Add to Cart button state
    const storedState = sessionStorage.getItem('buttonState_' + '<%= videoId %>' + '_' + '<%= loggedInUser %>');
    const addToCartButton = document.getElementById('btn-add-to-cart_<%= videoId %>');
    if (storedState === 'added') {
        addToCartButton.innerHTML = '<i class="fas fa-check"></i> Added to Cart';
        isAddedToCart_<%= videoId %> = true;
    }
});
</script>
</div>
<div class="container-2">
    <h1>Overview</h1>
    <form action="overview" method="post">
        <h2>What is your primary fitness goal?</h2>
        <label><input type="radio" name="fitnessGoal" value="Weight loss"> Weight loss</label><br>
        <label><input type="radio" name="fitnessGoal" value="Strength building"> Strength building</label><br>
        <label><input type="radio" name="fitnessGoal" value="Flexibility"> Flexibility</label><br>
        <label><input type="radio" name="fitnessGoal" value="Endurance"> Endurance</label><br>
        <label><input type="radio" name="fitnessGoal" value="General health"> General health</label><br>
        <label><input type="radio" name="fitnessGoal" value="Other"> Other (please specify)</label><br>
        <input type="text" name="otherGoal" placeholder="Specify if 'Other'"><br><br>

        <h2>How often do you currently work out?</h2>
        <label><input type="radio" name="workoutFrequency" value="Daily"> Daily</label><br>
        <label><input type="radio" name="workoutFrequency" value="3-4 times a week"> 3-4 times a week</label><br>
        <label><input type="radio" name="workoutFrequency" value="1-2 times a week"> 1-2 times a week</label><br>
        <label><input type="radio" name="workoutFrequency" value="Occasionally"> Occasionally</label><br>
        <label><input type="radio" name="workoutFrequency" value="None"> I don't work out regularly</label><br><br>

        <h2>What types of exercises do you enjoy most?</h2>
        <label><input type="checkbox" name="exerciseType" value="Pilates"> Pilates</label><br>
        <label><input type="checkbox" name="exerciseType" value="Yoga"> Yoga</label><br>
        <label><input type="checkbox" name="exerciseType" value="Weight training"> Weight training</label><br>
        <label><input type="checkbox" name="exerciseType" value="Cardio"> Cardio (Running, Cycling, etc.)</label><br>
        <label><input type="checkbox" name="exerciseType" value="HIIT"> HIIT</label><br>
        <label><input type="checkbox" name="exerciseType" value="Dance"> Dance</label><br>
        <label><input type="checkbox" name="exerciseType" value="Other"> Other (please specify)</label><br>
        <input type="text" name="otherExercise" placeholder="Specify if 'Other'"><br><br>

        <h2>How do you feel about your current level of flexibility?</h2>
        <label><input type="radio" name="flexibilityLevel" value="Very flexible"> Very flexible</label><br>
        <label><input type="radio" name="flexibilityLevel" value="Somewhat flexible"> Somewhat flexible</label><br>
        <label><input type="radio" name="flexibilityLevel" value="Average"> Average</label><br>
        <label><input type="radio" name="flexibilityLevel" value="Needs improvement"> Needs improvement</label><br>
        <label><input type="radio" name="flexibilityLevel" value="I don't focus on flexibility"> I don't focus on flexibility</label><br><br>

        <h2>What challenges do you face when trying to stay fit?</h2>
        <label><input type="checkbox" name="fitnessChallenges" value="Time management"> Time management</label><br>
        <label><input type="checkbox" name="fitnessChallenges" value="Motivation"> Motivation</label><br>
        <label><input type="checkbox" name="fitnessChallenges" value="Lack of knowledge"> Lack of knowledge</label><br>
        <label><input type="checkbox" name="fitnessChallenges" value="Injury/Health issues"> Injury/Health issues</label><br>
        <label><input type="checkbox" name="fitnessChallenges" value="Finding the right routine"> Finding the right routine</label><br>
        <label><input type="checkbox" name="fitnessChallenges" value="Other"> Other (please specify)</label><br>
        <input type="text" name="otherChallenge" placeholder="Specify if 'Other'"><br><br>

        <h2>What is your approach to a healthy diet?</h2>
        <label><input type="radio" name="dietApproach" value="Balanced diet"> Balanced diet</label><br>
        <label><input type="radio" name="dietApproach" value="Vegetarian/Vegan"> Vegetarian/Vegan</label><br>
        <label><input type="radio" name="dietApproach" value="Low-carb"> Low-carb</label><br>
        <label><input type="radio" name="dietApproach" value="High-protein"> High-protein</label><br>
        <label><input type="radio" name="dietApproach" value="Intermittent fasting"> Intermittent fasting</label><br>
        <label><input type="radio" name="dietApproach" value="I don't focus on diet"> I don't focus on diet</label><br>
        <label><input type="radio" name="dietApproach" value="Other"> Other (please specify)</label><br>
        <input type="text" name="otherDiet" placeholder="Specify if 'Other'"><br><br>

        <h2>How do you stay motivated to keep up with your fitness goals?</h2>
        <label><input type="checkbox" name="motivation" value="Setting short-term goals"> Setting short-term goals</label><br>
        <label><input type="checkbox" name="motivation" value="Tracking progress"> Tracking progress</label><br>
        <label><input type="checkbox" name="motivation" value="Joining fitness groups/classes"> Joining fitness groups/classes</label><br>
        <label><input type="checkbox" name="motivation" value="Fitness apps"> Fitness apps</label><br>
        <label><input type="checkbox" name="motivation" value="Reward system"> Reward system</label><br>
        <label><input type="checkbox" name="motivation" value="Other"> Other (please specify)</label><br>
        <input type="text" name="otherMotivation" placeholder="Specify if 'Other'"><br><br>

        <h2>Have you ever experienced any fitness injuries?</h2>
        <label><input type="radio" name="fitnessInjuries" value="Yes"> Yes</label><br>
        <label><input type="radio" name="fitnessInjuries" value="No"> No</label><br>
        <label><input type="radio" name="fitnessInjuries" value="I'm currently recovering from an injury"> I'm currently recovering from an injury</label><br><br>

        <h2>What fitness equipment do you use regularly?</h2>
        <label><input type="checkbox" name="fitnessEquipment" value="Dumbbells"> Dumbbells</label><br>
        <label><input type="checkbox" name="fitnessEquipment" value="Resistance bands"> Resistance bands</label><br>
        <label><input type="checkbox" name="fitnessEquipment" value="Stability ball"> Stability ball</label><br>
        <label><input type="checkbox" name="fitnessEquipment" value="Exercise mat"> Exercise mat</label><br>
        <label><input type="checkbox" name="fitnessEquipment" value="Kettlebells"> Kettlebells</label><br>
        <label><input type="checkbox" name="fitnessEquipment" value="None"> None</label><br>
        <label><input type="checkbox" name="fitnessEquipment" value="Other"> Other (please specify)</label><br>
        <input type="text" name="otherEquipment" placeholder="Specify if 'Other'"><br><br>

        <h2>What type of fitness challenges would you like to see on our website?</h2>
        <textarea name="fitnessChallengesIdeas" rows="4" cols="50" placeholder="Share your ideas for fitness challenges"></textarea><br><br>

        <div class="sub">
            <button type="submit">Submit</button>
        </div>
    </form>
</div>

<div class="f-button">
    <a href="faqsMenu.jsp" style="text-decoration: none; color: inherit;">
        <button>Faqs</button>
    </a>
    <a href="featuresMenu.jsp" style="text-decoration: none; color: inherit;">
        <button>Features</button>
    </a>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
