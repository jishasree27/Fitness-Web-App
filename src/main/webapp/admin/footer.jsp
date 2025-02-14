<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movable Footer</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: white; /* Very light grey */
            height: 100%;
        }

        .container {
            padding: 20px;
              background: linear-gradient(to right, #f5e1ff, #ffffff);
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 100px; /* Ensure space for footer */
        }

        /* Footer Styles */
        .footer {
              background: linear-gradient(to left, #f5e1ff, #ffffff);
            color: black;
            text-align: center;
            padding: 20px;
            bottom: 0;
            width: 100%;
            left: 0;
            cursor: move; /* Indicating the footer is draggable */
            z-index: 1000; /* Ensure footer is above other content */
            margin-top: 300px; /* Ensure space for footer */
        }

        .footer a {
            color: black;
            text-decoration: none;
            margin: 0 10px;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Optional: Adjust for large content and make footer always stick at the bottom */
        .content {
            min-height: 80vh; /* Ensures enough space before the footer */
            padding-bottom: 60px; /* Makes space for the footer */
        }
    </style>
</head>
<body>

   

    <!-- Movable Footer -->
    <div class="footer" id="draggableFooter">
        <p>© 2025 Your Company. All Rights Reserved.</p>
        <p><a href="privacy-policy.jsp">Privacy Policy</a> | <a href="terms-of-service.jsp">Terms of Service</a></p>
    </div>

    <script>
        // Make the footer draggable
        var footer = document.getElementById('draggableFooter');
        var isDragging = false;
        var offsetX, offsetY;

        footer.addEventListener('mousedown', function(e) {
            isDragging = true;
            offsetX = e.clientX - footer.offsetLeft;
            offsetY = e.clientY - footer.offsetTop;
            document.addEventListener('mousemove', moveFooter);
            document.addEventListener('mouseup', stopDragging);
        });

        function moveFooter(e) {
            if (isDragging) {
                footer.style.left = e.clientX - offsetX + 'px';
                footer.style.top = e.clientY - offsetY + 'px';
            }
        }

        function stopDragging() {
            isDragging = false;
            document.removeEventListener('mousemove', moveFooter);
            document.removeEventListener('mouseup', stopDragging);
        }
    </script>

</body>
</html>
