<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.razorpay.*, org.json.JSONObject, User.pack.Pojo.*, training.pack.Tdao.HomeDao, java.util.*, java.util.Base64" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Page</title>
    <style>
        .cart-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .cart-table th, .cart-table td { border: 1px solid #ddd; padding: 10px; text-align: center; }
        .alert { padding: 10px; margin: 10px; border-radius: 5px; }
        .alert-warning { background-color: #ffcc00; color: #333; }
        .alert-info { background-color: #d9edf7; color: #31708f; }
        .status-paid { color: green; font-weight: bold; }
        .status-pending { color: red; font-weight: bold; }
    </style>
</head>
<body>

<div class="container-4">
    <h2>Products</h2>

    <%
        HomeDao homedao3 = new HomeDao();
        List<ProductCart> pdList = homedao3.fetchAllProduct();
        String loggedInUser3 = (String) session.getAttribute("user");

        // Initialize total items and total amount
        int totalItems3 = 0;
        double totalAmount3 = 0.0;

        if (loggedInUser3 == null) {
    %>
    <div class="alert alert-warning text-center">
         <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
    </div>
    <%
        } else if (pdList != null && !pdList.isEmpty()) {
    %>

    <table class="cart-table">
        <thead>
            <tr>
                <th>Product</th>
                <th>Product Name</th>
                <th>Shop Name</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (ProductCart op : pdList) {
                if (loggedInUser3 != null && loggedInUser3.equals(op.getUserSession())) {
                    totalItems3++;

                    // Get image as Base64 for display
                    String base64Image = (op.getImage() != null && op.getImage().length > 0) ? 
                                          Base64.getEncoder().encodeToString(op.getImage()) : null;

                    try {
                    	// Ensure getPrice() returns a Double instead of double
                    	Double priceObj = op.getPrice();  // Ensure it’s a Double, not double
						double price = (priceObj != null) ? priceObj.doubleValue() : 0.0;
						
						Integer quantityObj = op.getQuantity();  // Ensure it’s an Integer, not int
						int quantity = (quantityObj != null) ? quantityObj.intValue() : 0;
						
						totalAmount3 += price * quantity;


        %>
            <tr>
                <td>
                    <% if (base64Image != null) { %>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= (op.getName() != null) ? op.getName() : "No Name" %>" width="50" height="50"/>
                    <% } else { %>
                        No Image
                    <% } %>
                </td>
                <td><%= (op.getName() != null) ? op.getName() : "No Name" %></td>
                <td><%= (op.getShop() != null) ? op.getShop() : "No Shop" %></td>
                <td><%= quantity %></td>
                <td><%= String.format("%.2f", price) %></td>
                <td>Added to cart</td>
                <td><jsp:include page="productcartpay.jsp" /></td>
            </tr>
        <%
                    } catch (Exception e) {
                        out.println("<p style='color:red;'>Error: Invalid data for an item in the cart. Please check.</p>");
                        e.printStackTrace();
                    }
                }
            }
        %>
        </tbody>
    </table>

    <h3>Payment Summary</h3>
    <p>Total Items: <%= totalItems3 %></p>
    <p>Total Amount: <%= String.format("%.2f", totalAmount3) %></p>
    <p>Payment Status: 
        <c:choose>
            <c:when test="${paymentStatus == 'paid'}">
                <span class="status-paid">Paid</span>
            </c:when>
            <c:otherwise>
                <span class="status-pending">Pending</span>
            </c:otherwise>
        </c:choose>
    </p>

    <% } else { %>
    <div class="alert alert-info text-center">
        <p style="color: red; text-align: center;">No saved profile found for your account.</p>
    </div>
    <% } %>
</div>

<!-- Payment Processing -->
<%
    HomeDao h1 = new HomeDao();
    List<ProductCart> vList = h1.fetchAllProduct();
    String loggedInUser = (String) session.getAttribute("user");

    if (loggedInUser != null && vList != null && !vList.isEmpty()) {
%>

<table border="1">
    <tr>
        <th>Product Name</th>
        <th>Price (INR)</th>
        <th>Action</th>
    </tr>

<%
    for (ProductCart product : vList) {
        if (loggedInUser.equals(product.getUserSession())) {
            String offerId = String.valueOf(product.getId());
            int amountInInr = (int) Math.round(product.getPrice()); 
            int amountInPaise = amountInInr * 100; // Convert INR to paise
            String productName = (product.getName() != null) ? product.getName() : "Unknown Product";
            String orderId = null;

            try {
                RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");

                JSONObject orderRequest = new JSONObject();
                orderRequest.put("amount", amountInPaise);
                orderRequest.put("currency", "INR");
                orderRequest.put("receipt", "txn_" + offerId);
                orderRequest.put("payment_capture", 1);

                Order order = razorpay.orders.create(orderRequest);
                orderId = order.get("id"); // Unique order ID
            } catch (Exception e) {
                e.printStackTrace();
            }
%>
    <tr>
        <td><%= productName %></td>
        <td><%= amountInInr %></td>
        <td>
            <% if (orderId != null) { %>
            <button class="rzp-button1"
                data-amount="<%= amountInPaise %>"
                data-title="<%= productName %>"
                data-offer-id="<%= offerId %>"
                data-order-id="<%= orderId %>">
                Buy Now (ID: <%= offerId %>)
            </button>
            <% } else { %>
                <span style="color:red;">Error generating order</span>
            <% } %>
        </td>
    </tr>

<% 
        }
    }
%>
</table>

<% } else { %>
     <p style="color: red; text-align: center;">No products available for payment.</p>
<% } %>

</body>
</html>
