<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="com.razorpay.RazorpayClient, com.razorpay.Order, org.json.JSONObject" %>


<%
    String orderId = "";
    try {
        RazorpayClient razorpay = new RazorpayClient("rzp_test_fI2kIVIDH3X305", "5z4BelDDTqXvaEMZKNnHBrNn");

        JSONObject orderRequest = new JSONObject();
        orderRequest.put("amount", 50000); // Amount in paise (50000 = 500 INR)
        orderRequest.put("currency", "INR");
        orderRequest.put("receipt", "txn_12345");
        orderRequest.put("payment_capture", 1);

        Order order = razorpay.orders.create(orderRequest);
        orderId = order.get("id"); // Store the order ID
        System.out.println(orderId);
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Razorpay Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<style>
#rzp-button1 {
    background-color: #2ac0d4;
    color: white; /* Optional: Sets text color to white */
    padding: 10px 20px; /* Optional: Adds padding around the button */
    border: none; /* Removes default border */
    border-radius: 5px; /* Optional: Adds rounded corners */
    cursor: pointer; /* Changes cursor to pointer on hover */
    font-size: 16px; /* Optional: Sets font size */
}

#rzp-button1:hover {
    background-color: #248a99; /* Optional: Darkens the background on hover */
}






</style>
<body>

    <button id="rzp-button1">Buy Now</button>

    <script>
        var options = {
            "key": "rzp_test_fI2kIVIDH3X305", 
            "amount": "50000", 
            "currency": "INR",
            "name": "Acme Corp",
            "description": "Test Transaction",
            "order_id": "<%= orderId %>", // Order ID from JSP
            "handler": function (response) {
                alert("Payment ID: " + response.razorpay_payment_id);
                alert("Order ID: " + response.razorpay_order_id);
                alert("Signature: " + response.razorpay_signature);
            }
        };

        var rzp1 = new Razorpay(options);
        
        document.getElementById('rzp-button1').onclick = function (e) {
            rzp1.open();
            e.preventDefault();
        };
    </script>
</body>
</html>
