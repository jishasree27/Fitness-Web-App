<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.Bookings" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Notifications</title>

</head>
<style>
/* Global styles */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f4f6f9;
    margin: 0;
    padding: 0;
}

/* Container and heading styles */
/* Container and heading styles */
.container {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    padding: 20px;
    position: relative; /* Corrected typo here */
    top: -600px; /* Adjust this value to move the container upwards */
    left: 120px;
    margin-top: 50px; /* Optional: to give space at the top */
}


/* Heading styles */
.container h3 {
    color: #333;
    font-weight: 600;
    margin-bottom: 20px;
}

/* Notification list styles */
.list-group-item {
    font-size: 1rem;
    padding: 15px;
    border: 1px solid #ddd;
    margin-bottom: 10px;
    background-color: #fafafa;
    border-radius: 6px;
}

/* Styling for notification types */
.list-group-item:hover {
    background-color: #f0f0f0;
    cursor: pointer;
}

/* Error message styles */
.text-danger {
    color: red;
    font-weight: bold;
}

/* Loading styles */
.loading {
    text-align: center;
    font-size: 1.2rem;
    color: #555;
}

/* Optional: Add a margin to the container */
body {
    padding: 20px;
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
<body>
<div>
        <jsp:include page="NavSide.jsp" />
    </div>
    
        
         <%
        String loggedInUser = session != null ? (String) session.getAttribute("user") : null;
        HomeDao homedao = new HomeDao();
        List<Bookings> bookList = homedao.getAllBookings();
    %>
    <div class="container mt-4">
        <h4>Notifications</h4>
        <%
            if (loggedInUser == null) {
        %>
        <div class="alert alert-warning"> <p style="color: red; text-align: center;">Please log in to view your bookings.</p></div>
        <%
            } else if (bookList != null && !bookList.isEmpty()) {
        %>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    
                    <th>Date</th>
                    <th>Time Slot</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Bookings bs : bookList) {
                        if (bs.getTrainerUserId() != null && bs.getTrainerUserId().equals(loggedInUser)) {
                %>
                <tr>
                    
                    <td><%= bs.getDate() != null ? bs.getDate() : "N/A" %></td>
                    <td><%= bs.getFtime() != null && bs.getTtime() != null ? bs.getFtime() + " - " + bs.getTtime() : "N/A" %></td>
                    <td><%= bs.getCustomerName() != null ? bs.getCustomerName() : "N/A" %></td>
                    <td><%= bs.getCustomerEmail() != null ? bs.getCustomerEmail() : "N/A" %></td>
                    <td>Done Booking</td>
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
        <div class="alert alert-info"> <p style="color: red; text-align: center;">No bookings found for your account.</p></div>
        <%
            }
        %>
    </div>
           <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
