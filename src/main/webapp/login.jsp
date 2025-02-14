<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            margin: 0;
            padding: 0;
        }
        .container-hello {
            max-width:100%;
          
            padding: 20px;
          	background: linear-gradient(to right, #E3F2FD, #FFFFFF);
            border-radius: 10px;
        }
        .login-container {
            border: none;
            border-radius: 8px;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .side-image {
            max-height: 500px;
            object-fit: cover;
            border-radius: 10px;
            margin-left:100px;
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
            width: 100%;
        }
        .btn-login:hover {
            background-color: #5c00e6;
        }
  
      .custom-font {
        font-family: 'Poppins', sans-serif;
    }
  
    </style>
</head>
<body>

    <div class="container-hello">
        <div class="row align-items-center">
            <!-- Side Image -->
            <div class="col-lg-6 col-md-7 d-none d-md-block">
                <img src="https://scontent.fcjb3-4.fna.fbcdn.net/v/t39.30808-6/368398800_619492070270776_5340188825398431368_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=nuvg9Q_qRHgQ7kNvgFBiEF-&_nc_oc=Adj7Lz-d65LiWRaYOpDS5z9__25XwJLhsUaZggdg67zXZN3CW8JB-S5zq0Wlydnl5aBc4D-1GYHPEfpLlQu3HCdW&_nc_zt=23&_nc_ht=scontent.fcjb3-4.fna&_nc_gid=ABjzMn7ypUr_AjZ-6NKNifC&oh=00_AYBR8sqQW2rLUTbnp4DtawbuWmcw9VTo_AnekkTHQaVCBw&oe=67AFE7B4" 
                     alt="Side Image" class="side-image img-fluid"> 
            </div>
            
            <!-- Signup Form -->
            <div class="col-lg-4 col-md-5">
                <div class="login-container">
                    <form action="register" method="post">
                     <h2 class="text-center custom-font fw-bold">Register</h2>

                        <div class="mb-3">
                            <label for="exampleInputEmail1" class="form-label">Email address</label>
                            <input type="email" class="form-control" id="exampleInputEmail1" 
                                   aria-describedby="emailHelp" placeholder="Enter email" name="uemail" required>
                        </div>
                        <div class="mb-3">
                            <label for="exampleInputPassword1" class="form-label">Password</label>
                            <input type="password" class="form-control" id="exampleInputPassword1" 
                                   placeholder="Password" name="upassword" required>
                        </div>
                        <div class="mb-3">
                            <label for="userType" class="form-label">Choose User Type</label>
                            <select class="form-control" id="userType" name="uuserType" required>
                                <option value="other" selected>Other</option>
                                <option value="user">User</option>
                                <option value="trainer">Trainer</option>
                            </select>
                        </div>
                         <p style="color: blue;">If you already have account Login!</p>
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="utermsAccepted" required>
                            <label class="form-check-label" for="exampleCheck1">I accept the terms and conditions</label>
                        </div>
                        <button type="submit" class="btn-login">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

  

</body>
</html>
