<%@ page import="training.pack.Tpojo.BookschedulePojo" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Book Schedules</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
 <style>
body {
    background-color: white;
    font-family: 'Poppins', sans-serif;
}

.center-header {
    text-align: center;
    margin-top: 20px;
    padding: 15px;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.container {
    max-width: 70%;
    height: 90vh;
    background-color: white;
    padding: 30px;
    border-radius: 10px;
    position:relative;
    left: 120px;
    top: -600px;
}

.container h4 {
    color: black;
}

.table {
    margin: 0 auto;
    width: 50%;
    position:relative;

}

.container .table-dark {
    background-color: rgb(85, 0, 203);
    color: white;
}

.table th {
    color: white;
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
.no-schedule{
 	position:relative;
 	top:-500px;
 	
}
</style>
</head>
<body>
    <jsp:include page="NavSide.jsp" />
    
    <% 
        HomeDao homedao = new HomeDao();
        List<BookschedulePojo> bookscheduleList = homedao.getAllschedule();
        String loggedInUser = (String) session.getAttribute("user");

        if (loggedInUser == null) {
    %>
    <div class="text-center mt-4">
        <p style="color: red; text-align: center;">Please log in to view your schedules.</p>
    </div>
    <% 
        } else if (bookscheduleList != null && !bookscheduleList.isEmpty()) { 
            System.out.println("Fetched bookschedules: " + bookscheduleList.size());
    %>

    <div class="container">
        <h4 class="text-center mb-4">Booked Schedules</h4>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Date</th>
                    <th scope="col">From Time</th>
                    <th scope="col">To Time</th>
                    <th scope="col">Amount</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (BookschedulePojo bs : bookscheduleList) {
                        if (bs.getUserId() != null && bs.getUserId().equals(loggedInUser)) {
                %>
                <tr>
                    <td><%= bs.getDate() %></td>
                    <td><%= bs.getFromTime() %></td>
                    <td><%= bs.getToTime() %></td>
                    <td><%= bs.getAmount() %></td>
                    <td>
                        <form action="update" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= bs.getId() %>" />
                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                        </form>
                        <form action="delete" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= bs.getId() %>" />
                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <% 
        } else {
            System.out.println("No schedules found.");
    %>
    <div class="no-schedule">
         <p style="color: red; text-align:center;">No schedules found for your account.</p>
    </div>
    <% 
        }
    %>
    <footer> 
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
