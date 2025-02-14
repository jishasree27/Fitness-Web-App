<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.FreeClassPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Free Live Classes</title>
</head>
<style>
        body {
             font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            position:relative;
            left:100px;
            top:-600px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .table-bordered {
            border: 1px solid #ddd;
        }

        .table-hover tbody tr:hover {
            background-color: #f1f1f1;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td a {
            color: #007bff;
            text-decoration: none;
        }

        td a:hover {
            text-decoration: underline;
        }

        .btn {
            padding: 5px 10px;
            font-size: 14px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        .btn-sm {
            padding: 5px 15px;
            font-size: 12px;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
            color: white;
        }

        .btn-danger:hover {
            background-color: #c82333;
        }

        .text-center {
            text-align: center;
        }

        .mt-4 {
            margin-top: 1.5rem;
        }

        .alert {
            background-color: #f8d7da;
            color: #721c24;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
            border-radius: 5px;
        }
        .container h4{
        
        color:black;
        
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
<div>
        <jsp:include page="NavSide.jsp" />
    </div>

<div class="container">
    <% 
        String loggedInUser = (String) session.getAttribute("user");
        HomeDao uDao = new HomeDao();
        List<FreeClassPojo> classList = uDao.getAllFreeClass();
        
        if (loggedInUser == null) { 
    %>
        <div class="text-center mt-4">
             <p style="color: red; text-align: center;">Please log in to view and upload classes.</p>
        </div>
    <% 
        } else if (classList != null && !classList.isEmpty()) { 
            boolean hasClasses = false;
    %>             
        <h4 class="text-center">Uploaded Free Live Classes</h4>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Trainer Name</th>
                    <th scope="col">Class Title</th>
                    <th scope="col">Video Link</th>
                    <th scope="col">Description</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (FreeClassPojo freeClass : classList) {
                        if (freeClass.getTrainerName() != null && loggedInUser.equals(freeClass.getUserId())) {
                            hasClasses = true;
                %>
                <tr>
                    <td><%= freeClass.getTrainerName() %></td>
                    <td><%= freeClass.getClassTitle() %></td>
                    <td><a href="<%= freeClass.getVideoLink() %>" target="_blank">Watch Video</a></td>
                    <td><%= freeClass.getClassDescription() %></td>
                    <td>
                        <form action="updateFreeClass" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= freeClass.getId() %>">
                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                        </form>
                        <form action="deleteFreeClass" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= freeClass.getId() %>">
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    }
                    if (!hasClasses) {
                %>
                <div class="text-center mt-4">
                    <p style="color: red; text-align: center;">No free live classes found for your account.</p>
                </div>
                <% 
                    }
                %>
            </tbody>
        </table>
    <%  
        } else { 
    %> 
        <div class="text-center mt-4">
             <p style="color: red; text-align: center;">No free live classes found for your account.</p>
        </div>
    <% 
        } 
    %>
</div>

<footer> 
    <jsp:include page="footer.jsp" />
</footer>
</body>
</html>
