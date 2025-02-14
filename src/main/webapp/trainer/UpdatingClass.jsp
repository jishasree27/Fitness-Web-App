<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.FreeClassPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Free Live Class</title>
</head>
 <style>
        body {
 font-family: 'Poppins', sans-serif;      
       background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            position:relative;
            left:120px;
            top:-600px;
        }

        .container h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            height: 150px;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            background-color: #007bff;
            color: white;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .alert {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
        }

        .text-center {
            text-align: center;
        }

        .mt-4 {
            margin-top: 1.5rem;
        }
          .form-group label {
        color: rgb(85, 0, 203) !important; /* Ensure this takes priority */
        font-weight: bold;
        display: block;
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
<body>
 <div>
        <jsp:include page="NavSide.jsp" />
    </div>
<div class="container">
   <%
        // Fetch the object from the request attribute
        FreeClassPojo classDetails = (FreeClassPojo) request.getAttribute("classDetails");
        System.out.println("Debug - classDetails: " + classDetails); // Debugging

        if (classDetails == null) {
    %>
    <div class="alert alert-danger" role="alert">
         <p style="color: red; text-align: center;">No class details found to update. Please try again later.</p>
    </div>
    <%
        } else {
    %>
    <form action="freeclassUpdate" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= classDetails.getId() %>" />

        <div class="form-group">
            <label for="trainerName">Trainer Name:</label>
            <input type="text" id="trainerName" name="trainerName" class="form-control" 
                   value="<%= classDetails.getTrainerName() != null ? classDetails.getTrainerName() : "" %>" />
        </div>

        <div class="form-group">
            <label for="classTitle">Class Title:</label>
            <input type="text" id="classTitle" name="classTitle" class="form-control" 
                   value="<%= classDetails.getClassTitle() != null ? classDetails.getClassTitle() : "" %>" />
        </div>

        <div class="form-group">
            <label for="videoLink">Video Link:</label>
            <input type="text" id="videoLink" name="videoLink" class="form-control" 
                   value="<%= classDetails.getVideoLink() != null ? classDetails.getVideoLink() : "" %>" />
        </div>

        <div class="form-group">
            <label for="classDescription">Class Description:</label>
            <textarea id="classDescription" name="classDescription" class="form-control"><%= 
                classDetails.getClassDescription() != null ? classDetails.getClassDescription() : "" %>
            </textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update Class</button>
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
