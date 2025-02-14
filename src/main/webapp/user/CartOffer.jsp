<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="User.pack.Pojo.OfferCart, training.pack.Tdao.HomeDao, java.util.List, java.util.Base64, java.util.*" %>
<%@ page import="com.razorpay.*, org.json.JSONObject" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Offer Program Classes</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
.status-paid { 
    color: green; 
    font-weight: bold; 
}

.status-pending { 
    color: red; 
    font-weight: bold; 
}

/* General Button Styling */
button {
    font-family: 'Arial', sans-serif;
    font-size: 16px;
    padding: 10px 20px;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
    border: none;
}

/* Confirm Button Styling */
.confirm-button {
    background-color: #28a745; /* Green */
    color: white;
}

.confirm-button:hover {
    background-color: #218838;
}

/* Pay Now Button Styling */
.rzp-button2 {
    background-color: #007bff; /* Blue */
    color: white;
    margin-left: 10px; /* Space between buttons */
}

.rzp-button2:hover {
    background-color: #0056b3;
}

/* Disabled Button Styling */
button:disabled {
    background-color: #ccc;
    cursor: not-allowed;
}
   
    </style>
</head>
<body>

<div class="container-3">
    <h2>Offer Program Classes</h2>

    <%
        HomeDao homedao2 = new HomeDao();
        List<OfferCart> cartList = homedao2.fetchAllCartOffers();
        String loggedInUser2 = (String) session.getAttribute("user");

        int totalItems2 = 0;
        double totalAmount2 = 0.0;

        if (loggedInUser2 == null) {
    %>

    <div class="alert alert-warning text-center">
         <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
    </div>

    <% } else if (cartList != null && !cartList.isEmpty()) { %>

    <table class="cart-table">
        <thead>
            <tr>
                <th>Title</th>
                <th>Trainer Name</th>
                <th>Offer</th>
                <th>Original Amount</th>
                <th>Discounted Amount</th>
                <th>Status</th>
                <th>Action</th>
                <th>Payment</th>
                <th>Button</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (OfferCart op : cartList) {
                if (op.getUserSession().equals(loggedInUser2)) {
                    totalItems2++;

                    try {
                        double originalAmount = Double.parseDouble(op.getPaymentDetails());
                        String offerText = op.getOffer();
                        double discountPercentage = 0.0;

                        if (offerText != null && offerText.matches(".*\\d+%.*")) {
                            discountPercentage = Double.parseDouble(offerText.replaceAll("[^\\d.]", ""));
                        }

                        double discountedAmount = originalAmount * (1 - (discountPercentage / 100));
                        totalAmount2 += discountedAmount;

                        // Razorpay payment initialization
                        String amountInPaise = String.valueOf((int) (discountedAmount * 100));
                        String orderId = "";
                        try {
                            RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");
                            JSONObject orderRequest = new JSONObject();
                            orderRequest.put("amount", Integer.parseInt(amountInPaise));
                            orderRequest.put("currency", "INR");
                            orderRequest.put("receipt", "txn_" + op.getId());
                            orderRequest.put("payment_capture", 1);

                            Order order = razorpay.orders.create(orderRequest);
                            orderId = order.get("id");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
        %>
            <tr>
                <td><%= op.getTitle() %></td>
                <td><%= op.getName() %></td>
                <td><%= op.getOffer() %></td>
                <td><%= originalAmount %></td>
                <td><%= String.format("%.2f", discountedAmount) %></td>
                <td>Added to cart</td>
                <td>
    <form id="offerPaymentForm_<%= op.getId() %>" action="offerpayment" method="post" 
      onsubmit="return handleConfirmOffer(event, '<%= op.getId() %>');">
    <input type="hidden" name="userId" value="<%= loggedInUser2 %>">
    <input type="hidden" name="TrainerName" value="<%= op.getName() %>">
    <input type="hidden" name="title" value="<%= op.getTitle() %>">
    <input type="hidden" name="amount" value="<%= originalAmount %>">
    <input type="hidden" name="offerSpecification" value="<%= op.getOfferSpecification() %>">
    <input type="hidden" name="trainerId" value="<%= op.getTrainerSession() %>">
    <button type="submit" id="confirmOfferBtn_<%= op.getId() %>">Confirm</button>
</form>

<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("[id^='confirmOfferBtn_']").forEach(button => {
        let trainerId = button.id.replace("confirmOfferBtn_", "");
        if (localStorage.getItem("offer_confirmed_" + trainerId) === "true") {
            button.innerText = "Confirmed";
            button.disabled = true;
        }
    });
});

function handleConfirmOffer(event, trainerId) {
    let button = document.getElementById("confirmOfferBtn_" + trainerId);

    // Ensure form submits properly
    localStorage.setItem("offer_confirmed_" + trainerId, "true");
    button.innerText = "Confirmed";
    button.disabled = true;

    return true; // Allows form submission
}
</script>



                </td>
                
                <td>
                    <% if (!orderId.isEmpty()) { %>
                        <button id="rzp-button2-<%= op.getId() %>" 
                                class="rzp-button2"
                                data-amount="<%= amountInPaise %>"
                                data-title="<%= op.getTitle() %>"
                                data-offer-id="<%= op.getId() %>"
                                data-order-id="<%= orderId %>">
                            Pay Now
                        </button>
                    <% } else { %>
                         <p style="color: red; text-align: center;">Error: Unable to generate order ID.</p>
                    <% } %>
                </td>
                <td>
    <form action="deleteOfferCartItem" method="post" 
          onsubmit="return confirm('Are you sure you want to delete this item?');">
        <input type="hidden" name="id" value="<%= op.getId() %>">
        <button type="submit" class="btn btn-danger">Delete</button>
    </form>
</td>
                
            </tr>
        <%
                    } catch (NumberFormatException e) {
                        out.println("<p>Error: Invalid data for an item in the cart.</p>");
                    }
                }
            }
        %>
        </tbody>
    </table>
    <script>

document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".rzp-button2").forEach(payButton => {
        const orderId = payButton.getAttribute("data-order-id");
        const paidStatus = payButton.getAttribute("data-paid");

        if (paidStatus === "Paid") {
            payButton.disabled = true;
            return;
        }

        payButton.addEventListener("click", function (e) {
            e.preventDefault();
            let amount = payButton.getAttribute("data-amount") * 100;
            let title = payButton.getAttribute("data-title");

            if (!orderId) {
                alert("Error: Order ID missing. Please try again.");
                return;
            }

            let options = {
                "key": "rzp_test_fI2kIVIDH3X305",
                "amount": amount,
                "currency": "INR",
                "name": title,
                "description": "Trainer Booking Payment",
                "order_id": orderId,
                "handler": function (response) {
                    alert("Payment Successful: " + response.razorpay_payment_id);
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

    <h3>Payment Summary</h3>
    <p>Total Items: <%= totalItems2 %></p>
    <p>Total Amount: <%= String.format("%.2f", totalAmount2) %></p>
   

    <% } else { %>
    <div class="alert alert-info text-center">
        <p style="color: red; text-align: center;">No saved profile found for your account.</p>
    </div>
    <% } %>

</div>


</body>
</html>
