<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.AdminDao" %>
<%@ page import="training.pack.Tpojo.*" %>
<%@ page import="User.pack.Pojo.*" %>
<%@ page import="com.fpojo.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Messages</title>
    <style>
   /* General Body Styling */
body {
    font-family: Arial, sans-serif;
    text-align: center;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

/* Table Styling */
table {
    width: 70%;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: white;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

/* Table Header */
th, td {
    border: 1px solid #ddd;
    padding: 12px 15px;
    text-align: left;
}

th {
    background-color: #f4f4f4;
    font-weight: bold;
    color: #333;
}

/* Table Row Hover Effect */
tr:hover {
    background-color: #f9f9f9;
}

/* Container Styling */
.container, .container-2, .container-3 {
    width: 70%;
    margin: 30px auto;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin-left:350px;
}

/* Heading Styling */
h2 {
    color: #333;
    font-size: 24px;
    margin-bottom: 20px;
}

/* No Messages Found Styling */
p {
    font-size: 16px;
    color: #777;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container, .container-2, .container-3 {
        width: 90%;
        padding: 15px;
    }

    table {
        width: 100%;
        margin-bottom: 20px;
    }

    th, td {
        font-size: 14px;
        padding: 8px;
    }

    h2 {
        font-size: 20px;
    }
}

/* Login Warning Message */
.container p, .container-2 p, .container-3 p {
    font-size: 18px;
    color: red;
    font-weight: bold;
}


.container-4 {
    width: 70%;
    margin: 20px auto;
    padding: 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    position: relative;
    left: 120px; /* Moves the container slightly to the left */
}

h2 {
    text-align: center;
    font-size: 24px;
    color: #333;
    margin-bottom: 15px;
}

table {
    width: 80%;
    border-collapse: collapse;
    background: #fff;
    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
}

th, td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

th {
    background-color: #007BFF;
    color: white;
    font-weight: bold;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

tr:hover {
    background-color: #ddd;
}

@media screen and (max-width: 768px) {
    .container-4 {
        width: 95%;
        left: 0; /* Reset position for smaller screens */
    }

    table, th, td {
        font-size: 14px;
        padding: 8px;
    }
}

    </style>
</head>
<body>
 <div>
        <jsp:include page="adminNavside.jsp" />
    </div>
<% 
    String loggedInUser = (String) session.getAttribute("user");
    AdminDao uDao = new AdminDao();
    List<ContactUser> hList = uDao.AlluserContact(); 
%>

<div class="container">
    <% if (loggedInUser == null) { %>
        <p>Please log in to view messages.</p>
    <% } else if (hList != null && !hList.isEmpty()) { %>
        <h2>Messages By Users</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
            </tr>
            <% for (ContactUser contact : hList) { %>
                <tr>
                    <td><%= contact.getName() %></td>
                    <td><%= contact.getEmail() %></td>
                    <td><%= contact.getMessage() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p style="text-align: center;">No messages found.</p>
    <% } %>
</div>
<% 
    String loggedInUser2 = (String) session.getAttribute("user");
    AdminDao uDao2 = new AdminDao();
    List<ContactPojo> hList2 = uDao.AlltrainerContact() ; 
%>

<div class="container-2">
    <% if (loggedInUser2 == null) { %>
        <p>Please log in to view messages.</p>
    <% } else if (hList2 != null && !hList2.isEmpty()) { %>
        <h2>Messages By Trainers</h2>
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
            </tr>
            <% for (ContactPojo contact2 : hList2) { %>
                <tr>
                    <td><%= contact2.getName() %></td>
                    <td><%= contact2.getEmail() %></td>
                    <td><%= contact2.getMessage() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
       <p style="text-align: center;">No messages found.</p>
    <% } %>
</div>
<% 
    String loggedInUser3 = (String) session.getAttribute("user");
    AdminDao uDao3 = new AdminDao();
    List<ContactUsPojo> hList3 = uDao.AllcommonContact() ; 
%>

<div class="container-3">
 <h2>Messages By Viewers</h2>
    <% if (loggedInUser3 == null) { %>
        <p style="color: red; text-align: center;">Please log in to view messages.</p>
    <% } else if (hList3 != null && !hList3.isEmpty()) { %>
       
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
            </tr>
            <% for (ContactUsPojo contact3 : hList3) { %>
                <tr>
                    <td><%= contact3.getName() %></td>
                    <td><%= contact3.getEmail() %></td>
                    <td><%= contact3.getMessage() %></td>
                </tr>
            <% } %>
        </table>
    <% } else { %>
        <p style="color: red; text-align: center;">No messages found by Viewers.</p>
    <% } %>
</div>
<div class="container-4">
<h2>Overview Form</h2>

  <table>
        <tr>
            <th>Fitness Goal</th>
            <th>Workout Frequency</th>
            <th>Exercise Types</th>
            <th>Flexibility Level</th>
            <th>Diet Approach</th>
            <th>Motivation</th>
        </tr>
        <%
            List<FitnessForm> fitnessForms = (List<FitnessForm>) request.getAttribute("fitnessForms");
            if (fitnessForms != null && !fitnessForms.isEmpty()) {
                for (FitnessForm form : fitnessForms) {
        %>
        <tr>
            <td><%= form.getFitnessGoal() %></td>
            <td><%= form.getWorkoutFrequency() %></td>
            <td><%= form.getExerciseTypes() %></td>
            <td><%= form.getFlexibilityLevel() %></td>
            <td><%= form.getDietApproach() %></td>
            <td><%= form.getMotivation() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6"> <p style="color: red; text-align: center;">No records found.</p></td>
        </tr>
        <% } %>
    </table>

</div>

</body>
</html>
