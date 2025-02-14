<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navigation Bar</title>
    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

    /* Navigation Bar */
        nav {
            background-color: #ffffff; /* Background color */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow to navbar */
        }

        /* Header on the Left */
        .header {
            font-size: 1.8rem;
            color: rgb(85, 0, 203);
            font-weight: bold;
        }

        /* Navigation Links on the Right */
        .nav-links {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
        }

        .nav-links li {
            margin-left: 20px;
        }

        .nav-links a {
            text-decoration: none;
            color: rgb(85, 0, 203);
            font-size: 1.2rem;
            padding: 8px 12px;
            transition: background-color 0.3s ease;
        }

        .nav-links a:hover {
          background-color:#f8f9fa;
            color: rgb(85, 0, 203);
            border-radius: 5px;
        }

    </style>
</head>
<body>

    <nav>
        <!-- Left Header -->
        <div class="header">Fitness Freaks</div>

        <!-- Right Navigation Links -->
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="contactMenu.jsp">Contact</a></li>
            <li><a href="featuresMenu.jsp">Features</a></li>
            <li><a href="faqsMenu.jsp">FAQs</a></li>
        </ul>
    </nav>

</body>
</html>
