<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.UserDetails" %>
<%@ include file="userNavSide.jsp" %> <!-- Include the navigation side here -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 20px;
            width: 60%;
            margin-left: auto;
            margin-right: auto;
        }
        .card {
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-weight: bold;
            margin-bottom: 5px;
            display: block;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-group input[readonly] {
            background-color: #f0f0f0;
        }
        .btn {
            padding: 10px 20px;
            background-color: #2ac0d4;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
            border-radius: 5px;
            display: inline-block;
            text-align: center;
        }
        .btn:hover {
            background-color: #2297a0;
        }
          .btn-danger {
            background-color: #e74c3c;
        }
        .btn-danger:hover {
            background-color: #c0392b;
        }
        footer{
         margin-top: 20em;
        padding: 15px;
        position: relative;
        
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            String loggedInUser = (String) session.getAttribute("user");
            HomeDao uDao = new HomeDao();
            List<UserDetails> dList = null;

            try {
                dList = uDao.getAllDetails1();
            } catch (Exception e) {
                System.err.println("Error fetching user details: " + e.getMessage());
            }

            // Filter the list for the logged-in user based on a field like email or user ID
            UserDetails loggedInUserDetails = null;
            if (loggedInUser != null && dList != null) {
                for (UserDetails details : dList) {
                    if (loggedInUser.equals(details.getEmail())) { // or use user ID if that's how the logged-in user is identified
                        loggedInUserDetails = details;
                        break;
                    }
                }
            }
        %>

        <% if (loggedInUser == null) { %>
            <div class="alert alert-warning text-center">
                 <p style="color: red; text-align: center;">Please log in to view and upload classes.</p>
                <a href="login.jsp" class="btn">Login</a>
            </div>
        <% } else if (loggedInUserDetails != null) { %>
            <div class="card">
                <h2 class="text-center mb-4">Your Details</h2>
                <form action="DeleteDetails" method="POST">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" value="<%= loggedInUserDetails.getName() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" value="<%= loggedInUserDetails.getEmail() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" id="phone" name="phone" value="<%= loggedInUserDetails.getPhone() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender</label>
                        <input type="text" id="gender" name="gender" value="<%= loggedInUserDetails.getGender() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="dob">DOB</label>
                        <input type="text" id="dob" name="dob" value="<%= loggedInUserDetails.getDob() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="fitnessLevel">Fitness Level</label>
                        <input type="text" id="fitnessLevel" name="fitnessLevel" value="<%= loggedInUserDetails.getFitnessLevel() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="location">Location</label>
                        <input type="text" id="location" name="location" value="<%= loggedInUserDetails.getLocation() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="goal">Goal</label>
                        <input type="text" id="goal" name="goal" value="<%= loggedInUserDetails.getGoal() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="healthConditions">Health Conditions</label>
                        <input type="text" id="healthConditions" name="healthConditions" value="<%= loggedInUserDetails.getHealthConditions() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="weight">Weight</label>
                        <input type="text" id="weight" name="weight" value="<%= loggedInUserDetails.getWeight() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="height">Height</label>
                        <input type="text" id="height" name="height" value="<%= loggedInUserDetails.getHeight() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="activityLevel">Activity Level</label>
                        <input type="text" id="activityLevel" name="activityLevel" value="<%= loggedInUserDetails.getActivityLevel() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="dietPreferences">Diet Preferences</label>
                        <input type="text" id="dietPreferences" name="dietPreferences" value="<%= loggedInUserDetails.getDietPreferences() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="exercisePreferences">Exercise Preferences</label>
                        <input type="text" id="exercisePreferences" name="exercisePreferences" value="<%= loggedInUserDetails.getExercisePreferences() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="workoutSchedule">Workout Schedule</label>
                        <input type="text" id="workoutSchedule" name="workoutSchedule" value="<%= loggedInUserDetails.getWorkoutSchedule() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="sleep">Sleep</label>
                        <input type="text" id="sleep" name="sleep" value="<%= loggedInUserDetails.getSleep() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="motivation">Motivation</label>
                        <input type="text" id="motivation" name="motivation" value="<%= loggedInUserDetails.getMotivation() %>" readonly />
                    </div>
                    <div class="form-group">
                        <label for="communication">Communication</label>
                        <input type="text" id="communication" name="communication" value="<%= loggedInUserDetails.getCommunication() %>" readonly />
                    </div>
                      <button type="submit" class="btn btn-danger">Delete Details</button>
                </form>
            </div>
        <% } else { %>
            <div class="alert alert-info text-center">
                 <p style="color: red; text-align: center;">No details found for your account.</p>
            </div>
        <% } %>
    </div>
     <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
