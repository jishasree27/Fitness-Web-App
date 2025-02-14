<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

    <!-- Bootstrap 4 and custom styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <style>
        /* General Page Styles */
        body {
            font-family: Poppins, sans-serif;
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
</head>
<body>

    <jsp:include page="Navbar.jsp" />

    <div class="form-container">
        <form action="register" method="post">
            <h1>Sign Up</h1>
            <div class="form-group">
                <label for="exampleInputEmail1">Email address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="uemail" required>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Password</label>
                <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="upassword" required>
            </div>
            <div class="form-group">
                <label for="userType">Choose User Type</label>
                <select class="form-control" id="userType" name="uuserType" required>
                    <option value="other" selected>Other</option>
                    <option value="user">User</option>
                    <option value="trainer">Trainer</option>
                </select>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="utermsAccepted" required>
                <label class="form-check-label" for="exampleCheck1">I accept the terms and conditions</label>
            </div>
            <button type="submit" class="btn-login w-100">Submit</button>
        </form>
    </div>

</body>
</html>
 <jsp:include page="frontfooter.jsp" /> 
