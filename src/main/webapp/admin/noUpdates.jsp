<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    p {
        font-size: 20px;
        color: #6c757d;
        background-color: #ffffff;
        padding: 15px 25px;
        border-radius: 8px;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
</style>

<body>
 <div>
            <!-- Sidebar includes links to other sections like Users, Settings, etc. -->
            <jsp:include page="adminNavside.jsp" />
        </div>
 <p style="color: red; text-align: center;">no updates</p>
</body>
</html>