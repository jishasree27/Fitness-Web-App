<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.Bookings" %>
<%@ page import="User.pack.Pojo.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Bookings Page</title>
    <style>
        * { font-family: 'Poppins', sans-serif; }
        .booking-page { background-color: #f4f4f4; padding: 20px; }
        .container-1 , .container-2 ,.container-3 ,.container-4 { max-width: 70%; margin: -50px auto 0 -50px; position: relative;left:300px;top:-550px; }
        .container-1 , .container-2 ,.container-3 ,.container-4 h4,p { color: black; font-family: 'Poppins', sans-serif; }
        table { margin: 0 auto; width: 100%; }
        .alert { width: 100%; text-align: center; }
        footer { margin-top: 30px; padding: 10px; color: white; text-align: center; border-radius: 0 0 10px 10px; position: sticky; top: 0; }
    </style>
</head>
<body>
    <jsp:include page="NavSide.jsp" />
   <div class="container-1">
    <%
        String loggedInUser = session != null ? (String) session.getAttribute("user") : null;
        HomeDao homedao = new HomeDao();
        List<Bookings> bookList = homedao.getAllBookings();
    %>
    <div class="container mt-4">
        <h4>Your Bookings</h4>
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
                    <th>Trainer Name</th>
                    <th>Date</th>
                    <th>Time Slot</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                   
                    <th>Action</th> <!-- Added an Action column for the button -->
                </tr>
            </thead>
            <tbody>
                <%
                    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd"); // Adjust format if needed
                    for (Bookings bs : bookList) {
                        if (bs.getTrainerUserId() != null && bs.getTrainerUserId().equals(loggedInUser)) {
                            // Parse the booking date
                            java.util.Date bookingDate = null;
                            try {
                                bookingDate = dateFormat.parse(bs.getDate());
                            } catch (java.text.ParseException e) {
                                e.printStackTrace();
                            }

                            // Get the current date
                            java.util.Date currentDate = new java.util.Date();
                            boolean isExpired = bookingDate != null && bookingDate.before(currentDate); // Check if the booking date has expired
                %>
                <tr>
                    <td><%= bs.getTrainer() != null ? bs.getTrainer() : "N/A" %></td>
                    <td><%= bs.getDate() != null ? bs.getDate() : "N/A" %></td>
                    <td><%= bs.getFtime() != null && bs.getTtime() != null ? bs.getFtime() + " - " + bs.getTtime() : "N/A" %></td>
                    <td><%= bs.getCustomerName() != null ? bs.getCustomerName() : "N/A" %></td>
                    <td><%= bs.getCustomerEmail() != null ? bs.getCustomerEmail() : "N/A" %></td>
                   
                    <td>
                        <button <% if (isExpired) { %> style="background-color: red;" <% } %>>
                            <%= isExpired ? "Expired" : "Booked" %>
                        </button>
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
        <div class="alert alert-info"> <p style="color: red; text-align: center;">No bookings found for your account.</p></div>
        <%
            }
        %>
    </div>
</div>

    <div class = "container-2">
    

<%
    // Get logged-in trainer ID from session
    HttpSession sessionObj = request.getSession(false);
    String loggedInTrainerId = session != null ? (String) session.getAttribute("user") : null;

    // Fetch bookings where trainerId matches the logged-in user
    HomeDao dao = new HomeDao();
    List<BookPayment> bookings = dao.getBookingsByTrainerId(loggedInTrainerId);
%>


    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table, th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
           background-color: black;
            color:white;
        }
    </style>
<div class="container">
<h4>Trainer Booking Details</h4>
<p>By Cart</p>

<% 
    String loggedInUser2 = (String) session.getAttribute("user");
    boolean hasBookings = false;

    if (bookings != null && !bookings.isEmpty()) { 
%>
    <table>
        <tr>
          
            <th>User ID</th>
            <th>Trainer Name</th>
            <th>Title</th>
            <th>Amount</th>
            <th>Date</th>
            <th>Action</th> <!-- Column for the button -->
        </tr>
        <% 
            java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd"); 
            for (BookPayment booking : bookings) {
                if (loggedInUser2 != null && loggedInUser2.equals(booking.getTrainerId())) {
                    hasBookings = true;
                    java.util.Date bookingDate = null;
                    try {
                        bookingDate = dateFormat.parse(booking.getDate());
                    } catch (java.text.ParseException e) {
                        e.printStackTrace(); 
                    }

                    java.util.Date currentDate = new java.util.Date();
                    boolean isExpired = bookingDate != null && bookingDate.before(currentDate);
        %>
            <tr>
                
                <td><%= booking.getUserId() %></td>
                <td><%= booking.getTrainerName() %></td>
                <td><%= booking.getTitle() %></td>
                <td><%= booking.getAmount() %></td>
                <td><%= booking.getDate() %></td>
                <td>
                    <button <% if (isExpired) { %> style="background-color: red;" <% } %>>
                        <%= isExpired ? "Expired" : "Booked" %>
                    </button>
                </td>
            </tr>
        <% 
                }
            }
            if (!hasBookings) {
        %>
            <p style="color: red; text-align: center;">No bookings found for your account.</p>
        <% 
            }
        %>
    </table>
<% } else { %>
    <p style="color: red; text-align: center;">No bookings found.</p>
<% } %>
</div>
    </div>
  <div class="container-3">
    <%
        String loggedInUsertrainer = session != null ? (String) session.getAttribute("user") : null;

        if (loggedInUsertrainer != null) {
            HomeDao homeDao = new HomeDao();
            List<OfferPayment> offerPayments = homeDao.getOfferPaymentsByTrainerId(loggedInUsertrainer);
            boolean hasOffers = false;
    %>

    <style>
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: black;
            color: white;
        }
    </style>

    <div class="container">
        <h4>Offer Payment Details</h4>
		<p>By Cart</p>
        <% if (offerPayments != null && !offerPayments.isEmpty()) { %>
            <table>
                <tr>
                  
                    <th>User ID</th>
                    <th>Trainer Name</th>
                    <th>Title</th>
                    <th>Amount</th>
                    <th>Offer Specification</th>
                </tr>

                <% for (OfferPayment offer : offerPayments) { 
                        if (loggedInUsertrainer.equals(offer.getTrainerId())) { 
                            hasOffers = true;
                %>
                    <tr>
                       
                        <td><%= offer.getUserId() %></td>
                        <td><%= offer.getTrainerName() %></td>
                        <td><%= offer.getTitle() %></td>
                        <td><%= offer.getAmount() %></td>
                        <td><%= offer.getOfferSpecification() %></td>
                    </tr>
                <% 
                        }
                    } 
                %>
            </table>
            <% if (!hasOffers) { %>
                <p style="color: red; text-align: center;">No offer payments found for your trainer account.</p>
            <% } %>
        <% } else { %>
            <p style="color: red; text-align: center;">No offer payments available.</p>
        <% } %>
    </div>

    <% } else { %>
        <p style="color: red; text-align: center;">You must be logged in as a trainer to view this page.</p>
    <% } %>
