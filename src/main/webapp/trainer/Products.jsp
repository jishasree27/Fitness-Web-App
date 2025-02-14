<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trainer Product Listing</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
     
        }
.container {
    max-width: 700px; /* Reduced width to make the container smaller */
    position: absolute; /* For precise placement */
    left: 300px; /* Adjust horizontal placement */
    top: 250px; /* Adjust vertical placement */
    background: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 15px; /* Reduced padding for a smaller appearance */
}

.container h4{
color:black;

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
            width: 100%;
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 4px;
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
        .image-preview {
            display: flex;
            gap: 10px;
        }
        .image-preview img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }
        .product-images {
    display: flex;
    gap: 10px;
    margin-top: 10px;
}

.image-container {
    position: relative;
    width: 150px;
    height: 100px;
    overflow: hidden;
    border: 1px solid #ddd;
    border-radius: 5px;
    text-align: center;
    background-color: #f9f9f9;
}

.rectangular-profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
    cursor: pointer;
}

.hidden-input {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0;
    cursor: pointer;
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

    footer {
    margin-top: 1000px;
    padding: 10px;
    color: white;
    text-align: center;
    border-radius: 0 0 10px 10px;
    position: static;
    top: 0;
}
        
    </style>
</head>
  <body>

<div>
        <jsp:include page="NavSide.jsp" />
    </div>

    <div class="container">
        <h4>Trainer Product Listing</h4>
        <form action="AddProductServlet" method="post" enctype="multipart/form-data">
           
            <div class="form-group">
                <label for="productName">Product Name:</label>
                <input type="text" id="productName" name="productName" placeholder="Enter product name" required>
            </div>

            <!-- Product Description -->
            <div class="form-group">
                <label for="productDescription">Product Description:</label>
                <textarea id="productDescription" name="productDescription" rows="4" placeholder="Enter product description" required></textarea>
            </div>

            <!-- Product Images -->
            <div class="form-group">
                <label for="productImages">Product Images (4 images):</label>
                <div class="product-images">
                    <div class="image-container">
                        <img src="https://via.placeholder.com/150" 
                             alt="Upload Image" 
                             class="rectangular-profile" 
                             id="upload-image1">
                        <input type="file" id="image1" class="hidden-input" accept="image/*" name="uimage1" 
                               onchange="previewImage(event, 'upload-image1')" required>
                    </div>
                    <div class="image-container">
                        <img src="https://via.placeholder.com/150" 
                             alt="Upload Image" 
                             class="rectangular-profile" 
                             id="upload-image2">
                        <input type="file" id="image2" class="hidden-input" accept="image/*" name="uimage2" 
                               onchange="previewImage(event, 'upload-image2')">
                    </div>
                    <div class="image-container">
                        <img src="https://via.placeholder.com/150" 
                             alt="Upload Image" 
                             class="rectangular-profile" 
                             id="upload-image3">
                        <input type="file" id="image3" class="hidden-input" accept="image/*" name="uimage3" 
                               onchange="previewImage(event, 'upload-image3')">
                    </div>
                    <div class="image-container">
                        <img src="https://via.placeholder.com/150" 
                             alt="Upload Image" 
                             class="rectangular-profile" 
                             id="upload-image4">
                        <input type="file" id="image4" class="hidden-input" accept="image/*" name="uimage4" 
                               onchange="previewImage(event, 'upload-image4')">
                    </div>
                </div>
            </div>

            <!-- Product Details -->
            <div class="form-group">
                <label for="productUse">Use:</label>
                <input type="text" id="productUse" name="productUse" placeholder="What is the product used for?" required>
            </div>

            <div class="form-group">
                <label for="productPrice">Price:</label>
                <input type="number" id="productPrice" name="productPrice" min="0" placeholder="Enter product price" required>
            </div>

            <div class="form-group">
                <label for="productDiscount">Discount (%) :</label>
                <input type="number" id="productDiscount" name="productDiscount" min="0" max="100" placeholder="Enter discount percentage" required>
            </div>

            <div class="form-group">
                <label for="trainerName">Trainer's Name:</label>
                <input type="text" id="trainerName" name="trainerName" placeholder="Enter your name" required>
            </div>

            <div class="form-group">
                <label for="shopName">Shop Name:</label>
                <input type="text" id="shopName" name="shopName" placeholder="Enter your shop name" required>
            </div>

            <!-- Submit -->
            <div class="form-group">
                <input type="submit" value="Add Product">
            </div>

          
        </form>
         <form action="uploadProduct" method="get">
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
   <footer >
        <jsp:include page="footer.jsp" />
   </footer>


 </body>
</html>
