<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Update Form</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to the external CSS file -->
</head>
<style>body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.update-form {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.image-container {
    display: flex;
    align-items: center;
    gap: 10px;
}

.rectangular-profile {
    width: 100px;
    height: 100px;
    object-fit: cover;
    border-radius: 10px;
    border: 2px solid #ccc;
}

.hidden-input {
    display: none;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 5px;
}

.form-group label {
    font-weight: bold;
    color: #333;
}

.form-group input, 
.form-group textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

textarea {
    resize: vertical;
}

.submit-btn, .btn-primary {
    background: #007bff;
    color: #fff;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.submit-btn:hover, .btn-primary:hover {
    background: #0056b3;
}

.btn-primary {
    width: fit-content;
    margin: 20px 0 0;
}

@media (max-width: 768px) {
    .container {
        padding: 15px;
    }
}
</style>
<body>
    <div>
        <jsp:include page="adminNavside.jsp" />
    </div>
    
    <div class="container">
    <h3>Updates</h3>
        <form action="adminUpdateServlet" method="post" enctype="multipart/form-data" class="update-form">
            <!-- ID (Hidden) -->
            <input type="hidden" name="id" id="id" required>

         <!-- Image Upload -->
<div class="image-container">
    <label for="image1" class="image-label">
        <img src="https://via.placeholder.com/100" 
             alt="Upload Image" 
             class="rectangular-profile" 
             id="upload-image1">
    </label>
    <input type="file" id="image1" class="hidden-input" accept="image/*" name="uimage1" 
           onchange="previewImage(event, 'upload-image1')" required>
</div>


            <!-- Title -->
            <div class="form-group">
                <label for="class-name">Title:</label>
                <input type="text" id="class-name" name="title" placeholder="Enter title" required>
            </div>

            <!-- Update Details -->
            <div class="form-group">
                <label for="feedback">Updation Details:</label>
                <textarea id="feedback" name="update" rows="6" placeholder="Share here..." required></textarea>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <button type="submit" class="submit-btn">Submit</button>
            </div>  
        </form>

        <!-- View Load Button -->
        <form action="uploadadmin" method="get">
            <button type="submit" class="btn btn-primary">View Load</button>
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
</body>

</html>
