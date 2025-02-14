<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="User.pack.Pojo.SaveProfilePojo" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Content</title>
    <style>
        body {
            font-family: poppins, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
        }

   
      

        .content-section {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .content-section h3 {
            margin-top: 0;
            font-size: 20px;
            color: #333;
        }

        .saved-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .saved-table th, .saved-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .saved-table th {
            background-color: #2ac0d4; /* Deep violet */
            color: white;
            font-size: 16px;
        }

        .saved-table td {
            font-size: 14px;
            color: #333;
        }

        .saved-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .saved-table tr:hover {
            background-color: #f1f1f1;
        }

        .saved-table td form button {
            background-color: #dc3545; /* Red */
            color: white;
            padding: 5px 10px;
            font-size: 14px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .saved-table td form button:hover {
            background-color: #c82333;
        }

        .alert {
            padding: 10px;
            margin-top: 20px;
            border-radius: 5px;
            font-size: 16px;
            text-align: center;
        }

        .alert-warning {
            background-color: #fff3cd;
            color: #856404;
        }

        .alert-info {
            background-color: #d1ecf1;
            color: #0c5460;
        }
                 footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }

       
    </style>
</head>
<body>
    <div>
        <jsp:include page="userNavSide.jsp" />
    </div>
  
        <center>
            <h3>Saved Content</h3>
        </center>

      
            <div class="content-section">
                <p>Here are the materials or classes you have saved for later:</p>

                <%
                    HomeDao homedao = new HomeDao();
                    List<SaveProfilePojo> saveList = homedao.getAllSaved();
                    String loggedInUser = (String) session.getAttribute("user");

                    if (loggedInUser == null) {
                %>
                <div class="alert alert-warning text-center">
                     <p style="color: red; text-align: center;">Please log in to view your bookings.</p>
                </div>
                <%
                    } else if (saveList != null && !saveList.isEmpty()) {
                %>

                <table class="saved-table">
                    <thead>
                        <tr>
                            <th>Trainer Name</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (SaveProfilePojo sp : saveList) {
                                if (sp.getCustomerUserId().equals(loggedInUser)) {
                        %>
                        <tr>
                            <td><%= sp.getTrainerName() %></td>
                            <td><%= sp.getTitle() %></td>
                            <td><%= "saved" %></td>
                            <td>
                                <form action="deleteSaved" method="post" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= sp.getTrainerId() %>" />
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
                <%
                    } else {
                %>
                <div class="alert alert-info text-center">
                    <p style="color: red; text-align: center;">No saved profile found for your account.</p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
