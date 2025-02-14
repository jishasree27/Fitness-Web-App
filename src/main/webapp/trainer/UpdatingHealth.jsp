<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.HealthPojo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Video</title>
    <style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.container {
    width: 50% !important; /* Make sure the width is applied */
    max-width: 400px !important; /* Set the maximum width */
    margin-top: -580px !important; /* Adjust the top margin */
    margin-left: 10px !important; /* Move the container to the left */
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-left: 500px !important;

}

.container h4 {
    text-align: center;
    margin-bottom: 20px;
    color:black;
}

.form-group {
    margin-bottom: 15px;
}

label {
    font-size: 1rem;
    color: #555;
    display: block;
    margin-bottom: 5px;
}

input.form-control,
select.form-control {
    width: 100% !important; /* Ensure the form elements take the full width */
    padding: 10px;
    border-radius: 4px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

.btn-primary {
    background-color: rgb(85, 0, 203);
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 1rem;
    cursor: pointer;
    border-radius: 4px;
    width: 100% !important; /* Ensure the button takes the full width */
}

.btn-primary:hover {
    background-color: rgb(68, 0, 160);
}

.alert {
    color: white;
    background-color: #e74c3c;
    padding: 15px;
    border-radius: 4px;
    text-align: center;
    font-size: 1rem;
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
  <jsp:include page="NavSide.jsp" />
    <div class="container">
        <% 
            // Fetch the object from the request attribute
            HealthPojo uservp = (HealthPojo) request.getAttribute("uservp");
            System.out.println("Debug - uservp: " + uservp); // Debugging

            if (uservp == null) { 
        %>
            <div class="alert">
                 <p style="color: red; text-align: center;">No video details found to update. Please try again later.</p>
            </div>
        <% 
            } else {
        %>
            <h4>Update Health Video</h4>
            <form action="healthUpdate" method="post" enctype="multipart/form-data">
                <input type="hidden" name="uid" value="<%= uservp.getId() %>" />
                <input type="hidden" name="userId" value="<%= session.getAttribute("user") %>" />

                <div class="form-group">
                    <label for="uname">Trainer Name:</label>
                    <input type="text" id="uname" name="utrainer" class="form-control" 
                           value="<%= uservp.getTrainerName() != null ? uservp.getTrainerName() : "" %>" />
                </div>

                <div class="form-group">
                    <label for="uspecification">Food Control Ideas:</label>
                    <input type="text" id="ufood" name="ufood" class="form-control" 
                           value="<%= uservp.getFoodControlIdeas() != null ? uservp.getFoodControlIdeas() : "" %>" />
                </div>

                <div class="form-group">
                    <label for="daysToFollow">Days to Follow:</label>
                    <select id="daysToFollow" name="daysToFollow" class="form-control" required>
                        <option value="">Select number of days</option>
                        <option value="7" <%= uservp.getDaysToFollow().equals("7") ? "selected" : "" %>>7 days</option>
                        <option value="14" <%= uservp.getDaysToFollow().equals("14") ? "selected" : "" %>>14 days</option>
                        <option value="30" <%= uservp.getDaysToFollow().equals("30") ? "selected" : "" %>>30 days</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="udetails">Daily Routine:</label>
                    <input type="text" id="udaily" name="udaily" class="form-control" 
                           value="<%= uservp.getDailyRoutine() != null ? uservp.getDailyRoutine() : "" %>" />
                </div>

                <button type="submit" class="btn-primary">Update Video</button>
            </form>
        <% 
            }
        %>
    </div>
    
               <footer> 
    <jsp:include page="footer.jsp" />
</footer>
      
</body>
</html>
