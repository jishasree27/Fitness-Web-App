<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQs</title>
    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Container to center the content */
        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Page Heading */
        h1 {
            font-size: 2.5rem;
            color: #2e8b57; /* Light Green color */
            text-align: center;
            margin-bottom: 20px;
        }

        /* Navigation Button */
        button {
            background-color: #2e8b57;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-bottom: 20px;
        }

        button a {
            color: #fff;
            text-decoration: none;
        }

        button:hover {
            background-color: #256c43; /* Darker green on hover */
        }

        /* FAQ Section */
        .faq {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 15px;
            margin-bottom: 15px;
        }

        .faq h5 {
            font-size: 1.2rem;
            color: #2e8b57;
            margin-bottom: 10px;
        }

        .faq p {
            font-size: 1rem;
            color: #555;
            margin: 0;
        }
    </style>
</head>
<body><jsp:include page="Navbar.jsp" />
    <div class="container mt-4">
        
        <h1>Frequently Asked Questions</h1>
        <div class="faq">
            <h5>1. How do I create an account?</h5>
            <p>You can create an account by clicking the "Sign Up" button on the homepage and filling out your details.</p>
        </div>
        <div class="faq">
            <h5>2. How can I reset my password?</h5>
            <p>If you've forgotten your password, click on the "Forgot Password" link on the login page and follow the instructions.</p>
        </div>
        <div class="faq">
            <h5>3. How can I track my progress?</h5>
            <p>You can track your progress in the "Progress" section, where you can log your workouts and monitor your improvements over time.</p>
        </div>
        <div class="faq">
            <h5>4. Can I connect with other users?</h5>
            <p>Yes, you can connect with other users through our community section where you can share tips, challenges, and achievements.</p>
        </div>
    </div>
</body>
</html>
<jsp:include page="footer.jsp" />
