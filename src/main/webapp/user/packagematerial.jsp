<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Materials for Sale</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
             background-color: #F0FFF0; /* Honeydew */
            color: black;
            padding: 10px 20px;
            text-align: center;
        }

        .content {
	         padding: 20px;
		     margin-bottom: 5em; /* Adds 5 lines worth of space (approximately) */
	    
        }

        .material-section {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .material-section h3 {
            margin-top: 0;
        }

        .material-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .material-table th, .material-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .material-table th {
            background-color: #301934; /* Deep violet */
            color: white;
        }

        .material-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .material-table tr:hover {
            background-color: #f1f1f1;
        }

        .buy-button {
            background-color: #301934; /* Deep violet */
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
        }

    
    </style>
</head>
<body>
<div>
    
    <jsp:include page="userNavSide.jsp" />
  </div>
  <div class="content">
    <header>
        <h1>Fitness Materials for Sale</h1>
    </header>

    <div class="content">
        <div class="material-section">
            <h3>Available Materials</h3>
            <p>Here are the fitness materials offered by our trainers to enhance your fitness journey. You can purchase these materials to help achieve your goals:</p>
            
            <table class="material-table">
                <thead>
                    <tr>
                        <th>Material Name</th>
                        <th>Trainer</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Purchase</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="material" items="${fitnessMaterials}">
                        <tr>
                            <td>${material.materialName}</td>
                            <td>${material.trainerName}</td>
                            <td>${material.description}</td>
                            <td>${material.price}</td>
                            <td>
                                <a href="purchaseMaterial.jsp?materialId=${material.id}" class="buy-button">Buy Now</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
    <footer>
      <jsp:include page="footer.jsp" />
    </footer>

</body>
</html>
