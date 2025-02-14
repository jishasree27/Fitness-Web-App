<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitness-Freaks</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
  /* Custom Styles */
  body {
    background-color: white; /* Set background to white */
    color: rgb(86, 20, 150); /* Set font color */
  }
  .navbar-custom {
    background-color: white !important; /* Set navbar background to white */
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* Soft shadow */
    padding-top: 20px;
    padding-bottom: 20px;
  }
  .navbar-brand {
    display: flex;
    align-items: center;
  }
  .navbar-brand img {
    width: 50px;
    height: 50px;
    margin-right: 10px;
  }
  .navbar-brand span {
    font-size: 20px;
    font-weight: bold;
    color: rgb(86, 20, 150) !important; /* Updated Font Color for Brand */
  }
  .nav-link {
    color: rgb(86, 20, 150) !important; /* Set font color to rgb(86, 20, 150) */
    font-size: 18px;
  }
  .nav-link:hover {
    color: rgba(86, 20, 150, 0.8) !important; /* Slightly lighter on hover */
  }
  .login-signup {
    margin-left: auto;
  }
  .btn-custom {
    color: white !important;
    background-color: rgb(86, 20, 150) !important; /* Button Color */
    border-radius: 20px;
    padding: 8px 15px;
    font-size: 16px;
    border: none;
  }
  .btn-custom:hover {
    background-color: rgba(86, 20, 150, 0.8) !important;
  }
  .btn-outline-primary {
    color: rgb(86, 20, 150) !important;
    border-color: rgb(86, 20, 150) !important;
  }
  .btn-outline-primary:hover {
    background-color: rgb(86, 20, 150) !important;
    color: white !important;
  }

  /* Container with Gradient Background and Centered Image */
  .container-centered {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 500px; /* Adjust the height as needed */
   background: linear-gradient(to right, #2196F3, #FFFFFF); /* Blue to White */
  
  }
  
  .header {
  font-size: 4rem;
  font-weight: bold;
  color: white;
  margin-left: 200px;
   white-space: nowrap;
   margin-top:-100px;
}
  
   .container-centered img {
    bottom: 0; /* Position at the bottom */
    right: 0; /* Position at the right */
    width: 700px; /* Increase the size of the image */
    height: 500px; /* Maintain aspect ratio */
    margin-left:100px;
  }
    .container-centered  h2 {
     font-style: italic; /* Optional: Makes the paragraph text italic */
     white-space: nowrap;
     margin-bottom:-200px;
     margin-left: -450px;
     color: white;
     margin-top:-80px;
  }
  .card-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* Create 4 columns */
    gap: 20px;
    padding: 20px;
  }

  .card {
      background: linear-gradient(to right, #ADD8E6, #FFB6C1); 
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    text-align: center;
    padding: 20px;
    transition: transform 0.3s;
  }

  .card:hover {
    transform: scale(1.05); /* Slightly zoom on hover */
  }

  .card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
    border-radius: 10px;
  }

  .card h3 {
    margin: 15px 0;
    font-size: 1.2em;
    color: #333;
  }

  .card p {
    font-size: 1em;
    color: #666;
  }

  /* Responsive design for smaller screens */
  @media (max-width: 768px) {
    .card-container {
      grid-template-columns: repeat(2, 1fr); /* 2 columns on smaller screens */
    }
  }

  @media (max-width: 480px) {
    .card-container {
      grid-template-columns: 1fr; /* 1 column on very small screens */
    }
  }
  /* General Styles */

/* Container Styling for Both Pages */
/* General Container Styles */
.container2 {
  width: 90%;
  margin: 0 auto;
  padding: 20px;
  box-sizing: border-box;
}

/* Page Header Style */
.page-header {
  font-size: 2rem;
  color: rgb(86, 20, 150);
  margin-bottom: 20px;
  text-align: center;
  font-weight: bold;
}

/* User and Trainer Content Styles */
.user-page-content, .trainer-page-content {
  background-color: #f9f9f9;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  margin-bottom: 20px;
}

