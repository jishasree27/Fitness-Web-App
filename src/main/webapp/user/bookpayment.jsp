<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="User.pack.Pojo.CartPojo, training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*, java.io.*" %>
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

        .rzp-button:active {
            background-color: #b53f34;
            transform: scale(0.98);
        }

        .rzp-button:disabled {
            background: #ccc;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
<%
HomeDao h1 = new HomeDao();
List<CartPojo> vList = h1.getAllCartProfile();
String loggedInUser = (String) session.getAttribute("user");

// Redirect if user is not logged in
if (loggedInUser == null) {
    response.sendRedirect("login.jsp");
    return;
}

// List to store multiple order details
List<Map<String, String>> orderDetailsList = new ArrayList<>();

if (vList != null && !vList.isEmpty()) {
    for (CartPojo product : vList) {
        if (product.getUsersession() != null && product.getUsersession().equals(loggedInUser)) {
            if (product.getPayment() != null && !product.getPayment().isEmpty()) {
                try {
                    int amountInInr = Integer.parseInt(product.getPayment()); // Convert to INR
                    String amountInPaise = String.valueOf(amountInInr * 100); // Convert to paise
                    String trainerName = product.getTrainerName();
                    String offerId = String.valueOf(product.getTrainerId());

                    RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");

                    JSONObject orderRequest = new JSONObject();
                    orderRequest.put("amount", Integer.parseInt(amountInPaise));
                    orderRequest.put("currency", "INR");
                    orderRequest.put("receipt", "txn_" + offerId);
                    orderRequest.put("payment_capture", 1);

                    Order order = razorpay.orders.create(orderRequest);
                    String orderId = order.get("id");

                    // Store order details in a map
                    Map<String, String> orderDetails = new HashMap<>();
                    orderDetails.put("amount", amountInPaise);
                    orderDetails.put("trainerName", trainerName);
                    orderDetails.put("offerId", offerId);
                    orderDetails.put("orderId", orderId);
                    orderDetails.put("paidStatus", product.getPayment().equalsIgnoreCase("Paid") ? "Paid" : "Unpaid"); // Fix

                    orderDetailsList.add(orderDetails);

                } catch (NumberFormatException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
%>

<% if (!orderDetailsList.isEmpty()) { %>
    <% for (Map<String, String> orderDetails : orderDetailsList) { %>
        <button id="rzp-button-<%= orderDetails.get("offerId") %>"
                class="rzp-button"
                data-amount="<%= orderDetails.get("amount") %>"
                data-title="<%= orderDetails.get("trainerName") %>"
                data-offer-id="<%= orderDetails.get("offerId") %>"
                data-order-id="<%= orderDetails.get("orderId") %>"
                data-paid="<%= orderDetails.get("paidStatus") %>">
            Buy Now (Offer ID: <%= orderDetails.get("offerId") %>)
        </button>
    <% } %>

    <script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".rzp-button").forEach(payButton => {
            const offerId = payButton.getAttribute("data-offer-id");
            const paidStatus = payButton.getAttribute("data-paid");

            // Ensure only unpaid buttons are active
            if (paidStatus === "Paid") {
                payButton.innerText = "Paid";
                payButton.disabled = true;
                return; // Skip adding event listener
            }

            payButton.addEventListener("click", function (e) {
                e.preventDefault();

                let amount = payButton.getAttribute("data-amount");
                let title = payButton.getAttribute("data-title");
                let orderId = payButton.getAttribute("data-order-id");

                if (!orderId || !amount) {
                    alert("Error: Order ID or amount missing!");
                    return;
                }

                let options = {
                    "key": "rzp_test_fI2kIVIDH3X305",
                    "amount": parseInt(amount),
                    "currency": "INR",
                    "name": title,
                    "description": "Offer Payment",
                    "order_id": orderId,
                    "handler": function (response) {
                        alert("Payment Successful: " + response.razorpay_payment_id);

                        // Store payment status
                        localStorage.setItem("paid_" + offerId, "true");
                        payButton.innerText = "Paid";
                        payButton.disabled = true;
                    },
                    "theme": { "color": "#3399cc" }
                };

                let rzp1 = new Razorpay(options);
                rzp1.open();
            });
        });
    });

    </script>

<% } else { %>
    <p style="color: red; text-align: center;">>Error: Unable to generate order ID. Please try again later.</p>
<% } %>

</body>
</html>
