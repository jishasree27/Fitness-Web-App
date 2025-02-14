<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="User.pack.Pojo.CartPojo, training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.List, java.util.Set, java.util.HashSet" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Booking</title>
    <style>
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            transition: background 0.3s ease;
        }
        button:disabled {
            background-color: #6c757d;
            cursor: not-allowed;
        }
        button:hover {
            background-color: #0056b3;
        }
        input {
            display: none;
        }
    </style>
</head>
<body>

<%
    // Fetch all cart offers
    HomeDao homedao3 = new HomeDao();
    List<CartPojo> cList = homedao3.getAllCartProfile();

    // Get logged-in user session
    String loggedInUser1 = (String) session.getAttribute("user");

    // Retrieve confirmed trainer IDs from session (if any)
    Set<String> confirmedTrainers = (Set<String>) session.getAttribute("confirmedTrainers");
    if (confirmedTrainers == null) {
        confirmedTrainers = new HashSet<>();
        session.setAttribute("confirmedTrainers", confirmedTrainers);
    }

    if (loggedInUser1 != null) { // Ensure user is logged in
        boolean found = false;
        for (CartPojo userProfile : cList) { 
            if (userProfile.getUsersession().equals(loggedInUser1)) { // Match user session
                found = true;
                String trainerId = String.valueOf(userProfile.getTrainerId());
%>

            <form id="paymentForm_<%= trainerId %>" action="bookpayment" method="post" onsubmit="handleConfirm(event, '<%= trainerId %>');">
                <input type="hidden" name="userId" value="<%= loggedInUser1 %>">
                <input type="hidden" name="trainerName" value="<%= userProfile.getTrainerName() %>">
                <input type="hidden" name="title" value="<%= userProfile.getTitle() %>">
                <input type="hidden" name="amount" value="<%= userProfile.getPayment() %>">
                <input type="hidden" name="date" value="<%= userProfile.getDate() %>">
                <input type="hidden" name="trainerId" value="<%= userProfile.getTrainersession() %>">

                <button type="submit" id="confirmBtn_<%= trainerId %>" 
                        <%= confirmedTrainers.contains(trainerId) ? "disabled" : "" %>>
                    <%= confirmedTrainers.contains(trainerId) ? "Confirmed" : "Confirm" %>
                </button>
            </form>

<%
            } // End of if condition
        } // End of for loop
        if (!found) {
            out.println("<p>No bookings found.</p>");
        }
    } else {
        out.println("<p>Please log in to proceed.</p>");
    }
%>

<script>
function handleConfirm(event, trainerId) {
    event.preventDefault(); // Prevent default form submission
    let form = document.getElementById("paymentForm_" + trainerId);
    
    // Submit the form
    form.submit();
    
    // Change button text to "Confirmed" and disable it
    let button = document.getElementById("confirmBtn_" + trainerId);
    button.innerText = "Confirmed";
    button.disabled = true;

    // Store confirmation in localStorage for persistence after refresh
    localStorage.setItem("confirmed_" + trainerId, "true");
}

// Restore button state after refresh
document.addEventListener("DOMContentLoaded", function() {
    <% for (CartPojo userProfile : cList) { 
        if (userProfile.getUsersession().equals(loggedInUser1)) { 
            String trainerId = String.valueOf(userProfile.getTrainerId());
    %>
        let trainerId = "<%= trainerId %>";
        let button = document.getElementById("confirmBtn_" + trainerId);
        if (localStorage.getItem("confirmed_" + trainerId) === "true") {
            button.innerText = "Confirmed";
            button.disabled = true;
        }
    <% } } %>
});
</script>

</body>
</html>
