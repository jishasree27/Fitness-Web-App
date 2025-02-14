<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.NewUpdatePojo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Video</title>
    <style>
  .container {
    position: relative;
    margin: 20px auto;
    max-width: 500px; /* Reduced width */
    padding: 15px; /* Reduced padding */
    background-color: #ffffff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    top: -600px; /* Move upwards */
    left: 200px; /* Move left */
}

.container h4 {
    margin-bottom: 15px;
    color: black;
    text-align: center;
}

.form-group {
    margin-bottom: 10px; /* Reduced spacing between fields */
}

.form-control {
    width: 100%;
    padding: 6px; /* Reduced padding */
    font-size: 14px; /* Smaller font size */
    box-sizing: border-box;
    border: 1px solid #ccc; /* Subtle border */
    border-radius: 4px; /* Slightly rounded corners */
}

.btn-primary {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 8px 12px; /* Reduced button size */
    font-size: 14px; /* Smaller font */
    cursor: pointer;
    border-radius: 4px;
}

.btn-primary:hover {
    background-color: #0056b3;
}

.alert {
    padding: 10px; /* Reduced padding */
    background-color: #f8d7da;
    color: #721c24;
    margin-bottom: 15px; /* Reduced margin */
    border: 1px solid #f5c6cb;
    font-size: 14px; /* Smaller font */
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
        <h4>Updates</h4>
        <%
            // Fetch the object from the request attribute
            NewUpdatePojo uservp = (NewUpdatePojo) request.getAttribute("uservp");
            System.out.println("Debug - uservp: " + uservp); // Debugging

            if (uservp == null) {
        %>
        <div class="alert alert-danger" role="alert">
             <p style="color: red; text-align: center;">No video details found to update. Please try again later.</p>
        </div>
        <%
            } else {
        %>
        <form action="updateNew" method="post" enctype="multipart/form-data">
            <input type="hidden" name="uid" value="<%= uservp.getClassId() %>" />
             <input type="hidden" name="userId" value="<%= session.getAttribute("user") %>" />
            <div class="form-group">
                <label for="utitle">Class Name:</label>
                <input type="text" id="utitle" name="uname" class="form-control" 
                       value="<%= uservp.getClassName() != null ? uservp.getClassName() : "" %>" required />
            </div>
            
            <div class="form-group">
                <label for="uname">Trainer Name:</label>
                <input type="text" id="uname" name="utrainer" class="form-control" 
                       value="<%= uservp.getTrainerName() != null ? uservp.getTrainerName() : "" %>" />
            </div>
            
            <div class="form-group">
                <label for="uspecification">Expertise:</label>
                <input type="text" id="uspecification" name="uexpertise" class="form-control" 
                       value="<%= uservp.getExpertise() != null ? uservp.getExpertise() : "" %>" />
            </div>
            
            <div class="form-group">
                <label for="umessage">Description:</label>
                <input type="text" id="umessage" name="udescription" class="form-control" 
                       value="<%= uservp.getDescription() != null ? uservp.getDescription() : "" %>" />
            </div>
            
            <div class="form-group">
                <label for="udetails">Feedback:</label>
                <input type="text" id="udetails" name="ufeedback" class="form-control" 
                       value="<%= uservp.getFeedback() != null ? uservp.getFeedback() : "" %>" />
            </div>
            
            <button type="submit" class="btn btn-primary">Update Video</button>
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
