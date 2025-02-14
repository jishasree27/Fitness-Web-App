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
</head>

  <style>
    
    body {
        font-family: Arial, sans-serif;
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
    width: 75%; /* Full width of the container */
    height: auto; /* Maintain aspect ratio */
    object-fit: cover; /* Ensures the image fills the container while maintaining its aspect ratio */
    margin: 20px auto;
    display: block;
    border: 3px solid #007bff; /* Optional: Add a border around the image */
    border-radius: 10px; /* Optional: Slightly rounded corners for a polished look */
}


    .video-title {
        font-size: 2em;
        margin: 20px 0;
        color: #007bff;
    }

    .trainer-details {
        font-size: 1.2em;
        margin: 10px 0;
        color: #555;
        text-align: left;
        line-height: 1.8;
    }

    .description {
        margin: 20px 0;
        font-size: 1.1em;
        text-align: left;
        padding: 10px;
        background-color: #f1f1f1;
        border-radius: 5px;
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
        background: #007bff;
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
            color: #007bff;
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
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
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
    background-color: #0056b3; /* Darker shade of blue on hover */
    color: #fff; /* Keep text white */
}
.sub {
 
    justify-content: center; /* Horizontally centers the button */
    
   
}
</style>
<body>
<div>
    <jsp:include page="userNavSide.jsp" />
</div>

<% 

    String videoId = request.getParameter("videoId");
    System.out.println("Received videoId: " + videoId);

    VideoPojo video = null;
    SessionFactory factory = null;
    Session session1 = null;  
    Transaction transaction = null;

    try {
        // Initialize the SessionFactory and session
        factory = new Configuration()
                .configure("hibernate.cfg.xml")
                .addAnnotatedClass(VideoPojo.class)
                .buildSessionFactory();
        
        session1 = factory.openSession();  // Assign the session here
        transaction = session1.beginTransaction();

        // Fetch video details from the database using videoId
        video = session1.get(VideoPojo.class, Integer.parseInt(videoId));

        if (video != null) {
            // Commit the transaction if video is retrieved successfully
            transaction.commit();
        } else {
            System.out.println("No video found with the provided videoId.");
        }
    } catch (Exception e) {
        if (transaction != null) {
            transaction.rollback();  // Rollback the transaction in case of error
        }
        e.printStackTrace();
    } finally {
        // Ensure resources are properly closed
        if (session1 != null) {
            session1.close();
        }
        if (factory != null) {
            factory.close();
        }
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
             <p style="color: red; text-align: center;">No image available</p>
        <% } %>

        <p class="trainer-details">
            <strong>Trainer:</strong> <%= video.getName() != null ? video.getName() : "Not specified" %><br>
            <strong>Specialization:</strong> <%= video.getSpecification() != null ? video.getSpecification() : "Not specified" %><br>
            <strong>Role:</strong> Top Instructor<br>
            <strong>Demo Video:</strong>
            <% if (video.getVideo() != null) { %>
                <a href="<%= video.getVideo() %>" target="_blank">Watch Now</a>
            <% } else { %>
                Not specified
            <% } %>
            <br>

            <strong>Date:</strong> <%= video.getDate() != null ? video.getDate() : "Not specified" %><br>
            <strong>Time:</strong> from <%= video.getFtime() != null ? video.getFtime() : "Not specified" %> To <%= video.getTtime() != null ? video.getTtime() : "Not specified" %><br>
            <strong>Payment:</strong> <%= video.getPaymentDetails() != null ? video.getPaymentDetails() : "Not specified" %><br>
            <strong>Offer:</strong> <%= video.getOffer() != null ? video.getOffer() : "Not specified" %><br>
        </p>

        <div class="description">
            <h3>Description</h3>
            <p><%= video.getDetails() != null ? video.getDetails() : "No description available" %></p>
        </div>

        <div>
            <a href="javascript:void(0)" class="book-btn" onclick="toggleBookingForm()">Book Now</a>
        </div>
         <% } else { %>
         <p style="color: red; text-align: center;">Video not found.</p>
    <% } %>
         
        <% String loggedInUser = (String) session.getAttribute("user"); %>
        
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

                <label for="customerName">Customer UserId:</label>
                <input type="text" id="customerUserId" name="customerUserId" value="<%= loggedInUser %>" required><br><br>

                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" placeholder="Enter your name" required><br><br>

                <label for="customerEmail">Customer Email:</label>
                <input type="text" id="customerEmail" name="customerEmail" placeholder="Enter your email" required><br><br>

                <button class="book-btn" type="submit" id="bookButton">Book</button>
            </form>
        </div>
    </div>
        
         <div id="bookingFormContainer" style="display: none;">
        <div class="container">
            <form action="bookNowServlet" method="post" onsubmit="return handleBooking(event)">
                <!-- Form fields here -->
                <button class="book-btn" type="submit" id="bookButton">Book</button>
            </form>
        </div>
    </div>

    <script>
    function handleBooking(event) {
        const button = document.getElementById("bookButton");
        button.textContent = "Booked";
        button.disabled = true;
        button.classList.add("booked");
        var videoId = "<%= videoId %>";
        var userId = "<%= loggedInUser %>";
        localStorage.setItem("bookingStatus_" + videoId + "_" + userId, "Booked");
        document.querySelector('.book-btn').textContent = "Booked";
        document.querySelector('.book-btn').disabled = true;
        return true;
    }
    </script>
</div>

</div>
</body>
</html>