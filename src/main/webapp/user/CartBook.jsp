<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="User.pack.Pojo.CartPojo" %>
<%@ page import="User.pack.Pojo.*" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List, java.util.Set, java.util.HashSet" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="User.pack.Pojo.CartPojo, training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* Base button styles */
/* Base button styles */
button {
    font-size: 16px;
    padding: 10px 20px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

/* Confirm button specific styles */
.confirmBookBtn {
    background-color: #4CAF50; /* Green */
    color: white;
}

.confirmBookBtn:hover {
    background-color: #45a049; /* Darker green on hover */
    transform: scale(1.05); /* Slight zoom effect */
}

/* Reset button specific styles */
.resetBookBtn {
    background-color: #f44336; /* Red */
    color: white;
    display: none; /* Initially hidden */
}
.resetBookBtn:hover {
    background-color: #e53935; /* Darker red on hover */
    transform: scale(1.05); /* Slight zoom effect */
}

/* Button hover effects */
button:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

/* Button focus effect */
button:focus {
    outline: none;
    box-shadow: 0 0 3px 2px rgba(0, 0, 255, 0.5);
}
.rzp-button1 {
    background-color: #007bff; /* Blue */
    color: white;
    margin-left: 10px; /* Space between buttons */
}

.rzp-button1:hover {
    background-color: #0056b3;
}


</style>
<body>
<div class="container-2">
    <h3>Classes You Added</h3>
    <%
        HomeDao homedao = new HomeDao();
        List<CartPojo> profileList = homedao.getAllCartProfile();
        String loggedInUser = (String) session.getAttribute("user");

        int totalItems = 0;
        double totalAmount = 0.0;
        boolean found = false;

        if (loggedInUser == null) {
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
                <th>Action</th>
                <th>Payment</th>
                <th>Button</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (CartPojo sp : profileList) {
                if (sp.getUsersession().equals(loggedInUser)) {
                    found = true;
                    totalItems++;
                    try {
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
                <td>Added to cart</td>
                <td>
                  <form id="bookPaymentForm_<%= sp.getTrainerId() %>" action="bookpayment" method="post">
    <input type="hidden" name="userId" value="<%= loggedInUser %>">
    <input type="hidden" name="trainerName" value="<%= sp.getTrainerName() %>">
    <input type="hidden" name="title" value="<%= sp.getTitle() %>">
    <input type="hidden" name="amount" value="<%= sp.getPayment() %>">
    <input type="hidden" name="date" value="<%= sp.getDate() %>">
    <input type="hidden" name="trainerId" value="<%= sp.getTrainersession() %>">

    <button type="button" id="confirmBookBtn_<%= sp.getTrainerId() %>" onclick="handleConfirmBook(event, <%= sp.getTrainerId() %>)">
        Confirm
    </button>
    <button type="button" id="resetBookBtn_<%= sp.getTrainerId() %>" onclick="handleResetBook(<%= sp.getTrainerId() %>)" style="display: none;">
        Reset
    </button>

    
</form>

<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll("[id^='confirmBookBtn_']").forEach(button => {
        let trainerId = button.id.replace("confirmBookBtn_", "");
        if (localStorage.getItem("book_confirmed_" + trainerId) === "true") {
            button.innerText = "Confirmed";
            button.disabled = true;
            document.getElementById("resetBookBtn_" + trainerId).style.display = "inline-block";
        }
    });
});

function handleConfirmBook(event, trainerId) {
    event.preventDefault();
    let form = document.getElementById("bookPaymentForm_" + trainerId);
    form.submit(); // Submit the form

    let button = document.getElementById("confirmBookBtn_" + trainerId);
    let resetButton = document.getElementById("resetBookBtn_" + trainerId);

    if (button) {
        button.innerText = "Confirmed";
        button.disabled = true;
        localStorage.setItem("book_confirmed_" + trainerId, "true");
        resetButton.style.display = "inline-block";
    }
}

function handleResetBook(trainerId) {
    let button = document.getElementById("confirmBookBtn_" + trainerId);
    let resetButton = document.getElementById("resetBookBtn_" + trainerId);

    if (button) {
        button.innerText = "Confirm";
        button.disabled = false;
        localStorage.removeItem("book_confirmed_" + trainerId);
        resetButton.style.display = "none";
    }
}
</script>


                    </form>
                </td>
                <td>
                <%
                    HomeDao h1 = new HomeDao();
                    List<CartPojo> vList = h1.getAllCartProfile();

                    if (loggedInUser == null) {
                        response.sendRedirect("login.jsp");
                        return;
                    }

                    RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");
                    String orderId = null;
                    boolean isPaid = "Paid".equalsIgnoreCase(sp.getPayment());

                    if (!isPaid) {
                        try {
                            int amountInPaise = Integer.parseInt(sp.getPayment()) * 100;
                            JSONObject orderRequest = new JSONObject();
                            orderRequest.put("amount", amountInPaise);
                            orderRequest.put("currency", "INR");
                            orderRequest.put("receipt", "txn_" + sp.getTrainerId());
                            orderRequest.put("payment_capture", 1);

                            Order order = razorpay.orders.create(orderRequest);
                            orderId = order.get("id");

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>

                <button id="rzp-button1-<%= sp.getTrainerId() %>" class="rzp-button1"
                        data-amount="<%= sp.getPayment() %>"
                        data-title="<%= sp.getTrainerName() %>"
                        data-order-id="<%= orderId %>"
                        data-paid="<%= isPaid ? "Paid" : "Unpaid" %>"
                        <%= isPaid ? "disabled" : "" %>>
                    <%= isPaid ? "Paid" : "Buy Now" %>
                </button>

                </td>
 <td>
    <form action="deleteCartItem" method="post">
        <input type="hidden" name="id" value="<%= sp.getTrainerId() %>">
        <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this item?');">
            Delete
        </button>
    </form>
</td>
     </tr>
        <%
                }
            }
            if (!found) {
                out.println("<p>No bookings found.</p>");
            }
        %>
        </tbody>
    </table>

    <h3>Payment Summary</h3>
    <p>Total Items: <%= totalItems %></p>
    <p>Total Amount: <%= totalAmount %></p>
 

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.querySelectorAll(".rzp-button1").forEach(payButton => {
                const orderId = payButton.getAttribute("data-order-id");
                const paidStatus1 = payButton.getAttribute("data-paid");

                if (paidStatus1 === "Paid") {
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




</body>
</html>