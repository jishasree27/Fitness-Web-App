<%@ page import="training.pack.Tpojo.AddDetailsPojo" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Edit User Details</title>
    <style>
        body-4 {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            position:relative;
            top:-600px;
            left:120px;
            
        }
        .container h3 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
            color: #555;
        }
        input, textarea {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 100%;
        }
        textarea {
            resize: vertical;
        }
        button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #45a049;
        }
        .text-center {
            text-align: center;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        .login-link a {
            text-decoration: none;
            color: #4CAF50;
            font-weight: bold;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
          form label {
        color: rgb(85, 0, 203);
        font-weight: bold; /* Optional: Make the labels bold for emphasis */
    }
    input[type="submit"] {
        background-color: rgb(85, 0, 203); /* Button color */
        color: white; /* Text color */
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 1rem;
    }

    /* Style for hover effect on the submit button */
    input[type="submit"]:hover {
        background-color: rgb(70, 0, 163); /* Darker shade on hover */
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
   
        <h3>Edit User Details</h3>
        <%
            String loggedInUserEmail = (String) session.getAttribute("user");
            HomeDao homeDao = new HomeDao();

            if (loggedInUserEmail == null) { // Check if user is logged in
        %>
        <div class="login-link">
            <p style="color: red; text-align: center;">Please log in to view your details.</p>
            <a href="login.jsp">Login</a>
        </div>
        <%
            } else {
                // Fetch the user details by email instead of userId
                AddDetailsPojo userDetails = homeDao.getDetailsByEmail(loggedInUserEmail);

                if (userDetails != null) { // If user details exist
        %>
        <form action="updateEdit" method="POST">
            <input type="hidden" name="userId" value="<%= userDetails.getId() %>">

            <label for="uname">Name:</label>
            <input type="text" id="uname" name="userName" value="<%= userDetails.getName() %>" required><br>

            <label for="uemail">Email:</label>
            <input type="email" id="uemail" name="userEmail" value="<%= userDetails.getEmail() %>" readonly><br>

            <label for="ucontact">Contact:</label>
            <input type="text" id="ucontact" name="userContact" value="<%= userDetails.getContact() %>" required><br>

            <label for="utype">Type:</label>
            <input type="text" id="utype" name="userType" value="<%= userDetails.getType() %>" required><br>

            <label for="uqualification">Qualification:</label>
            <input type="text" id="uqualification" name="userQualification" value="<%= userDetails.getQualification() %>" required><br>

            <label for="uexpertise">Expertise:</label>
            <input type="text" id="uexpertise" name="userExpertise" value="<%= userDetails.getExpertise() %>" required><br>

            <label for="uspecification">Specification:</label>
            <input type="text" id="uspecification" name="userSpecification" value="<%= userDetails.getSpecification() %>" required><br>
            
            <label for="uphone">Phone:</label>
            <input type="text" id="uphone" name="userphone" value="<%= userDetails.getPhone() %>" required><br>
            
            
            <label for="uaddress">Address:</label>
            <input type="text" id="uaddress" name="useraddress" value="<%= userDetails.getAddress() %>" required><br>
            
            <label for="ujoined">Joined On:</label>
            <input type="text" id="ujoined" name="userjoined" value="<%= userDetails.getJoinedOn() %>" required><br>
            

            <label for="uphoto">Photo URL:</label>
            <input type="text" id="uphoto" name="userPhoto" value="<%= userDetails.getPhoto() %>"><br>

            <label for="umessage">Message:</label>
            <textarea id="umessage" name="userMessage" rows="4"><%= userDetails.getMessage() %></textarea><br>
		 
            <input type="submit" value="Update">
        </form>
        <%
                } else { // If no details found
        %>
         <p style="color: red; text-align: center;">No details found for the logged-in user.</p>
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
