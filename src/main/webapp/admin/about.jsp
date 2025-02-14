<!DOCTYPE html>
<%@ page import="com.fpojo.Fpojo" %>
<%@ page import="training.pack.Tpojo.*" %>
<%@ page import="User.pack.Pojo.*" %>
<%@ page import="com.fdao.Fdao" %>
<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adminStyles.css"> <!-- Link to your CSS file -->
</head>
<style>
/* Admin Dashboard Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
    font-size: 14px; /* Reduced base font size */
}

/* Admin Sidebar */
.admin-sidebar {
    width: 250px;
    background-color: #333;
    color: white;
    padding: 15px;
    position: fixed;
    top: 0;
    left: 0;
    height: 100vh;
    box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
    font-size: 13px; /* Smaller sidebar text */
}

/* Admin Content */
.admin-content {
    margin-left: 270px;
    padding: 15px;
    width: 100%;
}

/* Section Styling */
section {
    background-color: white;
    border-radius: 8px;
    padding: 15px;
    margin-bottom: 10px; /* Reduced margin */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    font-size: 14px;
}

/* Button Styling */
.btn {
    background-color: pink;
    color: black;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    text-decoration: none;
    font-size: 13px;
}

.btn:hover {
    background-color: grey;
}

/* Overview Box Styling */
.admin-overview {
    display: flex;
    
    margin-bottom: 10px; /* Reduced gap */
}

/* Update the .overview-box to be smaller in size */
.overview-box {
    width: 18%; /* Slightly reduced width */
    padding: 10px; /* Reduced padding */
    background-color: #f9f9f9;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    text-align: center;
    border-radius: 8px;
    font-size: 14px;
    background-color: #f0f8ff; /* Light background color */
    margin-right: 10px; /* Added right margin to separate boxes */
}
.overview-box h3 {
    margin-bottom: 55px; /* Increased gap between heading and content */
}
/* Align the text inside .user-count and .trainer-count to center */
.user-count, .trainer-count {
    width: 100%;
    text-align: center;
    background-color: #d3e7ff; /* Set background color */
    padding: 8px; /* Reduced padding */
    border-radius: 8px;
    font-weight: bold; /* Make the text bold */
    margin-bottom: 5px; /* Reduced margin between containers */
}

/* Container for Total Revenue Section */
.container-2 {
    margin-top: 20px; /* Reduced margin-top */
    text-align: center;
    padding: 10px; /* Reduced padding */
    background-color: #d3e7ff; /* Light cyan background */
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

/* Responsive Design */
@media (max-width: 768px) {
    .admin-container {
        flex-direction: column;
    }
    .admin-sidebar {
        width: 100%;
        height: auto;
        font-size: 12px;
    }
    .admin-content {
        margin-left: 0;
    }
}

/* For trainer count section */
.trainer-count {
    background-color: #d3e7ff; /* Light red background for testing */
    border: 1px solid #d6c5c5;  /* Add a border */
    padding: 8px; /* Reduced padding */
    text-align: center;
    border-radius: 8px;
    font-weight: bold;
    margin-bottom: 5px; /* Reduced margin */
}


</style>
<body>
    <div class="admin-container">
        <div >
            <!-- Sidebar includes links to other sections like Users, Settings, etc. -->
            <jsp:include page="adminNavside.jsp" />
        </div>

        <div class="admin-content">
            <!-- Dashboard Heading -->
            <h1>Admin Dashboard</h1>
            <p>Welcome to the Admin Panel. Here you can manage users, view system statistics, and adjust settings.</p>
            
            <!-- Overview Section -->
            <div class="admin-overview">
                <div class="overview-box">
                    <h3>Total Users</h3>
                     <% 
                    // Fetch logged-in user from session
                    String loggedInUser = (String) session.getAttribute("user");

                    // Create an instance of Fdao to fetch fitness data
                    Fdao dao = new Fdao();
                    List<Fpojo> fList = dao.getAllFitnessData();

                    // Count the number of users (filtered by 'user' type)
                    int userCount = 0;
                    for (Fpojo fitness : fList) {
                        if (fitness.getUserType().equalsIgnoreCase("user")) {
                            userCount++;  // Increment user count
                        }
                    }
                %>
                <div class="user-count">
                    <p>Total Users: <%= userCount %></p>
                </div> <!-- Dynamic value can be fetched from DB -->
                </div>

                <div class="overview-box">
                    <h3>Total Trainers</h3>
                    
                <% 
                    // Fetch logged-in user from session
                    String loggedInUser1 = (String) session.getAttribute("user");

                    // Create an instance of Fdao to fetch fitness data
                    Fdao dao1 = new Fdao();
                    List<Fpojo> fList1 = dao1.getAllFitnessData();

                    // Count the number of trainers (filtered by 'trainer' type)
                    int tCount1 = 0;
                    for (Fpojo fitness : fList1) { // Use fList1 here
                        if (fitness.getUserType().equalsIgnoreCase("trainer")) {
                            tCount1++;  // Increment trainer count
                        }
                    }
                %>
                <div class="trainer-count">
                    <p>Total Trainers: <%= tCount1 %></p>
                </div><!-- Dynamic value can be fetched from DB -->
                </div>

                <div class="overview-box">
                    <h3>Total products</h3>
                     <div class="container-2" style="margin-top: 40px;">
    <%
        HomeDao homedao = new HomeDao();
        List<CartPojo> profileList = homedao.getAllCartProfile();
        String loggedInUser2 = (String) session.getAttribute("user");

        // Initialize total items and total amount
        int totalItems = 0;
        double totalAmount = 0.0;

        for (CartPojo sp : profileList) {
            totalItems++;
            try {
                // Convert the payment to double and add to totalAmount
                totalAmount += Double.parseDouble(sp.getPayment());
            } catch (NumberFormatException e) {
                out.println("<p>Error: Invalid payment amount for an item. Please check the data.</p>");
            }
        }
    %>
    <%
        HomeDao homedao2 = new HomeDao();
        List<OfferCart> profileList2 = homedao2.fetchAllCartOffers();
        String loggedInUser3 = (String) session.getAttribute("user");

        // Initialize total items and total amount
        int totalItems2 = 0;
        double totalAmount2 = 0.0;

        for (OfferCart sp : profileList2) {
            totalItems2++;
            try {
                // Convert the payment to double and add to totalAmount
                totalAmount2 += Double.parseDouble(sp.getPaymentDetails());
            } catch (NumberFormatException e) {
                out.println("<p>Error: Invalid payment amount for an item. Please check the data.</p>");
            }
        }
    %>

    <p>Total Items: <%= totalItems + totalItems2 %></p>
    <p>Total Amount: <%= totalAmount + totalAmount2 %></p>
</div> <!-- Dynamic value can be fetched from DB -->
                </div>
            </div>

          <!-- User Management Section -->
<section class="user-management">
    <h2>User Management</h2>
    <p>Manage registered users, view their activity.</p>
    <button class="btn"><a href="user.jsp" >Manage Users</a></button>
</section>


<section class="Trainer-management">
    <h2>Trainer Management</h2>
    <p>Manage registered trainers, view their activity.</p>
    <button class="btn"><a href="trainer.jsp">Manage Trainers</a></button>
</section>
<!-- System Settings Section -->
<section class="system-settings">
    <h2>System Settings</h2>
    <p>Configure the system settings such as site preferences.</p>
    <button class="btn"><a href="settings.jsp" >Settings</a></button>
</section>

<!-- Product Management Section -->




        </div>
    </div>
</body>
</html>
