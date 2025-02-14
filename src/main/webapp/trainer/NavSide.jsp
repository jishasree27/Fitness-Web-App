<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Admin Dashboard" />
        <meta name="author" content="Fitness Freaks" />
        <title>Dashboard - Fitness Freaks</title>
        
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  
        <!-- External CSS -->
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
 body {
   
    color: rgb(85, 0, 203); /* Text color */
}

.notification-bar {
    background-color: #7f5fc6; /* Light purple background */
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
}

/* Set background color for notification bar */
#NotificationLink {
    color: rgb(85, 0, 203); /* Text color */
    text-decoration: none; /* Remove underline */
}

#NotificationLink:hover {
    color: #fff; /* Ensure white text on hover */
}

.navbar {
    background-color: #ffffff; /* Deep violet */

    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Shadow for navbar */
}

.navbar-nav .nav-item .nav-link {
    color: rgb(85, 0, 203); /* Text color for links */
}

.nav-profile img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

/* Sidebar Styling */
/* Sidebar Styling */
.sidebar {
    position: relative; /* Allows precise positioning */
    margin-top: 0px;   /* Adjust this value to move it further down */
    padding: 10px;
    background-color:; /* Add a background color for better visibility */
    width: 200px;       /* Set a fixed width for the sidebar */
    height: auto;       /* Adjust height based on content */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Optional shadow for style */
}

.sidebar a {
    font-size: 14px; /* Reduced font size */
    display: block;
    padding: 10px 15px;
    text-decoration: none;
    color: #333; /* Link color */
    font-family: 'Poppins', sans-serif;
     margin-bottom: 20px; /* Space between links */
}
    .sidebar a i {
        margin-right: 10px; /* Spacing between icon and text */
    }

.sidebar a:hover {
    background-color: #ddd; /* Highlight on hover */
    color: #000;
}


.sb-sidenav-footer {
    margin-bottom: 60px;
    font-size: 14px;
    background-color: white;
    color: rgb(64, 0, 64);
    border: 1px solid rgb(64, 0, 64); 
}

.main-content {
    margin-left: 240px; /* Adjust to ensure the content doesn't overlap sidebar */
    padding: 1px;
}

.double-header {
 
    color:  rgb(85, 0, 203); /* Heading color */
}


/* Link styling */
.button-link {
    color: white; /* White text color */
    text-decoration: none; /* No underline */
    display: block; /* Make the link fill the entire button */
}

/* Hover effect on button */
.styled-button:hover {
    background-color: grey; /* Darker button color on hover */
}

/* Add spacing between buttons */
.buttons-container {
    text-align: center; /* Center the buttons */
}

.header-text {
    /* Adjust the size as needed */
    color: white; /* Choose the color you prefer *//* Make the text bold */
    text-align: center; /* Center the text */
    padding: 20px; /* Add some padding */
    background-color: rgb(85, 0, 203); /* Light background color */
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Optional shadow */
}

        .navbar-second-row {
            background-color:rgb(85, 0, 203); /* Second row background color */
            color: white;
        }
        .navbar-second-row .form-control {
            max-width: 400px; /* Limit search bar width */
        }
        
    .main-content .double-header {
        margin-top: -670px; /* Moves the double-header upwards */
    }
       h3 {
     
        color: black;
  /* Adds spacing before words */
    }
    .navbar-brand{
     margin-left:650px;


    
    }
      
</style>
    </head>
    <body>
 
    <header>
    
    <!-- Second Row -->
    <nav class="navbar navbar-expand-lg navbar-second-row navbar-shadow">
    <img src="https://img.freepik.com/free-vector/fitness-logo-template-flat-design_52683-16841.jpg?t=st=1738071857~exp=1738075457~hmac=e9e6e0fd21e46f53a7a7ca3b77404ba3a90f747775808b1ba3f7632feb013084&w=740"   style="width: 50px; height: 50px; margin-right: 15px;" alt="Logo">
        <div class="container-fluid">
           <a class="navbar-brand text-white text-center" href="#" style="display: block;">Lets make this use!</a>  
        </div>
    </nav>

   
    <!-- Navbar -->
    <nav class="sb-topnav navbar navbar-expand">
        <!-- Navbar Brand -->
        <h3 >Fitness Freaks</h3>

        <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
    <div class="notification-bar bg-lightpurple text-white d-flex align-items-center justify-content-between px-3 py-2 w-100">
        <a id="NotificationLink" class="btn btn-light btn-sm" href="Notification.jsp">
            <i class="fa fa-bell"></i> <!-- Bell icon from Font Awesome -->
        </a>
    </div>
</form>


    

        <!-- Profile Section -->
        <div class="nav-profile">
            <a href="profile.jsp">
                <img src="https://cdn-icons-png.flaticon.com/128/3177/3177440.png" class="profile-logo">
            </a>
        </div>
    </nav>
</header>

   
        <!-- Sidebar -->
  <div class="sidebar">
    <a href="TrainerDashboard.jsp"><i class="fas fa-home"></i> Home</a>
    <a href="schedule.jsp"><i class="fas fa-calendar-alt"></i> Schedule</a>
    <a href="booking.jsp"><i class="fas fa-book"></i> Bookings</a>
    <a href="video.jsp"><i class="fas fa-video"></i> Video</a>
    <a href="NewUpdates.jsp"><i class="fas fa-bullhorn"></i> New Update</a>
    <a href="Health and fitness.jsp"><i class="fas fa-heartbeat"></i> Health & Fitness</a>
    <a href="Products.jsp"><i class="fas fa-shopping-cart"></i> Products to Sale</a>
    <a href="FreeLiveClass.jsp"><i class="fas fa-graduation-cap"></i> Any Free Classes</a>
    <a href="Settings.jsp"><i class="fas fa-cog"></i> Settings</a>
    <a href="about.jsp" class="button-link"><i class="fas fa-info-circle"></i> About</a>
    <a href="Contact.jsp" class="button-link"><i class="fas fa-envelope"></i> Contact</a>
</div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="double-header">
                <h2 id="num1">Fitness Freaks Training</h2>
                <h5 id="num2">Dashboard</h5>
            </div>
        </div>
             <% 
            String name = (String) session.getAttribute("user");
        %> 
        

        <!-- Bootstrap JS -->
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
