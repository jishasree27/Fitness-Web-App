<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.VideoPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<title>Uploaded Videos</title>
<style>
body{
            font-family: 'Poppins', sans-serif;

}
.container {
    width: 70%; /* Reduced width of the container */
    max-width: 700px; /* Set a maximum width */
    margin-left: 600px;
    padding: 15px;
    background-color: #fff;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.1);
    position: absolute;
    top: 300px;
    left: 210px; /* Moves it 600px from the left */
}

.container h4 {
    color: black;
    font-size: 18px;
    margin-bottom: 10px;
}

.table {
    margin: 0 auto;
    width: 70%; /* Reduced width */
    border-collapse: collapse;
    font-size: 12px; /* Smaller font size */
}

.table th, .table td {
    padding: 4px; /* Reduced padding */
    text-align: left;
    border: 1px solid #ddd;
}

.table th {
    font-size: 13px; /* Slightly smaller header font */
    padding: 6px;
}

.table td {
    font-size: 12px;
    padding: 4px;
}

.table img {
    width: 60px; /* Smaller images */
    height: 60px;
    object-fit: cover;
}

.table a {
    font-size: 12px;
}

.table .btn {
    font-size: 10px;
    padding: 3px 6px; /* Further reduced button size */
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
        <% 
            String loggedInUser = (String) session.getAttribute("user");
            HomeDao videoDao = new HomeDao();
            List<VideoPojo> videoList = videoDao.getAllVideos();

            if (loggedInUser == null) { 
        %>
            <div class="text-center mt-4">
                 <p style="color: red; text-align: center;">Please log in to view and upload videos.</p>
            </div>
        <%
            } else if (videoList != null && !videoList.isEmpty()) {
        %>             
            <h4 class="text-center">Uploaded Videos</h4>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th scope="col">Image</th>
                        <th scope="col">Thumbnail</th>
                        <th scope="col">Title</th>
                        <th scope="col">Video</th>
                        <th scope="col">TrainerName</th>
                        <th scope="col">Specification</th>
                        <th scope="col">Date</th>
                        <th scope="col">From Time</th>
                        <th scope="col">To Time</th>
                        <th scope="col">Payment</th>
                        <th scope="col">Offer</th>
                        <th scope="col">Offer Name</th>
                        <th scope="col">Offer Valid</th>
                        <th scope="col">Class Link</th>
                       
                        
                         <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (VideoPojo video : videoList) {
                            if (video.getUserId() != null && video.getUserId().equals(loggedInUser)) {
                                String base64Image = (video.getImage() != null) ? 
                                    Base64.getEncoder().encodeToString(video.getImage()) : null;
                    %>
                    <tr>
                        <td>
                            <%
                                if (base64Image != null) {
                            %>
                                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Instructor Photo">
                            <%
                                } else {
                            %>
                                <span> No Image</span>
                            <%
                                }
                            %>
                        </td>
                        <td><img src="<%= video.getThumbnail() %>" alt="Video Thumbnail"></td>
                        <td><%= video.getTitle() %></td>
                        <td><a href="<%= video.getVideo() %>" target="_blank">Watch Video</a></td>
                        <td><%= video.getName() %></td>
                        <td><%= video.getSpecification() %></td>
                        <td><%= video.getDate() %></td>
                        <td><%= video.getFtime() %></td>
                        <td><%= video.getTtime() %></td>
                        <td><%= video.getPaymentDetails() %></td>
                        <td><%= video.getOffer() %></td>
                        <td><%= video.getOfferName() %>
                        <td><%= video.getOfferValid() %>
                        <td><%= video.getClassLink() %>
                        
                        <td>
                            <form action="updateVideo" method="get" style="display:inline;">
                                <input type="hidden" name="uid" value="<%= video.getId() %>">
                                <button type="submit" class="btn btn-sm btn-primary">Update</button>
                            </form>
                            <form action="videodelete" method="post" style="display:inline;">
                                <input type="hidden" name="uid" value="<%= video.getId() %>">
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        <%  
            } else {
        %> 
            <div class="text-center mt-4">
                 <p style="color: red; text-align: center;">No videos found for your account.</p>
            </div>
        <% 
            }
        %>
    </div>
    <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
