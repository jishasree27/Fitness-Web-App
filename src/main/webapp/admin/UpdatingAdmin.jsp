<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.*" %>
<%@ page import="Admin.pack.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Form</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        width: 40%;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    .form-group {
        margin-bottom: 15px;
    }

    label {
        font-weight: bold;
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"], 
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }

    textarea {
        resize: none;
    }

    .image-container {
        text-align: center;
        margin-bottom: 15px;
    }

    .image-label {
        cursor: pointer;
        display: inline-block;
        border: 2px dashed #007bff;
        padding: 10px;
        border-radius: 8px;
        transition: 0.3s;
    }

    .image-label:hover {
        background-color: #f0f8ff;
    }

    .rectangular-profile {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 5px;
    }

    .hidden-input {
        display: none;
    }

    .submit-btn {
        width: 100%;
        background-color: #007bff;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: 0.3s;
    }

    .submit-btn:hover {
        background-color: #0056b3;
    }

    p {
        text-align: center;
        color: #6c757d;
        font-size: 18px;
    }
</style>

<body>
        <div>
            <!-- Sidebar includes links to other sections like Users, Settings, etc. -->
            <jsp:include page="adminNavside.jsp" />
        </div>
 <div class="container">
        <%
            // Fetch the object from the request attribute
            AdminPojo uservp = (AdminPojo) request.getAttribute("updateDetails");
            System.out.println("Debug - uservp: " + uservp); // Debugging

            if (uservp != null) {
        %>
            <form action="UpdateAd" method="post" enctype="multipart/form-data" class="update-form">
                <!-- ID (Hidden) -->
                <input type="hidden" name="id" id="id" value="<%= uservp.getId() %>" required>

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
                    <input type="text" id="class-name" name="title" value="<%= uservp.getTitle() %>" placeholder="Enter title" required>
                </div>

                <!-- Update Details -->
                <div class="form-group">
                    <label for="feedback">Updation Details:</label>
                    <textarea id="feedback" name="update" rows="6" placeholder="Share here..." required><%= uservp.getUpdate() %></textarea>
                </div>

                <!-- Submit Button -->
                <div class="form-group">
                    <button type="submit" class="submit-btn">Update</button>
                </div>  
            </form>
        <%
            } else {
                out.println(  "<p>Update details are not available.</p>");
            }
        %>
    </div>
</body>
</html>
