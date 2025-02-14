<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="training.pack.Tpojo.VideoPojo" %>
<%@ page import="java.util.Base64" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.1/css/all.min.css" rel="stylesheet" />
    
    <title>Special Offers for Booking Trainers</title>
    <style>
        body {
            font-family: poppins, sans-serif;
            margin: 0;
            padding: 0;
            background-color: white;
        }

  
        .offer-section {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        .offer-section h3 {
            margin-top: 0;
        }

        .offer-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .offer-table th, .offer-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        .offer-table th {
            background-color: #301934; /* Deep violet */
            color: white;
        }

        .offer-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .offer-table tr:hover {
            background-color: #f1f1f1;
        }

        .offer-button {
            background-color: #301934; /* Deep violet */
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
        }

        .content {
        margin-bottom: 5em; /* Adds 5 lines worth of space (approximately) */
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
    
    
    footer {
        margin-top: 20em;
        padding: 15px;
        position: relative;
    }
    </style>
</head>
<body>
<div>
    
    <jsp:include page="userNavSide.jsp" />
  </div>
  
  <div class="search-bar">
  <input type="text" name="searchQuery" id="searchQuery" placeholder="Search..." autocomplete="off" onkeyup="search()" />
  <span class="search-icon">&#x1F50D;</span>
  <div class="search-results" id="searchResults" style="display: none;"></div>
</div>
    <center>
        <h1>Special Offers for Booking Trainers</h1>
    </center>


      <div class="offer-section">
            <h3>Available Offers</h3>
            <p>Here are the latest offers available when booking your trainer sessions:</p>
            
      <% 
        // Fetch the list of videos from the request
          HomeDao homedao = new HomeDao();
            List<VideoPojo> videoList = homedao.getAllVideos();
            String videoId = request.getParameter("videoId");
            
            String loggedInUser = (String) session.getAttribute("user"); 
       
        if (videoList  != null && !videoList .isEmpty()) { 
            
    %>
      
           <table class="offer-table">
    <thead>
        <tr>
            <th>Profile</th>
            <th>Title</th>
            <th>Trainer Name</th>
            <th>Offer Name</th>
            <th>Description</th>
            <th>Amount</th>
            <th>Discount</th>
            <th>Validity</th>
            <th>Apply Now</th>
        </tr>
    </thead>
   <tbody>
    <% for (VideoPojo video : videoList) {
        String base64Image = (video.getImage() != null)
                ? Base64.getEncoder().encodeToString(video.getImage())
                : null; %>
   <tr>
   
        <td>
            <img src="data:image/png;base64,<%= base64Image %>" alt="Profile" width="50">
           
        </td>
        <td>
            <%= video.getTitle() %>
          
        </td>
        <td>
            <%= video.getName() %>
         
        </td>
        <td>
            <%= video.getOfferName() %>
            
        </td>
        <td>
            <%= video.getSpecification() %>
            
        </td>
        <td class="amount">
            <%= video.getPaymentDetails() %>
           
        </td>
        <td class="discount">
            <%= video.getOffer() %>
           
        </td>
        <td>
            <%= video.getOfferValid() %>
           
        </td>
        <td>
             <button class="book-btn" type="button" id="bookButton" 
                data-original-amount="<%= video.getPaymentDetails() %>" 
                data-discount-percent="<%= video.getOffer() %>" 
                onclick="applyOffer(this)">
                Apply
            </button>
            <br><br>
       <form id="cartForm_<%= video.getUserId() %>" action="offercart" method="post" enctype="multipart/form-data" onsubmit="updateButtonText(event, '<%= video.getUserId() %>')">
    <input type="hidden" name="trainerId" value="<%= videoId %>" required>
    <input type="hidden" name="offerValid" value="<%= video.getOfferValid() %>" required>
    <input type="hidden" name="offer" value="<%= video.getOffer() %>" required>
    <input type="hidden" name="Payment" value="<%= video.getPaymentDetails() %>" required>
    <input type="hidden" name="offerSpecification" value="<%= video.getSpecification() %>" required>
    <input type="hidden" name="offerName" value="<%= video.getOfferName() %>" required>
    <input type="hidden" name="name" value="<%= video.getName() %>" required>
    <input type="hidden" name="title" value="<%= video.getTitle() %>" required>
    <input type="hidden" name="image" value="<%= base64Image %>" required>
    <input type="hidden" name="trainersession" value="<%= video.getUserId() %>" required>
    <input type="hidden" name="usersession" value="<%= loggedInUser %>" required>

    <button type="submit" id="addToCartButton_<%= video.getUserId() %>">Add to Cart</button>
</form>

<script>
    function updateButtonText(event, userId) {
        // Prevent default form submission
        event.preventDefault();

        // Change the button text
        var button = document.getElementById("addToCartButton_" + userId);
        button.innerHTML = "Added to Cart";
        button.disabled = true; // Optionally disable the button after adding to cart

        // Submit the specific form programmatically
        var form = document.getElementById("cartForm_" + userId);
        form.submit();
    }
</script>


        </td>
    
</tr>

    <% } %>
</tbody>

</table>
  <script>
  function parseAmount(amount) {
	    // Handle the amount, ensuring only numeric characters are kept
	    return parseFloat(amount.replace(/[^0-9.-]+/g, ''));
	}

	function parseDiscount(discount) {
	    // Extract the numeric part from a string like '10% -offer'
	    const numericDiscount = discount.replace(/[^0-9.-]+/g, '');
	    return parseFloat(numericDiscount); // Return the numeric value
	}

	function applyOffer(button) {
	    // Get the original amount and discount percent from the data attributes
	    let originalAmount = button.getAttribute("data-original-amount");
	    let discountPercent = button.getAttribute("data-discount-percent");

	    // Parse values to numbers
	    originalAmount = parseAmount(originalAmount);
	    discountPercent = parseDiscount(discountPercent);

	    // Log values for debugging
	    console.log('Original Amount:', originalAmount);
	    console.log('Discount Percent:', discountPercent);

	    // Check if both values are valid
	    if (isNaN(originalAmount) || isNaN(discountPercent)) {
	        alert("Invalid amount or discount percent!");
	        return;
	    }

	    // Check if the button is already applied
	    if (button.textContent === "Applied") {
	        alert("Offer already applied!");
	        return;
	    }

	    // Change button text to 'Applied'
	    button.textContent = "Applied";
	    button.disabled = true; // Disable button after applying

	    // Calculate the reduced amount
	    const reducedAmount = originalAmount - (originalAmount * discountPercent / 100);
	    console.log('Reduced Amount:', reducedAmount); // Log the reduced amount

	    // Find the parent row and update the Amount column
	    const row = button.closest("tr");

	    if (!row) {
	        console.error("Row not found!");
	        return;
	    }

	    const amountCell = row.querySelector(".amount");

	    if (amountCell) {
	        amountCell.textContent = reducedAmount.toFixed(2); // Update the amount cell with the reduced amount
	    } else {
	        console.error("Amount cell not found!");
	    }
	}

	  
</script>

        </div>
    </div>
   <% 
            
        }
        else { 
    %>
        <div class="no-videos"> <p style="color: red; text-align: center;">No videos available at the moment.</p></div>
    <% 
        } 
    %>
 <script type="text/javascript">
 function search() {
	    let filter = document.getElementById('searchQuery').value.toUpperCase(); // Correct input field id

	    // Get all the row elements
	    let rows = document.querySelectorAll('.offer-table tbody tr');

	    // Loop through all rows and hide those that don't match the filter
	    for (let i = 0; i < rows.length; i++) {
	        let titleCell = rows[i].querySelector('td:nth-child(2)'); // Title column (2nd column)
	        let trainerNameCell = rows[i].querySelector('td:nth-child(3)'); // Trainer name column (3rd column)

	        let title = titleCell ? titleCell.innerText || titleCell.textContent : ''; // Get the text content of the title
	        let trainerName = trainerNameCell ? trainerNameCell.innerText || trainerNameCell.textContent : ''; // Get the text content of the trainer name

	        // Check if the title or trainer name matches the filter
	        if (title.toUpperCase().indexOf(filter) > -1 || trainerName.toUpperCase().indexOf(filter) > -1) {
	            rows[i].style.display = ""; // Show the row if it matches the filter
	        } else {
	            rows[i].style.display = "none"; // Hide the row if it doesn't match the filter
	        }
	    }
	}

    </script>
    
  
    
    <footer>
       <jsp:include page="footer.jsp" />
    </footer>

</body>
</html>
