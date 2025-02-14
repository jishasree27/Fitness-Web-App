<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.ViewProfilePojo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Instructor Profile</title>
    <style>
        body {
             font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.3);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .instructor-img img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            object-fit: cover;
        }
        .round-profile {
            border-radius: 50%;
            width: 100px; /* Adjust width */
            height: 100px; /* Adjust height */
            object-fit: cover; /* Ensure the image fits properly */
            cursor: pointer; /* Indicate clickable image */
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
    <div class="container">
        <%
            String loggedInUser = (String) session.getAttribute("user");
            HomeDao homeDao = new HomeDao();  
            List<ViewProfilePojo> viewList = null;

            try {
                viewList = homeDao.getAllProfile();  
            } catch (Exception e) {
                e.printStackTrace();
            }

            if (loggedInUser == null) {
        %>
            <div class="text-center mt-4">
                 <p style="color: red; text-align: center;">Please log in to view and update your profile.</p>
            </div>
        <%
            } else if (viewList != null && !viewList.isEmpty()) { 
                boolean found = false;
                for (ViewProfilePojo view : viewList) {
                    if (view.getUserId() != null && view.getUserId().equals(loggedInUser)) {
                        found = true;
        %>
        <h2>Update Instructor Profile</h2>
        <div class="instructor-info mt-3">
    <div class="instructor-img">
        <img src="<%= (view.getImage() != null) ? view.getImage() : "https://example.com/path-to-instructor-photo.jpg" %>" 
             alt="Instructor Name" class="round-profile" id="upload-instructor-photo">
        <input type="file" id="file-input" style="display: none;" accept="image/*" name="image">
    </div>
</div>

                
            <form action="viewupdate" method="post" enctype="multipart/form-data">
                <!-- Hidden Field for ID -->
                <input type="hidden" name="id" value="<%= view.getId() %>" />

                <!-- Instructor Name -->
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= view.getName() %>" required>
                </div>

                <!-- Details -->
                <div class="form-group">
                    <label for="details">Details:</label>
                    <textarea id="details" name="details" rows="4" required><%= view.getDetails() %></textarea>
                </div>

                <!-- Schedule Date -->
                <div class="form-group">
                    <label for="date">Schedule Date:</label>
                    <input type="date" id="date" name="date" value="<%= view.getDate() %>" required>
                </div>

                <!-- From Time -->
                <div class="form-group">
                    <label for="fromTime">From Time:</label>
                    <input type="time" id="fromTime" name="fTime" value="<%= view.getFtime() %>" required>
                </div>

                <!-- To Time -->
                <div class="form-group">
                    <label for="toTime">To Time:</label>
                    <input type="time" id="toTime" name="tTime" value="<%= view.getTtime() %>" required>
                </div>

                <!-- Payment Details -->
                <div class="form-group">
                    <label for="payment">Payment Details:</label>
                    <input type="text" id="payment" name="payment" value="<%= view.getPaymentDetails() %>" required>
                </div>

                <!-- Offer -->
                <div class="form-group">
                    <label for="offer">Offer:</label>
                    <input type="text" id="offer" name="offer" value="<%= view.getOffer() %>">
                </div>

                <!-- Submit Button -->
                <button type="submit">Update Profile</button>
            </form>
        </div>
        <%
                    }
                }
                if (!found) {
        %>
             <p style="color: red; text-align: center;">No profile found for the logged-in user.</p>
        <%
                }
            } else {
        %>
             <p style="color: red; text-align: center;">No profiles are currently available.</p>
        <%
            }
        %>
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
