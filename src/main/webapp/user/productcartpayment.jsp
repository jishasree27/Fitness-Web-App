<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="User.pack.Pojo.*, training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>

<%
HomeDao h1 = new HomeDao();
List<ProductCart> vList = h1.fetchAllProduct(); // Fetch product list
String loggedInUser = (String) session.getAttribute("user");

// Variables for payment
String amountInPaise = "0";
String productName = "";
String orderId = "";
String offerId = null; // Set as null initially

if (loggedInUser != null && vList != null && !vList.isEmpty()) {
    for (ProductCart product : vList) {
        if (product.getUserSession().equals(loggedInUser)) {
            offerId = String.valueOf(product.getId());
            int amountInInr = (int) product.getPrice();
            amountInPaise = String.valueOf(amountInInr * 100); // Convert INR to paise
            productName = product.getName();

            try {
                RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");

                JSONObject orderRequest = new JSONObject();
                orderRequest.put("amount", Integer.parseInt(amountInPaise));
                orderRequest.put("currency", "INR");
                orderRequest.put("receipt", "txn_" + offerId);
                orderRequest.put("payment_capture", 1);

                Order order = razorpay.orders.create(orderRequest);
                orderId = order.get("id"); // Store order ID
            } catch (Exception e) {
                e.printStackTrace();
            }
            break; // Stop after processing the first valid product
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Razorpay Payment</title>
 
    <script src="https://checkout.razorpay.com/v1/checkout.js" defer></script>
    
    <style>
        .rzp-button1 {
            background-color: #F37254;
            color: white;
            padding: 12px 25px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s ease;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        .rzp-button1:hover {
            background-color: #d55a47;
            transform: scale(1.05);
        }
        .rzp-button1:active {
            background-color: #b53f34;
            transform: scale(0.98);
        }
        .rzp-button1:disabled {
            background: #ccc;
            cursor: not-allowed;
        }
        button[id^="confirmBtn_"] {
    background-color: #28a745; /* Green */
    color: white; /* Text color */
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px; /* Rounded edges */
    transition: background-color 0.3s ease;
}

button[id^="confirmBtn_"]:hover {
    background-color: #218838; /* Darker green on hover */
}

button[id^="confirmBtn_"]:disabled {
    background-color: gray; /* Gray when disabled */
    cursor: not-allowed;
}
        
    </style>
</head>
<body>

<% if (offerId != null) { %>
    <button id="rzp-button1" class="rzp-button1" 
        data-amount="<%= amountInPaise %>"
        data-title="<%= productName %>"
        data-offer-id="<%= offerId %>"
        data-order-id="<%= orderId %>">
        Buy Now (Product ID: <%= offerId %>)
    </button>


    <script>
 
    document.addEventListener("DOMContentLoaded", function () {
        const button = document.getElementById("rzp-button1");

        if (!button) return; // Ensure the button exists

        const offerId = button.getAttribute("data-offer-id");

        // Check if this specific offer has been marked as paid
        if (localStorage.getItem("paid_" + offerId) === "true") {
            button.innerText = "Paid";
            button.disabled = true;
        }

        button.addEventListener("click", function (event) {
            event.preventDefault();

            let amount = button.getAttribute("data-amount");
            let title = button.getAttribute("data-title");
            let orderId = button.getAttribute("data-order-id");

            if (!orderId || !amount) {
                alert("Error: Order ID or amount missing!");
                return;
            }

            let options = {
                "key": "rzp_test_fI2kIVIDH3X305",
                "amount": parseInt(amount),
                "currency": "INR",
                "name": title,
                "description": "Product Payment",
                "order_id": orderId,
                "handler": function (response) {
                    alert("Payment Successful: " + response.razorpay_payment_id);

                    // Update button and localStorage
                    localStorage.setItem("paid_" + offerId, "true");
                    button.innerText = "Paid";
                    button.disabled = true;
                }
            };

            let rzp1 = new Razorpay(options);
            rzp1.open();
        });
    });



    </script>

<% } else { %>
     <p style="color: red; text-align: center;">No products available for payment.</p>
<% } %>

</body>
</html>
