<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.razorpay.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="User.pack.Pojo.*, training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    // Fetch all cart offers
    HomeDao homedao3 = new HomeDao();
    List<OfferCart> pdList = homedao3.fetchAllCartOffers();

    // Get logged-in user session
    String loggedInUser1 = (String) session.getAttribute("user");

    if (loggedInUser1 != null) { // Ensure user is logged in
        OfferCart offerProduct = null;
        for (OfferCart op : pdList) { 
            if (op.getUserSession().equals(loggedInUser1)) { // Match user session
            	offerProduct = op;
                break; // Stop once found
            }
        }

        if (offerProduct != null) { // Ensure product exists before proceeding
%>

<form id="paymentForm_<%= offerProduct.getId() %>" action="offerpayment" method="post" onsubmit="confirmButtonClick(this);">
    <input type="hidden" name="userId" value="<%= loggedInUser1 %>">
    <input type="hidden" name="TrainerName" value="<%= offerProduct.getName() %>">
    <input type="hidden" name="title" value="<%= offerProduct.getTitle() %>">
    <input type="hidden" name="amount" value="<%= offerProduct.getPaymentDetails() %>">
    <input type="hidden" name="offerSpecification" value="<%= offerProduct.getOfferSpecification() %>">
    <input type="hidden" name="trainerId" value="<%= offerProduct.getTrainerSession() %>">

    <button type="submit" id="confirmBtn2_<%= offerProduct.getId() %>">Confirm</button>
</form>

<script>
function confirmButtonClick(form) {
    const button = form.querySelector("button[type='submit']");
    const userId = form.querySelector("input[name='userId']").value;
    const trainerId = form.querySelector("input[name='trainerId']").value; // Unique identifier

    // Unique localStorage key
    const storageKey = `bookingStatus_${userId}_offer_${trainerId}`;

    // Store booking status
    localStorage.setItem(storageKey, "Confirmed");

    // Update button state
    button.textContent = "Confirmed";
    button.disabled = true;
}

function checkBookingStatus() {
    const userId = "<%= loggedInUser1 %>";

    document.querySelectorAll("form[id^='paymentForm_']").forEach(form => {
        const trainerId = form.querySelector("input[name='trainerId']").value;
        const storageKey = `bookingStatus_${userId}_offer_${trainerId}`;
        const confirmBtn = form.querySelector("button[type='submit']");

        if (localStorage.getItem(storageKey) === "Confirmed" && confirmBtn) {
            confirmBtn.textContent = "Confirmed";
            confirmBtn.disabled = true;
        }
    });
}

document.addEventListener("DOMContentLoaded", checkBookingStatus);
</script>


<%
        } else {
%>
     <p style="color: red; text-align: center;">No product details found for this user.</p>
<%
        }
    } else {
%>
    <p style="color: red; text-align: center;">No user details found. Please log in.</p>
<%
    }
%>


</body>
</html>