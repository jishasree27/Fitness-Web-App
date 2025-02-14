<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Cart</title>
    <style>
        body {
            font-family: poppins, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
        }

    

        .cart-table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-table th, .cart-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .cart-table th {
            background-color: #2ac0d4; /* Deep violet */
            color: white;
        }

        .cart-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .cart-table tr:hover {
            background-color: #f1f1f1;
        }

        .status-pending {
            color: red;
            font-weight: bold;
        }

        .status-paid {
            color: green;
            font-weight: bold;
        }

        .total-section {
            margin-top: 20px;
            padding: 10px;
            background-color: white;
            border-radius: 8px;
            border: 1px solid #ddd;
        }

        .total-section p {
            font-size: 1.2em;
        }

        .actions {
            margin-top: 20px;
            display: flex;
            gap: 10px;
        }

        .actions button {
            padding: 10px 20px;
            background-color: #301934;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #502d56;
        }
        
        .container-2 {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

 .container-3 {
            max-width: 1200px;
             margin: 10px auto; /* Reduced margin to decrease the gap */
           
            padding: 20px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
 .container-5 {
            max-width: 1200px;
             margin: 10px auto; /* Reduced margin to decrease the gap */
           
            padding: 20px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container-2 h2 {
            text-align: center;
            font-size: 28px;
            color: #343a40;
            margin-bottom: 20px;
            font-weight: bold;
        }
         .container-5 h2 {
            text-align: center;
            font-size: 28px;
            color: #343a40;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .alert {
            padding: 15px;
            border-radius: 5px;
            margin: 10px 0;
            font-size: 16px;
        }

        .alert-warning {
            background-color: #fff3cd;
            border: 1px solid #ffeeba;
            color: #856404;
        }

        .alert-info {
            background-color: #d1ecf1;
            border: 1px solid #bee5eb;
            color: #0c5460;
        }

        .text-center {
            text-align: center;
        }

        .table {
            width: 100%;
            margin-bottom: 1rem;
            background-color: transparent;
            border-collapse: collapse;
        }

        .table-bordered {
            border: 1px solid #dee2e6;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        .table thead {
            background-color: #343a40;
            color: #fff;
        }

        .table-dark th {
            text-transform: uppercase;
            font-size: 14px;
            text-align: center;
        }

        .table td {
            padding: 8px;
            vertical-align: middle;
            text-align: center;
            border: 1px solid #dee2e6;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .container-2 {
                padding: 15px;
            }

            .table th, .table td {
                font-size: 12px;
                padding: 6px;
            }
        }
        .container-4 {
            max-width: 1200px;
            margin: 10px auto; /* Reduced margin to decrease the gap */
            padding: 20px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
                  footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    } 
      .container-5 .table-dark th  {
             padding:20px;
            font-size: 14px;
            text-align: center;
             background-color: #2ac0d4
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

/* Buy Now Button Styling */
.rzp-button {
    background-color: #007bff; /* Blue */
    color: white;
}

.rzp-button:hover {
    background-color: #0056b3;
}

/* Paid Button Styling */
.rzp-button[disabled] {
    background-color: #28a745 !important; /* Green */
    color: white;
    cursor: not-allowed;
    font-weight: bold;
}
         
    
    </style>
</head>
<body>
 <jsp:include page="userNavSide.jsp" />

    <center>
         <h2>Items in Your Cart</h2>
<p style="color: red; font-weight: bold;">Booked Classes Links are available only in HOMEPAGE course Kindly View there!! Thank you..</p>


<jsp:include page="CartBook.jsp" />

 <jsp:include page="CartOffer.jsp" />
 


<div class="container-5">
    <h2>Your Bookings</h2>

    <%
        HomeDao homedao4 = new HomeDao();
        List<Bookings> bkList = homedao4.getAllBookings();
        String loggedInUser4 = (String) session.getAttribute("user");

        if (loggedInUser4 == null) {
    %>

    <div class="alert alert-warning text-center">
         <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
    </div>

    <%
        } else {
            boolean hasBookings = false;
    %>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Trainer Name</th>
                <th>Date</th>
                <th>Time Slot</th>
                <th>Customer Name</th>
                <th>Email</th>
               
            </tr>
        </thead>
        <tbody>
            <%
                if (bkList != null) {
                    for (Bookings bs : bkList) {
                        if (bs.getCustomerUserId() != null && bs.getCustomerUserId().equals(loggedInUser4)) {
                            hasBookings = true;
            %>
            <tr>
                <td><%= bs.getTrainer() %></td>
                <td><%= bs.getDate() %></td>
                <td><%= bs.getFtime() %> - <%= bs.getTtime() %></td>
                <td><%= bs.getCustomerName() %></td>
                <td><%= bs.getCustomerEmail() %></td>
               
            </tr>
            <%
                        }
                    }
                }
            %>
        </tbody>
    </table>

    <%
        if (!hasBookings) {
    %>
    <div class="alert alert-info text-center">
         <p style="color: red; text-align: center;">You have no bookings at the moment.</p>
    </div>
    <%
        }
    }
    %>
</div>


 <jsp:include page="CartProduct.jsp" />


<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
