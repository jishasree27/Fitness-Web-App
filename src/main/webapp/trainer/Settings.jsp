<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Settings - Fitness Freaks</title>
    <style>
       
        .settings-page {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position:relative;
            top:-600px;
        }
        .settings-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .settings-header img {
            height: 50px;
        }
        .settings-header h1 {
            font-size: 1.8em;
            color: #013220; /* Very dark green */
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
            background-color: rgb(85, 0, 203); /* Very dark green */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .settings-content button:hover {
            opacity: 0.9;
        }
       :root {
            --bg-color: #f4f4f4;
            --text-color: #333;
            --button-bg-light: #4CAF50;
            --button-bg-dark: #333;
        }

        /* Global Styles */
        body {
            background-color: var(--bg-color);
            color: var(--text-color);
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        h1 {
            text-align: center;
            padding: 20px;
        }
         footer {
        margin-top: 30px;
        padding: 10px;
        color: white;
        text-align: center;
        border-radius: 0 0 10px 10px;
        position: sticky;
        top: 0;
}
   

       
    </style>

</head>
<div >
                
                <jsp:include page="NavSide.jsp" />
            </div>
<body>
    <div class="settings-page">
        <div class="settings-header">
            <img src="https://media.istockphoto.com/id/1035561592/vector/vector-design-element-for-the-fitness-center.jpg?s=612x612&w=0&k=20&c=k3yyyEcqeivby9iE7gZIk33PAjtDqNsdEdYiMjw7qsM=" alt="Fitness Freaks Logo">
            <%  String loggedInUser = (String) session.getAttribute("user"); %> <h6><span>Account Holder:</span> <%= loggedInUser %></h6>
            <h1>Settings</h1>
        </div>
        <div class="settings-content">
            <button onclick="window.location.href='ActivityPage.jsp'">View Activity</button>
             <button onclick="window.location.href='profile.jsp'">View Profile</button>
            <form action="Logout" method="get"><button type="submit">Log Out</button>
            </form>
           
        </div>
    </div>
           <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>











