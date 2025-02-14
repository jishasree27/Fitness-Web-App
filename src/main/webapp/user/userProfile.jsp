<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.UserDetails" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Profile - Fitness Freaks</title>
    <style>
        body {
            font-family: poppins, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
            color: #333;
        }

        .profile-container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 10%;
            margin-bottom: 10px;
        }

        .settings-header img {
            height: 50px;
        }
        .profile-header h1 {
            font-size: 1.8em;
            color: #301934;
        }

        .profile-details {
            margin: 20px 0;
        }

        .profile-details table {
            width: 100%;
            border-collapse: collapse;
        }

        .profile-details th,
        .profile-details td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .profile-details th {
            background-color: #f9f9f9;
            font-weight: bold;
        }

        .profile-actions {
            text-align: center;
            margin-top: 20px;
        }

        .profile-actions button {
            padding: 10px 20px;
            background-color: #2ac0d4;
            color: white;
            font-size: 1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .profile-actions button:hover {
            opacity: 0.9;
        }

        
           footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }
        
    </style>
</head>

<body>
    <div>
        <jsp:include page="userNavSide.jsp" />
    </div>
   
        <div class="profile-container">
            <div class="settings-header text-center">
               <% String loggedInUser = (String) session.getAttribute("user"); %>
               
            </div>
            <%
                String loggedInUserEmail = (String) session.getAttribute("user");
                HomeDao homeDao = new HomeDao();

                if (loggedInUserEmail == null) {
            %>
            <div class="text-center">
                <p style="color: red; text-align: center;">Please log in to view your details.</p>
                <a href="login.jsp" class="btn btn-primary">Login</a>
            </div>
            <%
                } else {
                    UserDetails userDetails = homeDao.getDetailByEmail(loggedInUserEmail);

                    if (userDetails != null) {
            %>
            <div class="profile-header">
                <img src="<%= session.getAttribute("userPhoto") != null ? session.getAttribute("userPhoto").toString() : "https://img.freepik.com/free-vector/blue-circle-with-white-user_78370-4707.jpg" %>" alt="Profile Picture">
                <h1>Welcome, <%= userDetails.getName() %></h1>
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
                        <th>Gender</th>
                        <td><%= userDetails.getGender() %></td>
                    </tr>
                    <tr>
                        <th>Date of Birth</th>
                        <td><%= userDetails.getDob() %></td>
                    </tr>
                </table>
            </div>
            <div class="profile-actions">
                <form action="Logout" method="get">
                    <button type="submit" class="btn btn-danger">Log Out</button>
                </form>
            </div>
            <%
                    } else {
            %>
            <div class="text-center">
                < <p style="color: red; text-align: center;">No details found for the logged-in user.</p>
            </div>
            <%
                    }
                }
            %>
        </div>

    <footer>
    <jsp:include page="footer.jsp" />
    </footer>
</body>

</html>
