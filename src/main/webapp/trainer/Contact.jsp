<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Contact Us - Fitness Freaks</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .contact-page {
            text-align: center;
            padding: 50px 20px;
            margin-top:-600px;
        }
        .contact-page h1 {
            font-size: 2.5em;
           color: #013220; /* Very dark green */
        }
        .contact-page p {
            font-size: 1.2em;
            line-height: 1.6;
            max-width: 800px;
            margin: 20px auto;
        }
        .contact-form {
            max-width: 600px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .contact-form input,
        .contact-form textarea,
        .contact-form button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
        }
        .contact-form button {
            background-color: #013220; /* Very dark green */
            color: white;
            border: none;
            cursor: pointer;
        }
        .contact-form button:hover {
            opacity: 0.9;
        }
        input[type="submit"] {
    background-color: rgb(85, 0, 203); /* Set background color */
    color: white; /* Set text color */
    border: none; /* Remove default border */
    padding: 10px 20px; /* Add padding */
    font-size: 1rem; /* Set font size */
    cursor: pointer; /* Change cursor to pointer on hover */
    border-radius: 4px; /* Optional: adds rounded corners */
    margin-right: 10px; /* Add space to the right of the button */
    margin-bottom: 10px;
    width: 50%; /* Make the width of the button 100% of its container */
}

input[type="submit"]:hover {
    background-color: rgb(68, 0, 160); /* Darker shade on hover */
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
    <div class="contact-page">
        <h1>Contact Us</h1>
        <p>
            Have questions or need assistance? We are here to help! Get in touch with us for any inquiries, 
            feedback, or support. Our team at <strong>Fitness Freaks</strong> is dedicated to providing the 
            best experience for our valued trainees and community.
        </p>
        <form action="ContactServlet" method="post" class="contact-form">
            <input type="text" name="name" placeholder="Your Name" required>
            <input type="email" name="email" placeholder="Your Email" required>
            <textarea name="message" rows="5" placeholder="Your Message" required></textarea>
            <input type="submit" value="Submit">
        </form>
    </div>
       <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
