<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="training.pack.Tpojo.VideoPojo" %>
<%@ page import="java.util.Base64" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <style>
        /* Style for the container */
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            margin: 20px auto;
            max-width: 1200px;
            padding: 20px;
        }

        /* Style for each card */
        .card {
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 300px;
            text-align: center;
        }

        /* Style for the card image */
        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 1px solid #ccc;
        }

        /* Style for the card body */
        .card-body {
            padding: 15px;
        }

        /* Title styling */
        .card-title {
            font-size: 1.5em;
            color: #333;
            margin: 10px 0;
        }

        /* Details styling */
        .card-details {
            font-size: 0.9em;
            color: #666;
            line-height: 1.5;
            margin: 10px 0;
        }

        /* "Book Now" button styling */
        .book-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .book-btn:hover {
            background-color: #0056b3;
        }

        /* No videos message styling */
        .no-videos {
            font-size: 1.2em;
            color: #999;
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div>
    <jsp:include page="userNavSide.jsp" />
</div>

<div class="container">
    <% 
        // Fetch the list of videos from the request
        List<VideoPojo> videos = (List<VideoPojo>) request.getAttribute("videos");

        if (videos != null && !videos.isEmpty()) { 
            for (VideoPojo video : videos) {
                String base64Image = (video.getImage() != null) ? 
                                     Base64.getEncoder().encodeToString(video.getImage()) : null;
    %>
        <div class="card">
            <% if (base64Image != null) { %>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Video Thumbnail">
            <% } else { %>
                <span>No Image</span>
            <% } %>

            <div class="card-body">
                <h2 class="card-title"><%= video.getTitle() %></h2>
                <p class="card-details">
                    Trainer: <%= video.getName() != null ? video.getName() : "Not specified" %><br>
                    Specialist: <%= video.getSpecification() != null ? video.getSpecification() : "Not specified" %><br>
                    Message: <%= video.getMessage() != null ? video.getMessage() : "No message available" %>
                </p>
                <!-- Book Now button -->
                <a href="videoPage.jsp?videoId=<%= video.getId() %>" class="book-btn">Book Now</a>
            </div>
        </div>
    <% 
            }
        } else { 
    %>
        <div class="no-videos">  <p style="color: red; text-align: center;">No videos available at the moment.</p></div>
    <% 
        } 
    %>
</div>

<footer>
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>

