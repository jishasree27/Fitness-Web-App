<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>More Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
        }

        .info-container {
            width: 70%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .info-container h3 {
            color:  #301934; /* Deep violet */
        }

        .info-container p {
            margin-bottom: 15px;
            line-height: 1.6;
            color: #333;
        }

        .back-btn {
            background-color: #301934; /* Deep violet */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
        }

        .back-btn:hover {
            background-color: #45a049;
        }

        .content {
            margin-bottom: 5em; /* Adds 5 lines worth of space (approximately) */
        }
    </style>
</head>
<body>
<div>
    <jsp:include page="userNavSide.jsp" />
</div>
<div class="content">
    <h2>More Information</h2>

    <div class="info-container">
        <h3>Welcome to Fitness Freaks</h3>
        <p>At Fitness Freaks, we believe that fitness should be accessible and enjoyable for everyone. Our platform offers a wide range of workout routines, expert tips, and personalized fitness plans tailored to meet the needs of individuals at every stage of their fitness journey.</p>

        <p>Whether you're just starting out or you're a seasoned fitness enthusiast, we have something for you. From cardio and strength training to yoga and flexibility routines, Fitness Freaks is committed to providing quality resources that help you achieve your fitness goals effectively and safely.</p>

        <p>Our dedicated team of trainers and nutritionists are here to guide you with valuable advice, tips, and motivation. We also offer group training sessions, one-on-one coaching, and an online community to support you along the way.</p>

        <p>Stay up to date with the latest trends in fitness and wellness by exploring our regularly updated blog and newsletter. Fitness Freaks is not just a website, it's a lifestyle, and we are excited to help you become the best version of yourself!</p>

        <p>Thank you for being a part of the Fitness Freaks community. We are committed to helping you reach your fitness goals and look forward to seeing you thrive.</p>

        <p>If you have any questions or need assistance, feel free to contact us at <a href="mailto:fitnessfreaks2025@gmail.com">fitnessfreaks2025@gmail.com</a>.</p>
       
        <a href="library.jsp" class="back-btn">Back to Library</a> 
    </div>
</div>

<div>
    <jsp:include page="footer.jsp" />
</div>
</body>
</html>
s