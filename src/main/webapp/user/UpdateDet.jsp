<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="User.pack.Pojo.UserDetails" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User Details</title>
</head>
<body>
<div class="container">
    <%
        // Fetch the object from the request attribute
        UserDetails uservp = (UserDetails) request.getAttribute("Details");
        if (uservp == null) {
    %>
    <div class="alert alert-danger" role="alert">
        <p style="color: red; text-align: center;"> No user details found to update. Please try again later.</p>
    </div>
    <%
        } else {
    %>
    <form action="updatesubmit" method="POST">
        <!-- Personal Information -->
        <h3>Personal Information</h3>
        
        <input type="hidden" id="id" name="id" value="<%= (uservp.getId() != null) ? uservp.getId() : "" %>" required><br><br>
        
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" value="<%= (uservp.getName() != null) ? uservp.getName() : "" %>" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= (uservp.getEmail() != null) ? uservp.getEmail() : "" %>" required><br><br>

        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone" value="<%= (uservp.getPhone() != null) ? uservp.getPhone() : "" %>"><br><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender">
            <option value="male" <%= ("male".equalsIgnoreCase(uservp.getGender())) ? "selected" : "" %>>Male</option>
            <option value="female" <%= ("female".equalsIgnoreCase(uservp.getGender())) ? "selected" : "" %>>Female</option>
            <option value="other" <%= ("other".equalsIgnoreCase(uservp.getGender())) ? "selected" : "" %>>Other</option>
        </select><br><br>

        <label for="dob">Date of Birth:</label>
        <input type="text" id="dob" name="dob" value="<%= (uservp.getDob() != null) ? uservp.getDob() : "" %>" required><br><br>

        <label for="location">Location:</label>
        <input type="text" id="location" name="location" value="<%= (uservp.getLocation() != null) ? uservp.getLocation() : "" %>"><br><br>

        <!-- Health & Fitness Details -->
        <h3>Health & Fitness Details</h3>
        <label for="fitness_level">Current Fitness Level:</label>
        <select id="fitness_level" name="fitness_level">
            <option value="beginner" <%= ("beginner".equalsIgnoreCase(uservp.getFitnessLevel())) ? "selected" : "" %>>Beginner</option>
            <option value="intermediate" <%= ("intermediate".equalsIgnoreCase(uservp.getFitnessLevel())) ? "selected" : "" %>>Intermediate</option>
            <option value="advanced" <%= ("advanced".equalsIgnoreCase(uservp.getFitnessLevel())) ? "selected" : "" %>>Advanced</option>
        </select><br><br>

        <label for="goal">Fitness Goal:</label>
        <select id="goal" name="goal">
            <option value="weight_loss" <%= ("weight_loss".equalsIgnoreCase(uservp.getGoal())) ? "selected" : "" %>>Weight Loss</option>
            <option value="muscle_gain" <%= ("muscle_gain".equalsIgnoreCase(uservp.getGoal())) ? "selected" : "" %>>Muscle Gain</option>
            <option value="endurance" <%= ("endurance".equalsIgnoreCase(uservp.getGoal())) ? "selected" : "" %>>Endurance</option>
            <option value="flexibility" <%= ("flexibility".equalsIgnoreCase(uservp.getGoal())) ? "selected" : "" %>>Flexibility</option>
        </select><br><br>

        <label for="health_conditions">Health Conditions (if any):</label>
        <textarea id="health_conditions" name="health_conditions"><%=  uservp.getHealthConditions() %></textarea><br><br>

        <label for="weight">Current Weight (kg):</label>
        <input type="number" id="weight" name="weight" value="<%= uservp.getWeight() %>"><br><br>

        <label for="height">Height (cm):</label>
        <input type="number" id="height" name="height" value="<%= uservp.getHeight() %>"><br><br>

        <label for="activity_level">Activity Level:</label>
        <select id="activity_level" name="activity_level">
            <option value="sedentary" <%= ("sedentary".equalsIgnoreCase(uservp.getActivityLevel())) ? "selected" : "" %>>Sedentary</option>
            <option value="lightly_active" <%= ("lightly_active".equalsIgnoreCase(uservp.getActivityLevel())) ? "selected" : "" %>>Lightly Active</option>
            <option value="moderately_active" <%= ("moderately_active".equalsIgnoreCase(uservp.getActivityLevel())) ? "selected" : "" %>>Moderately Active</option>
            <option value="very_active" <%= ("very_active".equalsIgnoreCase(uservp.getActivityLevel())) ? "selected" : "" %>>Very Active</option>
        </select><br><br>

        <!-- Lifestyle Information -->
        <h3>Lifestyle Information</h3>
        <label for="diet_preferences">Diet Preferences:</label>
        <input type="text" id="diet_preferences" name="diet_preferences" value="<%= uservp.getDietPreferences()  %>"><br><br>

        <label for="exercise_preferences">Exercise Preferences:</label>
        <input type="text" id="exercise_preferences" name="exercise_preferences" value="<%= uservp.getExercisePreferences()  %>"><br><br>

        <label for="workout_schedule">Workout Schedule (days per week):</label>
        <input type="number" id="workout_schedule" name="workout_schedule" min="0" max="7" value="<%= uservp.getWorkoutSchedule()  %>"><br><br>

        <label for="sleep">Average Sleep (hours per night):</label>
        <input type="number" id="sleep" name="sleep" min="0" max="24" value="<%= uservp.getSleep()  %>"><br><br>

        <!-- Optional Information -->
        <h3>Additional Information</h3>
        <label for="motivation">Motivation & Support:</label>
        <input type="text" id="motivation" name="motivation" value="<%= uservp.getMotivation()  %>"><br><br>

        <label for="communication">Preferred Communication:</label>
        <select id="communication" name="communication">
            <option value="email" <%= ("email".equalsIgnoreCase(uservp.getCommunication())) ? "selected" : "" %>>Email</option>
            <option value="sms" <%= ("sms".equalsIgnoreCase(uservp.getCommunication())) ? "selected" : "" %>>SMS</option>
            <option value="app_notifications" <%= ("app_notifications".equalsIgnoreCase(uservp.getCommunication())) ? "selected" : "" %>>App Notifications</option>
        </select><br><br>

        <!-- Submit Button -->
        <input type="submit" value="Submit">
    </form>
    <%
        }
    %>
</div>
</body>
</html>
