<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trainer Profile Update</title>
    <style>
 body {
 font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    width: 60%; /* Adjust the container width to make it smaller */
    margin-left: 300px !important; /* Move the container to the left */
    margin-top: -600px; /* Move the container upwards */
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.form-group input, 
.form-group textarea, 
.form-group select {
    width: 50%; /* Adjust input box width to 50% */
    padding: 6px; /* Reduce padding */
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box; /* Ensure padding doesn't affect the width */
}

.form-group button {
    background-color: #007bff;
    color: #fff;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    border-radius: 4px;
    cursor: pointer;
}

.form-group button:hover {
    background-color: #0056b3;
}

.image-container {
    display: flex;
    align-items: center;
    justify-content: flex-start; /* Align the content to the left */
    margin-bottom: 20px;
}


.rectangular-profile {
    width: 50px;
    height: 50px;
    border-radius: 50%;
}

   .hidden-input {
       position: absolute;
       width: 1px;
       height: 1px;
       opacity: 0;
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
<body>
<div>
        <jsp:include page="NavSide.jsp" />
    </div>
    <div class="container">
        
        <form action="NewUpdateServlet" method="post"  enctype="multipart/form-data">
            <!-- Name -->
            <input type="hidden" name="id" id="id" required>
            
       <div class="image-container">
    Image:  
    <img src="https://via.placeholder.com/50" 
         alt="Upload Image" 
         class="rectangular-profile" 
         id="upload-image1">
    <input type="file" id="image1" class="hidden-input" accept="image/*" name="uimage1" 
           onchange="previewImage(event, 'upload-image1')" required>
</div>
            
            <div class="form-group">
                <label for="name">Class Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter full name" required>
            </div>
            
            
            <div class="form-group">
                <label for="name">Trainer Name:</label>
                <input type="text" id="name" name="trainerName" placeholder="Enter full name" required>
            </div>
            
            <!-- Expertise -->
            <div class="form-group">
                <label for="expertise">Expertise:</label>
                <input type="text" id="expertise" name="expertise" placeholder="e.g., Yoga, Weightlifting" required>
            </div>
         
    <div class="form-group">
        <label for="feedback">We’d love to hear your thoughts on Version 2.0 and Upcoming!</label>
        <textarea id="feedback" name="feedback" rows="6" placeholder="Share your feedback or suggestions here..." required></textarea>
    </div>

   
    <div class="form-group">
        <label for="description">Food & Fitness:</label>
        <textarea id="description" name="description" rows="6" placeholder="Write a brief bio about yourself" required></textarea>
    </div>

    <!-- Submit Button -->
    <div class="form-group">
        <input type="submit" value="Submit">
    </div>  
</form>
        <form action="uploadUpdates" method="get">
            <input type="submit" value="View">
        </form>
       
 
    </div>
    <script>
   function previewImage(event, imageId) {
       const input = event.target;
       if (input.files && input.files[0]) {
           const reader = new FileReader();
           reader.onload = function(e) {
               document.getElementById(imageId).src = e.target.result;
           };
           reader.readAsDataURL(input.files[0]);
       }
   }

   document.getElementById('upload-image1').addEventListener('click', function() {
       document.getElementById('image1').click();
   });
</script>
           <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
