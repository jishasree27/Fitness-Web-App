<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.ProductPojo" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       .container-product {
    max-width: 70%;
    margin: auto;
    padding: 20px;
    background-color: #E8F5E9;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    margin-left:350px;
}

.card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    justify-content: center;
}

.product-card {
    width: 250px; /* Reduced card size */
    background: #ffffff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}

.product-card:hover {
    transform: scale(1.05);
}

.carousel img {
    width: 100%;
    height: 180px; /* Adjusted image size */
    object-fit: cover;
    border-radius: 8px 8px 0 0;
}

.product-info {
    padding: 10px;
    text-align: center;
}

.product-info h5 {
    color: #007bff;
    font-size: 16px;
    margin-bottom: 5px;
}

.product-info p {
    font-size: 14px;
    color: #555;
}

.btn-group {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-top: 10px;
}

.btn-group button {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 6px 10px;
    font-size: 14px;
    border-radius: 5px;
    cursor: pointer;
    transition: background 0.3s;
}

.btn-group button:hover {
    background-color: #0056b3;
}
 
    </style>
</head>
<body>


<div class="container-product">
    <% 
        String loggedInUser = (String) session.getAttribute("user");
        HomeDao uDao = new HomeDao();
        List<ProductPojo> hList = uDao.getAllProduct();

       
        if (hList != null && !hList.isEmpty()) { 
    %>             
      
        <div class="card-container">
            <% 
                for (ProductPojo product : hList) {
                    String base64Image1 = (product.getImage1() != null) ? Base64.getEncoder().encodeToString(product.getImage1()) : null;
                    String base64Image2 = (product.getImage2() != null) ? Base64.getEncoder().encodeToString(product.getImage2()) : null;
                    String base64Image3 = (product.getImage3() != null) ? Base64.getEncoder().encodeToString(product.getImage3()) : null;
                    String base64Image4 = (product.getImage4() != null) ? Base64.getEncoder().encodeToString(product.getImage4()) : null;
            %>
            <div class="product-card">
                <div id="carousel<%= product.getId() %>" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <% if (base64Image1 != null) { %>
                            <div class="carousel-item active">
                                <img src="data:image/jpeg;base64,<%= base64Image1 %>" alt="Product Image 1">
                            </div>
                        <% } else { %>
                            <div class="carousel-item active">
                                <span>No Image</span>
                            </div>
                        <% } %>
                        <% if (base64Image2 != null) { %>
                            <div class="carousel-item">
                                <img src="data:image/jpeg;base64,<%= base64Image2 %>" alt="Product Image 2">
                            </div>
                        <% } %>
                        <% if (base64Image3 != null) { %>
                            <div class="carousel-item">
                                <img src="data:image/jpeg;base64,<%= base64Image3 %>" alt="Product Image 3">
                            </div>
                        <% } %>
                        <% if (base64Image4 != null) { %>
                            <div class="carousel-item">
                                <img src="data:image/jpeg;base64,<%= base64Image4 %>" alt="Product Image 4">
                            </div>
                        <% } %>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel<%= product.getId() %>" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carousel<%= product.getId() %>" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
                <h4>Shop: <%= product.getShopName() %></h4>
                <div class="product-info">
                    <h5><%= product.getProductName() %></h5>
                    
                    <p><strong>Price:</strong> <%= product.getProductPrice() %></p>
                    <p><strong>Discount:</strong> <%= product.getProductDiscount() %></p>
                    <div class="btn-group">
                         <jsp:include page="pay.jsp" />
                    </div>
                </div>
            </div>
            <% 
                } 
            %>
        </div>
    <%  
        } else { 
    %> 
        <div class="text-center mt-4">
            <p style="color: red; text-align: center;">No products found for your account.</p>
        </div>
    <% 
        } 
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
