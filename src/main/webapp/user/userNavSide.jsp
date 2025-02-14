<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <title>Navbar with Profile Logo</title>
  <style>
    /* General Styling */
   /* General Styling */
body {
  margin: 0;
  font-family: 'Poppins', sans-serif;
}

/* Navbar Styling */
.navbar {
  display: flex;
  flex-direction: column;
  background-color: #301934; /* Deep violet */
  color: white;
   box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
}

.navbar-top {
    background-color: #E5F4F6; /* RGB(102,192,202) */
    padding: 10px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    color:black;
}


.navbar-top img {
  height: 50px;
}

.navbar-top .header2 {
  font-size: 1.5rem;
  font-weight: bold;
  color: #215960;
}

.navbar-top .search-bar {
  flex-grow: 1;
  margin: 0 15px;
  position: relative;
  max-width: 500px;
}

.navbar-top .search-bar input[type="text"] {
  width: 100%;
  padding: 8px 40px 8px 10px;
  border: none;
  border-radius: 4px;
}

.navbar-top .search-bar .search-icon {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  font-size: 18px;
  color: black;
  cursor: pointer;
}

.navbar-top .profile {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.navbar-top .profile img {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  margin-left: 10px;
}

/* Sidebar Styling */
.sidebar {
  width: 250px;
  background-color: #b4e8ed; /* Deep violet */
  color: black;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 100vh;
  position: fixed;
}

.sidebar .menu {
  display: flex;
  flex-direction: column;
  padding: 20px;
}

.sidebar .menu button {
  background-color: white; /* Black background for sidebar buttons */
  color: black; /* Dark purple text color */
  border: none;
  padding: 10px 15px;
  margin: 5px 0;
  border-radius: 5px;
  text-align: left;
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.sidebar .menu button:hover {
  background-color: #b4e8ed; /* Darker gray on hover */
}

.sidebar .side-footer {
  padding: 15px;
  text-align: center;
  color: black;
  font-size: 0.9rem;
}
.navbar .user{
color: black;
}
   /* Navbar Bottom */
        .navbar-bottom {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: white;
            padding: 10px;
            
       
        }
        .navbar-bottom .column {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            background-color:white;
            border-radius: 8px;
            color: black;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
            position: relative;
            width: 80px;
            margin: 0 10px;
            text-align: center;
            font-size: 12px; /* Reduced font size */
        }

        .navbar-bottom .column:hover {
            background-color: white;
            transform: translateY(-2px);
        }

        .navbar-bottom .column i {
            margin-bottom: 4px;
            font-size: 16px; /* Smaller icon size */
        }

        /* Icon Colors */
        .navbar-bottom .column i.fa-home { color: #3498db; }
        .navbar-bottom .column i.fa-bookmark { color: #e74c3c; }
        .navbar-bottom .column i.fa-calendar { color: #27ae60; }
        .navbar-bottom .column i.fa-book { color: #9b59b6; }
        .navbar-bottom .column i.fa-cogs { color: #f39c12; }
        .navbar-bottom .column i.fa-phone-alt { color: #2c3e50; }


/* Hide the details initially */
     /* Sidebar should be on the left */
        .sidebar-container {
            display: flex;
            align-items: center;
        }

        .sidebar {
            display: flex;
            flex-direction: column;
            background: #f5f5f5;
            padding: 10px;
            border-radius: 6px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            margin-right: 15px; /* Moves sidebar left of the updates button */
        }

        .sidebar button {
            width: 100%;
            background: none;
            border: none;
            padding: 8px;
            margin: 4px 0;
            cursor: pointer;
            text-align: left;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .sidebar button:hover {
            background: #f1f1f1;
            border-radius: 4px;
        }

        /* Column Styles */
        .column {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            border-radius: 8px;
            color: black;
            cursor: pointer;
            transition: transform 0.2s;
            position: relative;
            width: 80px;
            margin: 0 10px;
            text-align: center;
            font-size: 12px;
        }

        .column:hover {
            background-color: white;
            transform: translateY(-2px);
        }

        .column i {
            margin-bottom: 4px;
            font-size: 16px;
        }

        /* Icon Colors */
        .column i.fa-home { color: #3498db; }
        .column i.fa-bookmark { color: #e74c3c; }
        .column i.fa-calendar { color: #27ae60; }
        .column i.fa-book { color: #9b59b6; }
        .column i.fa-cogs { color: #f39c12; }
        .column i.fa-phone-alt { color: #2c3e50; }
        .column i.fa-bell { color: #ff9800; }
        .column i.fa-heartbeat { color: #e91e63; }
        .column i.fa-gift { color: #4caf50; }
        .column i.fa-shopping-bag { color: #673ab7; }
        .column i.fa-shopping-cart { color: #795548; }
        .column i.fa-video { color: #3f51b5; }
        .column i.fa-user { color: #9c27b0; }
        .column i.fa-history { color: #607d8b; }

        /* Sidebar Details */
        .details {
            display: none;
            margin-top: 10px;
            background-color: #f9f9f9;
            color: black;
            padding: 5px;
            border-radius: 4px;
            text-align: center;
            position: absolute;
            top: 100%;
            z-index: 1;
            width: 100%;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .side-footer {
            margin-top: 10px;
            font-size: 12px;
            text-align: center;
            color: #555;
        }
  </style>
</head>
<body>
    <% 
        String name = (String) session.getAttribute("user");
    %> 
  <!-- Navbar -->
  <header>
      <nav class="navbar navbar-expand-lg navbar-second-row navbar-shadow" style="background-color: #B7E1E6;">
  <div style="display: flex; align-items: center;">
    <img src="https://img.freepik.com/free-vector/fitness-logo-template-flat-design_52683-16841.jpg?t=st=1738071857~exp=1738075457~hmac=e9e6e0fd21e46f53a7a7ca3b77404ba3a90f747775808b1ba3f7632feb013084&w=740"  
         style="width: 50px; height: 50px; margin-right: 15px;" alt="Logo">
    <p style="margin: 0; text-align: center; width: 90%; color:#3794A1;">Happy shopping make a change!</p>
</div>

</nav>

  <div class="navbar">
    <!-- Top Navbar -->
    <div class="navbar-top">
         <div class="header2"> Fitness Freaks Welcomes You!</div>
       


        <div class="profile" onclick="redirectToProfile()">
            <span style="color:#3794A1;">Profile</span>
            <img src="data:image/jpeg;base64,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" alt="Profile" class="profile-logo">
               </div>
    </div>

 <div class="navbar-bottom">
        <div class="column" onclick="toggleDetails(this)">
            <i class="fas fa-bars"></i>
            <span>Sidebar</span>
            <div class="details">
                <div class="sidebar">
                    <form action="userhome" method="get">
                        <button onclick="navigateTo('homepage.jsp')">
                            <i class="fas fa-home"></i> Home
                        </button>
                    </form>
                
                        <button onclick="window.location.href='yourbooking.jsp'">
                            <i class="fas fa-bookmark"></i> Bookings
                        </button>
                  
                    <button onclick="window.location.href='yourschedule.jsp'">
                        <i class="fas fa-calendar"></i> Schedule
                    </button>
                    <button onclick="window.location.href='library.jsp'">
                        <i class="fas fa-book"></i> Library
                    </button>
                    <button onclick="window.location.href='usersettings.jsp'">
                        <i class="fas fa-cogs"></i> Settings
                    </button>
                    <button onclick="window.location.href='usercontact.jsp'">
                        <i class="fas fa-phone-alt"></i> Contact
                    </button>
                    <div class="side-footer">
                        Logged in as: <%= name %>
                    </div>
                </div>
            </div>
        </div>
   
  
    <div class="column" onclick="redirectToNewUpdates()">
        <i class="fa fa-bell"></i> <div>Updates</div>
        <div class="details">Details about new updates...</div>
    </div>
    <div class="column" onclick="redirectToHealth()">
        <i class="fa fa-heartbeat"></i> <div>Health</div>
        <div class="details">Details about likes...</div>
    </div>
    <div class="column" onclick="redirectToOfferPack()">
        <i class="fa fa-gift"></i> <div>Offer</div>
        <div class="details">Details about offer packs...</div>
    </div>
  <div class="column" onclick="redirectToProducts()">
    <i class="fa fa-shopping-bag"></i> 
    <div>Products</div>
    <div class="details">Details about products...</div>
</div>
    <div class="column" onclick="redirectToSaved()">
        <i class="fa fa-bookmark"></i> <div>Saved</div>
        <div class="details">Details about saved items...</div>
    </div>
    <div class="column" onclick="redirectToCart()">
        <i class="fa fa-shopping-cart"></i> <div>Cart</div>
        <div class="details">Details about booked carts...</div>
    </div>
    <div class="column" onclick="redirectToFreeClass()">
        <i class="fa fa-video"></i> <div>Free class</div>
        <div class="details">Details about booked carts...</div>
    </div>
    <div class="column" onclick="redirectToDetails()">
        <i class="fa fa-user"></i> <div>User</div>
        <div class="details">Details about booked carts...</div>
    </div>
    <div class="column" onclick="redirectToActivity()">
        <i class="fa fa-history"></i> <div>Activity</div>
        <div class="details">Details about products...</div>
    </div>
</div>
</div>
 
</header>
  <script>

    // Function to toggle details for each column
// Toggle function to show/hide the sidebar details
function toggleDetails(element) {
    // Find the '.details' div within the clicked '.column' element
    const details = element.querySelector('.details');
    
    // Toggle the visibility of the details div
    if (details.style.display === 'none' || details.style.display === '') {
        details.style.display = 'block'; // Show the details
    } else {
        details.style.display = 'none';  // Hide the details
    }
}

// Placeholder function for navigation
function navigateTo(page) {
    // Logic for navigating to the respective pages can be added here
    console.log("Navigating to: " + page);
}


    // Function to redirect to the profile page
    function redirectToProfile() {
      window.location.href = 'profile.jsp'; // Replace with actual profile page URL
    }

    // Function to navigate to different pages
    function navigateTo(page) {
      if (page && typeof page === "string") {
        window.location.href = page;
      } else {
        console.error("Invalid page URL provided.");
      }
    }

    function redirectToNewUpdates() {
        window.location.href = "newupdates.jsp"; // Redirects to the newupdates.jsp page
    }
    function redirectToProducts() {
        window.location.href = "products.jsp"; // Redirects to the previousbooking.jsp page
    }
    function redirectToOfferPack() {
        window.location.href = "offerpack.jsp"; // Redirects to the offerpack.jsp page
    }
    function redirectToProducts() {
        window.location.href = "products.jsp"; // Redirects to the packagematerial.jsp page
    }
    function redirectToHealth() {
        window.location.href = "HealthFitness.jsp"; // Redirects to the likes.jsp page
    }
 
    function redirectToSaved() {
        window.location.href = "saved.jsp"; // Redirects to the saved.jsp page
    }
   
    function redirectToProfile() {
        window.location.href = "userProfile.jsp"; // Redirects to the browsinghistory.jsp page
    }
    function redirectToCart() {
        window.location.href = "cart.jsp"; // Redirects to the browsinghistory.jsp page
    }
    function redirectToFreeClass(){
    	window.location.href = "FreeClass.jsp";
    	
    }
  function redirectToDetails(){
	   window.location.href = "UserDetails.jsp";
	  
  }
  function redirectToActivity(){
	  
	  window.location.href = "UserActivity.jsp";
  }
  </script>



</body>

</html>
