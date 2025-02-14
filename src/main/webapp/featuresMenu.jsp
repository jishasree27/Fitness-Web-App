<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Features</title>
    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Container to center the form */
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Form-like Box for Features */
        .feature-box {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        /* Page Heading */
        h1 {
            font-size: 2.5rem;
            color: #2e8b57; /* Light Green color */
            text-align: center;
            margin-bottom: 20px;
        }

        /* List of Features */
        ul {
            list-style-type: none;
            padding: 0;
        }

        ul li {
            margin-bottom: 10px;
            font-size: 1.2rem;
        }

        /* Button Styles */
        button {
            background-color: #2e8b57;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #256c43; /* Darker green on hover */
        }

        /* Navigation Link Styles */
        a.nav-link {
            text-decoration: none;
            color: #fff;
        }

        a.nav-link:hover {
            color: #d9d9d9;
        }

    </style>
</head>
<body><jsp:include page="Navbar.jsp" />
    <div class="container mt-4">
    
        
        <!-- Features Form Box -->
        <div class="feature-box">
            <h1>Features of Our Fitness App</h1>
            <ul>
                <li>Track your workouts and progress.</li>
                <li>Get personalized workout plans.</li>
                <li>Monitor your daily calorie intake and nutrition.</li>
                <li>Join challenges and compete with friends.</li>
                <li>Access fitness tips and tutorials.</li>
            </ul>
        </div>
    </div>
  
</body>
</html>
  <jsp:include page="footer.jsp" />
