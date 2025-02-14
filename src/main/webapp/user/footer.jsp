<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fitness Freaks</title>
 <style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
  }

  .content {
    min-height: calc(100vh - 160px); /* Adjust height to account for footer space */
    padding: 20px;
    padding-bottom: 40px; /* Leave extra space before the footer */
    background-color: #E5F4F6;
  }

  .footer {
    padding-top: 40px;
    background-color: #E5F4F6;
    color: black;
    padding: 20px 10px;
    font-family: Arial, sans-serif;
    position: sticky;
    bottom: 0;
    width: 100%;
  }

  .footer-container {
    display: flex;
    justify-content: space-between;
    max-width: 1200px;
    margin: 0 auto;
  }

  .footer-section {
    flex: 1;
    min-width: 200px;
    margin: 10px;
  }

  .footer h3 {
    color: #ff5722;
  }

  .footer ul {
    list-style: none;
    padding: 0;
    font-size: 14px;
  }

  .footer ul li a {
    color: black;
    text-decoration: none;
  }

  .footer ul li a:hover {
    text-decoration: underline;
  }

  .footer a {
    color: black;
    text-decoration: none;
  }

  .footer a:hover {
    text-decoration: underline;
  }

  .subscribe-form {
    display: flex;
    gap: 10px;
  }

  .subscribe-form input {
    padding: 8px;
    flex: 1;
    border: none;
    border-radius: 5px;
  }

  .subscribe-form button {
    padding: 8px 12px;
    background-color: #ff5722;
    border: none;
    color: #fff;
    cursor: pointer;
    border-radius: 5px;
  }

  .footer-bottom {
    text-align: center;
    margin-top: 20px;
    font-size: 14px;
  }
</style>

</head>
<body>
 

  <div class="footer">
    <div class="footer-container">
      <!-- About Us Section -->
      <div class="footer-section">
        <h3>About FitLife</h3>
        <p>Your one-stop platform for fitness tips, workout plans, and nutrition guidance. Empowering your journey to a healthier life.</p>
      </div>

      <!-- Quick Links Section -->
      <div class="footer-section">
        <h3>Quick Links</h3>
        <ul>
          <li><a href="#workouts">Workouts</a></li>
          <li><a href="#nutrition">Nutrition</a></li>
          <li><a href="#tips">Health Tips</a></li>
          <li><a href="#contact">Contact Us</a></li>
        </ul>
      </div>

      <!-- Social Media Section -->
      <div class="footer-section">
        <h3>Connect with Us</h3>
        <div>
          <a href="https://www.facebook.com" target="_blank">Facebook</a>
          <a href="https://www.instagram.com" target="_blank" style="margin-left: 10px;">Instagram</a>
          <a href="https://www.twitter.com" target="_blank" style="margin-left: 10px;">Twitter</a>
        </div>
      </div>

      <!-- Newsletter Section -->
      <div class="footer-section">
        <h3>Subscribe</h3>
        <p>Get the latest fitness tips and updates directly to your inbox.</p>
        <form class="subscribe-form">
          <input type="email" placeholder="Enter your email">
          <button type="submit">Subscribe</button>
        </form>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; 2024 FitLife. All rights reserved. | <a href="#privacy">Privacy Policy</a></p>
    </div>
  </div>
</body>
</html>
