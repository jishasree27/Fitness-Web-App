<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
    max-width: 450px; /* Reduced width */
    margin: 40px; /* Added some top margin for better spacing */
    padding: 15px; /* Slightly reduced padding */
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-left:500px;
}


        .container h1 {
            text-align: center;
            color: #333;
        }

        .container p {
            text-align: center;
            color: #555;
        }

        .container .mb-3 {
            margin-bottom: 1rem;
        }

        .container .form-label {
            font-weight: bold;
            color: #333;
        }

       .container .form-control {
            width: 90%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 4px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

       .container .form-control:focus {
            border-color: #007bff;
            outline: none;
        }

        .container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }

        .container button:hover {
            background-color: #0056b3;
        }

        .container a.nav-link {
            text-decoration: none;
            color: #007bff;
        }

        .container a.nav-link:hover {
            color: #0056b3;
        }

        .container .btn-primary {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }

        .container .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<jsp:include page="frontNav.jsp" /> 
    <div class="container mt-4">
        
        <h1>Contact Us</h1>
        <p>If you have any questions or concerns, feel free to reach out to us!</p>

        <form action="ContactAdmin" method="POST">
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Send Message</button>
        </form>
    </div>
   
<footer class="text-black text-center p-3 mt-auto bg-light w-100">
    <div class="container">
        <p>&copy; 2024 Fitness Freaks. All rights reserved.</p>
        <p>
            <a href="#" class="text-black me-3">Privacy Policy</a>
            <a href="#" class="text-black">Terms of Service</a>
        </p>
    </div>
</footer>

</body>
</html>


