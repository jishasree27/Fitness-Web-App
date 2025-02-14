<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="User.pack.Pojo.*, training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>

<%
HomeDao h1 = new HomeDao();
List<OfferCart> vList = h1.fetchAllCartOffers();
String loggedInUser = (String) session.getAttribute("user");

// Variables for payment
String amountInPaise = "0";
String videoTitle = "";
String orderId = "";
String offerId = "";

if (loggedInUser != null && vList != null && !vList.isEmpty()) {
    for (OfferCart vid : vList) {
        if (loggedInUser.equals(vid.getUserSession())) {
            if (vid.getPaymentDetails() != null && !vid.getPaymentDetails().isEmpty()) {
                try {
                    int amountInInr = Integer.parseInt(vid.getPaymentDetails());
                    amountInPaise = String.valueOf(amountInInr * 100); // Convert INR to paise
                    videoTitle = vid.getTitle();
                    offerId = String.valueOf(vid.getId()); // Convert int to String

                    // Call Razorpay API
                    try {
                        RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");

                        JSONObject orderRequest = new JSONObject();
                        orderRequest.put("amount", Integer.parseInt(amountInPaise)); // Ensure valid integer
                        orderRequest.put("currency", "INR");
                        orderRequest.put("receipt", "txn_" + offerId);
                        orderRequest.put("payment_capture", 1);

                        Order order = razorpay.orders.create(orderRequest);
                        orderId = order.get("id"); // Store order ID
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                } catch (NumberFormatException e) {
                    amountInPaise = "0"; // Default to 0 if parsing fails
                }
                break; // Exit after first valid offer
            }
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
</head>
<body>

<% if (!orderId.isEmpty()) { %>
   <button id="rzp-button2"
        class="rzp-button2"
        data-amount="<%= amountInPaise %>"
        data-title="<%= videoTitle %>"
        data-offer-id="<%= offerId %>"
        data-order-id="<%= orderId %>">
        Buy Now (Offer ID: <%= offerId %>)
</button>


<script>
document.addEventListener("DOMContentLoaded", function () {
    let payButton = document.getElementById("rzp-button2");

    if (!payButton) return; // Ensure the button exists

    const offerId = payButton.getAttribute("data-offer-id");

    // Check if this specific offer has been marked as paid
    if (localStorage.getItem("paid_" + offerId) === "true") {
        payButton.innerText = "Paid";
        payButton.disabled = true;
        return; // No need to add event listener if already paid
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

                // Update button and store status in localStorage
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
</script>

<% } else { %>
     <p style="color: red; text-align: center;">Error: Unable to generate order ID. Please try again later.</p>
<% } %>

</body>
</html>
