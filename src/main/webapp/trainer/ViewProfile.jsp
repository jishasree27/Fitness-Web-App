<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitness Freaks Essentials</title>
</head>
<style>


.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    padding: 20px;
    width: 95%;
    max-width: 1200px;
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.content {
    width: 100%;
}

h1.title {
    text-align: center;
    margin-bottom: 20px;
}

.instructor-info {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}

.instructor-img img {
    border-radius: 50%;
    width: 80px;
    height: 80px;
    object-fit: cover;
}

.instructor-name, .instructor-role {
    margin-left: 20px;
}

.instructor-name input, .instructor-role input {
    width: 200px;
    padding: 5px;
    margin-top: 5px;
}

.class-details, .date-time, .payment-info {
    margin-bottom: 15px;
}

textarea, input[type="text"], input[type="date"], input[type="time"] {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.enroll-btn form {
    display: flex;
    justify-content: center;
}

.pay-button {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.pay-button:hover {
    background-color: #45a049;
}

.enrollment-info p {
    text-align: center;
    font-size: 14px;
}
.round-profile {
    border-radius: 50%;
    width: 100px; /* Adjust width */
    height: 100px; /* Adjust height */
    object-fit: cover; /* Ensure the image fits properly */
    cursor: pointer; /* Indicate clickable image */
}

.logo img{
 height: 50px;
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
<body>
<div>
        <jsp:include page="NavSide.jsp" />
    </div>
     <form action="viewprofile" method="post" enctype="multipart/form-data">
   <div class="container">
    <div class="logo">
        <img src="https://media.istockphoto.com/id/1035561592/vector/vector-design-element-for-the-fitness-center.jpg?s=612x612&w=0&k=20&c=k3yyyEcqeivby9iE7gZIk33PAjtDqNsdEdYiMjw7qsM=" 
            srcset="https://example.com/path-to-logo.png 2x, https://example.com/path-to-logo.png 3x" 
            alt="Fitness Freaks">
    </div>

    <div class="content">
        <h1 class="title">Fitness Freaks Essentials</h1>

        <div class="instructor-info">
		<div class="instructor-img">
    <img src="https://example.com/path-to-instructor-photo.jpg" 
         alt="Instructor Name" class="round-profile" id="upload-instructor-photo">
    <input type="file" id="file-input" style="display: none;" accept="image/*" name="uimage">
</div>
                
            <div class="instructor-name">
                <label for="instructor-name">Instructor Name</label>
                <input type="text" id="instructor-name" name="uname" placeholder="Instructor Name">
            </div>
            <div class="instructor-role">
                <label for="instructor-role">Role</label>
                <input type="text" id="instructor-role" name="urole" placeholder="Instructor Role" value="Top Instructor" readonly>
            </div>
        </div>

        <div class="class-details">
            <label for="class-details">Class Details</label>
            <textarea id="class-details" name="udetails" placeholder="Provide class details"></textarea>
        </div>

        <div class="date-time">
            <label for="class-date">Date</label>
            <input type="date" id="class-date" name="udate">
            
            <label for="class-time">From Time</label>
            <input type="time" id="class-time" name="uFtime">
            
            <label for="class-time">To Time</label>
            <input type="time" id="class-time" name="uTtime">
        </div>

        <div class="payment-info">
            <label for="payment-details">Payment Details</label>
            <input type="text" id="payment-details" name="upayment" placeholder="Enter payment details">
        </div>
        <div class="Offer-info">
            <label for="offer-details">Offer</label>
            <input type="text" id="offer-details" name="uoffer" placeholder="Enter Offer details">
        </div>

        <div class="enroll-btn">
         
                <input type="hidden" name="action" value="enroll">
                <button type="submit" class="pay-button">
                    <span>Submit</span>
                   
                </button>
            </form>
            <form action="viewingprofile" method="get"><button type="submit">View</button></form>
        </div>

    </div>
</div>
<script>
document.getElementById('upload-instructor-photo').addEventListener('click', function() {
    document.getElementById('file-input').click(); // Triggers the file input click
});

document.getElementById('file-input').addEventListener('change', function(event) {
    const file = event.target.files[0]; // Get the selected file
    if (file) {
        const reader = new FileReader(); // Create a FileReader to read the file
        reader.onload = function(e) {
            // Set the image source to the selected file's data URL
            document.getElementById('upload-instructor-photo').src = e.target.result;
        };
        reader.readAsDataURL(file); // Read the file as a data URL
    }
});
</script>
    <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
