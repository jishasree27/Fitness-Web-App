<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Page</title>
<style>
/* Style for the search bar */
.search-bar {
    display: flex;
    align-items: center;
    position: relative;
    width: 300px; /* Adjust width as needed */
    margin: 20px auto;
}

.search-bar input[type="text"] {
    width: 100%;
    padding: 10px;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
}

.search-bar .search-icon {
    position: absolute;
    right: 10px;
    font-size: 20px;
    color: #888;
}

/* Style for the search results dropdown */
.search-results {
    position: absolute;
    top: 40px; /* Adjust top as needed to align with the input */
    width: 100%;
    border: 1px solid #ccc;
    border-radius: 4px;
    background: #fff;
    max-height: 200px; /* Adjust max-height as needed */
    overflow-y: auto;
    z-index: 1000;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.search-results .result-item {
    padding: 10px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
}

.search-results .result-item:hover {
    background-color: #f0f0f0;
}
</style>
</head>
<body>
<div class="search-bar">
 
  <input type ="text" name="" id="find" placeholder="search here....." onkeyup="search()">
  
</div>


<script type="text/javascript">
function search() {
 
  let filter = document.getElementById('find').value.toUpperCase(); // Convert to uppercase for case-insensitive matching

  // Get the container of the search results (assuming you have a list of results)
  let item = document.querySelectorAll('.product');
  
  // Get all the result items
  let l = document.getElementByTagName('h3')[0];

  // Loop through all result items and hide those that don't match the filter
  for (var i = 0; i <= l.length; i++) {
    let a = items[i].getElementByTagName('h3');
    let value = a.innerHTML || a.innerText || a.textcontent; // Get the text content of the result item
    
    if (value.toUpperCase().indexOf(filter) > -1) {
      item[i].style.display = ""; // Show the result if it matches the filter
    } else {
      item[i].style.display = "none"; // Hide the result if it doesn't match the filter
    }
  }
}
</script>

</body>
</html>
