<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Fitness Freaks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        .about-container {
            max-width: 800px;
            margin: 60px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .about-container,contact-section h2 {
            color: #4A235A; /* Dark purple */
        }

        .about-container,contact-section p {
            font-size: 16px;
            line-height: 1.6;
        }

        .about-container.highlight {
            font-weight: bold;
            color: #8510d8; /* Purple tone */
        }

        .about-container.contact-section {
            margin-top: 20px;
            padding: 15px;
            background-color: #f5e1ff;
            border-radius: 5px;
        }
        .navbar-nav {
    display: flex !important;
    flex-direction: row !important;
    align-items: center;
    justify-content: center;
    gap: 20px; /* Adjust spacing */
    list-style: none;
    padding: 0;
    margin: 0;
}
        
    </style>
</head>
<body>

    <jsp:include page="frontNav.jsp" /> <!-- Include Navigation Bar -->

    <div class="about-container">
        <h2>About Fitness Freaks</h2>
        <p>Welcome to <span class="highlight">Fitness Freaks</span> – your ultimate fitness companion! 
        Our mission is to empower individuals to lead a healthy lifestyle through customized workout plans, 
        nutritional guidance, and a supportive fitness community.</p>

        <h3>Our Mission</h3>
        <p>We believe that fitness is not just about physical health but also about mental well-being. 
        Our goal is to provide a platform that makes fitness <span class="highlight">accessible, enjoyable, and effective</span>.</p>

        <h3>What We Offer</h3>
        <p>🏋️‍♂️ Personalized Workout Plans<br>
        🍎 Diet & Nutrition Guidance<br>
        🎯 Goal Tracking & Progress Analysis<br>
        🤝 Community Support & Motivation</p>

        <div class="contact-section">
            <h3>Contact Us</h3>
            <p>Email: support@fitnessfreaks.com</p>
            <p>Phone: +91 98765 43210</p>
            <p>Follow us on <a href="#" class="highlight">Social Media</a></p>
        </div>
    </div>

  
  <jsp:include page="frontfooter.jsp" /> 
</body>
</html>
