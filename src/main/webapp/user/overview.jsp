<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pilates Challenge Overview</title>
    <style>
        /* Existing CSS with enhancements */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
            line-height: 1.6;
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
            flex-direction: column;
            padding-left: 20px;
        }
        .container {
            max-width: 800px;
            width: 100%;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: #007bff;
        }
        p {
            margin-bottom: 10px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            resize: vertical;
        }
        textarea {
            min-height: 100px;
        }
        button[type="submit"] {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        button[type="submit"]:hover {
            background-color: #0056b3;
        }



        @media (max-width: 768px) {
            body {
                padding-left: 10px;
            }
            .container {
                padding: 10px;
            }
        }
        
        /* Remove default button styling */
button.link-button {
    background: none;
    border: none;
    padding: 0;
    cursor: pointer;
}

/* Style for the link inside the button */
button.link-button a {
    text-decoration: none;
    color: #ffffff; /* White text color */
    background-color: #007bff; /* Bootstrap primary color */
    padding: 10px 20px; /* Add padding */
    border-radius: 5px; /* Rounded corners */
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effects */
}

/* Hover effect for the button */
button.link-button a:hover {
    background-color: #0056b3; /* Darker shade of blue on hover */
    color: #fff; /* Keep text white */
}
.sub {
 
    justify-content: center; /* Horizontally centers the button */
    
   
}
     
    </style>
</head>
<body>


    <h1>Overview</h1>

    <h2>What is your primary fitness goal?</h2>
    <label><input type="radio" name="fitnessGoal" value="Weight loss"> Weight loss</label><br>
    <label><input type="radio" name="fitnessGoal" value="Strength building"> Strength building</label><br>
    <label><input type="radio" name="fitnessGoal" value="Flexibility"> Flexibility</label><br>
    <label><input type="radio" name="fitnessGoal" value="Endurance"> Endurance</label><br>
    <label><input type="radio" name="fitnessGoal" value="General health"> General health</label><br>
    <label><input type="radio" name="fitnessGoal" value="Other"> Other (please specify)</label><br>
    <input type="text" name="otherGoal" placeholder="Specify if 'Other'"><br><br>

    <h2>How often do you currently work out?</h2>
    <label><input type="radio" name="workoutFrequency" value="Daily"> Daily</label><br>
    <label><input type="radio" name="workoutFrequency" value="3-4 times a week"> 3-4 times a week</label><br>
    <label><input type="radio" name="workoutFrequency" value="1-2 times a week"> 1-2 times a week</label><br>
    <label><input type="radio" name="workoutFrequency" value="Occasionally"> Occasionally</label><br>
    <label><input type="radio" name="workoutFrequency" value="None"> I don't work out regularly</label><br><br>

    <h2>What types of exercises do you enjoy most?</h2>
    <label><input type="checkbox" name="exerciseType" value="Pilates"> Pilates</label><br>
    <label><input type="checkbox" name="exerciseType" value="Yoga"> Yoga</label><br>
    <label><input type="checkbox" name="exerciseType" value="Weight training"> Weight training</label><br>
    <label><input type="checkbox" name="exerciseType" value="Cardio"> Cardio (Running, Cycling, etc.)</label><br>
    <label><input type="checkbox" name="exerciseType" value="HIIT"> HIIT</label><br>
    <label><input type="checkbox" name="exerciseType" value="Dance"> Dance</label><br>
    <label><input type="checkbox" name="exerciseType" value="Other"> Other (please specify)</label><br>
    <input type="text" name="otherExercise" placeholder="Specify if 'Other'"><br><br>

    <h2>How do you feel about your current level of flexibility?</h2>
    <label><input type="radio" name="flexibilityLevel" value="Very flexible"> Very flexible</label><br>
    <label><input type="radio" name="flexibilityLevel" value="Somewhat flexible"> Somewhat flexible</label><br>
    <label><input type="radio" name="flexibilityLevel" value="Average"> Average</label><br>
    <label><input type="radio" name="flexibilityLevel" value="Needs improvement"> Needs improvement</label><br>
    <label><input type="radio" name="flexibilityLevel" value="I don't focus on flexibility"> I don't focus on flexibility</label><br><br>

    <h2>What challenges do you face when trying to stay fit?</h2>
    <label><input type="checkbox" name="fitnessChallenges" value="Time management"> Time management</label><br>
    <label><input type="checkbox" name="fitnessChallenges" value="Motivation"> Motivation</label><br>
    <label><input type="checkbox" name="fitnessChallenges" value="Lack of knowledge"> Lack of knowledge</label><br>
    <label><input type="checkbox" name="fitnessChallenges" value="Injury/Health issues"> Injury/Health issues</label><br>
    <label><input type="checkbox" name="fitnessChallenges" value="Finding the right routine"> Finding the right routine</label><br>
    <label><input type="checkbox" name="fitnessChallenges" value="Other"> Other (please specify)</label><br>
    <input type="text" name="otherChallenge" placeholder="Specify if 'Other'"><br><br>

    <h2>What is your approach to a healthy diet?</h2>
    <label><input type="radio" name="dietApproach" value="Balanced diet"> Balanced diet</label><br>
    <label><input type="radio" name="dietApproach" value="Vegetarian/Vegan"> Vegetarian/Vegan</label><br>
    <label><input type="radio" name="dietApproach" value="Low-carb"> Low-carb</label><br>
    <label><input type="radio" name="dietApproach" value="High-protein"> High-protein</label><br>
    <label><input type="radio" name="dietApproach" value="Intermittent fasting"> Intermittent fasting</label><br>
    <label><input type="radio" name="dietApproach" value="I don't focus on diet"> I don't focus on diet</label><br>
    <label><input type="radio" name="dietApproach" value="Other"> Other (please specify)</label><br>
    <input type="text" name="otherDiet" placeholder="Specify if 'Other'"><br><br>

    <h2>How do you stay motivated to keep up with your fitness goals?</h2>
    <label><input type="checkbox" name="motivation" value="Setting short-term goals"> Setting short-term goals</label><br>
    <label><input type="checkbox" name="motivation" value="Tracking progress"> Tracking progress</label><br>
    <label><input type="checkbox" name="motivation" value="Joining fitness groups/classes"> Joining fitness groups/classes</label><br>
    <label><input type="checkbox" name="motivation" value="Fitness apps"> Fitness apps</label><br>
    <label><input type="checkbox" name="motivation" value="Reward system"> Reward system</label><br>
    <label><input type="checkbox" name="motivation" value="Other"> Other (please specify)</label><br>
    <input type="text" name="otherMotivation" placeholder="Specify if 'Other'"><br><br>

    <h2>Have you ever experienced any fitness injuries?</h2>
    <label><input type="radio" name="fitnessInjuries" value="Yes"> Yes</label><br>
    <label><input type="radio" name="fitnessInjuries" value="No"> No</label><br>
    <label><input type="radio" name="fitnessInjuries" value="I'm currently recovering from an injury"> I'm currently recovering from an injury</label><br><br>

    <h2>What fitness equipment do you use regularly?</h2>
    <label><input type="checkbox" name="fitnessEquipment" value="Dumbbells"> Dumbbells</label><br>
    <label><input type="checkbox" name="fitnessEquipment" value="Resistance bands"> Resistance bands</label><br>
    <label><input type="checkbox" name="fitnessEquipment" value="Stability ball"> Stability ball</label><br>
    <label><input type="checkbox" name="fitnessEquipment" value="Exercise mat"> Exercise mat</label><br>
    <label><input type="checkbox" name="fitnessEquipment" value="Kettlebells"> Kettlebells</label><br>
    <label><input type="checkbox" name="fitnessEquipment" value="None"> None</label><br>
    <label><input type="checkbox" name="fitnessEquipment" value="Other"> Other (please specify)</label><br>
    <input type="text" name="otherEquipment" placeholder="Specify if 'Other'"><br><br>

    <h2>What type of fitness challenges would you like to see on our website?</h2>
    <textarea name="fitnessChallengesIdeas" rows="4" cols="50" placeholder="Share your ideas for fitness challenges"></textarea><br><br>

   <div class="sub"><button type="submit">Submit</button></div>



    
</body>
</html>
