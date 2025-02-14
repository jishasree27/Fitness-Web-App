<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>
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
            color: var(--btn-color);
        }

        .menuicn {
            height: 25px;
            cursor: pointer;
        }

        .main-container {
            display: flex;
            padding-top: 20px;
        }

      /* Main container for the sidebar */
.main-container {
    display: flex;
    
}

/* Sidebar Navigation Styling */
.nav {
    width: 250px;
    background-color: var(--secondary-bg);
    height: 100vh;
    box-shadow: 2px 0 6px rgba(0, 0, 0, 0.1);
    position: fixed;
    top: 70px; /* Adjust if necessary */
    left: 0;
    padding: 20px;
    display: flex;
    flex-direction: column; /* Stack nav items vertically */
    gap: 20px; /* Space between each nav item */
    z-index: 999; /* Ensure sidebar is on top */
}

/* Each nav option */
.nav-option {
    display: flex;
    align-items: center;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    transition: 0.3s ease;
    cursor: pointer;
    background-color: #fff; /* Ensures there’s a background color */
}

/* Hover effect on nav options */
.nav-option:hover {
    background-color: var(--hover-bg);
}

/* Nav icons */
.nav-option img {
    height: 20px;
    margin-right: 15px;
}

/* Text for the nav options */
.nav-option span {
    font-size: 14px;
    font-weight: 500;
    color: var(--hover-color);
}

/* Styling for links to remove underlines */
a {
    text-decoration: none; /* Remove underline from links */
}


        .main {
            margin-left: 270px;
            padding: 20px;
            width: calc(100% - 270px);
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
/* Default Light Theme */
body {
    font-family: 'Poppins', sans-serif;
    background-color: var(--primary-bg);
    color: #333;
    transition: all 0.3s ease;
}

/* Dark Mode Styling */
body.dark-mode {
    background-color: #181818;
    color: #fff;
}

header {
    height: 70px;
    width: 100%;
    background: linear-gradient(to right, #f5e1ff, #ffffff);
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

.nav-option {
    display: flex;
    align-items: center;
    padding: 10px;
    margin-bottom: 10px;
    border-radius: 5px;
    transition: 0.3s ease;
    cursor: pointer;
}

.nav-option img {
    height: 20px;
    margin-right: 15px;
}

.nav-option span {
    font-size: 14px;
    font-weight: 500;
    color: var(--primary-color);
}

/* Button hover effects */
.nav-option:hover {
    background-color: var(--hover-bg);
}

#theme-toggle {
    cursor: pointer;
    color: var(--primary-color);
}

/* Dark Mode Styling */
body.dark-mode {
    background-color: #181818;
    color: #fff;
}

body.dark-mode header {
    background-color: #222;
}

body.dark-mode .nav {
    background-color: #333; /* Set the sidebar/nav background to black/dark gray */
}

body.dark-mode .main-container {
    background-color: #222; /* Set the main container to dark color */
}

body.dark-mode .nav-option {
    background-color: #444; /* Dark background for nav options */
}

body.dark-mode .nav-option:hover {
    background-color: #555; /* Darker hover effect */
}

body.dark-mode .nav-option span {
    color: #fff; /* Light color for text on dark background */
}

body.dark-mode #theme-toggle {
    color: #fff;
}

/* Button hover effects */
.nav-option:hover {
    background-color: var(--hover-bg);
}

/* Button hover effects for dark mode */
body.dark-mode .nav-option:hover {
    background-color: #555;
}

/* Sidebar Nav Icon Color */
body.dark-mode .nav-option img {
    filter: invert(1); /* Invert icons for dark mode */
}
.profile-logo {
    width: 50px;
    height: 50px;
}
  .notification button {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 24px;
            color: #007bff; /* Blue color */
            margin-left:1200px;
        }
        .notification button:hover {
            color: #0056b3; /* Darker blue on hover */
        }
        
    </style>
<body>
    <header>
    
        <div class="logo">Fitness Freaks</div>
        <div class="notification" onclick="window.location.href='notification.jsp'">
     <button> <i class="fas fa-bell notification-logo"></i></button>
     </div>
        
        <div class="profile" onclick="redirectToProfile()">
            <img src="https://cdn-icons-png.flaticon.com/128/3177/3177440.png" class="profile-logo">
        </div>
    </header>
    <div class="main-container">
        <nav class="nav">
            <a href="Admin.jsp">
                <div class="nav-option">
                    <img src="https://img.icons8.com/material-outlined/24/home.png" alt="Home">
                    <span>Home</span>
                </div>
            </a>

            <a href="user.jsp">
                <div class="nav-option">
                    <img src="https://www.iconpacks.net/icons/1/free-user-group-icon-296-thumb.png" alt="User">
                    <span>User</span>
                </div>
            </a>
            <a href="trainer.jsp">
                <div class="nav-option">
                    <img src="https://cdn-icons-png.flaticon.com/128/4401/4401449.png" alt="Trainer">
                    <span>Trainer</span>
                </div>
            </a>
            <a href="updates.jsp">
                <div class="nav-option">
                    <img src="https://cdn-icons-png.flaticon.com/128/9147/9147804.png" alt="updates">
                    <span>Updates</span>
                </div>
            </a>
            <a href="about.jsp">
                <div class="nav-option">
                    <img src="https://img.icons8.com/material-outlined/24/info.png" alt="About">
                    <span>About</span>
                </div>
            </a>
             <a href="settings.jsp">
                <div class="nav-option">
                    <img src="https://img.icons8.com/material-outlined/24/settings.png" alt="Settings">
                    <span>Settings</span>
                </div>
            </a>
             <div class="nav-option"  id="theme-toggle">
        <img src="https://cdn-icons-png.flaticon.com/128/8138/8138713.png" alt="theme">
        <span> Theme</span></div>
        
           <a href="logout.jsp">
                <div class="nav-option">
                    <img src="https://cdn-icons-png.flaticon.com/128/18792/18792990.png" alt="logout">
                    <span>Logout</span>
                </div>
            </a>
        
        </nav>
    </div>


<script>
    const themeToggleButton = document.getElementById('theme-toggle');
    const body = document.body;

    const currentTheme = localStorage.getItem('theme');
    if (currentTheme === 'dark') {
        body.classList.add('dark-mode');
    }

    themeToggleButton.addEventListener('click', () => {
        body.classList.toggle('dark-mode');

        if (body.classList.contains('dark-mode')) {
            localStorage.setItem('theme', 'dark');
        } else {
            localStorage.setItem('theme', 'light');
        }
    });
</script>
    <script>
        function redirectToProfile() {
            window.location.href = "profile.jsp"; // Redirect to profile.jsp
        }
    </script>


</body>
</html>