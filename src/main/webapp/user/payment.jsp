<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="training.pack.Tpojo.VideoPojo, training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>

<%
HomeDao h1 = new HomeDao();
List<VideoPojo> vList = h1.getAllVideos();
String loggedInUser = (String) session.getAttribute("user");

// Get videoId from request parameters
String currentVideoId = request.getParameter("videoId"); 

// Razorpay Client Setup
RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");

// Initialize payment variables
String amountInPaise = "";
String videoTitle = "";
String orderId = "";

if (loggedInUser != null && currentVideoId != null) {
    for (VideoPojo vid : vList) {
        if (String.valueOf(vid.getId()).equals(currentVideoId)) { // Check if it matches current video
            try {
                int amountInInr = Integer.parseInt(vid.getPaymentDetails());
                amountInPaise = String.valueOf(amountInInr * 100);
                videoTitle = vid.getTitle();

                // Create Razorpay order for this video
                JSONObject orderRequest = new JSONObject();
                orderRequest.put("amount", Integer.parseInt(amountInPaise)); 
                orderRequest.put("currency", "INR");
                orderRequest.put("receipt", "txn_" + currentVideoId);
                orderRequest.put("payment_capture", 1);

                Order order = razorpay.orders.create(orderRequest);
                orderId = order.get("id"); // Store the order ID

            } catch (NumberFormatException | RazorpayException e) {
                e.printStackTrace();
            }
            break; // Stop loop after finding the matching video
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Razorpay Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        .rzp-button {
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

        .rzp-button:hover {
            background-color: #d55a47;
            transform: scale(1.05);
        }

        .rzp-button:disabled {
            background: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>

    <% if (loggedInUser != null && currentVideoId != null && !amountInPaise.isEmpty()) { %>
        <h3><%= videoTitle %></h3>
        <button id="rzp-button"
            class="rzp-button"
            data-video-id="<%= currentVideoId %>"
            data-user-id="<%= loggedInUser %>"
            data-amount="<%= amountInPaise %>"
            data-title="<%= videoTitle %>"
            data-order-id="<%= orderId %>">
           Pay &#8377;<%= Integer.parseInt(amountInPaise) / 100 %>

        </button>
    <% } else { %>
        <p style="color: red; text-align: center;">No payment option available for this video or user not logged in.</p>
    <% } %>

    <script>
    document.addEventListener("DOMContentLoaded", function () {
        let button = document.getElementById("rzp-button");

        if (button) {
            let videoId = button.getAttribute("data-video-id");
            let userId = button.getAttribute("data-user-id");

            // Ensure unique sessionStorage key for each user & video
            let paymentKey = "payment_" + userId + "_" + videoId;

            if (sessionStorage.getItem(paymentKey) === "paid") {
                button.innerText = "Paid";
                button.disabled = true;
            }

            button.addEventListener("click", function (e) {
                e.preventDefault();

                let options = {
                    "key": "rzp_test_fI2kIVIDH3X305",
                    "amount": button.getAttribute("data-amount"),
                    "currency": "INR",
                    "name": button.getAttribute("data-title"),
                    "description": "Test Transaction",
                    "order_id": button.getAttribute("data-order-id"),
                    "handler": function (response) {
                        alert("Payment Successful for " + button.getAttribute("data-title"));

                        button.innerText = "Paid";
                        button.disabled = true;

                        // Store payment status uniquely for this user & video
                        sessionStorage.setItem(paymentKey, "paid");
                    }
                };

                let rzp1 = new Razorpay(options);
                rzp1.open();
            });
        }
    });
    </script>

</body>
</html>
