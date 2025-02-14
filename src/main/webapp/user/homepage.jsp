<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="training.pack.Tpojo.VideoPojo" %>
<%@ page import="java.util.Base64" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.1/css/all.min.css" rel="stylesheet" />
    
    <title>Homepage</title>
    <style>
  .container {
    display: flex;
    flex-wrap: wrap;
    gap: 25px;
    justify-content: center;
    margin: 20px auto;
    max-width: 1400px; /* Increased width */
    padding: 20px;
}

.card {
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 12px;
    box-shadow: 0px 5px 12px rgba(0, 0, 0, 0.12);
    overflow: hidden;
    width: 320px; /* Increased size */
    text-align: center;
    cursor: pointer;
}

.card img {
    width: 100%;
    height: 220px; /* Increased image height */
    object-fit: cover;
    border-bottom: 1px solid #ccc;
}

.card-body {
    padding: 18px;
}

.card-title {
    font-size: 1.6em;
    color: #333;
    margin: 12px 0;
}

.card-details {
    font-size: 1em;
    color: #666;
    line-height: 1.6;
    margin: 12px 0;
}

.book-btn {
    display: inline-block;
    margin-top: 12px;
    padding: 12px 22px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 6px;
    transition: background-color 0.3s ease;
    font-size: 1.1em;
}

.book-btn:hover {
    background-color: #0056b3;
}

.no-videos {
    font-size: 1.4em;
    color: #999;
    text-align: center;
    margin-top: 50px;
}

.book-button {
    color: #007bff;
}

/* Ensure 4 cards per row */
@media (min-width: 1300px) {
    .container {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 25px;
        justify-content: center;
    }
}

@media (max-width: 1299px) {
    .container {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media (max-width: 992px) {
    .container {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media (max-width: 600px) {
    .container {
        grid-template-columns: repeat(1, 1fr);
    }
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
.container {
    display: flex;
    justify-content: center; /* Center horizontally */
    align-items: center; /* Center vertically */
   }

.no-videos {
    text-align: center; /* Center text inside the div */
}


    </style>
<script>
    // Function to redirect to the user's detail page when a card is clicked
    function redirectToDetailsPage(videoId) {
        window.location.href = "BookPage.jsp?videoId=" + videoId;
    }

    // Function to handle the 'Book Now' button click and redirect
    document.addEventListener('DOMContentLoaded', function() {
        const bookButtons = document.querySelectorAll(".book-button");

        bookButtons.forEach((button) => {
            button.addEventListener("click", function(event) {
                // Prevent default action of anchor tag
                event.preventDefault();

                // Get the cardId from data attribute
                const cardId = event.target.closest(".card").getAttribute("data-card-id");
                
                if (cardId) {
                    // Construct target URL dynamically
                    const targetUrl = `BookPage.jsp?videoId=${cardId}`;
                    
                    // Redirect to the target URL
                    window.location.href = targetUrl;
                } else {
                    console.error("cardId not found!");
                }
            });
        });
    });
</script>

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
<div class="container">
    <% 
        // Fetch the list of videos from the request
        List<VideoPojo> videos = (List<VideoPojo>) request.getAttribute("videos");

        if (videos != null && !videos.isEmpty()) { 
            for (VideoPojo video : videos) {
                String base64Image = (video.getImage() != null) ? 
                                     Base64.getEncoder().encodeToString(video.getImage()) : null;
    %>
        <div class="card" data-card-id="<%= video.getId() %>" onclick="redirectToDetailsPage(<%= video.getId() %>)">
            <% if (base64Image != null) { %>
                <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Video Thumbnail">
            <% } else { %>
                <span>No Image</span>
            <% } %>

            <div class="card-body">
                <h2 class="card-title"><%= video.getTitle() %></h2>
                <p class="card-details">
                    Trainer: <%= video.getName() != null ? video.getName() : "Not specified" %><br>
                    Specialist: <%= video.getSpecification() != null ? video.getSpecification() : "Not specified" %><br>
                    Message: <%= video.getMessage() != null ? video.getMessage() : "No message available" %>
                </p>
                
                <!-- Book Now button -->
                <p class="book-button">View </p>

              
            </div>
        </div>
    <% 
            }
        } else { 
    %>
       <div class="container">
    <div class="no-videos"> <p style="color: red; text-align: center;">No videos available at the moment.</p></div>
</div>

    <% 
        } 
    %>
</div>
<script type="text/javascript">
function search() {
  let filter = document.getElementById('searchQuery').value.toUpperCase(); // Correct input field id

  // Get all the card elements
  let items = document.querySelectorAll('.card');

  // Loop through all card items and hide those that don't match the filter
  for (var i = 0; i < items.length; i++) {
    let title = items[i].getElementsByTagName('h2')[0]; // Get the h2 element inside each card
    let value = title.innerHTML || title.innerText || title.textContent; // Get the text content of the h2 element

    if (value.toUpperCase().indexOf(filter) > -1) {
      items[i].style.display = ""; // Show the card if it matches the filter
    } else {
      items[i].style.display = "none"; // Hide the card if it doesn't match the filter
    }
  }
}
</script>

<!-- Action buttons -->


<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
