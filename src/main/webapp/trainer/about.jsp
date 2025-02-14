<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>About Trainee - Fitness Freaks</title>
    <style>
        body {
             font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }
        .about-page {
            text-align: center;
            padding: 50px 20px;
            position:relative;
            top:-600px;
        }
        .about-page h3 {
       
           color: black; /* Very dark green */
        }
        .about-page p {
            font-size: 1.2em;
            line-height: 1.6;
            max-width: 800px;
            margin: 20px auto;
            color:black;
        }
        .about-page img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
            footer {
		    padding: 10px;
		    color: white;
		    text-align: center;
		    border-radius: 0 0 10px 10px;
		    position: static;
		    top: 0;
}
      
    </style>
</head>

             <div >
                
                <jsp:include page="NavSide.jsp" />
            </div>
<body>
    <div class="about-page">
        <h3>About Our Trainees</h3>
     <p>
        At <strong>Fitness Freaks</strong>, our trainees are the heart of our community. Each trainee 
        comes with unique goals, ambitions, and challenges, and we are dedicated to helping them succeed. 
        Whether it is weight loss, muscle building, or improving overall wellness, our trainees push their limits 
        and inspire each other to become the best versions of themselves.
    </p>
    <p>
        With personalized training programs, state-of-the-art equipment, and a supportive network, our trainees 
        are transforming their lives one step at a time. Their journey is a testament to the power of hard work, 
        determination, and the right guidance.
    </p>
    
    </div>
      <footer >
        <jsp:include page="footer.jsp" />
   </footer>
</body>
</html>
