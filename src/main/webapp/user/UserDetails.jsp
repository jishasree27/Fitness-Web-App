<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information Form</title>
</head>
   <style>

        body {
            font-family: poppins, sans-serif;
            background-color: white;
            }

        .container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            width: 70%;
            max-width: 900px;
            margin-left:300px;
            margin-top:50px;
           
            /* Remove justify-content:center, since flex on the body does the centering */
        }

         .container h2 {
            text-align: center;
            color: #333;
        }

        .container h3 {
            color: #444;
        }

         .container label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        input[type="date"],
        input[type="number"],
        input[type="submit"],
        textarea,
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

         .container textarea {
            resize: vertical;
            height: 100px;
        }

         .container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

         .container form {
            margin-top: 20px;
        }

        .form-section {
            margin-bottom: 25px;
        }

        .form-section h3 {
            margin-bottom: 10px;
        }

        .form-section label {
            font-size: 14px;
        }

        .form-section input,
        .form-section select,
        .form-section textarea {
            font-size: 14px;
        }

        .form-section input[type="submit"] {
            width: auto;
            margin-top: 20px;
        }

        .form-section input[type="number"] {
            width: auto;
            max-width: 120px;
        }
        input[type="submit"] {
    background-color: #2ac0d4;  /* Change to the desired color */
    color: white;
    border: none;
    cursor: pointer;
    font-size: 16px;
}

input[type="submit"]:hover {
    background-color: #1e99a2;  /* Slightly darker shade for hover effect */
}
                      footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }
     .container button {
    background-color: #2ac0d4;  /* Set the background color */
    color: white;               /* Set the text color */
    border: none;               /* Remove the border */
    padding: 10px 20px;         /* Add padding */
    font-size: 16px;            /* Set font size */
    cursor: pointer;           /* Set the cursor to pointer on hover */
    border-radius: 4px;         /* Optional: add rounded corners */
}

button:hover {
    background-color: #1e99a2;  /* Slightly darker shade for hover effect */
}
footer{



}
    
        
   
    </style>
<body>
    <jsp:include page="userNavSide.jsp" />
  <div class="container">
    <h2>Fitness Information Form</h2>
    <form action="submitFitnessDetails" method="POST">
        <!-- Personal Information -->
        <h3>Personal Information</h3>
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="phone">Phone Number:</label>
        <input type="tel" id="phone" name="phone"><br><br>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender">
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select><br><br>

        <label for="dob">Date of Birth:</label>
        <input type="text" id="dob" name="dob" required><br><br>

        <label for="location">Location:</label>
        <input type="text" id="location" name="location"><br><br>

        <!-- Health & Fitness Details -->
        <h3>Health & Fitness Details</h3>
        <label for="fitness_level">Current Fitness Level:</label>
        <select id="fitness_level" name="fitnesslevel">
            <option value="beginner">Beginner</option>
            <option value="intermediate">Intermediate</option>
            <option value="advanced">Advanced</option>
        </select><br><br>

        <label for="goal">Fitness Goal:</label>
        <select id="goal" name="goal">
            <option value="weight_loss">Weight Loss</option>
            <option value="muscle_gain">Muscle Gain</option>
            <option value="endurance">Endurance</option>
            <option value="flexibility">Flexibility</option>
        </select><br><br>

        <label for="health_conditions">Health Conditions (if any):</label>
        <textarea id="health_conditions" name="healthconditions"></textarea><br><br>

        <label for="weight">Current Weight (kg):</label>
        <input type="number" id="weight" name="weight"><br><br>

        <label for="height">Height (cm):</label>
        <input type="number" id="height" name="height"><br><br>

        <label for="activity_level">Activity Level:</label>
        <select id="activity_level" name="activitylevel">
            <option value="sedentary">Sedentary</option>
            <option value="lightly_active">Lightly Active</option>
            <option value="moderately_active">Moderately Active</option>
            <option value="very_active">Very Active</option>
        </select><br><br>

        <!-- Lifestyle Information -->
        <h3>Lifestyle Information</h3>
        <label for="diet_preferences">Diet Preferences:</label>
        <input type="text" id="diet_preferences" name="dietpreferences"><br><br>

        <label for="exercise_preferences">Exercise Preferences:</label>
        <input type="text" id="exercise_preferences" name="exercisepreferences"><br><br>

        <label for="workout_schedule">Workout Schedule (days per week):</label>
        <input type="number" id="workout_schedule" name="workoutschedule" min="0" max="7"><br><br>

        <label for="sleep">Average Sleep (hours per night):</label>
        <input type="number" id="sleep" name="sleep" min="0" max="24"><br><br>

        <!-- Optional Information -->
        <h3>Additional Information</h3>
        <label for="motivation">Motivation & Support:</label>
        <input type="text" id="motivation" name="motivation"><br><br>

        <label for="communication">Preferred Communication:</label>
        <select id="communication" name="communication">
            <option value="email">Email</option>
            <option value="sms">SMS</option>
            <option value="app_notifications">App Notifications</option>
        </select><br><br>

        <!-- Submit Button -->
        <input type="submit" value="Submit">
    </form>
    <form action="viewDetails" method="get"><button>View Load</button></form>

</div>
 <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>

</html>
