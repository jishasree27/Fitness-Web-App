<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="training.pack.Tpojo.VideoPojo" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.razorpaypojo" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Razorpay Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        /* Styles for pay button */
        #rzp-button1 {
            background-color: #F37254;
            color: white;
            padding: 12px 30px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        #rzp-button1:hover { background: #d55a47; }
        #rzp-button1:disabled { background: #ccc; cursor: not-allowed; }

        /* Payment container */
        .pay-container {
            width: 350px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-family: Arial, sans-serif;
            margin: auto;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<%
    HomeDao h1 = new HomeDao();
    List<VideoPojo> vList = h1.getAllVideos();
    HomeDao dm = new HomeDao();
    List<razorpaypojo> rlist = dm.getAllCredentials();
    String publicKey = "", privateKey = "", orderId = "", amountInPaise = "0", videoTitle = "";
    
    String loggedInUser = (String) session.getAttribute("user");
    if (loggedInUser != null) {
        for (VideoPojo vid : vList) {
            if (vid.getPaymentDetails() != null && !vid.getPaymentDetails().isEmpty()) {
                int amountInInr = Integer.parseInt(vid.getPaymentDetails());
                amountInPaise = String.valueOf(amountInInr * 100);
                videoTitle = vid.getTitle();
                
                for (razorpaypojo credential : rlist) {
                    if (vid.getUserId().equals(credential.getUserId())) {
                        publicKey = credential.getPublicApiKey();
                        privateKey = credential.getPrivateApiKey();
                        break;
                    }
                }
                
                try {
                    RazorpayClient razorpay = new RazorpayClient(publicKey, privateKey);
                    JSONObject orderRequest = new JSONObject();
                    orderRequest.put("amount", amountInPaise);
                    orderRequest.put("currency", "INR");
                    orderRequest.put("receipt", "txn_" + vid.getId());
                    orderRequest.put("payment_capture", 1);
                    Order order = razorpay.orders.create(orderRequest);
                    orderId = order.get("id");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            }
        }
    }
%>
    <div class="pay-container">
        <h2 id="videoTitle">Course Title: <%= videoTitle %></h2>
        <p id="courseAmount">Amount: &#8377; <%= amountInPaise.isEmpty() ? 0 : Integer.parseInt(amountInPaise) / 100 %></p>
        <button id="rzp-button1">Pay</button>
    </div>
    
    <script>
        console.log("Razorpay public key: <%= publicKey %>");
        console.log("Order ID: <%= orderId %>");
        
        var options = {
            "key": "<%= publicKey %>",
            "amount": "<%= amountInPaise %>",
            "currency": "INR",
            "name": "<%= videoTitle %>",
            "description": "Test Transaction",
            "order_id": "<%= orderId %>",
            "handler": function (response) {
                alert("Payment Successful!");
               
                
            },
            "prefill": { "name": "Test User", "email": "testuser@example.com", "contact": "1234567890" },
            "theme": { "color": "#F37254" }
        };

        var rzp1 = new Razorpay(options);
        document.getElementById("rzp-button1").onclick = function (e) {
            if (!document.getElementById("rzp-button1").disabled) {
                rzp1.open();
                e.preventDefault();
            }
        };
    </script>
</body>
</html>
