<%@ page import="training.pack.Tpojo.AddDetailsPojo" %>
<%@ page import="training.pack.Tdao.HomeDao" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">

       
    

    <script>
        // Function to show popup message
        function showPopup(message) {
            alert(message);
        }

        // Function to validate form fields
        function validateForm() {
            // Get form values
            const name = document.forms["addDetailsForm"]["uname"].value;
            const email = document.forms["addDetailsForm"]["uemail"].value;
            const contact = document.forms["addDetailsForm"]["ucontact"].value;
            const type = document.forms["addDetailsForm"]["utype"].value;
            const qualification = document.forms["addDetailsForm"]["uqualification"].value;
            const expertise = document.forms["addDetailsForm"]["uexpertise"].value;
            const specification = document.forms["addDetailsForm"]["uspecification"].value;
            const photo = document.forms["addDetailsForm"]["uphoto"].value;
            const message = document.forms["addDetailsForm"]["umessage"].value;

            // Check if all required fields are filled
            if (name === "" || email === "" || contact === "" || type === "" || qualification === "" || expertise === "" || specification === "" || photo === "" || message === "") {
                showPopup("All fields are required. Please fill out all fields.");
                return false; // Prevent form submission
            }
           
            return true; // Allow form submission
        }
    </script>
</head>

<body>
<div class="container mt-4">
<p>"Embrace the journey to a healthier, stronger you. Fitness isn't just about looking good; it's about feeling unstoppable. Each drop of sweat tells a story of perseverance and dedication. Whether you're lifting weights, running miles, or finding peace on the yoga mat, remember that every small effort builds a bigger picture. At Fitness Freaks, we believe in pushing boundaries and breaking limits. Join us in transforming challenges into achievements and making fitness a lifestyle, not a destination."</p>

    <div class="row mb-4">
        <div class="col-xl-6 mx-auto">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-image me-1"></i>
                    "The body achieves what the mind believes." – Napoleon Hill
                </div>
                <div class="card-body">
                    <img 
                        src="https://www.guardian.in/cdn/shop/articles/What-is-the-importance-of-physical-fitness.jpg?v=1715235454&width=2048" 
                        alt="Importance of Physical Fitness" 
                        style="width: 100%; height: auto;" />
                </div>
            </div>
        </div>
        <div class="col-xl-6 mx-auto">
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-image me-1"></i>
                    "The real workout starts when you want to stop." – Ronnie Coleman
                </div>
                <div class="card-body">
                    <img 
                        src="https://static01.nyt.com/images/2024/02/27/well/23Well-fitness-data/23Well-fitness-data-superJumbo.jpg" 
                        alt="Importance of Physical Fitness" 
                        style="width: 100%; height: auto;" />
                </div>
            </div>
        </div>
    </div>
    
  
  <%  
                        String emailId = (String) session.getAttribute("user"); %>

    <div class="card">
        <div class="card-body">
            <ul class="nav nav-tabs" id="formTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="addDetails-tab" data-bs-toggle="tab" href="#addDetails" role="tab" aria-controls="addDetails" aria-selected="true">Add Details</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="bookSchedule-tab" data-bs-toggle="tab" href="#bookSchedule" role="tab" aria-controls="bookSchedule" aria-selected="false">Book Schedule</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="editDetails-tab" data-bs-toggle="tab" href="#editDetails" role="tab" aria-controls="editDetails" aria-selected="false">Edit Details</a>
                </li>
            </ul>
            <!-- Tab Content -->
            <div class="tab-content mt-3">
                <!-- Add Details Section -->
                <div id="addDetails" class="tab-pane fade show active" role="tabpanel" aria-labelledby="addDetails-tab">
                   
                        <form name="addDetailsForm" action="AddDetailServlet" method="post" onsubmit="return validateForm()">
                        
                            <div class="row mb-3">
                                <input type="hidden" name="userId" value="<%= (emailId != null) ? emailId : "" %>" />
                                <label class="col-sm-2 col-form-label">Name:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter name" name="uname"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Email:</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" placeholder="Enter email" name="uemail" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Contact:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter contact" name="ucontact" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Type:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter type" name="utype" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Qualification:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter qualification" name="uqualification" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Expertise:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter expertise" name="uexpertise" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Specification:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter specification" name="uspecification"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">phone:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter phone" name="uphone" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Address:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter type" name="uaddress" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Joined On:</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" placeholder="Enter type" name="ujoined" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Upload Photo:</label>
                                <div class="col-sm-10">
                                    <input type="file" accept="image/jpeg, image/jpg" class="form-control" name="uphoto"/>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">Message:</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" placeholder="Enter your message" name="umessage"></textarea>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-secondary">Cancel</button>
                        </form>
                 
                </div>

                <!-- Book Schedule Section -->
                <div id="bookSchedule" class="tab-pane fade" role="tabpanel" aria-labelledby="bookSchedule-tab">
                    <h3>Book Schedule</h3>
                    <form action="BookScheduleServlet" method="post">
                        <!-- Date Input -->
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Date:</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" name="udate" required />
                            </div>
                        </div>
                        <!-- From Time Input -->
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">From Time:</label>
                            <div class="col-sm-10">
                                <input type="time" class="form-control" name="ufromTime" required />
                            </div>
                        </div>
                        <!-- To Time Input -->
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">To Time:</label>
                            <div class="col-sm-10">
                                <input type="time" class="form-control" name="utoTime" required />
                            </div>
                        </div>
                        <!-- Amount Input -->
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label">Amount:</label>
                            <div class="col-sm-10">
                                <input type="number" class="form-control" placeholder="Enter amount" name="uamount" required />
                            </div>
                        </div>
                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary">Book</button>
                    </form>
                </div>
			
			<div id="editDetails" class="tab-pane fade" role="tabpanel" aria-labelledby="editDetails-tab">
			    <h3>Edit Details</h3>
			    <form action="EditDetailsServlet" method="get">
			       
			        <!-- You can repeat similar fields for other attributes -->
			        <button type="submit" class="btn btn-primary">View Details</button>
			    </form>
			</div>

            </div>
        
        </div>
    </div>

</div>

<!-- Bootstrap JS, Popper.js, and jQuery -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
