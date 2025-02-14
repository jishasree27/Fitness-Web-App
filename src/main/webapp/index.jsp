<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 50px;
        }
        .login-container {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .side-image {
            max-height: 500px;
            object-fit: cover;
        }
        .text-center {
            text-align: center;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        a {
            color: #007bff;
        }
        a:hover {
            color: #0056b3;
            text-decoration: none;
        }
        @media (max-width: 767.98px) {
            .container {
                margin-top: 20px;
            }
        }
        .btn-login {
            background-color: rgb(85, 0, 203);
            color: white;
            border: none;
            border-radius: 25px;
            height: 50px;
            font-size: 16px;
        }
        .btn-login:hover {
            background-color: #5c00e6;
        }
        footer{
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
    <jsp:include page="Navbar.jsp" />
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-4 col-md-5">
                <div class="login-container bg-light p-4"> 
                    <h2 class="text-center">Login</h2>
                    <form class="login-form" method="POST" action="login"> 
                        <div class="mb-3">
                            <label for="email" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required> 
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required> 
                        </div>
                        <div class="form-group">
                            <label for="userType">Choose User Type</label>
                            <select class="form-control" id="userType" name="userType" required>
                                <option value="other" selected>Other</option>
                                <option value="user">User</option>
                                <option value="trainer">Trainer</option>
                            </select>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="remember">
                            <label class="form-check-label" for="remember">Remember me</label>
                        </div>
                        <button type="submit" class="btn-login w-100">Login</button>
                        <p class="text-center mt-3">
                            Don't have an account? 
                            <a href="signup.jsp" onclick="showSignUpForm()">Sign Up</a> |
                            <a href="AdminLogin.jsp">Admin Login</a>
                        </p>
                    </form>
                </div>
            </div>
            <div class="col-lg-6 col-md-7 d-none d-md-block">
                <img src="https://i.pinimg.com/736x/15/d9/15/15d9152daeb5edba4069ca762ea0a612.jpg" alt="Side Image" class="side-image img-fluid"> 
            </div>
        </div>
    </div>
</body>
</html>
<footer>
 <jsp:include page="frontfooter.jsp" /> 
 </footer>
