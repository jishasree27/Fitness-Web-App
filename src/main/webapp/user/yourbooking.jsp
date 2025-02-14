<%@ page import="User.pack.Pojo.Bookings" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Bookings</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            flex-direction: column;
            min-height: 100vh;
            padding: 20px;
            background-size: cover;
            background-position: center center;
            background-repeat: no-repeat;
            color: #333;
        }

        .container {
            margin: 0 auto;
            max-width: 1000px; /* Max width of the container */
            padding: 20px;
            border-radius: 8px;
            width: 100%;
            background-color: #ffffff; /* White background for container */
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1); /* Shadow effect */
            margin-bottom: 30px; /* Added space after the container */
            margin-top:50px;
        }

        .container h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-size: 16px;
        }

        table th, table td {
            text-align: left;
            padding: 16px; /* Increased padding for larger table */
            border-bottom: 1px solid #d4a6a6;
            color: black;
        }

        table th {
            background-color: #2ac0d4; /* Indigo color for header */
            color: #ffffff;
        }

        table tbody tr:hover {
            background-color: #f5f5f5;
        }

        footer {
            margin-top: 15em;
            padding: 15px;
            position: relative;
        }

    </style>
</head>
<body>
    <jsp:include page="userNavSide.jsp" />
  
    <div class="container">
        <h2>Your Bookings</h2>
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
      
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th>Trainer Name</th>
                    <th>Date</th>
                    <th>Time Slot</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Bookings bs : bookList) {
                        if (bs.getCustomerUserId() != null && bs.getCustomerUserId().equals(loggedInUser)) {
                %>
                <tr>
                    <td><%= bs.getTrainer() %></td>
                    <td><%= bs.getDate() %></td>
                    <td><%= bs.getFtime() %> - <%= bs.getTtime() %></td>
                    <td><%= bs.getCustomerName() %></td>
                    <td><%= bs.getCustomerEmail() %></td>
                    <td><%= "booked" %></td>
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
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
