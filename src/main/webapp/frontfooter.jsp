<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Fitness Freaks</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
 
<!-- Bootstrap JS -->

<!-- Footer Section -->
<footer class="footer">
  <div class="container">
    <div class="row">
      
      <!-- About Section -->
      <div class="col-lg-4 col-md-6 footer-about">
        <h4>About Fitness Freaks</h4>
        <p>Your trusted partner for a healthier and stronger lifestyle. Join our community and reach your fitness goals with expert trainers and top-quality products.</p>
      </div>
      
      <!-- Quick Links -->
      <div class="col-lg-2 col-md-6 footer-links">
        <h4>Quick Links</h4>
        <ul>
          <li><a href="frontpage.jsp">Home</a></li>
          <li><a href="about.jsp">About</a></li>
          <li><a href="frontContact.jsp">Contact</a></li>
          <li><a href="signup.jsp">Sign Up</a></li>
        </ul>
      </div>

      <!-- Contact Details -->
      <div class="col-lg-3 col-md-6 footer-contact">
        <h4>Contact Us</h4>
        <p>
        &#128205; 123 Coimbatore, Tamil Nadu, India <br>
		&#128222; +1 234 567 890 <br>
		&#128231; support@fitnessfreaks.com

        </p>
      </div>

      <!-- Social Media Links -->
      <div class="col-lg-3 col-md-6 footer-social">
        <h4>Follow Us</h4>
        <div class="social-icons">
          <a href="#"><img src="https://cdn-icons-png.flaticon.com/512/733/733547.png" alt="Facebook"></a>
          <a href="#"><img src="https://cdn-icons-png.flaticon.com/512/733/733558.png" alt="Instagram"></a>
          <a href="#"><img src="https://cdn-icons-png.flaticon.com/512/733/733635.png" alt="Twitter"></a>
          <a href="#"><img src="https://cdn-icons-png.flaticon.com/512/733/733579.png" alt="YouTube"></a>
        </div>
      </div>

    </div>
    
    <!-- Copyright Section -->
    <div class="footer-bottom">
      <p>&copy; 2025 Fitness Freaks. All Rights Reserved.</p>
    </div>
    
  </div>
</footer>

<!-- Footer CSS -->
<style>
  .footer {
    background-color: rgb(86, 20, 150);
    color: white;
    padding: 40px 0;
    text-align: left;
  }
  
  .footer h4 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 20px;
    color:white;
  }
  
  .footer p, .footer ul {
    font-size: 14px;
    line-height: 1.6;
    color:white;
  }
  
  .footer ul {
    list-style: none;
    padding: 0;
  }
  
  .footer ul li {
    margin-bottom: 10px;
  }
  
  .footer ul li a {
    color: white;
    text-decoration: none;
    transition: color 0.3s;
  }
  
  .footer ul li a:hover {
    color: rgba(255, 255, 255, 0.8);
  }
  
  .footer-contact p {
    margin-bottom: 10px;
  }

  /* Social Media Icons */
  .footer-social .social-icons {
    display: flex;
    gap: 15px;
    margin-top: 10px;
  }
  
  .footer-social .social-icons a img {
    width: 30px;
    height: 30px;
    transition: transform 0.3s;
  }
  
  .footer-social .social-icons a img:hover {
    transform: scale(1.1);
  }

  /* Copyright */
  .footer-bottom {
    text-align: center;
    margin-top: 30px;
    font-size: 14px;
    border-top: 1px solid rgba(255, 255, 255, 0.3);
    padding-top: 15px;
  }
  
  /* Responsive Footer */
  @media (max-width: 768px) {
    .footer .row {
      text-align: center;
    }
    .footer-social .social-icons {
      justify-content: center;
    }
  }
</style>


</body>
</html>
