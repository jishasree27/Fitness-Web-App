<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
     .container {
    width: 80%;
    max-width: 900px;
    margin: 20px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    position: relative;  /* Relative to its normal position */
    top: -650px !important;  /* Moves the container 50px down */
    left: 120px !important;    /* Keeps the container centered */
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
 <jsp:include page="NavSide.jsp" />
 <div class="container">
            <h3 class="error-message">Your Details are Already Entered , Update Your details!</h3>
            <h3>Thank You..</h3>
        </div>
            <footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>