<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <script>
        // Get the menu icon and sidebar elements
        const menuIcon = document.getElementById("menu-icon");
        const sidebar = document.querySelector(".nav");

        // Toggle the sidebar when the icon is clicked
        menuIcon.addEventListener("click", () => {
            sidebar.classList.toggle("open");
        });
    </script>
</body>
</html>