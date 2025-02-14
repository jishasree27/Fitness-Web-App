<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="training.pack.Tpojo.AddDetailsPojo" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Profile - Fitness Freaks</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
     
            color: #333;
        }
        .table{
		            
		    width: 100%;
		    max-width: 100%;
		    border-collapse: collapse;
		    margin-left: 0; /* Align the table to the left */

        }
        
        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            position:relative;
            top:-600px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }
        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        .profile-header h1 {
            font-size: 1.8em;
            color: black; /* Very dark green */
        }
        .profile-details {
            margin: 20px 0;
        }
        .profile-details table {
            width: 100%;
            border-collapse: collapse;
        }
        .profile-details th, .profile-details td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .profile-details th {
            background-color: #f4f4f4;
            font-weight: bold;
        }
        .profile-actions {
            text-align: center;
            margin-top: 20px;
        }
        .profile-actions button {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
             background-color:rgb(85, 0, 203); /* Very dark green */
            color: white;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
        }
        .profile-actions button:hover {
            opacity: 0.9;
        }
        .editprofile{
        	padding: 10px 20px;
        }
             footer {

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
    <% String user = (String) session.getAttribute("user"); %>

   
           
            <%
                String loggedInUserEmail = (String) session.getAttribute("user");
                HomeDao homeDao = new HomeDao();

                if (loggedInUserEmail == null) { // Check if user is logged in
            %>
            <div class="login-link">
                 <p style="color: red; text-align: center;">Please log in to view your details.</p>
                <a href="index.jsp">Login</a>
            </div>
            <%
                } else {
                    // Fetch the user details by email
                    AddDetailsPojo userDetails = homeDao.getDetailsByEmail(loggedInUserEmail);

                    if (userDetails != null) { // If user details exist
            %>
                <div class="profile-container">
        <div class="profile-header">
            <img src="<%= session.getAttribute("userPhoto") != null ? session.getAttribute("userPhoto") : "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg" %>" alt="Profile Picture">
            <h1>Welcome, <%= userDetails.getName()  %></h1>
        </div>
        <div class="profile-details">
            <h2>Profile Details</h2>
            <table class="table">
                <tr>
                    <th>Name</th>
                    <td><%= userDetails.getName() %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= userDetails.getEmail() %></td>
                </tr>
                <tr>
                    <th>Phone</th>
                    <td><%= userDetails.getPhone() %></td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td><%= userDetails.getAddress() %></td>
                </tr>
                <tr>
                    <th>Joined On</th>
                    <td><%= userDetails.getJoinedOn() %></td>
                </tr>
                    <tr>
                    <th>Account Details</th>
                   <td>
    <button onclick="window.location.href='credentials.jsp'" style="background-color: rgb(85, 0, 203); color: white; border: none; padding: 8px 12px; border-radius: 5px; cursor: pointer;">View Credentials</button>
</td>
                </tr>
            </table>
            </div>
            <div class="profile-actions">
          
                <form action ="EditDetailsServlet" method="get" class="editprofile" ><button onclick="window.location.href='EditProfile.jsp'">Edit Profile</button> </form>
                <form action ="Logout" method="get"><button type="submit">Log Out</button></form>
          
            <%
                    } else { // If no details found
            %>
            <p style="color: red; text-align: center;">No details found for the logged-in user.</p>
            <%
                    }
                }
            %>
        </div>
    </div>
       <footer >
        <jsp:include page="footer.jsp" />
   </footer>
</body>
</html>
