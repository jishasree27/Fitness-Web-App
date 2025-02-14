<%@ page import="java.util.*" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.VideoPojo" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Update Video</title>
    <style>
  body {
    font-family: 'Poppins', sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.container h4 {
    color: black;
    margin-top: 20px;
}

.container {
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: relative;
    left: 170px; /* Adjust the left position if needed */
    margin-top: -600px; /* Adjust the top margin if needed */
    margin-bottom: 20px;
    max-width: 350px; /* Reduced container width */
}

.alert {
    margin-bottom: 20px;
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

.form-control {
    padding: 8px; /* Reduced padding for smaller input boxes */
    border-radius: 4px;
    box-sizing: border-box;
    width: 50%; /* Ensure full width of container but reduced padding */
}

.btn-primary {
    background-color: #007bff;
    border: none;
    font-size: 1rem;
    padding: 10px 20px;
    cursor: pointer;
}

.btn-primary:hover {
    background-color: #0056b3;
}
input[type="submit"] {
    background-color: rgb(85, 0, 203); /* Set background color */
    color: white; /* Set text color */
    border: none; /* Remove default border */
    padding: 10px 20px; /* Add padding */
    font-size: 1rem; /* Set font size */
    cursor: pointer; /* Change cursor to pointer on hover */
    border-radius: 4px; /* Optional: adds rounded corners */
}

input[type="submit"]:hover {
    background-color: rgb(68, 0, 160); /* Darker shade on hover */
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
    <main>
        
        <div class="container">
        <h4>Update Video</h4>
            <%
                VideoPojo uservp = (VideoPojo) request.getAttribute("uservp");
                if (uservp == null) {
            %>
            <div class="alert alert-danger" role="alert">
                 <p style="color: red; text-align: center;">No video details found to update. Please try again later.</p>
            </div>
            <%
                } else {
            %>
            <form action="vid" method="post" enctype="multipart/form-data">
                <input type="hidden" name="uid" value="<%= uservp.getId() %>" />
                <div class="form-group">
                    <label for="utitle">Title:</label>
                    <input type="text" id="utitle" name="utitle" class="form-control" value="<%= uservp.getTitle() %>" required />
                </div>
                <div class="form-group">
                    <label for="videoFile">Choose Video:</label>
                    <input type="file" id="videoFile" name="uvideo" accept="video/*" class="form-control" value="<%= uservp.getVideo() %>"  />
                </div>
                <div class="form-group">
                    <label for="thumbnailFile">Choose Thumbnail:</label>
                    <input type="file" id="thumbnailFile" name="uthumbnail" accept="image/*" class="form-control" value="<%= uservp.getThumbnail() %>" />
                </div>
                 <div class="form-group">
                    <label for="Name">Name:</label>
                    <input type="text" id="name" name="uname"  class="form-control" value="<%= uservp.getName() %>"  />
                </div>
                 <div class="form-group">
                    <label for="Specification">Specification:</label>
                    <input type="text" id="specification" name="uspecification" class="form-control" value="<%= uservp.getSpecification() %>"  />
                </div>
                 <div class="form-group">
                    <label for="message">Message:</label>
                    <input type="text" id="message" name="umessage"  class="form-control" value="<%= uservp.getMessage() %>" />
                </div>
                
                 <div class="form-group">
                    <label for="date">Date:</label>
                    <input type="text" id="date" name="udate" class="form-control" value="<%= uservp.getDate() %>"  />
                </div>
                 <div class="form-group">
                    <label for="fromtime">From Time:</label>
                    <input type="text" id="fromtime" name="uFtime" class="form-control" value="<%= uservp.getFtime() %>" />
                </div>
                 <div class="form-group">
                    <label for="totime">To Time:</label>
                    <input type="text" id="totime" name="uTtime" class="form-control" value="<%= uservp.getTtime() %>" />
                </div>
                 <div class="form-group">
                    <label for="payment">payment:</label>
                    <input type="text" id="payment" name="upayment" class="form-control" value="<%= uservp.getPaymentDetails() %>" />
                </div>
                 <div class="form-group">
                    <label for="offer">Offer:</label>
                    <input type="text" id="offer" name="uoffer" class="form-control" value="<%= uservp.getOffer() %>" />
                </div>
                <div class="form-group">
                    <label for="offerName">Offer Name:</label>
                    <input type="text" id="offer" name="uofferName" class="form-control" value="<%= uservp.getOfferName() %>" />
                </div>
                <div class="form-group">
                    <label for="offerValid">Offer Valid:</label>
                    <input type="text" id="offer" name="uofferValid" class="form-control" value="<%= uservp.getOfferValid() %>" />
                </div>
                 <div class="form-group">
                    <label for="Link">Class Link:</label>
                    <input type="text" id="classlink" name="uclasslink" class="form-control" value="<%= uservp.getClassLink() %>" />
                </div>
                  
                
                <input type="submit" value="Update Video">
            </form>
            <%
                }
            %>
        </div>
    </main>
    
               <footer> 
    <jsp:include page="footer.jsp" />
</footer>
      
</body>
</html>
