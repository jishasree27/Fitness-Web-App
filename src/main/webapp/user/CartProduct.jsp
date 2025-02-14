<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="User.pack.Pojo.*" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*, java.util.stream.Collectors, java.util.Base64" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Products</title>
</head>
<style>
.rzp-button3 {
    background-color: #007bff; /* Blue */
    color: white;
    margin-left: 10px; /* Space between buttons */
}

.rzp-button3:hover {
    background-color: #0056b3;
}



</style>
<body>

<div class="container-4">
    <h2>Products</h2>

    <%
        HomeDao homedao3 = new HomeDao();
        List<ProductCart> pdList = homedao3.fetchAllProduct();
        List<UserDetails> uList = homedao3.getAllDetails1();
        String loggedInUser3 = (String) session.getAttribute("user");

        int totalItems3 = 0;
        double totalAmount3 = 0.0;

        if (loggedInUser3 == null) {
    %>
    <div class="alert alert-warning text-center">
         <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
    </div>
    <%
        } else {
            // Get current user details
            UserDetails currentUser = uList.stream()
                .filter(up -> loggedInUser3.equals(up.getUserId()))
                .findFirst()
                .orElse(null);

            // Filter products for the logged-in user
            List<ProductCart> userProducts = pdList.stream()
                .filter(op -> loggedInUser3.equals(op.getUserSession()))
                .collect(Collectors.toList());

            totalItems3 = userProducts.size();
            totalAmount3 = userProducts.stream()
                .mapToDouble(op -> op.getPrice() * op.getQuantity())
                .sum();

            if (!userProducts.isEmpty()) {
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
                <th>Payment</th>
                <th>Button</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (ProductCart op : userProducts) {
                String base64Image = (op.getImage() != null) ? Base64.getEncoder().encodeToString(op.getImage()) : null;
                String offerId = String.valueOf(op.getId());
                int amountInPaise = (int) (op.getPrice() * 100); // Convert INR to paise
                String orderId = "";

                try {
                    RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");
                    JSONObject orderRequest = new JSONObject();
                    orderRequest.put("amount", amountInPaise);
                    orderRequest.put("currency", "INR");
                    orderRequest.put("receipt", "txn_" + offerId);
                    orderRequest.put("payment_capture", 1);
                    Order order = razorpay.orders.create(orderRequest);
                    orderId = order.get("id"); // Store order ID
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<script>console.error('Error creating Razorpay order: " + e.getMessage() + "');</script>");
                    orderId = ""; 
                }

        %>
            <tr>
                <td>
                    <% if (base64Image != null) { %>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= op.getName() %>" width="50" height="50"/>
                    <% } else { %>
                        No Image
                    <% } %>
                </td>
                <td><%= op.getName() %></td>
                <td><%= op.getShop() %></td>
                <td><%= op.getQuantity() %></td>
                <td><%= String.format("%.2f", op.getPrice()) %></td>
                <td>Added to cart</td>
                <td>
                    <form id="paymentForm3_<%= op.getId() %>" action="productpayment" method="post" onsubmit="confirmButtonClick(this);">
                        <input type="hidden" name="userId" value="<%= loggedInUser3 %>">
                        <input type="hidden" name="productName" value="<%= op.getName() %>">
                        <input type="hidden" name="shopName" value="<%= op.getShop() %>">
                        <input type="hidden" name="amount" value="<%= op.getPrice() %>">
                        <input type="hidden" name="quantity" value="<%= op.getQuantity() %>">
                        <input type="hidden" name="trainerid" value="<%= op.getUserSession() %>">
                        <input type="hidden" name="userEmail" value="<%= currentUser.getEmail() %>">
                        <input type="hidden" name="userAddress" value="<%= currentUser.getLocation() %>">

                        <button type="button" id="confirmBtn3_<%= op.getId() %>" onclick="handleConfirmproduct('<%= op.getId() %>')">
                            Confirm
                        </button>
                        <button type="button" id="resetBtn3_<%= op.getId() %>" onclick="handleResetProduct('<%= op.getId() %>')" style="display:none;">
                            Reset
                        </button>
                    </form>
                </td>
                <td>
                   <% if (orderId != null && !orderId.trim().isEmpty()) { %>
			    <button id="rzp-button3_<%= op.getId() %>" class="rzp-button3"
			            data-amount="<%= amountInPaise %>"
			            data-title="<%= op.getName() %>"
			            data-order-id="<%= orderId %>">
			        Buy Now
			    </button>
			<% } else { %>
			    <p style="color: red; text-align: center;">Payment unavailable for this product</p>
			<% } %>

                </td>
                <td>
    <form action="deleteProductCartItem" method="post" 
          onsubmit="return confirm('Are you sure you want to delete this item?');">
        <input type="hidden" name="id" value="<%= op.getId() %>">
        <button type="submit" class="btn btn-danger">Delete</button>
    </form>
</td>
                
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <h3>Payment Summary</h3>
    <p>Total Items: <%= totalItems3 %></p>
    <p>Total Amount: <%= String.format("%.2f", totalAmount3) %></p>

    <%
            }
        }
    %>
</div>

</body>
</html>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll("[id^='confirmBtn3_']").forEach(button => {
            let productId = button.id.split("_")[1]; 
            let resetButton = document.getElementById("resetBtn3_" + productId);

            if (localStorage.getItem("confirmed_" + productId) === "true") {
                button.innerText = "Confirmed";
                button.disabled = true;
                if (resetButton) resetButton.style.display = "inline-block";
            }
        });
    });

    function handleConfirmproduct(productId) {
        localStorage.setItem("confirmed_" + productId, "true");

        let button = document.getElementById("confirmBtn3_" + productId);
        let resetButton = document.getElementById("resetBtn3_" + productId);
        
        button.innerText = "Confirmed";
        button.disabled = true;
        resetButton.style.display = "inline-block";

        document.getElementById("paymentForm3_" + productId).submit();
    }

    function handleResetProduct(productId) {
        localStorage.removeItem("confirmed_" + productId);

        let button = document.getElementById("confirmBtn3_" + productId);
        let resetButton = document.getElementById("resetBtn3_" + productId);

        button.innerText = "Confirm";
        button.disabled = false;
        resetButton.style.display = "none";
    }
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".rzp-button3").forEach(button => {
            button.addEventListener("click", function () {
                let amount = this.getAttribute("data-amount");
                let title = this.getAttribute("data-title");
                let orderId = this.getAttribute("data-order-id");

                let options = {
                    "key": "rzp_test_fI2kIVIDH3X305", // Replace with your Razorpay Key ID
                    "amount": amount,
                    "currency": "INR",
                    "name": title,
                    "description": "Product Payment",
                    "order_id": orderId, 
                    "handler": function (response) {
                        alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                        payButton.innerText = "Paid";
                        payButton.disabled = true;
                    },
                    "prefill": {
                        "name": "User",
                        "email": "user@example.com", // Replace with actual user email
                        "contact": "9999999999" // Replace with actual user contact
                    },
                    "theme": {
                        "color": "#3399cc"
                    }
                };

                let rzp1 = new Razorpay(options);
                rzp1.open();
            });
        });
    });
</script>

