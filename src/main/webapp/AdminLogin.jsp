<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<style>
/* General body styling */

    <style>
        /* General Page Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }

        /* Container for the form */
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Form Heading */
        h1 {
            text-align: center;
            font-size: 2rem;
            color: #2e8b57;
            margin-bottom: 20px;
            font-family:Poppins, sans-serif;
        }

        /* Form Labels */
        .form-group label {
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 5px;
            display: block;
        }

        /* Input Fields */
        .form-control {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            font-size: 1rem;
        }

        /* Submit Button */
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


        /* Checkbox */
        .form-check-label {
            font-size: 1rem;
            color: #333;
        }
    </style>

</style>
<body>

    <jsp:include page="Navbar.jsp" />

 <div class="container">
    <div class="form-container">
        <h2 class="text-center">Admin Login</h2>
        <form class="login-form" method="POST" action="adminlogin" autocomplete="off">
            <div class="mb-3">
                <label for="email" class="form-label">Email address</label>
                <input type="email" class="form-control" id="email" name="email" autocomplete="off" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" autocomplete="off" required>
            </div>
            <div class="form-group">
                <label for="userType">Choose User Type</label>
                <select class="form-control" id="userType" name="userType" required>
                    <option value="other" selected>Other</option>
                    <option value="user">Admin</option>
                </select>
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="remember">
                <label class="form-check-label" for="remember">Remember me</label>
            </div>
            <button type="submit" class="btn-login w-100">Login</button>
        </form>
    </div>
</div>

     <footer>
 <jsp:include page="frontfooter.jsp" /> 
 </footer>      
</body>
</html>