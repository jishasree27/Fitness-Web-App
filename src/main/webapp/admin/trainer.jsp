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
    display: block; /* Ensure visibility; toggle with JS if needed */
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
    width: 60%;
    border-collapse: collapse;
    margin: 0 auto;
}

#fitnessTable thead th {
    background-color: var(--btn-color);
    color: #fff;
    text-align: left;
    padding: 10px;
    font-size: 16px;
    border-bottom: 2px solid #ddd;
}

#fitnessTable tbody td {
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
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
    padding: 12px 15px;
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
        String loggedInUser = (String) session.getAttribute("user");
        Fdao dao = new Fdao();
        List<Fpojo> fList = dao.getAllFitnessData();
        
        // Count the number of trainers
        int trainerCount = 0;
        for (Fpojo fitness : fList) {
            if (fitness.getUserType().equalsIgnoreCase("trainer")) {
                trainerCount++;
            }
        }
    %>
    
    <div id="fitness-container">
        <h2 class="text-center">Fitness User Details</h2>
        <p class="text-center"> Total Trainer:<%= trainerCount %></p> <!-- Display the count of trainers -->
        
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
                    if (fitness.getUserType().equalsIgnoreCase("trainer")) {
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
   
</body>
</html>