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
   
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }
        .product-card {
            width: 350px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        .carousel-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .product-info {
            padding: 15px;
        }
        .btn-add-to-cart {
            background-color: #ff5722;
            border: none;
            padding: 10px 20px;
            color: white;
            font-size: 1rem;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-add-to-cart:hover {
            background-color: #e64a19;
        }
          .search-bar {
        position: relative;
        width: 100%;
        max-width: 400px; /* Adjust as needed */
        margin: 0 auto;
    }

    .search-bar input {
        width: 100%;
        padding: 10px 15px;
        border: 2px solid #E5F4F6;
        border-radius: 20px;
        font-size: 16px;
        outline: none;
        transition: 0.3s ease-in-out;
    }

    .search-bar input:focus {
        border-color: #B2E4E6; /* Slightly darker shade for focus */
        box-shadow: 0 0 5px rgba(179, 228, 230, 0.5);
    }

    .search-icon { 
        position: absolute;
        right: 15px;
        top: 50%;
        transform: translateY(-50%);
        cursor: pointer;
    }

    .search-results {
        width: 100%;
        background: white;
        border: 2px solid #E5F4F6;
        border-radius: 10px;
        position: absolute;
        top: 100%;
        left: 0;
        z-index: 10;
        display: none;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    }
    .btn-warning {
    background-color: #f0ad4e; /* Bootstrap warning color */
    margin-top:10px;
    border: none;
    padding: 10px 15px;
    font-size: 1rem;
    color: white;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out, transform 0.2s ease-in-out;
}

.btn-warning:hover {
    background-color: #ec971f; /* Darker shade on hover */
    transform: scale(1.05); /* Slight zoom effect */
}

.btn-warning:active {
    background-color: #d58512; /* Even darker shade on click */
    transform: scale(0.98); /* Click animation effect */
}
    
    
          footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }
    .container h2 {
    color:green;
    font-size: 28px;
    text-align: center;
    margin-bottom: 10px;
}

.p p {
    color: red;  /* Changed from black to red */
    font-size: 18px;
    text-align: center;
    font-weight: bold;
}

    </style>
</head>
<body>

 <div>
        <jsp:include page="userNavSide.jsp" />
    </div>

<div class="search-bar">
    <input type="text" id="searchQuery" placeholder="Search..." autocomplete="off" onkeyup="search()" />
    <span class="search-icon">&#x1F50D;</span>
</div>

<div class="container">
    <% 
        String loggedInUser = (String) session.getAttribute("user");
        HomeDao uDao = new HomeDao();
        List<ProductPojo> hList = uDao.getAllProduct();

        if (loggedInUser == null) { 
    %>
        <div class="text-center mt-4">
           <p style="color: red; text-align: center;">Please log in to view and upload products.</p>
        </div>
    <% 
        } else if (hList != null && !hList.isEmpty()) { 
    %>       
    <center>      
       <h2>Products to Buy!</h2>
<p class="p">Enjoy shopping</p>
<p style="color: green;">Find the best deals on top-quality products. Shop now and grab exciting offers!</p>

        </center>
        <div class="card-container">
            <% 
                for (ProductPojo product : hList) {
                    String base64Image1 = (product.getImage1() != null) ? Base64.getEncoder().encodeToString(product.getImage1()) : null;
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
                    </div>
                </div>
                <h4>Shop: <%= product.getShopName() %></h4>
                <div class="product-info">
                    <h5><%= product.getProductName() %></h5>
                    <p><strong>Description:</strong> <%= product.getProductDescription() %></p>
                    <p><strong>Price:</strong> <%= product.getProductPrice() %></p>
                     
                    <div class="btn-group">
                      
                        <form action="cartProduct" method="post" onsubmit="changeButtonLabel(event, '<%= product.getId() %>', '<%= loggedInUser %>')" enctype="multipart/form-data">
                            <input type="hidden" name="share" value="cart">
                            <input type="number" name="quantity" class="quantity-input" id="quantity_<%= product.getId() %>" value="1" min="1" max="10">
                            <input type="hidden" name="id" value="<%= product.getId() %>">
                            <input type="hidden" name="image" value="<%= base64Image1 %>">   
                            <input type="hidden" name="name" value="<%= product.getProductName() %>">
                            <input type="hidden" name="shop" value="<%= product.getShopName() %>">
                            <input type="hidden" name="price" value="<%= product.getProductPrice() %>">
                            <input type="hidden" name="usersession" value="<%= loggedInUser %>">
                            <button class="btn btn-danger btn-add-to-cart" type="submit" id="btn-add-to-cart_<%= product.getId() %>">
                                <i class="fas fa-shopping-cart"></i> Add to Cart
                            </button>
                        </form>
                          <button class="btn btn-warning" onclick="location.href='cart.jsp'">
					        Buy After Adding to Cart
					    </button>
                    </div>
                </div>
            </div>
            <% } %>
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

<script>
    function search() {
        let filter = document.getElementById('searchQuery').value.toUpperCase();
        let items = document.querySelectorAll('.product-card');

        for (let i = 0; i < items.length; i++) {
            let title = items[i].getElementsByClassName('product-info')[0].getElementsByTagName('h5')[0];
            let value = title.innerHTML || title.innerText || title.textContent;

            if (value.toUpperCase().indexOf(filter) > -1) {
                items[i].style.display = "";
            } else {
                items[i].style.display = "none";
            }
        }
    }

    function changeButtonLabel(event, productId, userId) {
        event.preventDefault();
        const button = document.getElementById('btn-add-to-cart_' + productId);
        button.innerHTML = '<i class="fas fa-check"></i> Added to Cart';
        button.disabled = true;
        setTimeout(() => {
            event.target.closest('form').submit();
        }, 100);
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


 <footer>
       <jsp:include page="footer.jsp" />
    </footer>

</body>
</html>
