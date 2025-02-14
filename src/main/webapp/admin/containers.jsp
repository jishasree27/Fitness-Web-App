<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fpojo.Fpojo" %>
<%@ page import="training.pack.Tpojo.*" %>
<%@ page import="User.pack.Pojo.*" %>
<%@ page import="com.fdao.Fdao" %>
<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookings</title>
<style>
.container-b {
    background-color: pink;
    padding: 15px; /* Reduced padding */
    border-radius: 8px; /* Slightly smaller rounded corners */
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
    max-width: 70%; /* Reduce width to 80% of the page */
    margin: auto; /* Center the container */
    margin-left:350px;
}

.container-b h2 {
    color: #333;
    margin-bottom: 15px; /* Reduced margin */
    font-size: 22px; /* Slightly smaller font */
}

.summary {
    background-color: #f8f9fa;
    padding: 10px; /* Reduced padding */
    border-radius: 6px; /* Slightly smaller rounded corners */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: center;
    margin-top: 15px; /* Reduced margin */
    font-family: Arial, sans-serif;
    max-width: 60%; /* Reduce width */
    margin-left: auto;
    margin-right: auto;
}

.summary p { 
    font-size: 16px; /* Slightly smaller text */
    color: #333;
    margin: 8px 0;
}

.summary strong {
    color: #007bff;
    font-weight: bold;
}
.container-cart {
    background-color: #e0f7fa; /* Light cyan background */
    padding: 12px; /* Reduced padding */
    border-radius: 6px; /* Smaller rounded corners */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    max-width: 70%; /* Reduce width */
    margin: auto; /* Center the container */
    margin-left:350px;
 
}

.container-cart h2 {
    color: #333;
    margin-bottom: 15px; /* Reduced margin */
    font-size: 22px; /* Slightly smaller font */
}

.container-cart p {
    font-size: 16px; /* Smaller text */
    color: #444;
    margin: 6px 0;
}
  
 .container-p {
    background-color: #ffe6e6; /* Light pink background */
    padding: 15px; /* Reduced padding */
    border-radius: 8px; /* Slightly smaller rounded corners */
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
    width: 70%; /* Reduce container width */
    margin:auto; /* Center the container */
    margin-left:350px;
}

.container-p h2 {
    color: #333;
    margin-bottom: 10px;
    text-align: left;
    padding-left: 10px;
    font-size: 22px;
}
.container-highpay {
    background-color: #e6f7ff; /* Light blue background */
    padding: 20px; /* Reduced padding */
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 70%; /* Reduced container width */
    margin: auto; /* Center the container */
    margin-left:350px;
}
 
.container-highpay h3 {
    color: #333;
    margin-bottom: 10px;
    font-size: 22px;
}
</style>
</head>
<body>

<div class="container-b">
    <h2>Your Bookings</h2>
    <%
        HomeDao daou = new HomeDao();
        List<Bookings> bookList = daou.getAllBookings();
        String loggedInUsers = (String) session.getAttribute("user");

        int totalBookings = 0;
        double totalAmount = 0.0;

        if (bookList != null) {
            totalBookings = bookList.size();
            for (Bookings bs : bookList) {
                try {
                    String amountStr = bs.getAmount();
                    if (amountStr != null && !amountStr.trim().isEmpty()) {
                        totalAmount += Double.parseDouble(amountStr);
                    }
                } catch (NumberFormatException e) {
                    out.println("<p>Error: Invalid booking amount.</p>");
                }
            }
        }

        if (loggedInUsers == null) {
    %>
    <div class="alert alert-warning text-center">
         <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
    </div>
    <%
        } else if (totalBookings > 0) {
    %>


    <div class="summary">
        <p><strong>Total Bookings:</strong> <%= totalBookings %></p>
        <p><strong>Total Amount:</strong>&#8377;<%= totalAmount %></p>
    </div>

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

<div class="container-cart">
<h2>In Carts</h2>
    <%
        HomeDao homedao = new HomeDao();
        List<CartPojo> profileList = homedao.getAllCartProfile();

        int totalItems = 0;
        double totalAmount1 = 0.0;

        for (CartPojo sp : profileList) {
            totalItems++;
            try {
                String paymentStr = sp.getPayment();
                if (paymentStr != null && !paymentStr.trim().isEmpty()) {
                    totalAmount1 += Double.parseDouble(paymentStr);
                }
            } catch (NumberFormatException e) {
                out.println("<p>Error: Invalid payment amount.</p>");
            }
        }
    %>
<div class="summary">
    <p> <strong>Total Items:</strong> <%= totalItems %></p>
    <p> <strong>Total Amount:</strong> &#8377;<%= totalAmount1 %></p>
     </div>
    
</div>

<div class="container-p">
    <h2>Products</h2>

    <%
        HomeDao homedao5 = new HomeDao();
        List<ProductCart> pdList = homedao5.fetchAllProduct();
        String loggedInUser5 = (String) session.getAttribute("user");

        int totalItemsAll = 0;
        double totalAmountAll = 0.0;

        if (loggedInUser5 == null) {
    %>

    <div class="alert alert-warning text-center">
         <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
    </div>
    <%
        } else if (pdList != null && !pdList.isEmpty()) {
    %>

    <%
        for (ProductCart op : pdList) {
            totalItemsAll += op.getQuantity();
            totalAmountAll += op.getPrice() * op.getQuantity();
        }
    %>
<div class="summary">
    <p><strong>Total Quantity:</strong><%= totalItemsAll %></p>
    <p>Total Amount:</strong> &#8377;<%= String.format("%.2f", totalAmountAll) %></p>
</div>
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

<!-- Step 6: Display the highest-paying product -->
<%
    HomeDao homedao1 = new HomeDao();
    List<CartPojo> cartList = homedao1.getAllCartProfile();
    HomeDao homedao3 = new HomeDao();
    List<OfferCart> offerList = homedao3.fetchAllCartOffers();

    Map<String, Double> productRevenue = new HashMap<>();

    for (CartPojo cart : cartList) {
        String productName = cart.getTitle();
        double payment = 0.0;

        try {
            if (cart.getPayment() != null) {
                payment = Double.parseDouble(cart.getPayment());
            }
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid payment for a cart item.</p>");
        }

        productRevenue.put(productName, productRevenue.getOrDefault(productName, 0.0) + payment);
    }

    String highestPayingProduct = "";
    double maxPayment = 0.0;

    for (Map.Entry<String, Double> entry : productRevenue.entrySet()) {
        if (entry.getValue() > maxPayment) {
            maxPayment = entry.getValue();
            highestPayingProduct = entry.getKey();
        }
    }
%>

<div class="container-highpay">
    <h3>Highest Paying Trainer </h3>
    <div class="summary">
    <p><strong>Product Name:</strong> <%= highestPayingProduct %></p>
    <p><strong>Total Revenue:</strong> &#8377;<%= maxPayment %></p>
    </div>
</div>

<div>
	
    <jsp:include page="adminproject.jsp" />
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</body>
</html>
</html>