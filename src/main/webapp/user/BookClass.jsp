<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="training.pack.Tpojo.VideoPojo" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Transaction" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Class</title>
    <style>
        .book-btn {
            background-color: #4CAF50; /* Green background */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        .book-btn:hover {
            background-color: #45a049; /* Darker green when hovered */
        }
         footer {
        margin-top: 30px;
        padding: 10px;
        background: #007bff;
        color: white;
        text-align: center;
        border-radius: 0 0 10px 10px;
    }
    
     h2 {
    text-align: center;
}


        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            box-sizing: border-box;

            margin-left:550px;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .book-btn {
            background-color: #4CAF50; /* Green background */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            width: 100%;
        }

        .book-btn:hover {
            background-color: #45a049; /* Darker green when hovered */
        }
    </style>
</head>
<body>
<div>
    <jsp:include page="userNavSide.jsp" />
</div>
  <h2>Book Your Class</h2>

<% 
    String videoId = request.getParameter("videoId");
    VideoPojo video = null;
    SessionFactory factory = new Configuration()
            .configure("hibernate.cfg.xml")
            .addAnnotatedClass(VideoPojo.class)
            .buildSessionFactory();
    Session session1 = null;  // Declare session variable only once
    Transaction transaction = null;
    String loggedInUser = (String) session.getAttribute("user"); // Fetch logged-in user's ID
    

    try {
        session1 = factory.openSession();  // Assign the session here
        transaction = session1.beginTransaction();

        // Fetch video details from the database using videoId
        video = session1.get(VideoPojo.class, Integer.parseInt(videoId));

        // Commit the transaction
        transaction.commit();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        factory.close();
    }
%>
<% 
    // Fetch the booking status from the session
    String bookingStatus = (String) session.getAttribute("bookingStatus");
%>
 <button id="backButton" class="book-btn" type="button" onclick="goBack()">Go Back</button>

<script>
function goBack() {
    window.history.back(); // This will navigate to the previous page
}
</script>
 

<div class="container">
   
     <form id="bookingForm" action="bookNowServlet" method="post">
     
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
    
    <!-- Dynamic Customer Information -->
    <label for="customerName">Customer UserId:</label>
    <input type="text" id="customerUserId" name="customerUserId" value="<%= loggedInUser %>" required><br><br>

    <label for="customerName">Customer Name:</label>
    <input type="text" id="customerName" name="customerName" placeholder="Enter your name" required><br><br>

    <label for="customerEmail">Customer Email:</label>
    <input type="email" id="customerEmail" name="customerEmail" placeholder="Enter your email" required><br><br>

    <button id="bookButton" class="book-btn" type="submit">Book Now</button>
     <% if ("Booked".equals(bookingStatus)) { %>
                Booked
            <% } else { %>
                Book Now
            <% } %>
</form>

</div>

<script>
document.getElementById('bookButton').addEventListener('click', function(event) {
    const bookButton = this;
    bookButton.disabled = true; // Disable the button to prevent multiple clicks
    bookButton.textContent = 'Booking...'; // Change button text to "Booking..."

    // Simulate a delay for booking process (optional)
    setTimeout(() => {
        bookButton.textContent = 'Booked'; // Update text to "Booked"
    }, 1000); // Adjust delay if needed

    // Submit the form after changing the button text
    document.getElementById('bookingForm').submit(); // Ensure form submission
});
</script>

    <footer>
    <jsp:include page="footer.jsp" />
</footer>
    
</body>
</html>
