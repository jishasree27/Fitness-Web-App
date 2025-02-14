<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Video Upload Page</title>
    <style>
        /* Basic Styles */
        body {
             font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
          
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
.form-container {
    max-width: 900px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: relative; /* Enable relative positioning */
    left: 300px; /* Move container to the right */
    top: -600px; /* Optional: Move container upwards */
    margin-right: 10px;
}


       .form-container h2 {
            color: #013220; /* Very dark green */
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
        }

input[type="text"],
input[type="file"],
input[type="date"],
input[type="time"],
textarea {
    padding: 15px; /* Increased padding for more space inside the input fields */
    margin-top: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    width: 100%; /* Make input fields span the full container width */
    max-width: 500px; /* Set a max-width to prevent inputs from becoming too large */
    font-size: 16px; /* Increase font size for better readability */
}

textarea {
    height: 150px; /* Adjust the height for the textarea */
    resize: vertical; /* Allow vertical resizing */
}


        input[type="submit"] {
            background-color:  rgb(85, 0, 203); /* Very dark green */
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 5px;
            width: auto;
        }
        

        input[type="submit"]:hover {
            background-color: grey; /* Darker shade */
        }

        .round-profile {
            border-radius: 50%;
            width: 100px; 
            height: 100px; 
            object-fit: cover; 
            cursor: pointer; 
            border: 2px solid #013220; /* Add border for better visibility */
        }

        .hidden-input {
            display: none;
        }

        .instructor-img {
            text-align: center;
            margin-bottom: 20px;
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
    <div class="form-container">
        <h2>Upload Video</h2>
        <form action="video" method="post" enctype="multipart/form-data">
            <div class="instructor-img">
                <img src="https://example.com/path-to-instructor-photo.jpg" 
                     alt="Upload Image" 
                     class="round-profile" 
                     id="upload-instructor-photo">
                <input type="file" id="file-input" class="hidden-input" accept="image/*" name="uimage">
            </div>

            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" placeholder="Enter title" name="utitle" required />

            <label for="videoFile">Choose Video:</label>
            <input type="file" id="videoFile" name="uvideo" accept="video/*" required />

            <label for="thumbnailFile">Choose Thumbnail:</label>
            <input type="file" id="thumbnailFile" name="uthumbnail" accept="image/*" required />

            <label for="trainerName">Trainer Name:</label>
            <input type="text" id="trainerName" name="uname" required />
            
            <label for="instructor-role">Role</label>
            <input type="text" id="instructor-role" name="urole" placeholder="Instructor Role" value="Top Instructor" readonly>
            
             <label for="class-details">Trainer Details</label>
            <textarea id="class-details" name="udetails" placeholder="Provide class details"></textarea>
      
      		 <label for="class-date">Date</label>
            <input type="date" id="class-date" name="udate">
            
            <label for="class-time">From Time</label>
            <input type="time" id="class-time" name="uFtime">
            
            <label for="class-time">To Time</label>
            <input type="time" id="class-time" name="uTtime">

            <label for="trainerSpecification">Specification:</label>
            <input type="text" id="specification" name="uspecification" required />
            
            <label for="payment-details">Payment Details</label>
            <input type="text" id="payment-details" name="upayment" placeholder="Enter payment details">
            
            <label for="offer-details">Offer Name:</label>
            <input type="text" id="offer-details" name="uoffername" placeholder="Enter offer details">
        
            <label for="offer-details">Offer</label>
            <input type="text" id="offer-details" name="uoffer" placeholder="Enter offer details">
        
            <label for="offer-details">Valid till</label>
            <input type="text" id="offer-details" name="uoffervalid" placeholder="Enter Offer details">

            <label for="trainerMessage">Message:</label>
            <input type="text" id="trainermessage" name="umessage" required />
            
            <label for="trainerClass">class Link:</label>
            <input type="text" id="trainerclass" name="uclass" required />
            
           
            <input type="submit" value="Upload Video">
        </form>
        <form action="upload" method="get">
            <input type="submit" value="View">
        </form>
    </div>

    <script>
        // Trigger file input when the round profile image is clicked
        document.getElementById('upload-instructor-photo').addEventListener('click', function() {
            document.getElementById('file-input').click();
        });

        // Display the selected image in the round profile
        document.getElementById('file-input').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('upload-instructor-photo').src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
    </script>
    <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
