<%@ page import="training.pack.Tpojo.BookschedulePojo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Update Book Schedule</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
 .container-schedule {
    max-width: 500px;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    margin: 40px auto;
    margin-left: 500px;
    position: relative; /* Enable relative positioning */
    top: -600px; /* Move the container upwards */
}

      .container-schedule  h2 {
            font-size: 1.8rem;
            color: black;
        }
        label {
            font-weight: bold;
            color: #495057;
        }
        input[type="date"],
        input[type="time"],
        input[type="number"] {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            font-size: 1rem;
            border: 1px solid #ced4da;
            border-radius: 5px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .alert {
            margin-top: 20px;
            padding: 15px;
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
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
    <div class="container-schedule mt-4">
        <h2 class="text-center mb-4">Update Book Schedule</h2>

        <%
            BookschedulePojo bs_obj = (BookschedulePojo) request.getAttribute("user");
            if (bs_obj == null) {
        %>
            <div class="alert alert-danger" role="alert">
                 <p style="color: red; text-align: center;">No schedule details found to update. Please try again.</p>
            </div>
        <%
            } else {
        %>
            <form action="Update" method="post" class="form-group">
                <input type="hidden" name="id" value="<%= bs_obj.getId() %>" />

                <div class="mb-3">
                    <label for="date" class="form-label">Date:</label>
                    <input type="date" id="date" name="date" value="<%= bs_obj.getDate() %>" required />
                </div>

                <div class="mb-3">
                    <label for="fromtime" class="form-label">From Time:</label>
                    <input type="time" id="fromtime" name="fromtime" value="<%= bs_obj.getFromTime() %>" required />
                </div>

                <div class="mb-3">
                    <label for="totime" class="form-label">To Time:</label>
                    <input type="time" id="totime" name="totime" value="<%= bs_obj.getToTime() %>" required />
                </div>

                <div class="mb-3">
                    <label for="amount" class="form-label">Amount:</label>
                    <input type="number" id="amount" name="amount" value="<%= bs_obj.getAmount() %>" required />
                </div>

                <button type="submit" class="btn btn-primary">Update</button>
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

