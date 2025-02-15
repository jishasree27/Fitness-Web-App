<%@ page import="User.pack.Pojo.SaveProfilePojo" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.Bookings" %>
<%@ page import="User.pack.Pojo.CartPojo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page import="User.pack.Pojo.OfferCart" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.Bookings" %>
<%@ page import="User.pack.Pojo.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library - Trainer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: white;

            
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .section {
            margin-top: 30px;
        }

        .section h3 {
            color: #301934; /* Deep violet */
        }

        .item-list {
            list-style: none;
            padding: 0;
        }

        .item-list li {
            padding: 10px;
            background-color: #fff;
            margin: 5px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .item-list li span {
            font-weight: bold;
        }

        .action-button {
            background-color: #301934; /* Deep violet */
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 5px;
        }

        .action-button:hover {
            background-color: #45a049;
        }

        .empty-message {
            text-align: center;
            font-size: 18px;
            color: #666;
        }
        .content {
        margin-bottom: 5em; /* Adds 5 lines worth of space (approximately) */
    }
    /* Apply styling to all tables */
table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
    background-color: white; /* Set table background to white */
}

/* Apply styling to table headers */
table thead {
    background-color: #2ac0d4; /* Set table header color */
    color: white; /* Set text color to white */
}

/* Apply styling to table rows */
table tbody tr {
    border-bottom: 1px solid #ddd;
}

/* Apply padding and background color for table cells */
table td, table th {
    padding: 12px;
    text-align: left;
    
} 

table th{
background-color: #2ac0d4; /* Set table header color */
color:white;

}

/* Add hover effect for rows */
table tbody tr:hover {
    background-color: #f1f1f1;
}
    footer {
       
        padding: 15px;
        position: relative;
    }
    .content {
    margin-bottom: 15em; /* Adjust as needed */
    background-color: white; /* Ensures gap color is white */
}
    
  .content button{
  background-color: #2ac0d4;
  color:white;
  }  
    </style>
</head>
<body>
<div>
    
    <jsp:include page="userNavSide.jsp" />
  </div>
