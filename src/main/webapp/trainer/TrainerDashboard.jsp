<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="Admin Dashboard" />
        <meta name="author" content="Fitness Freaks" />
        <title>Dashboard - Fitness Freaks</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
      

    </head>
<style>
    .notification-bar {
        /* Shadow and border removed */
        /* border-radius: 5px; */
        /* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
    }


    .container-right {
        justify-content: flex-end; /* Moves the content to the right */
        padding: 20px;
        margin-left: 200px; /* Keeps the left margin */
        margin-top: -600px; /* Moves the container upwards */
        border: none;  /* If there was any border */
        box-shadow: none;  /* If there was any shadow */
    }

    .container-right jsp\:include {
        width: 100%; /* Ensure the included content takes full width inside the container */
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

        <div class="container-right">
    <jsp:include page="TrainerHome.jsp" />
</div>

       

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- Search Bar -->



               <footer> 
    <jsp:include page="footer.jsp" />
</footer>
      
    </body>
</html>
