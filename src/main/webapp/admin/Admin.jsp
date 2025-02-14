<!DOCTYPE html>
<html lang="en">
<%@ page import="com.fpojo.Fpojo" %>
<%@ page import="training.pack.Tpojo.*" %>
<%@ page import="User.pack.Pojo.*" %>
<%@ page import="com.fdao.Fdao" %>
<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.*" %>

<%@ page import="com.google.gson.Gson" %>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="responsive.css">
    <style>
        /* Main Styles */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        :root {
            --primary-bg: #fafaff;
            --secondary-bg: #ffffff;
            --hover-bg: #cad7fda4;
            --primary-color: #4b49ac;
            --hover-color: #0c007d;
            --btn-color: #5500cb;
        }

        body {
            background-color: var(--primary-bg);
            overflow-x: hidden;
            margin-top: 70px;
        }

        header {
            height: 70px;
            width: 100%;
            background-color: var(--secondary-bg);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
        }

        .logo {
            font-size: 24px;
            font-weight: 600;
            color: #4CAF50;
        }

        .menuicn {
            height: 25px;
            cursor: pointer;
        }

        .main-container {
            display: flex;
            padding-top: 20px;
        }

        .nav {
            width: 250px;
            background-color: var(--secondary-bg);
            height: 100vh;
            box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
            position: fixed;
            top: 70px;
            left: 0;
            padding: 20px;
        }

        .nav-option {
            display: flex;
            align-items: center;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: 0.3s ease;
            cursor: pointer;
        }

        .nav-option:hover {
            background-color: var(--hover-bg);
        }

        .nav-option img {
            height: 20px;
            margin-right: 15px;
        }

        .nav-option span {
            font-size: 14px;
            font-weight: 500;
            color: var(--hover-color);
        }

        .main {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
        }
        .main h2{
        	margin-top:100px;
        
        }

        .box-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .box {
            background-color: var(--btn-color);
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            flex: 1;
            min-width: 200px;
            max-width: 300px;
            text-align: center;
        }

        .box:hover {
            transform: scale(1.05);
            transition: 0.3s ease;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .main-container {
                flex-direction: column;
            }

            .nav {
                position: static;
                width: 100%;
                height: auto;
                box-shadow: none;
            }

            .box-container {
                justify-content: center;
            }
        }
        .userContainer {
    padding: 20px;
    margin-top: 20px;
    background-color: var(--secondary-bg);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
}

#fitness-container {
    display: block; /* Ensure visibility; toggle with JS if needed */
    margin: 0 auto;
    max-width: 70%;
    text-align: center;
}

#fitness-container h2 {
    font-size: 24px;
    font-weight: 600;
    color: var(--primary-color);
    margin-bottom: 20px;
}

#fitnessTable {
    width: 60%;
    border-collapse: collapse;
    margin: 0 auto;
}

#fitnessTable thead th {
    background-color: var(--btn-color);
    color: #fff;
    text-align: left;
    padding: 10px;
    font-size: 16px;
    border-bottom: 2px solid #ddd;
}

#fitnessTable tbody td {
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}

#fitnessTable tbody tr:nth-child(even) {
    background-color: var(--hover-bg);
}

#fitnessTable tbody tr:hover {
    background-color: var(--hover-color);
    color: #fff;
    transition: 0.3s ease;
}

#fitnessTable td,
#fitnessTable th {
    padding: 12px 15px;
}

.table-bordered {
    border: 1px solid #ddd;
    border-radius: 5px;
}

.table-bordered td,
.table-bordered th {
    border: 1px solid #ddd;
}
   .pie-chart-container {
            width: 400px; /* Adjust the width as needed */
            height: 400px; /* Adjust the height as needed */
            margin: 0 auto; /* Center the chart horizontally */
        }
          .bar-chart-container {
            width: 600px; /* Adjust the width as needed */
            height: 400px; /* Adjust the height as needed */
            margin: 0 auto; /* Center the chart horizontally */
        }
        

/* Payment Status Styles */
.status-paid {
    color: green;
    font-weight: bold;
}

.status-pending {
    color: orange;
    font-weight: bold;
}

    </style>
</head>

