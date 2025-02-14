<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <title>Home Page</title>
    <script>
        // Function to show popup message
        function showPopup(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <!-- Include TrainerDashboard.jsp -->
    <jsp:include page="TrainerDashboard.jsp" />

    <%
        // Get the success or error message from the request
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");

        // If a message is present, show it as a popup
        if (message != null) {
    %>
        <script>
            // Display the success message in a popup
            showPopup("<%= message %>");
        </script>
    <%
        } else if (error != null) {
    %>
        <script>
            // Display the error message in a popup
            showPopup("<%= error %>");
        </script>
    <%
        }
    %>
</body>
</html>
