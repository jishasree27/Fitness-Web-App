<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="training.pack.Tpojo.ProductPojo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
 <style>

    body {
     font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }

    /* Container styling */
    .container {
        width: 80%;
        margin: auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        position: relative;
        left: 100px; /* Adjust to move container left */
        top: -600px;  /* Adjust to move container upwards */
    }

    /* Header styling */
    h2 {
        text-align: center;
        color: #343a40;
        margin-bottom: 20px;
    }

    /* Table styling */
    table {
        width: 100%; /* Full width */
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table th, table td {
        text-align: left;
        padding: 12px;
        border: 1px solid #ddd;
        font-size: 14px;
    }

    table th {
        background-color: #343a40;
        color: #ffffff;
        font-size: 16px;
    }

    table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    table tr:hover {
        background-color: #f1f1f1;
    }

    /* Image styling */
    img {
        max-width: 70px; /* Compact image size */
        max-height: 70px;
        border-radius: 5px;
        object-fit: cover;
    }

    /* Buttons styling */
    button {
        padding: 5px 10px;
        font-size: 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn-primary {
        background-color: #007bff;
        color: #ffffff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-danger {
        background-color: #dc3545;
        color: #ffffff;
    }

    .btn-danger:hover {
        background-color: #c82333;
    }

    /* Text alignment */
    .text-center {
        text-align: center;
        font-size: 16px;
        color: #555555;
    }

    /* Responsive design */
    @media (max-width: 768px) {
        .container {
            width: 100%;
            left: 0;
            top: 0;
            padding: 10px;
        }

        table {
            font-size: 12px;
        }

        img {
            max-width: 50px;
            max-height: 50px;
        }

        button {
            padding: 4px 8px;
            font-size: 10px;
        }
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
        List<ProductPojo> hList = uDao.getAllProduct();

        if (loggedInUser == null) { 
    %>
        <div class="text-center mt-4">
             <p style="color: red; text-align: center;">Please log in to view and upload videos.</p>
        </div>
    <% 
        } else if (hList != null && !hList.isEmpty()) { 
    %>             
        <h2 class="text-center">Uploaded Products</h2>
        <table class="table table-bordered table-hover">
            <thead class="table-dark">
                <tr>
                    <th scope="col">Image 1</th>
                    <th scope="col">Image 2</th>
                    <th scope="col">Image 3</th>
                    <th scope="col">Image 4</th>
                    <th scope="col">Trainer Name</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Description</th>
                    <th scope="col">Product Use</th>
                    <th scope="col">Product Price</th>
                    <th scope="col">Product Discount</th>
                    <th scope="col">Shop Name</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (ProductPojo product : hList) {
                        if (product.getUserId() != null && product.getUserId().equals(loggedInUser)) {
                            String base64Image1 = (product.getImage1() != null) 
                                ? Base64.getEncoder().encodeToString(product.getImage1()) 
                                : null;
                            String base64Image2 = (product.getImage2() != null) 
                                ? Base64.getEncoder().encodeToString(product.getImage2()) 
                                : null;
                            String base64Image3 = (product.getImage3() != null) 
                                ? Base64.getEncoder().encodeToString(product.getImage3()) 
                                : null;
                            String base64Image4 = (product.getImage4() != null) 
                                ? Base64.getEncoder().encodeToString(product.getImage4()) 
                                : null;
                %>
                <tr>
                    <td>
                        <% if (base64Image1 != null) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image1 %>" alt="Product Image 1" style="width:100px;height:100px;">
                        <% } else { %>
                            <span>No Image</span>
                        <% } %>
                    </td>
                    <td>
                        <% if (base64Image2 != null) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image2 %>" alt="Product Image 2" style="width:100px;height:100px;">
                        <% } else { %>
                            <span>No Image</span>
                        <% } %>
                    </td>
                    <td>
                        <% if (base64Image3 != null) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image3 %>" alt="Product Image 3" style="width:100px;height:100px;">
                        <% } else { %>
                            <span>No Image</span>
                        <% } %>
                    </td>
                    <td>
                        <% if (base64Image4 != null) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image4 %>" alt="Product Image 4" style="width:100px;height:100px;">
                        <% } else { %>
                            <span>No Image</span>
                        <% } %>
                    </td>
                    <td><%= product.getTrainerName() %></td>
                    <td><%= product.getProductName() %></td>
                    <td><%= product.getProductDescription() %></td>
                    <td><%= product.getProductUse() %></td>
                    <td><%= product.getProductPrice() %></td>
                    <td><%= product.getProductDiscount() %></td>
                    <td><%= product.getShopName() %></td>
                    <td>
                        <form action="updatePdt" method="get" style="display:inline;">
                            <input type="hidden" name="id" value="<%= product.getId() %>">
                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                        </form>
                        <form action="deletePdt" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= product.getId() %>">
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
        <div class="text-center mt-4">
           <p style="color: red; text-align: center;">No products found for your account.</p>
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
