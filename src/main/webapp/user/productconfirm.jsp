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
HomeDao homedao3 = new HomeDao();
List<ProductCart> pdList = homedao3.fetchAllProduct();
List<UserDetails> uList = homedao3.getAllDetails1();
String loggedInUser1 = (String) session.getAttribute("user");

// Find the details of the logged-in user
UserDetails currentUser = null;
for (UserDetails up : uList) {
    if (up.getUserId().equals(loggedInUser1)) { // Assuming 'getUserId()' exists
        currentUser = up;
        break; // Stop looping once the user is found
    }
}

if (currentUser != null) { // Ensure user exists before proceeding
    ProductCart userProduct = null;
    for (ProductCart op : pdList) { 
        if (op.getUserSession().equals(loggedInUser1)) { // Ensure product belongs to user
            userProduct = op;
            break; // Stop looping once the product is found
        }
    }

    if (userProduct != null) { // Ensure product exists before proceeding
%>
<form id="paymentForm_<%= userProduct.getId() %>" action="productpayment" method="post" onsubmit="confirmButtonClick(this);">
    <input type="hidden" name="userId" value="<%= loggedInUser1 %>">
    <input type="hidden" name="productName" value="<%= userProduct.getName() %>">
    <input type="hidden" name="shopName" value="<%= userProduct.getShop() %>">
    <input type="hidden" name="amount" value="<%= userProduct.getPrice() %>">
    <input type="hidden" name="quantity" value="<%= userProduct.getQuantity() %>">
	<input type="hidden" name="trainerid" value="<%= userProduct.getUserSession() %>">
    <input type="hidden" name="userEmail" value="<%= currentUser.getEmail() %>">
    <input type="hidden" name="userAddress" value="<%= currentUser.getLocation() %>">

    <button type="submit" id="confirmBtn_<%= userProduct.getId() %>">Confirm</button>
</form>

<script>
function confirmButtonClick(form) {
    const button = form.querySelector("button[type='submit']");
    const userId = form.querySelector("input[name='userId']").value;
    const productId = form.querySelector("input[name='productName']").value; 

    // Unique localStorage key
    const storageKey = `bookingStatus_${userId}_product_${productId}`;

    // Store booking status
    localStorage.setItem(storageKey, "Confirmed");

    // Update button state
    button.textContent = "Confirmed";
    button.disabled = true;
}

function checkBookingStatus() {
    const userId = "<%= loggedInUser1 %>";

    document.querySelectorAll("form[id^='paymentForm_']").forEach(form => {
        const productId = form.querySelector("input[name='productName']").value;
        const storageKey = `bookingStatus_${userId}_product_${productId}`;
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
    <p style="color: red; text-align: center;">No user details found.</p>
<%
}
%>

</body>
</html>