/* Strong Text Styles */
strong {
  display: block;
  font-size: 1.1rem;
  margin-top: 15px;
  color: rgb(86, 20, 150); /* Blue color for emphasis */
}

/* Paragraph Styles */
p {
  font-size: 1rem;
  line-height: 1.6;
  color: rgb(86, 20, 150);
  margin-top: 10px;
}
.content {
  background:white;
}

/* Responsive Design for Smaller Screens */
@media (max-width: 768px) {
  .container {
    width: 90%;
  }

  .page-header {
    font-size: 1.5rem;
  }

  .user-page-content, .trainer-page-content {
    padding: 15px;
  }

  strong {
    font-size: 1rem;
  }

  p {
    font-size: 0.95rem;
  }
}

/* General styles for the 'about' section */
/* General container styles */
.about {
  display: flex;
  flex-direction: row; /* Items in a row */
  gap: 20px; /* Add space between items */
  overflow-x: auto; /* Enable horizontal scrolling */
  scroll-snap-type: x mandatory; /* Enable snapping on scroll */
  scrollbar-width: none; /* Hide scrollbar in Firefox */
}

.about::-webkit-scrollbar {
  display: none; /* Hide scrollbar in Chrome, Safari, Edge */
}

.about-item {
  display: flex;
  flex-direction: row; /* Align content in a row */
  align-items: center; /* Vertically center content */
  flex-shrink: 0; /* Prevent items from shrinking */
  min-width: 300px; /* Set a minimum width */
  scroll-snap-align: start; /* Snapping position */
}

.about-image {
  width: 60%; /* Adjust image size */
  height: 400px; /* Maintain aspect ratio */
  margin-right: 20px; /* Space between image and text */
}

.about-content {
  max-width: 300px; /* Limit content width */
}

.about-content h3 {
  font-size: 1.5rem;
  margin-top: 0;
  text-align: center;
  color: black;
  margin-bottom: 10px;
  margin-left:50px;
}

.about-content p {
  font-size: 1.1rem;
  text-align: justify;
  line-height: 1.5;
  color: #555;
}

@media (max-width: 768px) {
  .about {
    flex-direction: column; /* Stack items vertically on smaller screens */
  }

  .about-item {
    min-width: 70%;
    margin: 10px auto;
  }
}

