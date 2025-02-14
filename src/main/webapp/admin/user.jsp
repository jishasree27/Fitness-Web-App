<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.fpojo.Fpojo" %>
<%@ page import="com.fdao.Fdao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <style>
        /* Main Styles */
  .userContainer {
    padding: 10px; /* Reduced padding to make the container smaller */
    margin-top: 20px;
    background-color: var(--secondary-bg);
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 5px; /* Reduced border-radius for a less curved effect */
    max-width: 1000px; /* Reduced max-width to make the container more compact */
    margin-left: auto; /* Center horizontally */
    margin-right: auto; /* Center horizontally */
}

#fitness-container {
    display: block;
    margin: 0 auto;
    max-width: 100%;
    text-align: center;
}

#fitness-container h2 {
    font-size: 24px;
    font-weight: 600;
    color: var(--primary-color);
    margin-bottom: 20px;
}

#fitnessTable {
    width: 500px; /* Increase width to make the table larger */
    border-collapse: collapse;
    margin: 0 auto;
}

#fitnessTable thead th {
    background-color: var(--btn-color);
    color: #fff;
    text-align: left;
    padding: 15px; /* Increased padding for larger table size */
    font-size: 18px; /* Increased font size for better readability */
    border-bottom: 2px solid #ddd;
}

#fitnessTable tbody td {
    text-align: left;
    padding: 15px; /* Increased padding for larger table size */
    border-bottom: 1px solid #ddd;
    font-size: 16px; /* Increased font size */
}

#fitnessTable tbody tr:nth-child(even) {
    background-color: var(--hover-bg);
}

#fitnessTable tbody tr:hover {
    background-color: var(--hover-color);
    color: #fff;
    transition: 0.3s ease;
}

#fitnessTable td,
#fitnessTable th {
    padding: 15px 20px; /* Increased padding */
}

.table-bordered {
    border: 1px solid #ddd;
    border-radius: 5px;
}

.table-bordered td,
.table-bordered th {
    border: 1px solid #ddd;
}

  
    </style>


<body>
    <div>
        <jsp:include page="adminNavside.jsp" />
    </div>

    <div class="userContainer">
        <% 
            // Fetch logged-in user from session
            String loggedInUser = (String) session.getAttribute("user");

            // Create an instance of Fdao to fetch fitness data
            Fdao dao = new Fdao();
            List<Fpojo> fList = dao.getAllFitnessData();

            // Count the number of users (filtered by 'user' type)
            int userCount = 0;
            for (Fpojo fitness : fList) {
                if (fitness.getUserType().equalsIgnoreCase("user")) {
                    userCount++;  // Increment user count
                }
            }
        %>

        <div id="fitness-container">
            <h2 class="text-center">Fitness User Details</h2>

            <!-- Display user count dynamically -->
            <div class="user-count">
                <p>Total Users: <%= userCount %></p>
            </div>

            <!-- Fitness user table -->
            <table id="fitnessTable" class="table table-bordered">
                <thead>
                    <tr>
                        <th>Email</th>
                        <th>Type</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                    for (Fpojo fitness : fList) {
                        if(fitness.getUserType().equalsIgnoreCase("user")) {
                    %>
                        <tr>
                            <td><%= fitness.getEmail() %></td>
                            <td><%= fitness.getUserType() %></td>
                        </tr>
                    <% 
                        }
                    } 
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <br><br>
</body>

</html>