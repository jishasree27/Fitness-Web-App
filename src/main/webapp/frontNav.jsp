<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fitness Freaks</title>
<style>
 /* Custom Styles */
body {
    background-color: white;
    color: rgb(86, 20, 150);
}

.navbar-custom {
    background-color: white !important;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    padding: 15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar-brand {
    display: flex;
    align-items: center;
}

.navbar-brand img {
    width: 50px;
    height: 50px;
    margin-right: 10px;
}

.navbar-brand span {
    font-size: 20px;
    font-weight: bold;
    color: rgb(86, 20, 150) !important;
}

.navbar-nav {
    display: flex;
    align-items: center;
    gap: 20px;
    margin-left: 900px; /* Push to the right */
    padding: 0; /* Ensure no extra spacing */
}

.navbar-nav li {
    list-style: none; /* Remove default list bullets */
}

.nav-link {
    color: rgb(86, 20, 150) !important;
    font-size: 18px;
    text-decoration: none;
}

.nav-link:hover {
    color: rgba(86, 20, 150, 0.8) !important;
}

.login-signup {
    display: flex;
    gap: 10px;
}

.btn-custom {
    color: white !important;
    background-color: rgb(86, 20, 150) !important;
    border-radius: 20px;
    padding: 8px 15px;
    font-size: 16px;
    border: none;
    text-decoration: none;
}

.btn-custom:hover {
    background-color: rgba(86, 20, 150, 0.8) !important;
}

.btn-outline-primary {
    color: rgb(86, 20, 150) !important;
    border: 1px solid rgb(86, 20, 150) !important;
    padding: 8px 15px;
    border-radius: 20px;
    text-decoration: none;
}

.btn-outline-primary:hover {
    background-color: rgb(86, 20, 150) !important;
    color: white !important;
}

</style>
</head>
<body>
<nav class="navbar navbar-custom">
  <a class="navbar-brand" >
    <img src="https://img.freepik.com/free-vector/fitness-logo-template-flat-design_52683-16841.jpg" alt="Logo">
    <span>Fitness Freaks</span>
  </a>
 <ul class="navbar-nav d-flex flex-row">
    <li class="nav-item mx-2"><a class="nav-link" href="frontpage.jsp">Home</a></li>
    <li class="nav-item mx-2"><a class="nav-link" href="about.jsp">About</a></li>
    <li class="nav-item mx-2"><a class="nav-link" href="frontContact.jsp">Contact</a></li>
</ul>

  <div class="login-signup">
    <a href="index.jsp" class="btn btn-custom">Login</a>
    <a href="signup.jsp" class="btn btn-outline-primary">Signup</a>
  </div>
</nav>
</body>
</html>