</div><div class="container-4">
    <style>
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: black; color: white; }
        td { color: black; }
    </style>

    <%
        // Retrieve session and logged-in trainer ID
        HttpSession session1 = request.getSession();
        String loggedInTrainerId2 = (String) session1.getAttribute("trainerId");

        // Fetch product payment details based on trainer ID
        HomeDao homeDAO = new HomeDao();
        List<ProductPayment> productPayments = homeDAO.getProductPaymentsByTrainerId(loggedInTrainerId2);
        boolean hasPayments = false;
    %>

    <div class="container">
        <h4>Product Payment Details</h4>
		<p>By Cart</p>
        <% if (productPayments != null && !productPayments.isEmpty()) { %>
            <table>
                <tr>
                   
                    <th>User ID</th>
                    <th>Product Name</th>
                    <th>Shop Name</th>
                    <th>User Address</th>
                    <th>Amount</th>
                    <th>Quantity</th>
                </tr>

                <% for (ProductPayment payment : productPayments) { 
                    if (loggedInTrainerId.equals(payment.getTrainerId())) { 
                        hasPayments = true;
                %>
                    <tr>
                       
                        <td><%= payment.getUserId() %></td>
                        <td><%= payment.getProductName() %></td>
                        <td><%= payment.getShopName() %></td>
                        <td><%= payment.getUserAddress() %></td>
                        <td><%= payment.getAmount() %></td>
                        <td><%= payment.getQuantity() %></td>
                    </tr>
                <% 
                    }
                } 
                %>
            </table>

            <% if (!hasPayments) { %>
                <p style="color: red; text-align: center;">No product payments found for your trainer ID.</p>
            <% } %>

        <% } else { %>
            <p style="color: red; text-align: center;">No product payments found for your trainer ID.</p>
        <% } %>
    </div>
</div>

    
   
    <footer> 
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
