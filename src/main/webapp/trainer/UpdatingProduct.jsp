<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.ProductPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
  <style>
    body {
         font-family: 'Poppins', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 800px;
        margin: 30px auto;
        padding: 20px;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        position: relative;
        left: 110px; /* Adjust to move container left */
        top: -600px;
    }

    .container h2 {
        text-align: center;
        margin-bottom: 20px;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        font-weight: bold;
        color: #333;
        display: block;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
        color: rgb(85, 0, 203); /* Change the text color inside input fields */
    }

    .form-control:focus {
        border-color: #007bff;
        outline: none;
    }

    .btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .alert {
        background-color: #f8d7da;
        color: #721c24;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #f5c6cb;
        border-radius: 5px;
        text-align: center;
    }

    .form-group label {
        color: rgb(85, 0, 203) !important; /* Ensure this takes priority */
        font-weight: bold;
        display: block;
    }
      input[type="submit"] {
            background-color:  rgb(85, 0, 203); /* Very dark green */
            color: white;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 5px;
            width: auto;
        }
        

        input[type="submit"]:hover {
            background-color: grey; /* Darker shade */
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
    // Fetch the object from the request attribute
    ProductPojo uservp = (ProductPojo) request.getAttribute("uservp");
    System.out.println("Debug - uservp: " + uservp); // Debugging

    if (uservp == null) {
%>
    <div class="alert alert-danger" role="alert">
         <p style="color: red; text-align: center;">No product details found to update. Please try again later.</p>
    </div>
<%
    } else {
%>
    <form action="pdtUpdate" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="<%= uservp.getId() %>" />
        <input type="hidden" name="userId" value="<%= session.getAttribute("user") %>" />

        <div class="form-group">
            <label for="productName">Product Name:</label>
            <input type="text" id="productName" name="productName" class="form-control" 
                   value="<%= uservp.getProductName() != null ? uservp.getProductName() : "" %>" />
        </div>

        <div class="form-group">
            <label for="productDescription">Product Description:</label>
            <textarea id="productDescription" name="productDescription" class="form-control">
                <%= uservp.getProductDescription() != null ? uservp.getProductDescription() : "" %>
            </textarea>
        </div>

        <div class="form-group">
            <label for="image1">Image 1:</label>
            <input type="file" id="image1" name="image1" class="form-control" />
        </div>

        <div class="form-group">
            <label for="image2">Image 2:</label>
            <input type="file" id="image2" name="image2" class="form-control" />
        </div>

        <div class="form-group">
            <label for="image3">Image 3:</label>
            <input type="file" id="image3" name="image3" class="form-control" />
        </div>

        <div class="form-group">
            <label for="image4">Image 4:</label>
            <input type="file" id="image4" name="image4" class="form-control" />
        </div>

        <div class="form-group">
            <label for="productUse">Product Use:</label>
            <input type="text" id="productUse" name="productUse" class="form-control" 
                   value="<%= uservp.getProductUse() != null ? uservp.getProductUse() : "" %>" />
        </div>

        <div class="form-group">
            <label for="productPrice">Product Price:</label>
            <input type="number" id="productPrice" name="productPrice" class="form-control" 
                   value="<%= uservp.getProductPrice() != 0 ? uservp.getProductPrice() : "" %>" step="0.01" />
        </div>

        <div class="form-group">
            <label for="productDiscount">Product Discount:</label>
            <input type="number" id="productDiscount" name="productDiscount" class="form-control" 
                   value="<%= uservp.getProductDiscount() %>" min="0" max="100" />
        </div>

        <div class="form-group">
            <label for="trainerName">Trainer Name:</label>
            <input type="text" id="trainerName" name="trainerName" class="form-control" 
                   value="<%= uservp.getTrainerName() != null ? uservp.getTrainerName() : "" %>" />
        </div>

        <div class="form-group">
            <label for="shopName">Shop Name:</label>
            <input type="text" id="shopName" name="shopName" class="form-control" 
                   value="<%= uservp.getShopName() != null ? uservp.getShopName() : "" %>" />
        </div>

        <input type="submit" value="Update Product">
    </form>
<%
    }
%>
</div>

<footer> 
    <jsp:include page="footer.jsp" />
</footer>
      
</body>
</html>