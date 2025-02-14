<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.UserDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            padding: 20px;
            background-color: white;
        }

        h2 {
            text-align: center;
        }

        .form-container {
            width: 50%;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: #2ac0d4; 
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .content {
            margin-bottom: 5em; /* Adds 5 lines worth of space (approximately) */
            background-color: white;
        }

        .settings-content {
            margin-top: 20px;
        }

        .settings-content button {
            display: block;
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            font-size: 1em;
            background-color: #2ac0d4; 
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .settings-content button:hover {
            opacity: 0.9;
        }

        .settings-header img {
            height: 50px;
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
<div class="">
    <h2>User Settings</h2>
    <% 
        String loggedInUserEmail = (String) session.getAttribute("user");
        HomeDao homeDao = new HomeDao();
        if (loggedInUserEmail == null) { 
    %>
        <div class="text-center">
            <p style="color: red; text-align: center;">Please log in to view your details.</p>
            <a href="login.jsp" class="btn btn-primary">Login</a>
        </div>
    <% 
        } else {
            UserDetails userDetails = homeDao.getDetailByEmail(loggedInUserEmail);

            if (userDetails != null) { 
    %>
    <div class="form-container">
        <div class="profile-container">
            <div class="settings-header text-center">
                <img src="https://media.istockphoto.com/id/1035561592/vector/vector-design-element-for-the-fitness-center.jpg?s=612x612&w=0&k=20&c=k3yyyEcqeivby9iE7gZIk33PAjtDqNsdEdYiMjw7qsM=" alt="Fitness Freaks Logo">
                <% String loggedInUser = (String) session.getAttribute("user"); %>
                <h4><span>Account Holder:</span> <%= loggedInUser != null ? loggedInUser : "Guest" %></h4>
                <h1>Settings</h1>
            </div>
            <form action="updateSettings" method="post">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter your full name" value="<%= userDetails.getName() %>" required>

                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email address" value="<%= userDetails.getEmail() %>" required>
            </form>
            <div class="settings-content">
                <button onclick="window.location.href='UserActivity.jsp'">View Activity</button>
                <button onclick="window.location.href='userProfile.jsp'">View Profile</button>
                <form action="Logout" method="get"><button type="submit">Log Out</button></form>
            </div>
        </div>
    </div>
    <% 
        } else { 
    %>
        <div class="text-center">
            <p style="color: red; text-align: center;">No details found for the logged-in user.</p>
        </div>
    <% 
        } 
    } 
    %>
</div>

<footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