<body>
    <div>
        <jsp:include page="adminNavside.jsp" />
    </div>
    <div class="main">
        <h2>Welcome to the Admin Dashboard</h2>
        <div class="box-container">
            <div class="box">
                <h3>Users</h3>
                <p>Manage user details</p>
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
                </div>
            </div>
            <div class="box">
                <h3>Trainers</h3>
                <p>Manage Trainer details</p>
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
                <div class="user-count">
                    <p>Total Trainers: <%= tCount1 %></p>
                </div>
            </div>
            <div class="box">
               <a href="settings.jsp" style="text-decoration: none; color: white;">
			    <h3>Settings</h3>
			    <p>Update configurations</p>
			</a>

            </div>
        </div>
    </div>

     <div class="pie-chart-container">
     <p>
    <strong>Pie Chart Calculation maximise usage:</strong></p>
        <canvas id="userTrainerPieChart"></canvas>
    </div><br><br>
   <div class="bar chart"> 
       <% 
            AdminDao dao2 = new  AdminDao();
            List<BookschedulePojo> fList2 = dao2.getAllschedule();

            // Count the number of trainers (filtered by 'trainer' type)
            int tCount2 = 0;
            for (BookschedulePojo schedule : fList2) {
                
                    tCount2++;  
                }
            System.out.println(tCount2);
            
        %>
        <% 
            AdminDao dao3 = new  AdminDao();
            List<Bookings> fList3 = dao3.getAllbookings();

            // Count the number of trainers (filtered by 'trainer' type)
            int tCount3 = 0;
            for (Bookings book : fList3) {
                
                    tCount3++;  
                }
            System.out.println(tCount3);
            
        %>
        <% 
            AdminDao dao4 = new  AdminDao();
            List<OfferCart> fList4 = dao4.getAlloffer();

            // Count the number of trainers (filtered by 'trainer' type)
            int tCount4 = 0;
            for (OfferCart off : fList4) {
                
                    tCount4++;  
                }
            System.out.println(tCount4);
            
        %>
        <% 
            AdminDao dao5 = new  AdminDao();
            List<VideoPojo> fList5 = dao5.getAllvideo();

            // Count the number of trainers (filtered by 'trainer' type)
            int tCount5 = 0;
            for (VideoPojo vid : fList5) {
                
                    tCount5++;  
                }
            System.out.println(tCount5);
            
        %>
        <% 
            AdminDao dao6 = new  AdminDao();
            List<ProductPojo> fList6 = dao6.getAllproduct();

            // Count the number of trainers (filtered by 'trainer' type)
            int tCount6 = 0;
            for (ProductPojo pdt : fList6) {
                
                    tCount6++;  
                }
            System.out.println(tCount6);
            
        %>
        <% 
            AdminDao dao7 = new  AdminDao();
            List<FreeClassPojo> fList7 = dao7.getAllfree();

            // Count the number of trainers (filtered by 'trainer' type)
            int tCount7 = 0;
            for (FreeClassPojo free : fList7) {
                
                    tCount7++;  
                }
            System.out.println(tCount7);
            
        %>
</div>
  <div class="bar-chart-container" style="margin-bottom: 400px;">
  <p>
    <strong>Bar Chart Calculation for Usage Sections</strong>
    <br><br>
    This bar chart provides a visual representation of the various usage sections within our platform. The chart highlights the counts for different categories, including:
    <ul>
        <li><strong>Schedule:</strong> Represents the number of scheduled fitness activities.</li>
        <li><strong>Bookings:</strong> Shows the total number of bookings made by users.</li>
        <li><strong>Offers:</strong> Indicates the number of active offers available.</li>
        <li><strong>Videos:</strong> Displays the count of video content uploaded.</li>
        <li><strong>Products:</strong> Lists the total number of products available in our store.</li>
        <li><strong>Free Classes:</strong> Counts the number of free classes offered to users.</li>
    </ul>
    Understanding these metrics helps us analyze user engagement and the popularity of different sections, allowing us to improve our services and cater better to our users' needs.
</p>

        <canvas id="categoryBarChart"></canvas>
    </div>
   <jsp:include page="containers.jsp" />

<!-- Include Chart.js library -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
    // Set up the chart data for the bar chart
    var dataBar = {
        labels: ['Schedule', 'Bookings', 'Offers', 'Videos', 'Products', 'Free Classes'],
        datasets: [{
            label: 'Counts',
            data: [<%= tCount2 %>, <%= tCount3 %>, <%= tCount4 %>, <%= tCount5 %>, <%= tCount6 %>, <%= tCount7 %>],
            backgroundColor: ['#36A2EB', '#FF6384', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40'],
            hoverBackgroundColor: ['#36A2EB', '#FF6384', '#FFCE56', '#4BC0C0', '#9966FF', '#FF9F40']
        }]
    };

    // Create the bar chart
    var ctxBar = document.getElementById('categoryBarChart').getContext('2d');
    var categoryBarChart = new Chart(ctxBar, {
        type: 'bar',
        data: dataBar,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Counts by Category'
                }
            }
        }
    });

    // Set up the chart data for the pie chart
    var userCount = <%= userCount %>;
    var trainerCount = <%= tCount1 %>;
    var dataPie = {
        labels: ['Users', 'Trainers'],
        datasets: [{
            data: [userCount, trainerCount],
            backgroundColor: ['#36A2EB', '#FF6384'],
            hoverBackgroundColor: ['#36A2EB', '#FF6384']
        }]
    };

    // Create the pie chart
    var ctxPie = document.getElementById('userTrainerPieChart').getContext('2d');
    var userTrainerPieChart = new Chart(ctxPie, {
        type: 'pie',
        data: dataPie,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: true,
                    text: 'Users vs. Trainers'
                }
            }
        }
    });
</script>
<footer>
 <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
