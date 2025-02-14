<!DOCTYPE html>
<%@ page import="User.pack.Pojo.Bookings" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.List" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.query.Query" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="org.hibernate.cfg.Configuration" %>
<%@ page import="org.hibernate.Transaction" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Schedule</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #ffffff; /* White background */
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .container {
            width: 80%; /* Container width */
            margin: 0 auto; /* Center the container */
            padding: 20px;
            background-color: #ffffff; /* Ensure container has a white background */
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1); /* Add subtle shadow */
            border-radius: 8px; /* Rounded corners for the container */
            margin-top:50px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 16px; /* Increased font size */
        }

        th, td {
            padding: 15px; /* Increased padding */
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #2ac0d4; /* Header color changed to #2ac0d4 */
            color: white;
        }

        .no-schedule {
            text-align: center;
            font-size: 18px;
            color: #666;
        }

        .button {
            display: inline-block;
            background-color: #301934; /* Deep violet */
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }

        .button:hover {
            background-color: #45a049;
        }

        .content {
            margin-bottom: 5em; /* Adds 5 lines worth of space (approximately) */
        }

        footer {
            margin-top: 20em;
            padding: 15px;
            position: relative;
        }

    </style>
</head>
<body>
<div>
    <jsp:include page="userNavSide.jsp" />
</div>

<div class="container mt-4">
    <%
        HomeDao homedao = new HomeDao();
        List<Bookings> bookList = homedao.getAllBookings();
        String loggedInUser = (String) session.getAttribute("user");

        if (loggedInUser == null) {
    %>
    <div class="alert alert-warning text-center">
        <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
    </div>
    <%
        } else if (bookList != null && !bookList.isEmpty()) {
    %>
    <h2>Class Scheduled</h2>
    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>Title</th>
                <th>Trainer Name</th>
                <th>Date</th>
                <th>From Time</th>
                <th>To Time</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (Bookings bs : bookList) {
                    if (bs.getCustomerUserId() != null && bs.getCustomerUserId().equals(loggedInUser)) {
            %>
            <tr>
                <td><%= bs.getTitle() %></td>
                <td><%= bs.getTrainer() %></td>
                <td><%= bs.getDate() %></td>
                <td><%= bs.getFtime() %> </td>
                <td> <%= bs.getTtime() %></td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <%
        } else {
    %>
    <div class="alert alert-info text-center">
        <p style="color: red; text-align: center;">No bookings found for your account.</p>
    </div>
    <%
        }
    %>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
