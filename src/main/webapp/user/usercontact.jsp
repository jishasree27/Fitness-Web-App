
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            font-family: poppins, sans-serif;
            padding: 20px;
            background-color: white;
        }

        h2 {
            text-align: center;
        }

        .form-container {
            width: 60%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: #2ac0d4; /* Deep violet */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: grey;
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
 
    <h2>Contact Us</h2>

    <div class="form-container">
        <form action="sendMessage" method="post">
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>

            <label for="email">Your Email Address:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email address" required>

            <label for="message">Your Message:</label>
            <textarea id="message" name="message" rows="5" placeholder="Enter your message" required></textarea>

            <button type="submit" class="btn">Send Message</button>
        </form>
    </div>
  
   <footer>
    
    <jsp:include page="footer.jsp" />
  </footer>
</body>
</html>
