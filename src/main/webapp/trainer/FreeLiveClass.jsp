<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    width: 80%;
    max-width: 800px;
    margin: 20px auto;
    background-color: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position:relative;
    left:120px;
    top:-600px;
}

.container h2 {
    text-align: center;
    color: #333;
}

.form-group {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"], input[type="url"], textarea {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

textarea {
    height: 100px;
}

button {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

button:hover {
    background-color: #45a049;
}

.view-button {
    text-align: center;
    margin-top: 20px;
}
     input[type="submit"] {
            background-color:  rgb(85, 0, 203); /* Very dark green */
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 5px;
            width: auto;
        }
        

        input[type="submit"]:hover {
            background-color: grey; /* Darker shade */
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
        <h2>Trainer Live Classes Submission</h2>
        <form action="FreeClass" method="POST">
            <!-- Trainer's Name -->
            <div class="form-group">
                <label for="trainerName">Trainer's Name</label>
                <input type="text" id="trainerName" name="trainerName" required placeholder="Enter Trainer's Name">
            </div>

            <!-- Class Title -->
            <div class="form-group">
                <label for="classTitle">Class Title</label>
                <input type="text" id="classTitle" name="classTitle" required placeholder="Enter Class Title">
            </div>

            <!-- Video Link -->
            <div class="form-group">
                <label for="videoLink">Video Link (YouTube or Vimeo)</label>
                <input type="url" id="videoLink" name="videoLink" required placeholder="Enter video URL">
            </div>

            <!-- Class Description -->
            <div class="form-group">
                <label for="classDescription">Class Description</label>
                <textarea id="classDescription" name="classDescription" required placeholder="Enter Class Description"></textarea>
            </div>

            <!-- Submit Button -->
            <div class="form-group">
                <input type="submit" value="Submit">
            </div>
        </form>

        <!-- View Submitted Classes Button -->
         <form action="uploadLiveClass" method="get">
            <input type="submit" value="View Load">
        </form>
    </div>
       <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