.about-item:hover {
  transform: translateY(-5px);
}
.fitness-container {
   background: linear-gradient(to right, #ADD8E6, #FFB6C1);
    color: white;
    text-align: center;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    max-width: 600px;
    margin: 20px auto;
}

.fitness-container h2 {
    font-size: 28px;
    color:black;
    margin-bottom: 15px;
}

.fitness-container p {
    font-size: 16px;
    margin-bottom: 20px;
}

.signup-btn {
    background-color: white;
    color: #ff4b2b;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-weight: bold;
    transition: 0.3s;
}

.signup-btn:hover {
    background-color: grey;
    color: white;
}

.freaks {
    max-width: 1600px;
    font-family: 'Poppins', sans-serif;
    padding: 20px;
    border-radius: 10px;
   	background: linear-gradient(to right, #E3F2FD, #FFFFFF);/* Light Blue to Light Pink Gradient */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.freaks h2 {
    font-size: 28px;
    font-weight: bold;
    color: #00008B; /* Dark Blue */
    margin-bottom: 15px;
}

.freaks h5 {
    font-size: 18px;
    font-weight: normal;
    color: #333; /* Dark Gray */
    line-height: 1.6;
}

</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">
      <img src="https://img.freepik.com/free-vector/fitness-logo-template-flat-design_52683-16841.jpg?t=st=1738071857~exp=1738075457~hmac=e9e6e0fd21e46f53a7a7ca3b77404ba3a90f747775808b1ba3f7632feb013084&w=740" alt="Logo">
      <span>Fitness Freaks</span>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
      aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" href="frontpage.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="frontContact.jsp">Contact</a>
        </li>
      </ul>
      
      <!-- Login & Signup Links -->
      <div class="login-signup">
        <a href="index.jsp" class="btn btn-custom mx-2">Login</a>
        <a href="signup.jsp" class="btn btn-outline-primary">Signup</a>
      </div>
      
    </div>
  </div>
</nav>
<jsp:include page="login.jsp" />


<div class="freaks">
    <h2>Who are fitness freaks, and what defines them? </h2>
    <h5>
        Fitness freaks are individuals who are deeply committed to maintaining an active and healthy lifestyle. They prioritize physical well-being, often dedicating significant time and effort to rigorous workout routines, proper nutrition, and overall wellness. Whether it’s hitting the gym, practicing yoga, running marathons, or engaging in strength training, they are highly disciplined in their approach. Their motivation stems from a passion for self-improvement, pushing their limits, and striving for peak physical performance. Fitness enthusiasts not only focus on exercise but also emphasize healthy eating, ensuring their diet is rich in proteins, vitamins, and essential nutrients. Mental resilience plays a crucial role in their journey, as they constantly challenge themselves to break barriers, set new fitness goals, and stay consistent. Beyond personal gains, fitness freaks often inspire those around them, promoting a culture of health and wellness. Their dedication to staying fit extends beyond just physical strength; it enhances mental clarity, boosts self-confidence, and fosters a positive mindset. Through persistence, discipline, and unwavering commitment, fitness freaks turn their passion for health into a lifelong pursuit of excellence.
    </h5>
</div>


<!-- Container with Centered Image -->
<div class="container-centered">
    <h1 class="header">Fitness Freaks!!</h1>
    <h2>"Success starts with self-discipline."</h2>
  <img src="https://images.ctfassets.net/473zoc40547p/6h8aHCC0wPR4Quy2ypygoO/32bf96eff1b604278a329efbe6912373/exercise-bike.webp?fm=webp" alt="Centered Image">
</div>

<div class="card-container">
  <div class="card">
    <img src="https://images.pexels.com/photos/414029/pexels-photo-414029.jpeg" alt="Cardio Workouts">
    <h3>Cardio Workouts</h3>
    <p>Boost your heart rate with cardio exercises to stay fit.</p>
  </div>
  
  <div class="card">
    <img src="https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg" alt="Strength Training">
    <h3>Strength Training</h3>
    <p>Build muscle and improve strength with weight exercises.</p>
  </div>
  
  <div class="card">
    <img src="https://media.istockphoto.com/id/936401520/photo/woman-training-yoga-mountains-on-background.jpg?s=612x612&w=0&k=20&c=3SZl_FljV8Ws3t31cxEAhfSAMsgn6ka1zKKLmzYYENI=" alt="Flexibility">
    <h3>Flexibility</h3>
    <p>Improve flexibility with stretching and yoga exercises.</p>
  </div>
  
  <div class="card">
    <img src="https://www.auromere.com/images/Yoga-Pastel-Sun-FB.jpg" alt="Yoga">
    <h3>Yoga</h3>
    <p>Relax and rejuvenate your mind and body with yoga.</p>
  </div>
</div>
<div class="content">
<div class="container">
  <h2 class="page-header">Features for Users</h2>
  <div class="user-page-content">
    <strong>Wide Selection of Verified Trainers:</strong>
    <p>Explore numerous online fitness trainer profiles with certifications, experience, and specialization to match your needs. All profiles are thoroughly verified for your peace of mind.</p>
    <strong>Free Classes and Offers:</strong>
    <p>We offer free fitness classes along with various discounts and offers on premium sessions, so you can start your fitness journey without any worries.</p>
    <strong>Shop Fitness Products:</strong>
    <p>Browse through our store to purchase top-quality fitness products, from workout gear to supplements, and get them delivered right to your doorstep.</p>
    <strong>Easy Booking System:</strong>
    <p>You can book a class with your desired trainer, selecting the date and time that works best for you. Pay conveniently through our secure payment gateway.</p>
    <strong>Updates from Trainers and Admin:</strong>
    <p>Stay informed with the latest fitness trends, news, tips, and updates directly from our trainers and admin team.</p>
    <strong>Health and Fitness Ideas:</strong>
    <p>Receive expert advice and health tips to keep you motivated and on track with your fitness goals.</p>
    <p>Join Fitness Freaks today and start your journey toward a healthier, stronger you! Get personalized guidance, access to free classes, exclusive offers, and much more!</p>
  </div>
</div>

<div class="container2">
  <h2 class="page-header">Features for Trainers</h2>
  <div class="trainer-page-content">
    <p>As a Fitness Freaks trainer, you have the opportunity to inspire and guide countless individuals on their fitness journeys. Our platform allows you to connect with users worldwide, offering personalized online training sessions, providing health tips, and growing your fitness business.</p>

    <strong>Personalized Trainer Profile:</strong>
    <p>Create a detailed profile showcasing your certifications, training specialties, and experience. Share your passion for fitness with a wide audience of potential clients.</p>
    <strong>Flexible Class Scheduling:</strong>
    <p>Offer live classes and schedule one-on-one sessions with your clients, allowing them to choose convenient dates and times. Enjoy complete control over your availability.</p>
    <strong>Secure Payment Gateway:</strong>
    <p>Easily manage payments through our secure platform. Trainers can set their rates and receive payments directly for the classes they provide.</p>
    <strong>Exclusive Offers and Promotions:</strong>
    <p>Engage with users by offering exclusive deals, discounts on fitness products, and special offers on classes or training packages.</p>
    <strong>Health and Fitness Updates:</strong>
    <p>Post updates, workout tips, and fitness challenges to keep your clients motivated. Share the latest trends, exercise routines, and diet plans that benefit your audience.</p>
    <strong>Exposure to a Wide Audience:</strong>
    <p>Gain visibility to a global audience of fitness enthusiasts who are actively looking for personal trainers to help them achieve their goals.</p>

    <p>Join the Fitness Freaks platform today, where you can make a positive impact on your clients' lives and grow your fitness career to new heights!</p>
  </div>
</div>

</div>

<div class="about">
  <div class="about-item">
    <img src="https://media.istockphoto.com/id/1395337483/photo/sports-and-gym-activities.jpg?s=612x612&w=0&k=20&c=lev6DFIvb5CVjdxSxuURswdZYLNHZPT4Y44iUkgm2q4=" alt="Image 1" class="about-image">
    <div class="about-content">
     <h3>Planks</h3>
      <p><strong>Benefits:</strong> Strengthens core, improves posture, enhances balance and coordination.</p>
      <p><strong>How to perform:</strong> Start in a push-up position but with your forearms on the ground.</p>
      <p> Keep your body straight and hold the position as long as you can,</p>
       <p>engaging your core throughout.</p>

    </div>
  </div>
  <div class="about-item">
    <img src="https://s.yimg.com/ny/api/res/1.2/25t7.NFnkRGjY6ZeGmhnPw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTk2MDtoPTU0MA--/https://media.zenfs.com/en-us/purewow_185/5085dfc1054b8f99260cc81b411e5616" alt="Image 2" class="about-image">
    <div class="about-content">
       <h3>Hamstring Stretch</h3>
        <p><strong>Benefits:</strong> Increases flexibility in the hamstrings, reduces risk of injury, improves posture.</p>
      <p><strong>How to perform:</strong> Stand tall and place one foot on an elevated surface such as a bench or step.</p>
      <p> Keep your knee straight and lean forward from the hips to stretch your hamstring. </p>
      <p>Hold the stretch for 20–30 seconds, then switch legs.</p>
    </div>
  </div>
  <div class="about-item">
    <img src="https://images.pexels.com/photos/3823039/pexels-photo-3823039.jpeg?cs=srgb&dl=pexels-elly-fairytale-3823039.jpg&fm=jpg" alt="Image 3" class="about-image">
    <div class="about-content">
       <h3>Tree Pose (Vrksasana)</h3>
          <p><strong>Benefits:</strong> Improves balance, strengthens the legs and core, enhances focus, and promotes mental calmness.</p>
      <p><strong>How to perform:</strong> Stand tall with your feet hip-width apart.</p> 
      <p> Shift your weight onto one leg and place the sole of your other foot on your inner thigh or calf (avoid the knee).</p>
      <p> Bring your hands together in prayer position at your chest, or extend them overhead. </p>
      <p>Hold the position for 20–30 seconds, then switch sides.</p>
     </div>
  </div>
</div>


    <style>
        /* Container Styling */
        .fit-container {
            width: 80%;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 10px;
            box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
            font-family: Arial, sans-serif;
        }

        /* Heading Styles */
        .fitness-header {
            font-size: 2.5rem;
            color: rgb(86, 20, 150);
            font-weight: bold;
            margin-bottom: 15px;
        }

        /* Paragraph Styles */
        .fitness-text {
            font-size: 1.2rem;
            color: #333;
            line-height: 1.6;
            margin: 15px 0;
        }

        /* Bullet Points */
        .fitness-list {
            list-style: none;
            padding: 0;
            text-align: left;
            display: inline-block;
        }

        .fitness-list li {
            font-size: 1.1rem;
            color: #0077b6;
            margin: 5px 0;
        }

        /* Highlight Text */
        .highlight {
            font-weight: bold;
            color: #ff4500;
        }

        /* Motivational Section */
        .motivation {
            font-size: 1.3rem;
            font-style: italic;
            color: #444;
            margin-top: 20px;
            border-left: 5px solid #ff5733;
            padding-left: 15px;
            display: inline-block;
        }

        /* Call to Action */
        .cta {
            font-size: 1.2rem;
            font-weight: bold;
            color: white;
            background-color: rgb(86, 20, 150);
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
        }

        .cta:hover {
            background-color: white;
        }
    </style>

    <div class="fit-container">
        <h1 class="fitness-header">🔥 Fitness Freaks: The Journey to a Stronger You!</h1>
        
        <p class="fitness-text">
            Fitness isn’t just about looking good; it’s about <span class="highlight">feeling strong, confident, and unstoppable.</span>  
            Every drop of sweat, every extra rep, and every step you take is a victory for your body and mind.  
            The greatest investment you can make is in your health!
        </p>

        <p class="fitness-text">
            Whether you’re a beginner or an experienced athlete, the key to success is **consistency**.  
            Small efforts **every day** lead to **big results** over time.
        </p>

        <h2 class="fitness-header">💪 Key Benefits of Fitness</h2>
        <ul class="fitness-list">
            <li>✅ Boosts Energy & Endurance</li>
            <li>✅ Improves Mental Health & Focus</li>
            <li>✅ Strengthens Immunity & Reduces Stress</li>
            <li>✅ Builds Self-Confidence & Discipline</li>
            <li>✅ Enhances Productivity & Sleep Quality</li>
        </ul>

        <p class="motivation">“Your body can stand almost anything—it’s your mind you have to convince!”</p>

        <p class="fitness-text">
            💡 *No matter where you start, every workout is progress. It’s never too late to begin!*
        </p>

        <a href="#" class="cta">Start Your Fitness Journey Today! 🚀</a>
    </div>




<div class="fitness-container">
    <h2>Transform Your Life with Fitness</h2>
    <p>Join our fitness community and take the first step towards a healthier, stronger, and more confident you. 
       Our expert trainers and personalized plans will guide you on your journey.</p>
   <button class="signup-btn" onclick="window.location.href='signup.jsp'">Get Started Now</button>

</div>





<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
          📍 123 coimbatore, Tamil Nadu, India<br>
          📞 +1 234 567 890<br>
          📧 support@fitnessfreaks.com
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
   background-color: #ADD8E6;
    color: #00008B;;
    padding: 40px 0;
    text-align: left;
  }
  
  .footer h4 {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #00008B;;
  }
  
  .footer p, .footer ul {
    font-size: 14px;
    line-height: 1.6;
    color: #00008B;;
  }
  
  .footer ul {
    list-style: none;
    padding: 0;
  }
  
  .footer ul li {
    margin-bottom: 10px;
  }
  
  .footer ul li a {
    color: #00008B;;
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
