<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<title>Health and Fitness - Trainer Ideas</title>
    <style>
           body {
             font-family: 'Poppins', sans-serif;
           
            margin: 0;
     
        }
         .container-health h4 {
            color: black;
            text-align:center;
        }
       .container-health form {
            background: #fff;

            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
            input, textarea, select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
          button {
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
        }
          button:hover {
            background-color: #218838;
        }
        .container-health{
       
    position: relative;
    top: -600px;
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
<body>

        <jsp:include page="NavSide.jsp" />
        
    <div class ="container-health">
    <h4>Share Your Ideas on Food Control and Fitness</h4>
    <form action="health" method="post" enctype="multipart/form-data">
    	 <input type="hidden" id="id" name="id"  required>
            <div class="image-container">
                        <img src="https://via.placeholder.com/50x50" 
                             alt="Upload Image" 
                             class="rectangular-profile" 
                             id="upload-image1">
                        <input type="file" id="image1" class="hidden-input" accept="image/*" name="uimage1" 
                               onchange="previewImage(event, 'upload-image1')" required>
                    </div>
        <label for="trainerName">Trainer Name:</label>
        <input type="text" id="trainerName" name="trainerName" placeholder="Enter your name" required>
        
        <label for="foodControlIdeas">Your Ideas on Food Control in Fitness:</label>
        <textarea id="foodControlIdeas" name="foodControlIdeas" rows="6" placeholder="Share your ideas here..." required></textarea>
        
        <label for="daysToFollow">Days to Follow:</label>
        <select id="daysToFollow" name="daysToFollow" required>
            <option value="">Select number of days</option>
            <option value="7">7 days</option>
            <option value="14">14 days</option>
            <option value="30">30 days</option>
        </select>
        
        <label for="dailyRoutine">Daily Routine Plan:</label>
        <textarea id="dailyRoutine" name="dailyRoutine" rows="6" placeholder="Provide a detailed daily routine (e.g., workout and meals)..." required></textarea>
        
        <input type="submit" value ="submit">
        
    </form>
 <form action="uploadHealth" method="get">
            <input type="submit" value="View Load">
        </form>
  </div>     
 <script>
        // Function to preview selected image
        function previewImage(event, imageId) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById(imageId).src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        }
    </script>
           <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>