<div class="content">
    <h2>Trainer Library</h2>

    <div class="section" id="saved-section">
        <h3>Saved Trainers</h3>
    <div class="content-section">
                <p>Here are the materials or classes you have saved for later:</p>

                <%
                    HomeDao homedao = new HomeDao();
                    List<SaveProfilePojo> saveList = homedao.getAllSaved();
                    String loggedInUser = (String) session.getAttribute("user");

                    if (loggedInUser == null) {
                %>
                <div class="alert alert-warning text-center">
                     <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
                </div>
                <%
                    } else if (saveList != null && !saveList.isEmpty()) {
                %>

                <table class="saved-table">
                    <thead>
                        <tr>
                            <th>Trainer Name</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (SaveProfilePojo sp : saveList) {
                                if (sp.getCustomerUserId().equals(loggedInUser)) {
                        %>
                        <tr>
                            <td><%= sp.getTrainerName() %></td>
                            <td><%= sp.getTitle() %></td>
                            <td><%= "saved" %></td>
                            <td>
                                <form action="deleteSaved" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= sp.getTrainerId() %>" />
                                    <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                </form>
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
                <div class="alert alert-info text-center">
                    <p style="color: red; text-align: center;">No saved profile found for your account.</p>
                </div>
                <%
                    }
                %>
            </div>
        <div class="empty-message" id="saved-message" style="display: none;"> <p style="color: red; text-align: center;">You have no saved trainers.</p></div>
    </div>

    <div class="section" id="liked-section">
       
         <div class="container mt-4">
     <h2>Your Bookings</h2>
        <%
            HomeDao homedao1 = new HomeDao();
            List<Bookings> bookList = homedao1.getAllBookings();
            String loggedInUser1 = (String) session.getAttribute("user");

            if (loggedInUser1 == null) {
        %>
        <div class="alert alert-warning text-center">
            <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
        </div>
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
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Bookings bs : bookList) {
                        if (bs.getCustomerUserId() != null && bs.getCustomerUserId().equals(loggedInUser1)) {
                %>
                <tr>
                    <td><%= bs.getTrainer() %></td>
                    <td><%= bs.getDate() %></td>
                    <td><%= bs.getFtime() %> - <%= bs.getTtime() %></td>
                    <td><%= bs.getCustomerName() %></td>
                    <td><%= bs.getCustomerEmail() %></td>
                    <td><%= "unpaid/booked" %></td>
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
        <div class="alert alert-info text-center">
            <p style="color: red; text-align: center;">No bookings found for your account.</p>
        </div>
        <%
            }
        %>
    </div>

    <div class="section" id="downloaded-section">
            <div class="container-2">
        <h2>Items in Your Cart</h2>
        <h3>Classes You added</h3>
        <%
            HomeDao homedao3 = new HomeDao();
            List<CartPojo> profileList = homedao3.getAllCartProfile();
            String loggedInUser3 = (String) session.getAttribute("user");

            // Initialize total items and total amount
            int totalItems = 0;
            double totalAmount = 0.0;

            if (loggedInUser3 == null) {
        %>

        <div class="alert alert-warning text-center">
           <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
        </div>
        <%
            } else if (profileList != null && !profileList.isEmpty()) {
        %>

        <table class="cart-table">
            <thead>
                <tr>
                    <th>Class</th>
                    <th>Title</th>
                    <th>Trainer Name</th>
                    <th>Amount</th>
                    <th>Status</th>
                   
                </tr>
            </thead>
            <tbody>
            <%
                for (CartPojo sp : profileList) {
                    if (sp.getUsersession().equals(loggedInUser3)) {
                        String base64Image = (sp.getImage() != null) ? Base64.getEncoder().encodeToString(sp.getImage()) : null;
                        totalItems++;

                        try {
                            // Convert the payment to double and add to totalAmount
                            totalAmount += Double.parseDouble(sp.getPayment());
                        } catch (NumberFormatException e) {
                            out.println("<p>Error: Invalid payment amount for an item. Please check the data.</p>");
                        }
            %>
                <tr>
                    <td><%= sp.getDate() %></td>
                    <td><%= sp.getTitle() %></td>
                    <td><%= sp.getTrainerName() %></td>
                    <td><%= sp.getPayment() %></td>
                    <td><%= "Added to cart" %></td>
                    
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
        <div class="alert alert-info text-center">
             <p style="color: red; text-align: center;">No saved profile found for your account.</p>
        </div>
        <%
            }
        %>

    </div>

   </div>

    <div class="section" id="history-section">
        <div class="container-3">
        <h2>Offer Program classes</h2>

        <%
            HomeDao homedao4 = new HomeDao();
            List<OfferCart> cartList = homedao4.fetchAllCartOffers();
            String loggedInUser4 = (String) session.getAttribute("user");

            // Initialize total items and total amount
            int totalItems2 = 0;
            double totalAmount2 = 0.0;

            if (loggedInUser4 == null) {
        %>

        <div class="alert alert-warning text-center">
            <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
        </div>
        <%
            } else if (cartList != null && !cartList.isEmpty()) {
        %>

        <table class="cart-table">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Trainer Name</th>
                 
                    <th>Offer</th>
                 
                    <th>Original Amount</th>
                    <th>Discounted Amount</th>
                    <th>Status</th>
                  
                </tr>
            </thead>
            <tbody>
            <%
                for (OfferCart op : cartList) {
                    if (op.getUserSession().equals(loggedInUser4)) {
                        totalItems2++;

                        try {
                            // Parse the payment details
                            double originalAmount = Double.parseDouble(op.getPaymentDetails());

                            // Extract the numeric part of the offer percentage
                            String offerText = op.getOffer();
                            double discountPercentage = 0.0;
                            if (offerText != null && offerText.matches(".*\\d+%.*")) {
                                discountPercentage = Double.parseDouble(offerText.replaceAll("[^\\d.]", ""));
                            }

                            // Calculate discounted amount
                            double discountedAmount = originalAmount * (1 - (discountPercentage / 100));
                            totalAmount2 += discountedAmount;
            %>
                <tr>
                    <td><%= op.getTitle() %></td>
                    <td><%= op.getName() %></td>
                
                    <td><%= op.getOffer() %></td>
                 
                    <td><%= originalAmount %></td>
                    <td><%= String.format("%.2f", discountedAmount) %></td>
                    <td><%= "Added to cart" %></td>
                   
                </tr>
            <%
                        } catch (NumberFormatException e) {
                            out.println("<p>Error: Invalid data for an item in the cart. Please check.</p>");
                        }
                    }
                }
            %>
            </tbody>
        </table>

        <%
            } else {
        %>
        <div class="alert alert-info text-center">
            <p style="color: red; text-align: center;">No saved profile found for your account.</p>
        </div>
        <%
            }
        %>

    </div>
</div>
 </div>

     <h2>Confirmed Cart Items</h2>
   
  <div class="container">
    <%
        // Get logged-in trainer ID from session
        HttpSession sessionObj = request.getSession(false);
        String loggedInTrainerId = (sessionObj != null) ? (String) sessionObj.getAttribute("user") : null;

        // Fetch bookings where trainerId matches the logged-in user
        HomeDao dao = new HomeDao();
        List<BookPayment> bookings = dao.getBookingsByUserId(loggedInTrainerId);
    %>

    <div class="container">
        <h4>Trainer Booking Details</h4>
        <p>By Cart</p>

        <%
            boolean hasBookings = false;

            if (bookings != null && !bookings.isEmpty()) { 
        %>
            <table border="1" cellpadding="10">
                <tr>
                    <th>User ID</th>
                    <th>Trainer Name</th>
                    <th>Title</th>
                    <th>Amount</th>
                    <th>Date</th>
                    <th>Action</th>
                    <th>Button</th>
                </tr>
                <%
                    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date currentDate = new java.util.Date();

                    for (BookPayment booking : bookings) {
                        if (loggedInTrainerId != null && loggedInTrainerId.equals(booking.getUserId())) {
                            hasBookings = true;
                            java.util.Date bookingDate = null;
                            try {
                                bookingDate = dateFormat.parse(booking.getDate());
                            } catch (java.text.ParseException e) {
                                e.printStackTrace();
                            }

                            boolean isExpired = bookingDate != null && bookingDate.before(currentDate);
                %>
                        <tr>
                            <td><%= booking.getUserId() %></td>
                            <td><%= booking.getTrainerName() %></td>
                            <td><%= booking.getTitle() %></td>
                            <td><%= booking.getAmount() %></td>
                            <td><%= booking.getDate() %></td>
                            <td>
                                <button style="background-color: <%= isExpired ? "red" : "green" %>;">
                                    <%= isExpired ? "Expired" : "Booked" %>
                                </button>
                            </td>
                             <td>
                <form action="deleteBookPayment" method="post">
                    <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                    <button type="submit" onclick="return confirm('Are you sure you want to delete this booking?');">
                        Delete
                    </button>
                </form>
            </td>
                        </tr>
                <%
                        }
                    }
                %>
            </table>

            <% if (!hasBookings) { %>
                <p style="color: red; text-align: center;">No bookings found for your account.</p>
            <% } %>
            
        <% } else { %>
            <p style="color: red; text-align: center;">No bookings found.</p>
        <% } %>
    </div>
</div>

 

  <div class="container">
    <%
        // Get logged-in user ID from session
        HttpSession sessionObj1 = request.getSession(false);
        String loggedInUserId = (sessionObj != null) ? (String) sessionObj.getAttribute("user") : null;

        if (loggedInUserId != null) {
            HomeDao homeDao1 = new HomeDao();
            List<OfferPayment> offerPayments1 = homeDao1.getOfferPaymentsByUserId(loggedInUserId);
            boolean hasOffers1 = false;
    %>

    <div class="container">
        <h4>Offer Payment Details</h4>
        <p>By Cart</p>

        <% if (offerPayments1 != null && !offerPayments1.isEmpty()) { %>
            <table border="1" cellpadding="10">
                <tr>
                    <th>User ID</th>
                    <th>Trainer Name</th>
                    <th>Title</th>
                    <th>Amount</th>
                    <th>Offer Specification</th>
                    <th>Button</th>
                </tr>

                <% 
                    for (OfferPayment offer : offerPayments1) { 
                        if (loggedInUserId.equals(offer.getUserId())) { 
                            hasOffers1 = true;
                %>
                    <tr>
                        <td><%= offer.getUserId() %></td>
                        <td><%= offer.getTrainerName() %></td>
                        <td><%= offer.getTitle() %></td>
                        <td><%= offer.getAmount() %></td>
                        <td><%= offer.getOfferSpecification() %></td>
                         <td>
                <form action="deleteOfferPayment" method="post">
				    <input type="hidden" name="offerId" value="<%= offer.getId() %>">
				    <button type="submit" onclick="return confirm('Are you sure you want to delete this offer?');">Delete</button>
				</form>

            </td>
                    </tr>
                <%
                        }
                    } 
                %>
            </table>

            <% if (!hasOffers1) { %>
                <p style="color: red; text-align: center;">No offer payments found for your account.</p>
            <% } %>

        <% } else { %>
            <p style="color: red; text-align: center;">No offer payments available.</p>
        <% } %>
    </div>

    <% } else { %>
        <p style="color: red; text-align: center;">You must be logged in to view this page.</p>
    <% } %>
</div>


<div class="container">
    <%
        // Retrieve session and logged-in user ID
        HttpSession session1 = request.getSession(false);
        String loggedInUser5 = (session1 != null) ? (String) session1.getAttribute("user") : null;

        if (loggedInUser5 != null) {
            HomeDao homeDAO = new HomeDao();
            List<ProductPayment> productPayments = homeDAO.getProductPaymentsByUserId(loggedInUser5);
    %>

    <h4>Product Payment Details</h4>
    <p>By Cart</p>

    <% if (productPayments != null && !productPayments.isEmpty()) { %>
        <table border="1" cellpadding="10">
            <tr>
                <th>User ID</th>
                <th>Product Name</th>
                <th>Shop Name</th>
                <th>User Address</th>
                <th>Amount</th>
                <th>Quantity</th>
                <th>Button</th>
            </tr>

            <% for (ProductPayment payment : productPayments) { %>
                <tr>
                    <td><%= payment.getUserId() %></td>
                    <td><%= payment.getProductName() %></td>
                    <td><%= payment.getShopName() %></td>
                    <td><%= payment.getUserAddress() %></td>
                    <td><%= payment.getAmount() %></td>
                    <td><%= payment.getQuantity() %></td>
                      <td>
        <form action="deleteProductPayment" method="post">
            <input type="hidden" name="paymentId" value="<%= payment.getPaymentId() %>">
            <button type="submit" onclick="return confirm('Are you sure you want to delete this payment?')">
                Delete
            </button>
        </form>
    </td>
                </tr>
            <% } %>
        </table>

    <% } else { %>
        <p style="color: red; text-align: center;">No product payments available.</p>
    <% } %>

    <%  // Closing the main IF condition that checks if the user is logged in
        } else { 
    %>
        <p style="color: red; text-align: center;">You must be logged in to view this page.</p>
    <%  
    
    }%>
</div>

</div>
</div>
<footer>
    <jsp:include page="footer.jsp" />
  </footer>
</body>
</html>
