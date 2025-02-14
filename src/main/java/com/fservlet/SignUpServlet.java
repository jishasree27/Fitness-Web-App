package com.fservlet;

import javax.imageio.ImageIO;



import javax.servlet.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.Part;
import javax.transaction.SystemException;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.mindrot.jbcrypt.BCrypt;

import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.fdao.Fdao;
import com.fpojo.ContactUsPojo;
import com.fpojo.Fpojo;
import com.fsession.SessionProvider;

import User.pack.Pojo.BookPayment;
import  User.pack.Pojo.Bookings;
import User.pack.Pojo.CartPojo;
import User.pack.Pojo.OfferCart;
import User.pack.Pojo.OfferPayment;
import User.pack.Pojo.ProductCart;
import User.pack.Pojo.ProductPayment;
import User.pack.Pojo.SaveProfilePojo;
import User.pack.Pojo.UserDetails;
import User.pack.Pojo.ContactUser;
import User.pack.Udao;
import training.pack.Tdao.*;
import training.pack.Tpojo.AddDetailsPojo;
import training.pack.Tpojo.BookschedulePojo;
import training.pack.Tpojo.ContactPojo;
import training.pack.Tpojo.FitnessForm;
import training.pack.Tpojo.FreeClassPojo;
import training.pack.Tpojo.HealthPojo;
import training.pack.Tpojo.NewUpdatePojo;
import training.pack.Tpojo.ProductPojo;
import training.pack.Tpojo.VideoPojo;
import training.pack.Tpojo.ViewProfilePojo;
import training.pack.Tpojo.razorpaypojo;
import utils.FileUploadUtil;

import java.io.IOException;
import java.nio.file.*;
import javax.servlet.http.Part;
import com.google.gson.Gson;

import Admin.pack.AdminDetails;
import Admin.pack.AdminPojo;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;


/**
 * Servlet implementation class SignUpServlet
 */
@MultipartConfig
@WebServlet("/")
public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Default constructor
     */
    public SignUpServlet() {
        super();
    }

    /**
     * Handles POST requests (registration and login)
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("inside post");
        String mypath = request.getServletPath();
        Fdao dao = new Fdao();
        if (mypath.equals("/register")) {
            String registrationEmail = request.getParameter("uemail");
            String registrationPassword = request.getParameter("upassword");
            String userType = request.getParameter("uuserType");
            String termsAccepted = request.getParameter("utermsAccepted");

            if (registrationEmail == null || registrationEmail.isEmpty() || registrationPassword == null || registrationPassword.isEmpty()) {
                System.out.println("Email or password cannot be empty.");
                response.sendRedirect("register.jsp?error=Please fill in all required fields.");
            }

            try {
                Fpojo existingUser = dao.getUser(registrationEmail, userType);
                if (existingUser != null) {
                    System.out.println("Email already exists: " + registrationEmail);
                    response.sendRedirect("error.jsp?error=Email already exists.");
                    return;
                }

                Fpojo newUser = new Fpojo();
                newUser.setEmail(registrationEmail);
                newUser.setPassword(registrationPassword);
                newUser.setUserType(userType);
                newUser.setTermsAccepted(termsAccepted != null ? "Yes" : "No");

                dao.insert(newUser);
                response.sendRedirect("index.jsp?success=Registration successful.");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        }
        else if (mypath.equals("/login")) {
            String loginEmail = request.getParameter("email");
            String loginPassword = request.getParameter("password");
            String userType = request.getParameter("userType"); 
            try {
                if (loginEmail == null || loginPassword == null || userType == null ||
                    loginEmail.isEmpty() || loginPassword.isEmpty() || userType.isEmpty()) {
                    System.out.println("Invalid input: Email, Password, or UserType is empty");
                    response.sendRedirect("index.jsp?error=Please provide email, password, and user type");
                    return;
                }
                System.out.println("inside login");
              
                Fpojo user = dao.getUser(loginEmail, userType);

                if (user != null) {
                    if (user.getPassword().equals(loginPassword)) {
                        System.out.println("Login successful");

                       
                        if (!user.getUserType().equalsIgnoreCase(userType)) {
                            System.out.println("User type mismatch for user: " + loginEmail);
                            response.sendRedirect("index.jsp?error=Invalid user type selected");
                            return;
                        }

                       
                        HttpSession session = request.getSession();
                        session.setAttribute("user", user.getEmail());

                       
                        String inTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
                        session.setAttribute("inTime", inTime);

                       
                        String sessionDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                        session.setAttribute("sessionDate", sessionDate);

                        
                        if (userType.equalsIgnoreCase("trainer")) {
                            response.sendRedirect("trainer/TrainerDashboard.jsp");
                        } else if (userType.equalsIgnoreCase("user")) {
                            response.sendRedirect("user/userhome");
                        } 
                     
                        else {
                            System.out.println("Unknown user type");
                            response.sendRedirect("index.jsp?error=Unknown user type");
                        }
                    } else {
                        System.out.println("Invalid password for user: " + loginEmail);
                        response.sendRedirect("index.jsp?error=Invalid password");
                    }
                } else {
                    System.out.println("User not found with the given email.");
                    response.sendRedirect("index.jsp?error=Invalid credentials");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } 
        else if (mypath.equals("/ContactAdmin")) {
            String contactName = request.getParameter("name");
            String contactEmail = request.getParameter("email");
            String contactMessage = request.getParameter("message");

          
            if (contactName == null || contactName.isEmpty() || 
                contactEmail == null || contactEmail.isEmpty() || 
                contactMessage == null || contactMessage.isEmpty()) {
                System.out.println("Name, email, or message cannot be empty.");
                response.sendRedirect("contact.jsp?error=Please fill in all required fields.");
                return;
            }

            try {
                
                ContactUsPojo contact = new ContactUsPojo();
                contact.setName(contactName);
                contact.setEmail(contactEmail);
                contact.setMessage(contactMessage);

                
               Fdao dao1 = new Fdao();
                dao1.insert(contact);
                response.sendRedirect("success.jsp?success=Message sent successfully.");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        }
        else if (mypath.equals("/adminlogin")) {
            String loginEmail = request.getParameter("email");
            String loginPassword = request.getParameter("password");
            String userType = request.getParameter("userType");

            
            HttpSession session = request.getSession();

            try {
               
                final String adminEmail = "jishasree2002@gmail.com";
                final String adminPassword = "1234";

               
                if (adminEmail.equalsIgnoreCase(loginEmail) && adminPassword.equals(loginPassword)) {
                    session.setAttribute("user", loginEmail); 
                    response.sendRedirect("admin/Admin.jsp"); 
                    return;
                }

                
                if ("user".equalsIgnoreCase(userType)) {
                    
                    session.setAttribute("user", loginEmail);  
                    System.out.println("User login successful for email: " + loginEmail);
                    response.sendRedirect("Admin.jsp");  
                } else {
                    
                    System.out.println("User type mismatch or invalid user type: " + loginEmail);
                    response.sendRedirect("index.jsp?error=Invalid user type selected");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("index.jsp?error=An error occurred");
            }
        }




        else {
        	if (mypath.equals("/trainer/AddDetailServlet")) {
        	    HttpSession session = request.getSession(false); 
        	    if (session == null || session.getAttribute("user") == null) {
        	        response.sendRedirect("error.jsp");
        	        return;
        	    }

        	    String loggedInUser = (String) session.getAttribute("user");
        	    System.out.println("Logged-in User: " + loggedInUser);

        	    if (loggedInUser == null || loggedInUser.isEmpty()) {
        	        response.sendRedirect("error.jsp");
        	        return;
        	    }

        	  
        	    String detailName = request.getParameter("uname");
        	    String detailEmail = request.getParameter("uemail");
        	    String contact = request.getParameter("ucontact");
        	    String type = request.getParameter("utype");
        	    String qualification = request.getParameter("uqualification");
        	    String expertise = request.getParameter("uexpertise");
        	    String specification = request.getParameter("uspecification");
        	    String phone = request.getParameter("uphone");
        	    String address = request.getParameter("uaddress");
        	    String joinedOn = request.getParameter("ujoined");
        	    String photo = request.getParameter("uphoto");
        	    String message = request.getParameter("umessage");

        	 
        	    if (detailName == null || detailName.isEmpty() || detailEmail == null || detailEmail.isEmpty()) {
        	        request.setAttribute("error", "Invalid input! Please check all fields.");
        	        request.getRequestDispatcher("error.jsp").forward(request, response);
        	        return;
        	    }

        	
        	    AddDetailsPojo details = new AddDetailsPojo();
        	    details.setName(detailName);
        	    details.setEmail(detailEmail);
        	    details.setContact(contact);
        	    details.setType(type);
        	    details.setQualification(qualification);
        	    details.setExpertise(expertise);
        	    details.setSpecification(specification);
        	    details.setPhone(phone);
        	    details.setAddress(address);
        	    details.setJoinedOn(joinedOn);
        	    details.setPhoto(photo);
        	    details.setMessage(message);
        	    details.setUserId(loggedInUser); 

        	   
        	    HomeDao homeDao = new HomeDao();
        	    System.out.println("homedao");
        	 
        	 if (homeDao.isDetailExists(loggedInUser)) {
        		 System.out.println("inside if");
        	     request.setAttribute("error", "User ID already exists! You can't submit details more than once.");
        	     request.getRequestDispatcher("errorDetail.jsp").forward(request, response);
        	   
        	     return; 
        	 } else {
        	    
        	     try {
					homeDao.insertDetails(details);
					  System.out.println("inside else");
					 request.setAttribute("message", "Details added successfully.");
	        	     request.getRequestDispatcher("successpage.jsp").forward(request, response);
				} catch (Exception e) {
					
					e.printStackTrace();
				}
        	     
        	 }

        	}

    	   else if (mypath.equals("/trainer/BookScheduleServlet")) {
		    		    
		
		    		    
		    		    String loggedInUser = (String) request.getSession().getAttribute("user");
		    		    if (loggedInUser == null) {
		    		        
		    		        response.sendRedirect("login.jsp");
		    		       
		    		    }
		
		    		    
		    		    String date = request.getParameter("udate");
		    		    String fromTime = request.getParameter("ufromTime");
		    		    String toTime = request.getParameter("utoTime");
		    		    String amount = request.getParameter("uamount");
		
		    		    
		    		    if (date == null || date.trim().isEmpty() ||
		    		        fromTime == null || fromTime.trim().isEmpty() ||
		    		        toTime == null || toTime.trim().isEmpty() ||
		    		        amount == null || amount.trim().isEmpty()) {
		    		        request.setAttribute("error", "Invalid input! Please check all fields.");
		    		        request.getRequestDispatcher("error.jsp").forward(request, response);
		    		        return;
		    		    }
		
		    		    
		    		    BookschedulePojo schedule = new BookschedulePojo(date, fromTime, toTime, amount, loggedInUser);
		
		    		    
		    		    HomeDao homedao = new HomeDao();
		    		    try {
		    		        homedao.insertSchedule(schedule);
		    		        request.setAttribute("message", "Details added successfully.");
		    		        request.getRequestDispatcher("successpage.jsp").forward(request, response);
		    		    } catch (Exception e) {
		    		        e.printStackTrace();
		    		        request.setAttribute("error", "Failed to add details. Please try again.");
		    		        request.getRequestDispatcher("error.jsp").forward(request, response);
		    		    }
		    		}

 		else if(mypath.equals("/trainer/Update")) {
			 			
			
			 	        String id = request.getParameter("id");
			 	        String date = request.getParameter("date");
			 	        String fromtime = request.getParameter("fromtime");
			 	        String totime = request.getParameter("totime");
			 	        String amount = request.getParameter("amount");
			
			 	        if (id != null && !id.isEmpty()) {
			 	            try {
			 	                int bsId = Integer.parseInt(id);
			
			 	               BookschedulePojo updatedbs = new BookschedulePojo();
			 	                updatedbs.setId(bsId);
			 	                updatedbs.setDate(date);
			 	                updatedbs.setFromTime(fromtime);
			 	                updatedbs.setToTime(totime);
			 	                updatedbs.setAmount(amount);
			
			 	                HomeDao bsdao = new HomeDao();
			 	                bsdao.scheduleupdate(updatedbs);
			                    System.out.println("way to reach success page");
			 	                response.sendRedirect("successpage.jsp");
			 	            } catch (NumberFormatException e) {
			 	                System.out.println("Invalid ID format");
			 	                response.sendRedirect("error.jsp");
			 	            }
			 	        } else {
			 	            System.out.println("ID is required for updating");
			 	            response.sendRedirect("error.jsp");
			 	        }
			 	    } 
 		 else if (mypath.equals("/trainer/updateEdit")) {
  		   System.out.println("updateedit");

  		   String userid = request.getParameter("userId");
  		   String userName = request.getParameter("userName");
  		   String userEmail = request.getParameter("userEmail");
  		   String userContact = request.getParameter("userContact");
  		   String userType = request.getParameter("userType");
  		   String userQualification = request.getParameter("userQualification");
  		   String userExpertise = request.getParameter("userExpertise");
  		   String userSpecification = request.getParameter("userSpecification");
  		   String userPhone = request.getParameter("userPhone");
  		   String userAddress = request.getParameter("useraddress");
  		   String userJoined = request.getParameter("userjoined");
  		   String userPhoto = request.getParameter("userPhoto");
  		   String userMessage = request.getParameter("userMessage");

  		  
  		   if (userid != null && !userid.isEmpty()) {
  			   int adId = Integer.parseInt(userid);
  			 System.out.println(adId);
  		   AddDetailsPojo updatedDetails = new AddDetailsPojo();
  		   updatedDetails.setId(adId);
  		   updatedDetails.setName(userName);
  		   updatedDetails.setEmail(userEmail);
  		   updatedDetails.setContact(userContact);
  		   updatedDetails.setType(userType);
  		   updatedDetails.setQualification(userQualification);
  		   updatedDetails.setExpertise(userExpertise);
  		   updatedDetails.setSpecification(userSpecification);
  		   updatedDetails.setPhone(userPhone);
  		   updatedDetails.setAddress(userAddress);
  		   updatedDetails.setJoinedOn(userJoined);
  		   updatedDetails.setPhoto(userPhoto);
  		   updatedDetails.setMessage(userMessage);

  		   HomeDao homeDao = new HomeDao();
  		   boolean isUpdated = homeDao.updateUserDetails(updatedDetails); 
  		   System.out.println("isUpdated");

  		 
  		   if (isUpdated) {
  		       response.sendRedirect("successpage.jsp?message=Details updated successfully.");
  		   } else {
  		       response.sendRedirect("error.jsp?error=Failed to update user details.");
  		   }
  	   }
  	
 		 }
 		else if (mypath.equals("/trainer/delete")) {
				 		    try {
				 		        int empId = Integer.parseInt(request.getParameter("id"));
				 		        
				 		        HomeDao deletedao = new HomeDao();
				 		        deletedao.scheduledelete(empId);
				 		        
				 		      
				 		        List<BookschedulePojo> bookscheduleList = deletedao.getAllschedule();
				 		        
				 		       
				 		        request.setAttribute("bookscheduleList", bookscheduleList);
				 		        
				 		       
				 		        RequestDispatcher rd = request.getRequestDispatcher("schedule.jsp");
				 		        rd.forward(request, response);
				 		    } catch (NumberFormatException e) {
				 		        e.printStackTrace();
				 		        System.out.println("Invalid ID parameter. Unable to parse: " + request.getParameter("id"));
				 		        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID parameter.");
				 		    } catch (Exception e) {
				 		        e.printStackTrace();
				 		        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
				 		    }
				 		
				 		}
 
            else if (mypath.equals("/trainer/video")) {
            	
            	Part imagePart = request.getPart("uimage");
                Part videoPart = request.getPart("uvideo");  
                Part thumbnailPart = request.getPart("uthumbnail");  

                
                if (videoPart == null || thumbnailPart == null || imagePart == null ) {
                    response.sendRedirect("error.jsp?message=File(s) not uploaded");
                    return;
                }

               
                String videoDir = "C:\\uploads\\videos";
                String thumbnailDir = "C:\\uploads\\thumbnails";

                
                String videoPath = FileUploadUtil.saveUploadedFile(videoPart, videoDir);
                String thumbnailPath = FileUploadUtil.saveUploadedFile(thumbnailPart, thumbnailDir);

              
                String title = request.getParameter("utitle");
                if (title == null || title.trim().isEmpty()) {
                    response.sendRedirect("error.jsp?message=Title cannot be empty");
                    return;
                }
                
                byte[] imageBytes;
                try (InputStream inputStream = imagePart.getInputStream()) {
                    imageBytes = inputStream.readAllBytes(); 
                }

               
                String name = request.getParameter("uname");
                String specification = request.getParameter("uspecification");
                String message = request.getParameter("umessage");
                String udetails = request.getParameter("udetails"); 
                String udate = request.getParameter("udate");  
                String uFtime = request.getParameter("uFtime"); 
                String uTtime = request.getParameter("uTtime");  
                String upayment = request.getParameter("upayment"); 
                String Offer = request.getParameter("uoffer");
                String OfferName = request.getParameter("uoffername");
                String OfferValid = request.getParameter("uoffervalid");
                String classLink = request.getParameter("uclass");
               
                
                VideoPojo videoPojo = new VideoPojo();
                videoPojo.setImage(imageBytes);
                videoPojo.setTitle(title);
                videoPojo.setThumbnail(thumbnailPath);
                videoPojo.setVideo(videoPath);
                videoPojo.setName(name);
                videoPojo.setSpecification(specification);
                videoPojo.setMessage(message);
                videoPojo.setDetails(udetails);
                videoPojo.setDate(udate);
                videoPojo.setFtime(uFtime);
                videoPojo.setTtime(uTtime);
                videoPojo.setPaymentDetails(upayment);
                videoPojo.setOffer(Offer);
                videoPojo.setOfferName(OfferName);
                videoPojo.setOfferValid(OfferValid);
                videoPojo.setClassLink(classLink);
              

             
                String userId = (String) request.getSession().getAttribute("user");
                if (userId != null) {
                    videoPojo.setUserId(userId);
                } else {
                    response.sendRedirect("errorlogin.jsp");
                    return;
                }

                
                HomeDao videoDAO = new HomeDao();
                boolean isSaved = videoDAO.saveVideoDetails(videoPojo);

                if (isSaved) {
                	 request.setAttribute("message", "Details added successfully.");
                     request.getRequestDispatcher("successpage.jsp").forward(request, response); 
                } else {
                    response.sendRedirect("error.jsp?message=Failed to save video details");
                }
            }

            else if (mypath.equals("/trainer/videodelete")) {
                try {
                    
                    String idParam = request.getParameter("uid");
                    if (idParam == null || idParam.trim().isEmpty()) {
                        throw new IllegalArgumentException("ID parameter is missing or empty.");
                    }

                    int dId = Integer.parseInt(idParam); 
                    System.out.println("Deleting video with ID: " + dId);

                 
                    HomeDao deletedao = new HomeDao();
                    deletedao.videodelete(dId);

                   
                    List<VideoPojo> vList = deletedao.getAllVideos();

                  
                    request.setAttribute("vList", vList);

                 
                    RequestDispatcher rd = request.getRequestDispatcher("Uploaded.jsp");
                    rd.forward(request, response);

                } catch (NumberFormatException e) {
                    System.out.println("Invalid ID parameter. Unable to parse: " + request.getParameter("id"));
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID parameter. It must be a valid integer.");
                } catch (IllegalArgumentException e) {
                    System.out.println("Error: " + e.getMessage());
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, e.getMessage());
                } catch (Exception e) {
                    System.out.println("An unexpected error occurred while processing the delete request.");
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing the request.");
                }
            }
            else if (mypath.equals("/trainer/vid")) {
                try {
                   
                    String title = request.getParameter("utitle");
                    Part videoPart = request.getPart("uvideo"); 
                    Part thumbnailPart = request.getPart("uthumbnail");
                    String id = request.getParameter("uid");
                    String name = request.getParameter("uname");
                    String specification = request.getParameter("uspecification");
                    String message = request.getParameter("umessage");
                    String details = request.getParameter("udetails");
                    String date = request.getParameter("udate");
                    String fromtime = request.getParameter("uFtime");
                    String totime = request.getParameter("uTtime");
                    String payment = request.getParameter("upayment");
                    String offer = request.getParameter("uoffer");
                    String offerName = request.getParameter("uofferName");
                    String offerValid = request.getParameter("uofferValid");
                    String classLink = request.getParameter("uclasslink");
                   
                  
                    if (title == null || title.isEmpty() || videoPart == null || thumbnailPart == null || id == null || id.isEmpty()) {
                        System.out.println("One or more fields are empty.");
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
                        return;
                    }

                    int videoId;
                    try {
                        videoId = Integer.parseInt(id); 
                    } catch (NumberFormatException e) {
                        System.out.println("Invalid ID format: " + e.getMessage());
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
                        return;
                    }

                  
                    String videoFile = videoPart.getSubmittedFileName();
                    String thumbnailFile = thumbnailPart.getSubmittedFileName();

                 
                    if (videoFile == null || videoFile.isEmpty() || thumbnailFile == null || thumbnailFile.isEmpty()) {
                        System.out.println("Uploaded files are empty.");
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Video and thumbnail files are required.");
                        return;
                    }

                   
                    String uploadPath = "C:\\uploads\\videos"; 
                    videoPart.write(uploadPath + "/" + videoFile);
                    thumbnailPart.write(uploadPath + "/" + thumbnailFile);

                  
                    VideoPojo updatedVideo = new VideoPojo();
                    updatedVideo.setId(videoId);
                    updatedVideo.setTitle(title);
                    updatedVideo.setVideo(videoFile);
                    updatedVideo.setThumbnail(thumbnailFile);
                    updatedVideo.setName(name);
                    updatedVideo.setSpecification(specification);
                    updatedVideo.setMessage(message);
                    updatedVideo.setDetails(details);
                    updatedVideo.setDate(date);
                    updatedVideo.setFtime(fromtime);
                    updatedVideo.setTtime(totime);
                    updatedVideo.setPaymentDetails(payment);
                    updatedVideo.setOffer(offer);
                    updatedVideo.setOfferName(offerName);
                    updatedVideo.setOfferValid(offerValid);
                    updatedVideo.setClassLink(classLink);
                   
                  
                    HomeDao vpDao = new HomeDao();
                    boolean isUpdated = vpDao.videoupdate(updatedVideo);

                    if (isUpdated) {
                    	 request.setAttribute("message", "Details added successfully.");
                         request.getRequestDispatcher("successpage.jsp").forward(request, response); 
                    } else {
                        System.out.println("Failed to update video.");
                        response.sendRedirect("error.jsp"); 
                    }
                } catch (Exception e) {
                    System.out.println("An unexpected error occurred: " + e.getMessage());
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
                }
            }

            else if (mypath.equals("/trainer/ContactServlet")) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String message = request.getParameter("message");
            
               
                if (name == null || name.isEmpty() || email == null || email.isEmpty()) {
                    System.out.println("Name or email cannot be empty.");
                    
                    response.sendRedirect("Contact.jsp?error=Please provide all required fields.");
                    return;
                }

                
                ContactPojo contact = new ContactPojo();
                contact.setName(name);
                contact.setEmail(email);
                contact.setMessage(message);

               
                HomeDao homeDao = new HomeDao();
                try {
                    homeDao.contactInsert(contact);  
                    System.out.println("Message added successfully.");

                    
                    request.setAttribute("message", "Details added successfully.");
                    request.getRequestDispatcher("successpage.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                 
                    request.setAttribute("error", "Failed to add details.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }
            else if (mypath.equals("/trainer/viewprofile")) {
                response.setContentType("text/html");

                try {
                
                    Part imagePart = request.getPart("uimage"); 
                    String uname = request.getParameter("uname");  
                    String udetails = request.getParameter("udetails"); 
                    String udate = request.getParameter("udate");  
                    String uFtime = request.getParameter("uFtime"); 
                    String uTtime = request.getParameter("uTtime");  
                    String upayment = request.getParameter("upayment");
                    String Offer = request.getParameter("uoffer");

                    
                    String loggedInUser = (String) request.getSession().getAttribute("user");

                    
                    if (uname == null || uname.isEmpty() || 
                        udetails == null || udetails.isEmpty() || 
                        udate == null || udate.isEmpty() || 
                        uFtime == null || uFtime.isEmpty() || 
                        uTtime == null || uTtime.isEmpty() || 
                        upayment == null || upayment.isEmpty() || 
                        imagePart == null || Offer.isEmpty()) {
                        
                        request.setAttribute("error", "All fields are required!");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                        return;
                    }

                    if (loggedInUser == null || loggedInUser.isEmpty()) {
                        request.setAttribute("error", "User not logged in!");
                        request.getRequestDispatcher("errorlogin.jsp").forward(request, response);
                        return;
                    }

                    
                    byte[] imageBytes;
                    try (InputStream inputStream = imagePart.getInputStream()) {
                        imageBytes = inputStream.readAllBytes(); 
                    }

                    
                    ViewProfilePojo profile = new ViewProfilePojo();
                    profile.setImage(imageBytes);
                    profile.setName(uname);
                    profile.setDetails(udetails);
                    profile.setDate(udate);
                    profile.setFtime(uFtime);
                    profile.setTtime(uTtime);
                    profile.setPaymentDetails(upayment);
                    profile.setOffer(Offer);
                    profile.setUserId(loggedInUser); 
                    
                   
                    HomeDao vdao = new HomeDao();

                   
                    if (vdao.isProfileExists(loggedInUser)) {
                        request.setAttribute("error", "User ID already exists! You can't submit details more than once.");
                        request.getRequestDispatcher("errorDetail.jsp").forward(request, response);
                        return;
                    } 

                 
                    vdao.saveTrainerProfile(profile);
                    request.setAttribute("message", "Details added successfully.");
                    request.getRequestDispatcher("successpage.jsp").forward(request, response);

                } catch (Exception e) {
                
                    e.printStackTrace();
                    request.setAttribute("error", "Failed to add details due to an unexpected error.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }

            else if (mypath.equals("/trainer/viewupdate")) {
                response.setContentType("text/html");

                try {
                  
                    Part imagePart = request.getPart("image"); 
                    String uname = request.getParameter("name"); 
                    String udetails = request.getParameter("details");
                    String udate = request.getParameter("date");
                    String uFtime = request.getParameter("fTime");
                    String uTtime = request.getParameter("tTime"); 
                    String upayment = request.getParameter("payment");
                    String Offer = request.getParameter("offer");

                   
                    String loggedInUser = (String) request.getSession().getAttribute("user");
                
                    
                    byte[] imageBytes = null;
                    if (imagePart != null && imagePart.getSize() > 0) {
                        try (InputStream inputStream = imagePart.getInputStream()) {
                            imageBytes = inputStream.readAllBytes();
                            
                        }
                    }

               
                    ViewProfilePojo profile = new ViewProfilePojo();
                    profile.setName(uname);
                    profile.setDetails(udetails);
                    profile.setDate(udate);
                    profile.setFtime(uFtime);
                    profile.setTtime(uTtime);
                    profile.setPaymentDetails(upayment);
                    profile.setOffer(Offer);
                    profile.setUserId(loggedInUser);

                   
                    if (imageBytes != null && imageBytes.length > 0) {
                        profile.setImage(imageBytes);
                    }

                    HomeDao vdao = new HomeDao();
                    boolean isUpdated = vdao.updateTrainerProfile(profile);
                    
                    if (isUpdated) {
                        request.setAttribute("message", "Details updated successfully.");
                        request.getRequestDispatcher("successpage.jsp").forward(request, response);
                    } else {
                        request.setAttribute("error", "Failed to update profile.");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }

                } catch (Exception e) {
                   
                    e.printStackTrace();
                    request.setAttribute("error", "Failed to update details due to an unexpected error.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }

            else if(mypath.equals("/trainer/DeleteProfile")) {
            	  String loggedInUser = (String) request.getSession().getAttribute("user");
                  
                  if (loggedInUser != null) {
                      
                      HomeDao homeDao = new HomeDao();
                      
                      try {
                         
                          boolean isDeleted = homeDao.deleteProfileByUserId(loggedInUser);
                          
                          if (isDeleted) {
                             
                              request.setAttribute("message", "Profile deleted successfully.");
                              request.getRequestDispatcher("successpage.jsp").forward(request, response);
                          } else {

                              request.setAttribute("error", "Failed to delete profile.");
                              request.getRequestDispatcher("error.jsp").forward(request, response);
                          }
                          
                      } catch (Exception e) {
                         
                          e.printStackTrace();
                          request.setAttribute("error", "An unexpected error occurred while deleting the profile.");
                          request.getRequestDispatcher("error.jsp").forward(request, response);
                      }
                  } else {
                      
                      response.sendRedirect("errorlogin.jsp");
                  }
            }
            else if (mypath.equals("/user/overview")) {
                
                HttpSession session = request.getSession(false);
                if (session == null || session.getAttribute("user") == null) {
                    response.sendRedirect("errorlogin.jsp");
                    return;
                }

                String loggedInUser = (String) session.getAttribute("user");
                if (loggedInUser == null || loggedInUser.trim().isEmpty()) {
                    response.sendRedirect("errorlogin.jsp");
                    return;
                }

               
                String fitnessGoal = request.getParameter("fitnessGoal");
                String otherGoal = request.getParameter("otherGoal");
                String workoutFrequency = request.getParameter("workoutFrequency");
                String[] exerciseTypes = request.getParameterValues("exerciseType");
                String otherExercise = request.getParameter("otherExercise");
                String flexibilityLevel = request.getParameter("flexibilityLevel");
                String[] fitnessChallenges = request.getParameterValues("fitnessChallenges");
                String otherChallenge = request.getParameter("otherChallenge");
                String dietApproach = request.getParameter("dietApproach");
                String otherDiet = request.getParameter("otherDiet");
                String[] motivation = request.getParameterValues("motivation");
                String otherMotivation = request.getParameter("otherMotivation");
                String fitnessInjuries = request.getParameter("fitnessInjuries");
                String[] fitnessEquipment = request.getParameterValues("fitnessEquipment");
                String otherEquipment = request.getParameter("otherEquipment");
                String fitnessChallengesIdeas = request.getParameter("fitnessChallengesIdeas");

               
                FitnessForm form = new FitnessForm();
                form.setFitnessGoal(fitnessGoal);
                form.setOtherGoal(otherGoal);
                form.setWorkoutFrequency(workoutFrequency);
                form.setExerciseTypes(exerciseTypes != null ? String.join(", ", exerciseTypes) : null);
                form.setOtherExercise(otherExercise);
                form.setFlexibilityLevel(flexibilityLevel);
                form.setFitnessChallenges(fitnessChallenges != null ? String.join(", ", fitnessChallenges) : null);
                form.setOtherChallenge(otherChallenge);
                form.setDietApproach(dietApproach);
                form.setOtherDiet(otherDiet);
                form.setMotivation(motivation != null ? String.join(", ", motivation) : null);
                form.setOtherMotivation(otherMotivation);
                form.setFitnessInjuries(fitnessInjuries);
                form.setFitnessEquipment(fitnessEquipment != null ? String.join(", ", fitnessEquipment) : null);
                form.setOtherEquipment(otherEquipment);
                form.setFitnessChallengesIdeas(fitnessChallengesIdeas);
                form.setUserId(loggedInUser);

               
                HomeDao dao2 = new HomeDao();
                try {
                    boolean isSaved = dao2.saveFitnessForm(form);
                    if (isSaved) {
                    	 request.setAttribute("message", "Successfully submitted");
                         request.getRequestDispatcher("successpage.jsp").forward(request, response);
                    } else {
                        response.getWriter().println("Error submitting form. Please try again.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("An error occurred while processing your request.");
                }
            }
        	
            else if (mypath.equals("/user/bookNowServlet")) {
            
            	        System.out.println("inside servlet");
            	        
            	        HttpSession session = request.getSession();
            	        String userId = (String) session.getAttribute("user");
            	        String videoId = request.getParameter("videoId");  

            	        String trainerUserId = request.getParameter("trainerUserId");
            	        String title = request.getParameter("title");
            	        String trainerName = request.getParameter("trainer");
            	        String date = request.getParameter("date");
            	        String fromTime = request.getParameter("Ftime");
            	        String toTime = request.getParameter("Ttime");
            	        String amount = request.getParameter("uamount");
            	        String customerUserId = request.getParameter("customerUserId");
            	        String customerName = request.getParameter("customerName");
            	        String customerEmail = request.getParameter("customerEmail");

            	       
            	        System.out.println("Trainer UserId: " + trainerUserId);
            	        System.out.println("Trainer Name: " + trainerName);
            	        System.out.println("Date: " + date);
            	        System.out.println("From Time: " + fromTime);
            	        System.out.println("To Time: " + toTime);
            	        System.out.println("Customer UserId: " + customerUserId);
            	        System.out.println("Customer Name: " + customerName);
            	        System.out.println("Customer Email: " + customerEmail);

            	        
            	        Bookings booking = new Bookings();
            	        booking.setTitle(title);
            	        booking.setTrainerUserId(trainerUserId);
            	        booking.setTrainer(trainerName);
            	        booking.setDate(date);
            	        booking.setFtime(fromTime);
            	        booking.setTtime(toTime);
            	        booking.setCustomerUserId(customerUserId);
            	        booking.setCustomerName(customerName);
            	        booking.setCustomerEmail(customerEmail);
            	        booking.setAmount(amount);
            	        
            	        session.setAttribute("bookingStatus_" + videoId + "_" + userId, "Booked");

            	        
            	        HomeDao homeDao = new HomeDao();
            	        boolean isSaved = homeDao.saveBookings(booking);

            	        if (isSaved) {
            	            request.setAttribute("message", "Successfully submitted");
            	            request.getRequestDispatcher("bookingsuccess.jsp").forward(request, response);
            	        } else {
            	            response.getWriter().println("Error submitting form. Please try again.");
            	        }
            }
        

            else if (mypath.equals("/user/saveProfile")) {
                System.out.println("Inside save profile");
                
                
                String trainerId = request.getParameter("trainerId");
                String title = request.getParameter("title");
                String trainerName = request.getParameter("trainerName");
                String trainerSession = request.getParameter("trainersession");
                String UserSession = request.getParameter("usersession");
                
                
                
                SaveProfilePojo sp = new SaveProfilePojo();
                sp.setTrainerName(trainerName);
                sp.setTitle(title);
                sp.setTrainerUserId(trainerSession);
                sp.setCustomerUserId(UserSession);

               
                HomeDao saveDao = new HomeDao();
                try {
                    saveDao.saveProfile(sp); 
                    request.setAttribute("message", "Successfully submitted");
                    request.getRequestDispatcher("saved.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.getWriter().println("Error submitting form. Please try again.");
                }
            }
        	
            else if (mypath.equals("/user/deleteSaved")) {
            	String loggedInUser = (String) request.getSession().getAttribute("user");

              
                Long id = (long) Integer.parseInt(request.getParameter("id"));

               
                HomeDao sdao = new HomeDao();
                boolean result = sdao.deletesaved(id);

                if (result) {
               
                    response.sendRedirect("bookingsuccess.jsp");
                } else {
                   
                    response.sendRedirect("error.jsp");
                }
            }
            else if (mypath.equals("/user/cartProfile")) {
              
                    System.out.println("cartServlet");
                    Part imagePart = request.getPart("trainerImage");
                    String trainerId = request.getParameter("trainerId");
                    String title = request.getParameter("title");
                    String trainerName = request.getParameter("trainerName");
                    String trainerSession = request.getParameter("trainersession");
                    String userSession = request.getParameter("usersession");
                    String date = request.getParameter("date");
                    String payment = request.getParameter("payment");

                   
                    byte[] imageBytes = null;
                    if (imagePart != null && imagePart.getSize() > 0) {
                        try (InputStream inputStream = imagePart.getInputStream()) {
                            imageBytes = inputStream.readAllBytes();
                        }
                    } else {
                        throw new IllegalArgumentException("Invalid image file.");
                    }

                   
                    CartPojo cp = new CartPojo();
                    cp.setTrainerName(trainerName);
                    cp.setTitle(title);
                    cp.setDate(date);
                    cp.setPayment(payment);
                    cp.setImage(imageBytes);
                    cp.setTrainersession(trainerSession);
                    cp.setUsersession(userSession);

                    try {
                    HomeDao cartDao = new HomeDao();
                    cartDao.saveTocart(cp);

                   
                    request.setAttribute("message", "Successfully submitted");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);

                } catch (IllegalArgumentException e) {
                   
                    e.printStackTrace(); 
                    response.getWriter().println("Invalid input: " + e.getMessage());
                } catch (Exception e) {
                   
                    e.printStackTrace(); 
                    response.getWriter().println("Error submitting form. Please try again.");
                }
            }
            else if(mypath.equals("/user/offercart")){
            	 
            	System.out.println("inside offercart");
            	    String id = request.getParameter("trainerId");
            	    String offerValid = request.getParameter("offerValid");
            	    String offer = request.getParameter("offer");
            	    String payment = request.getParameter("Payment");
            	    String offerSpecification = request.getParameter("offerSpecification");
            	    String offerName = request.getParameter("offerName");
            	    String name = request.getParameter("name");
            	    String title = request.getParameter("title");
            	    Part imagePart = request.getPart("image");
            	    String trainerSession = request.getParameter("trainersession");
            	    String userSession = request.getParameter("usersession");

            	    byte[] imageBytes = null;
            	
            	    if (imagePart != null && imagePart.getSize() > 0) {
            	        try (InputStream inputStream = imagePart.getInputStream()) {
            	            imageBytes = inputStream.readAllBytes();
            	        } catch (IOException e) {
            	          
            	            e.printStackTrace();
            	            response.getWriter().println("Error reading the image file.");
            	            return;
            	        }
            	    } else {
            	       
            	        response.getWriter().println("Image file is required or invalid.");
            	        return;
            	    }

            	   
            	    OfferCart cart = new OfferCart();
            	    cart.setOfferValid(offerValid);
            	    cart.setOffer(offer);
            	    cart.setPaymentDetails(payment);
            	    cart.setOfferSpecification(offerSpecification);
            	    cart.setOfferName(offerName);
            	    cart.setName(name);
            	    cart.setTitle(title);
            	    cart.setImage(imageBytes);
            	    cart.setTrainerSession(trainerSession);
            	    cart.setUserSession(userSession);

            	   
            	  try {
            	        HomeDao offerDao = new HomeDao();
            	        offerDao.saveoffercart(cart); 

            	      
            	        request.setAttribute("message", "Successfully submitted");
            	        request.getRequestDispatcher("cart.jsp").forward(request, response);

            	    } catch (IllegalArgumentException e) {
            	      
            	        e.printStackTrace();
            	        response.getWriter().println("Invalid input: " + e.getMessage());
            	    } 
            	}
        	
            else if (mypath.equals("/trainer/NewUpdateServlet")) {
             
                String className = request.getParameter("name");
                String trainerName = request.getParameter("trainerName");
                String expertise = request.getParameter("expertise");
                String feedback = request.getParameter("feedback");
                String description = request.getParameter("description");
                Part imagePart1 = request.getPart("uimage1");

                
                String userId = (String) request.getSession().getAttribute("user");
                if (userId == null || userId.isEmpty()) {
                    request.setAttribute("message", "You must be logged in to perform this action.");
                    request.getRequestDispatcher("errorlogin.jsp").forward(request, response);
                    return;
                }

                
                byte[] imageBytes1 = null;
                if (imagePart1 != null && imagePart1.getSize() > 0) {
                    try (InputStream inputStream1 = imagePart1.getInputStream()) {
                        imageBytes1 = inputStream1.readAllBytes();
                    } catch (IOException e) {
                        response.getWriter().println("Failed to process the uploaded image.");
                        e.printStackTrace();
                        return;
                    }
                } else {
                    request.setAttribute("message", "Image file is required.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                }

                
                NewUpdatePojo classD = new NewUpdatePojo();
                classD.setUserId(userId);
                classD.setClassName(className);
                classD.setTrainerName(trainerName);
                classD.setExpertise(expertise);
                classD.setFeedback(feedback);
                classD.setDescription(description);
                classD.setImage(imageBytes1);

                
                HomeDao cdao = new HomeDao();
                try {
                    cdao.saveClassDetails(classD); 
                    request.setAttribute("message", "Successfully submitted");
                    request.getRequestDispatcher("successpage.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("error", "Failed to save class details. Please try again.");
                    e.printStackTrace();  
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            }  

            else if(mypath.equals("/trainer/health")){
            	
            	Part imagePart1 = request.getPart("uimage1");
                String trainerName = request.getParameter("trainerName");
                String foodControlIdeas = request.getParameter("foodControlIdeas");
                Integer daysToFollow = Integer.parseInt(request.getParameter("daysToFollow"));
                String dailyRoutine = request.getParameter("dailyRoutine");

               
                byte[] imageBytes1 = null;
                try (InputStream inputStream1 = imagePart1.getInputStream()) {
         	       imageBytes1 = inputStream1.readAllBytes();
         	   }
                HealthPojo health = new HealthPojo();
                health.setTrainerName(trainerName);
                health.setFoodControlIdeas(foodControlIdeas);
                health.setDaysToFollow(daysToFollow);
                health.setDailyRoutine(dailyRoutine);
                health.setImage(imageBytes1);
                
                String userId = (String) request.getSession().getAttribute("user");
                health.setUserId(userId); 
                
                HomeDao hdao = new HomeDao();
                try {
                    hdao.saveHealth(health); 
                    request.setAttribute("message", "Successfully submitted");
        	        request.getRequestDispatcher("successpage.jsp").forward(request, response);
                } catch (Exception e) {
                    response.getWriter().println("Failed to save class details.");
                    e.printStackTrace(); 
                }
               
                response.getWriter().write("Product saved successfully.");
            }

       else if(mypath.equals("/trainer/AddProductServlet")){
            	
    	
    	   Part imagePart1 = request.getPart("uimage1");
    	   Part imagePart2 = request.getPart("uimage2");
    	   Part imagePart3 = request.getPart("uimage3");
    	   Part imagePart4 = request.getPart("uimage4");

    	  
    	   byte[] imageBytes1 = null, imageBytes2 = null, imageBytes3 = null, imageBytes4 = null;

    	   try (InputStream inputStream1 = imagePart1.getInputStream()) {
    	       imageBytes1 = inputStream1.readAllBytes();
    	   }
    	   try (InputStream inputStream2 = imagePart2.getInputStream()) {
    	       imageBytes2 = inputStream2.readAllBytes();
    	   }
    	   try (InputStream inputStream3 = imagePart3.getInputStream()) {
    	       imageBytes3 = inputStream3.readAllBytes();
    	   }
    	   try (InputStream inputStream4 = imagePart4.getInputStream()) {
    	       imageBytes4 = inputStream4.readAllBytes();
    	   }

    	 
    	   String productName = request.getParameter("productName");
    	   String productDescription = request.getParameter("productDescription");
    	   String productUse = request.getParameter("productUse");
    	   double productPrice = Double.parseDouble(request.getParameter("productPrice"));
    	   int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
    	   String trainerName = request.getParameter("trainerName");
    	   String shopName = request.getParameter("shopName");

    	   
    	   ProductPojo product = new ProductPojo();
    	   product.setProductName(productName);
    	   product.setProductDescription(productDescription);
    	   product.setProductUse(productUse);
    	   product.setProductPrice(productPrice);
    	   product.setProductDiscount(productDiscount);
    	   product.setTrainerName(trainerName);
    	   product.setShopName(shopName);
    	   product.setImage1(imageBytes1); // Set first image
    	   product.setImage2(imageBytes2); // Set second image
    	   product.setImage3(imageBytes3); // Set third image
    	   product.setImage4(imageBytes4); // Set fourth image

    	   String userId = (String) request.getSession().getAttribute("user");
    	   product.setUserId(userId);

    	 
    	   HomeDao pdao = new HomeDao();
    	   try {
    	       pdao.saveProduct(product); 
    	       request.setAttribute("message", "Successfully submitted");
    	       request.getRequestDispatcher("successpage.jsp").forward(request, response);
    	   } catch (Exception e) {
    	       response.getWriter().println("Failed to save product details.");
    	       e.printStackTrace(); 
    	   }

    	
    	   response.getWriter().write("Product saved successfully.");
       }
            
       else if(mypath.equals("/trainer/FreeClass")) {
    	   
    	   String trainerName = request.getParameter("trainerName");
           String classTitle = request.getParameter("classTitle");
           String videoLink = request.getParameter("videoLink");
           String classDescription = request.getParameter("classDescription");
           String userId = (String) request.getSession().getAttribute("user");
	        if (userId == null || userId.isEmpty()) {
	            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User ID is required.");
	            return;
	        }

        
           FreeClassPojo classPojo = new FreeClassPojo();
           classPojo.setTrainerName(trainerName);
           classPojo.setClassTitle(classTitle);
           classPojo.setVideoLink(videoLink);
           classPojo.setClassDescription(classDescription);
           classPojo.setUserId(userId);
        
           HomeDao homeDao = new HomeDao();
           try {
               homeDao.saveClassDetails(classPojo); 
               request.setAttribute("message", "Class details submitted successfully!");
               request.getRequestDispatcher("successpage.jsp").forward(request, response);
           } catch (Exception e) {
               response.getWriter().println("Failed to submit class details.");
               e.printStackTrace();
           }
       }
       else if (mypath.equals("/trainer/updateNew")) {
    	   
    	    String className = request.getParameter("uname"); // Class Name
    	    String trainerName = request.getParameter("utrainer"); // Trainer Name
    	    String expertise = request.getParameter("uexpertise"); // Expertise
    	    String description = request.getParameter("udescription"); // Description
    	    String feedback = request.getParameter("ufeedback"); // Feedback

    	
    	    if (className == null || className.isEmpty()) {
    	        System.out.println("Class Name is required.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Class Name is required.");
    	        return;
    	    }

    	   
    	    String userId = (String) request.getSession().getAttribute("user");

    	   
    	    if (userId == null || userId.isEmpty()) {
    	        System.out.println("User ID is required.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
    	        return;
    	    }

    	
    	    NewUpdatePojo up = new NewUpdatePojo();
    	    up.setClassName(className);
    	    up.setTrainerName(trainerName);
    	    up.setExpertise(expertise);
    	    up.setDescription(description);
    	    up.setFeedback(feedback);
    	    up.setUserId(userId); 
    	    HomeDao nuDao = new HomeDao();
    	    boolean isUpdated = nuDao.updateExistingDetails(up); 
    	    if (isUpdated) {
    	        request.setAttribute("message", "Details updated successfully.");
    	        request.getRequestDispatcher("successpage.jsp").forward(request, response);
    	    } else {
    	        System.out.println("Failed to update details.");
    	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update details.");
    	    }
    	}
       else if (mypath.equals("/trainer/deleteUpdate")) {
    	    
    	    String userId = (String) request.getSession().getAttribute("user");

    	  
    	    if (userId == null || userId.isEmpty()) {
    	        System.out.println("User ID is required.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
    	        return;
    	    }

    	   
    	    NewUpdatePojo up = new NewUpdatePojo();
    	    up.setUserId(userId);

    	   
    	    HomeDao nuDao = new HomeDao();
    	    boolean isDeleted = nuDao.deleteExistingDetails(up); 
    	    if (isDeleted) {
    	        request.setAttribute("message", "Details deleted successfully.");
    	        request.getRequestDispatcher("successpage.jsp").forward(request, response);
    	    } else {
    	        System.out.println("Failed to delete details.");
    	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete details.");
    	    }
    	}
       else if (mypath.equals("/trainer/healthUpdate")) {
    	 
    	    String trainerName = request.getParameter("utrainer"); // Trainer Name
    	    String foodControlIdeas = request.getParameter("ufood"); // Food Control Ideas
    	    String daysToFollowStr = request.getParameter("daysToFollow"); // Days to Follow (String)
    	    String dailyRoutine = request.getParameter("udaily"); // Daily Routine

    	  
    	    if (trainerName == null || trainerName.isEmpty()) {
    	        System.out.println("Trainer Name is required.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Trainer Name is required.");
    	        return;
    	    }
    	    if (foodControlIdeas == null || foodControlIdeas.isEmpty()) {
    	        System.out.println("Food Control Ideas are required.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Food Control Ideas are required.");
    	        return;
    	    }
    	    if (dailyRoutine == null || dailyRoutine.isEmpty()) {
    	        System.out.println("Daily Routine is required.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Daily Routine is required.");
    	        return;
    	    }

    	  
    	    String userId = (String) request.getSession().getAttribute("user");

    	  
    	    if (userId == null || userId.isEmpty()) {
    	        System.out.println("User ID is required.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
    	        return;
    	    }

    	   
    	    Integer daysToFollow = null;
    	    if (daysToFollowStr != null && !daysToFollowStr.isEmpty()) {
    	        try {
    	            daysToFollow = Integer.parseInt(daysToFollowStr);
    	        } catch (NumberFormatException e) {
    	            System.out.println("Invalid format for Days to Follow.");
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid format for Days to Follow.");
    	            return;
    	        }
    	    }

    	    
    	    HealthPojo up = new HealthPojo();
    	    up.setTrainerName(trainerName);
    	    up.setFoodControlIdeas(foodControlIdeas);
    	    up.setDaysToFollow(daysToFollow); // Set the validated daysToFollow
    	    up.setDailyRoutine(dailyRoutine);
    	    up.setUserId(userId); // Set the userId from session

    	    
    	    HomeDao nuDao = new HomeDao();
    	    boolean isUpdated = nuDao.updateExistinghealth(up); 

    	  
    	    if (isUpdated) {
    	        request.setAttribute("message", "Details updated successfully.");
    	        request.getRequestDispatcher("successpage.jsp").forward(request, response);
    	    } else {
    	        System.out.println("Failed to update details.");
    	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update details.");
    	    }
    	}

       else if(mypath.equals("/trainer/deletehealth")) {
    	   
    	 
   	    String userId = (String) request.getSession().getAttribute("user");

   	    
   	    if (userId == null || userId.isEmpty()) {
   	        System.out.println("User ID is required.");
   	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
   	        return;
   	    }

   	  
   	    HealthPojo up = new HealthPojo();
   	    up.setUserId(userId); 
   	    HomeDao nuDao = new HomeDao();
   	    boolean isDeleted = nuDao.deleteExistinghealth(up); 
   	    if (isDeleted) {
   	        request.setAttribute("message", "Details deleted successfully.");
   	        request.getRequestDispatcher("successpage.jsp").forward(request, response);
   	    } else {
   	        System.out.println("Failed to delete details.");
   	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete details.");
   	    }
    	   
       }
       else if (mypath.equals("/trainer/pdtUpdate")) {
    	    try {
    	        
    	        String trainerName = request.getParameter("trainerName"); // Trainer Name
    	        String productName = request.getParameter("productName"); // Product Name
    	        String productDescription = request.getParameter("productDescription"); // Product Description
    	        String productUse = request.getParameter("productUse"); // Product Use
    	        String shopName = request.getParameter("shopName"); // Shop Name
    	        String productPriceStr = request.getParameter("productPrice"); // Product Price
    	        String productDiscountStr = request.getParameter("productDiscount"); // Product Discount

    	     
    	        if (trainerName == null || trainerName.isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Trainer Name is required.");
    	            return;
    	        }
    	        if (productName == null || productName.isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product Name is required.");
    	            return;
    	        }
    	        if (productDescription == null || productDescription.isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product Description is required.");
    	            return;
    	        }
    	        if (productUse == null || productUse.isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Product Use is required.");
    	            return;
    	        }
    	        if (shopName == null || shopName.isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Shop Name is required.");
    	            return;
    	        }

    	       
    	        Double productPrice = null;
    	        Integer productDiscount = null;

    	        try {
    	            productPrice = Double.parseDouble(productPriceStr);
    	        } catch (NumberFormatException e) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid format for Product Price.");
    	            return;
    	        }

    	        try {
    	            productDiscount = Integer.parseInt(productDiscountStr);
    	        } catch (NumberFormatException e) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid format for Product Discount.");
    	            return;
    	        }

    	        
    	        HttpSession session = request.getSession(false);
    	        if (session == null) {
    	            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User session is not active. Please log in again.");
    	            return;
    	        }

    	        String userId = (String) session.getAttribute("user");
    	        if (userId == null || userId.isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User ID is required.");
    	            return;
    	        }

    	      
    	        ProductPojo product = new ProductPojo();
    	        product.setUserId(userId);
    	        product.setTrainerName(trainerName);
    	        product.setProductName(productName);
    	        product.setProductDescription(productDescription);
    	        product.setProductUse(productUse);
    	        product.setShopName(shopName);
    	        product.setProductPrice(productPrice);
    	        product.setProductDiscount(productDiscount);

    	        
    	        HomeDao pdao = new HomeDao();
    	        boolean isUpdated = pdao.updateProductDetails(product); // Method to update product details

    	       
    	        if (isUpdated) {
    	            request.setAttribute("message", "Details updated successfully.");
    	            request.getRequestDispatcher("successpage.jsp").forward(request, response);
    	        } else {
    	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update details.");
    	        }
    	    } catch (Exception e) {
    	       
    	        e.printStackTrace();
    	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred: " + e.getMessage());
    	    }
    	}
        	
        	
    else if(mypath.equals("/trainer/deletePdt")) {
    	   
    	   
   	    String userId = (String) request.getSession().getAttribute("user");

   	    
   	    if (userId == null || userId.isEmpty()) {
   	        System.out.println("User ID is required.");
   	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
   	        return;
   	    }

   	  
   	    ProductPojo up = new ProductPojo();
   	    up.setUserId(userId); // Set the userId from session

   	   
   	    HomeDao nuDao = new HomeDao();
   	    boolean isDeleted = nuDao.deleteExistingProduct(up); // Method to delete the data

  
   	    if (isDeleted) {
   	        request.setAttribute("message", "Details deleted successfully.");
   	        request.getRequestDispatcher("successpage.jsp").forward(request, response);
   	    } else {
   	        System.out.println("Failed to delete details.");
   	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete details.");
   	    }
    	   
       }
        	
    else if (mypath.equals("/trainer/freeclassUpdate")) {
      
        String trainerName = request.getParameter("trainerName");
        String classTitle = request.getParameter("classTitle");
        String videoLink = request.getParameter("videoLink");
        String classDescription = request.getParameter("classDescription");
        String id = request.getParameter("id"); // Expecting ID as a parameter

       
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required.");
            return;
        }
        if (trainerName == null || trainerName.isEmpty() ||
            classTitle == null || classTitle.isEmpty() ||
            videoLink == null || videoLink.isEmpty() ||
            classDescription == null || classDescription.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "All fields are required.");
            return;
        }

       
        FreeClassPojo classDetails = new FreeClassPojo();
        classDetails.setId(Long.parseLong(id)); // Convert ID to Long
        classDetails.setTrainerName(trainerName);
        classDetails.setClassTitle(classTitle);
        classDetails.setVideoLink(videoLink);
        classDetails.setClassDescription(classDescription);

      
        HomeDao fdao = new HomeDao();
        boolean isUpdated = fdao.updateFreeClassDetails(classDetails);

       
        if (isUpdated) {
            request.setAttribute("message", "Class details updated successfully.");
            request.getRequestDispatcher("successpage.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update class details.");
        }
    }

    else if(mypath.equals("/trainer/deleteFreeClass")) {
       
        String userId = (String) request.getSession().getAttribute("user");

      
        if (userId == null || userId.isEmpty()) {
            System.out.println("User ID is required.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
            return;
        }

        
        FreeClassPojo up = new FreeClassPojo();
        up.setUserId(userId); 
        HomeDao fDao = new HomeDao();
        boolean isDeleted = fDao.deleteExistingClass(up);
        if (isDeleted) {
            request.setAttribute("message", "Details deleted successfully.");
            request.getRequestDispatcher("successpage.jsp").forward(request, response);
        } else {
          
            System.out.println("Failed to delete details.");
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete details.");
        }
    }
    else if (mypath.equals("/user/submitFitnessDetails")) {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        String loggedInUser = (String) session.getAttribute("user");
        System.out.println("Logged-in User: " + loggedInUser);

        try {
           
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String location = request.getParameter("location");
            String fitnessLevel = request.getParameter("fitnessLevel");
            String goal = request.getParameter("goal");
            String healthConditions = request.getParameter("healthConditions");
            double weight = parseDoubleParameter(request.getParameter("weight"));
            double height = parseDoubleParameter(request.getParameter("height"));
            String activityLevel = request.getParameter("activityLevel");
            String dietPreferences = request.getParameter("dietPreferences");
            String exercisePreferences = request.getParameter("exercisePreferences");
            int workoutSchedule =  parseIntParameter(request.getParameter("workoutSchedule"), 0);
            int sleep =  parseIntParameter(request.getParameter("sleep"), 0);
            String motivation = request.getParameter("motivation");
            String communication = request.getParameter("communication");

          
            String userId = (String) session.getAttribute("user");
            if (userId == null || userId.isEmpty()) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User ID is required.");
                return;
            }

           
            UserDetails ud = new UserDetails();
            ud.setName(name);
            ud.setEmail(email);
            ud.setPhone(phone);
            ud.setGender(gender);
            ud.setDob(dob);
            ud.setLocation(location);
            ud.setFitnessLevel(fitnessLevel);
            ud.setGoal(goal);
            ud.setHealthConditions(healthConditions);
            ud.setWeight(weight);
            ud.setHeight(height);
            ud.setActivityLevel(activityLevel);
            ud.setDietPreferences(dietPreferences);
            ud.setExercisePreferences(exercisePreferences);
            ud.setWorkoutSchedule(workoutSchedule);
            ud.setSleep(sleep);
            ud.setMotivation(motivation);
            ud.setCommunication(communication);
            ud.setUserId(userId);

            
            HomeDao homeDao = new HomeDao();

            if (homeDao.isDetailsExists(loggedInUser)) {
                System.out.println("User ID already exists.");
                request.setAttribute("error", "User ID already exists! You can't submit details more than once.");
                request.getRequestDispatcher("errorDetail.jsp").forward(request, response);
                return;  
            } else {
                try {
                    homeDao.saveUser(ud);
                    System.out.println("Details saved successfully.");
                    request.setAttribute("message", "Details added successfully.");
                    request.getRequestDispatcher("Successpage.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while saving details.");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input data.");
        }
    }

    else if (mypath.equals("/user/updatesubmit")) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("error.jsp");
            return;
        }

        String loggedInUser = (String) session.getAttribute("user");
        System.out.println("Logged-in User: " + loggedInUser);

        
        String id = request.getParameter("id");
        Long userId = null;

        try {
            userId = Long.parseLong(id);
        } catch (NumberFormatException e) {
           
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
            return;
        }

      
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String location = request.getParameter("location");
        String fitnessLevel = request.getParameter("fitness_level"); // Corrected parameter name
        String goal = request.getParameter("goal");
        String healthConditions = request.getParameter("health_conditions"); // Corrected parameter name
        double weight = parseDoubleParameter(request.getParameter("weight"));
        double height = parseDoubleParameter(request.getParameter("height"));
        String activityLevel = request.getParameter("activity_level"); // Corrected parameter name
        String dietPreferences = request.getParameter("diet_preferences"); // Corrected parameter name
        String exercisePreferences = request.getParameter("exercise_preferences"); // Corrected parameter name
        int workoutSchedule = parseIntParameter(request.getParameter("workout_schedule"), 0); // Corrected parameter name
        int sleep = parseIntParameter(request.getParameter("sleep"), 0); // Corrected parameter name
        String motivation = request.getParameter("motivation");
        String communication = request.getParameter("communication");

        
        if (loggedInUser == null || loggedInUser.isEmpty()) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "User ID is required.");
            return;
        }

        
        UserDetails ud = new UserDetails();
        ud.setId(userId); 
        ud.setName(name);
        ud.setEmail(email);
        ud.setPhone(phone);
        ud.setGender(gender);
        ud.setDob(dob);
        ud.setLocation(location);
        ud.setFitnessLevel(fitnessLevel);
        ud.setGoal(goal);
        ud.setHealthConditions(healthConditions);
        ud.setWeight(weight);
        ud.setHeight(height);
        ud.setActivityLevel(activityLevel);
        ud.setDietPreferences(dietPreferences);
        ud.setExercisePreferences(exercisePreferences);
        ud.setWorkoutSchedule(workoutSchedule);
        ud.setSleep(sleep);
        ud.setMotivation(motivation);
        ud.setCommunication(communication);
        ud.setUserId(loggedInUser); 

        
        HomeDao fdao = new HomeDao();
        boolean isUpdated = fdao.updateDetails(ud);

        
        if (isUpdated) {
            request.setAttribute("message", "Class details updated successfully.");
            request.getRequestDispatcher("Successpage.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update class details.");
        }
    }

    else if (mypath.equals("/user/deleteDetails")) {
      
        String userId = (String) request.getSession().getAttribute("user");

       
        if (userId == null || userId.isEmpty()) {
            System.out.println("User ID is required.");
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User ID is required.");
            return;
        }

      
        UserDetails up = new UserDetails();
        up.setUserId(userId); 

     
        HomeDao fDao = new HomeDao();
        boolean isDeleted = fDao.deleteExistingdetails(up); 

       
        if (isDeleted) {
            request.setAttribute("message", "Details deleted successfully.");
            request.getRequestDispatcher("Successpage.jsp").forward(request, response);
        } else {
            
            System.out.println("Failed to delete details for userId: " + userId);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete details.");
        }
    }
    else if (mypath.equals("/user/sendMessage")) {
        String contactName = request.getParameter("name");
        String contactEmail = request.getParameter("email");
        String contactMessage = request.getParameter("message");

        
        if (contactName == null || contactName.isEmpty() || 
            contactEmail == null || contactEmail.isEmpty() || 
            contactMessage == null || contactMessage.isEmpty()) {
            System.out.println("Name, email, or message cannot be empty.");
            response.sendRedirect("contact.jsp?error=Please fill in all required fields.");
            return;
        }

        
         
            ContactUser contact = new ContactUser();
            contact.setName(contactName);
            contact.setEmail(contactEmail);
            contact.setMessage(contactMessage);

            
            HomeDao dao1 = new HomeDao();
            try {
				dao1.insertuser(contact);
				
	            response.sendRedirect("Successpage.jsp?success=Message sent successfully.");
			} catch (Exception e) {
				
				e.printStackTrace();
			}

          
       
    }
        	
    else if (mypath.equals("/user/cartProduct")) {
        System.out.println("cartServlet");

        try {
           
            String id = request.getParameter("id");
            String quantity = request.getParameter("quantity");
            String name = request.getParameter("name");
            String shop = request.getParameter("shop");
            String price = request.getParameter("price");
            String userSession = request.getParameter("usersession");
            Part imagePart = request.getPart("image");

        
            if (id == null || name == null || shop == null || price == null || userSession == null || imagePart == null) {
                throw new IllegalArgumentException("Missing required form fields.");
            }

      
            byte[] imageBytes = null;
            if (imagePart.getSize() > 0) {
                try (InputStream inputStream = imagePart.getInputStream()) {
                    imageBytes = inputStream.readAllBytes();
                }
            }

           
            ProductCart cartProduct = new ProductCart();
            cartProduct.setId(Integer.parseInt(id)); // If 'id' is required to set
            cartProduct.setQuantity(Integer.parseInt(quantity)); // Correctly use 'quantity'
            cartProduct.setName(name);
            cartProduct.setShop(shop);
            cartProduct.setPrice(Double.parseDouble(price)); // Correctly set the price
            cartProduct.setUserSession(userSession);
            cartProduct.setImage(imageBytes);

            
            HomeDao pDao = new HomeDao();
            pDao.saveproductcart(cartProduct);

            request.setAttribute("message", "Successfully submitted");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
         
        } catch (IllegalArgumentException e) {
           
            e.printStackTrace(); 
            response.getWriter().println("Invalid input: " + e.getMessage());
        } catch (Exception e) {
           
            e.printStackTrace();
            response.getWriter().println("Error adding product to cart. Please try again.");
        }
    }


    else if (mypath.equals("/admin/adminUpdateServlet")) {
     

       try {
    	   System.out.println("Inside save profile");
           
            Part imagePart = request.getPart("uimage1");
            String id = request.getParameter("id"); 
            String title = request.getParameter("title");
            String update = request.getParameter("update");
            String userId = "jishasree2002@gmail.com";

           
            byte[] imageBytes = null;
            if (imagePart != null && imagePart.getSize() > 0) {
                try (InputStream inputStream = imagePart.getInputStream()) {
                    imageBytes = inputStream.readAllBytes();
                }
            }

          
            AdminPojo sp = new AdminPojo();
            sp.setTitle(title);
            sp.setUpdate(update);
            sp.setUserId(userId);
            sp.setImage(imageBytes);

           
            AdminDao uDao = new AdminDao();
           
            uDao.saveupdate(sp);

       
            request.setAttribute("message", "Successfully submitted");
            request.getRequestDispatcher("success.jsp").forward(request, response);

        } catch (Exception e) {
         
            e.printStackTrace();

           
            response.setContentType("text/html");
            response.getWriter().println("<p>Error submitting form. Please try again later.</p>");
        }
    }
        	

    	else if (mypath.equals("/admin/UpdateAd")) {
    	    try {
    	      
    	        String updateId = request.getParameter("id"); // ID of the item to be updated
    	        String title = request.getParameter("title"); // Title field
    	        String updateContent = request.getParameter("update"); // Update content

    	   
    	        if (title == null || title.trim().isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Title is required.");
    	            return;
    	        }

    	       
    	        Part imagePart = request.getPart("uimage1");
    	        byte[] imageBytes = null;
    	        if (imagePart != null) {
    	           
    	            InputStream inputStream = imagePart.getInputStream();
    	            imageBytes = new byte[inputStream.available()];
    	            inputStream.read(imageBytes);
    	        }

    	       
    	        if (updateId == null || updateId.trim().isEmpty()) {
    	            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Update ID is required.");
    	            return;
    	        }

    	       
    	        AdminPojo updatePojo = new AdminPojo();
    	        updatePojo.setId(Integer.parseInt(updateId));  // Set ID from request
    	        updatePojo.setTitle(title); // Set title
    	        updatePojo.setUpdate(updateContent); // Set update content
    	        updatePojo.setImage(imageBytes); // Set image bytes

    	       
    	        AdminDao homeDao = new  AdminDao();
    	        boolean isUpdated = homeDao.updateExistingAdmin(updatePojo); 

    	      
    	        if (isUpdated) {
    	            request.setAttribute("message", "Details updated successfully.");
    	            request.getRequestDispatcher("success.jsp").forward(request, response);
    	        } else {
    	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update details.");
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while updating details.");
    	    }
    	}

    	else if (mypath.equals("/admin/deleteAdmin")) {
    	    
    	   
    	    String id = request.getParameter("id");

    
    	    if (id == null || id.isEmpty()) {
    	        System.out.println("ID is required to delete the record.");
    	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID is required to delete the record.");
    	        return;
    	    }
    	    
    	   
    	    AdminPojo up = new AdminPojo();
    	    up.setId(Integer.parseInt(id)); 
    	    
    	    
    	    AdminDao fDao = new AdminDao();
    	    boolean isDeleted = fDao.deleteExistingAdmin(up); 
    	    if (isDeleted) {
    	        request.setAttribute("message", "Details deleted successfully.");
    	        request.getRequestDispatcher("success.jsp").forward(request, response);
    	    } else {
    	       
    	        System.out.println("Failed to delete details for id: " + id);
    	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete details.");
    	    }
    	}
    	else if(mypath.equals("/admin/submitAdminDetails")) {
    		
    		       
    		        String name = request.getParameter("name");
    		        String ageStr = request.getParameter("age");
    		        String dobStr = request.getParameter("dob");
    		        String designation = request.getParameter("designation");
    		        String email = request.getParameter("email");
    		        String gender = request.getParameter("gender");
    		        String phone = request.getParameter("phone");

    		        try {
    		         
    		            int age = Integer.parseInt(ageStr);
    		            LocalDate dob = LocalDate.parse(dobStr);

    		            
    		            AdminDetails adminDetails = new AdminDetails();
    		            adminDetails.setName(name);
    		            adminDetails.setAge(age);
    		            adminDetails.setDob(dob);
    		            adminDetails.setDesignation(designation);
    		            adminDetails.setEmail(email);
    		            adminDetails.setGender(gender);
    		            adminDetails.setPhone(phone);

    		            
    		            AdminDao adao = new AdminDao();
    		            boolean isSaved = adao.saveAdminDetails(adminDetails);

    		           
    		            if (isSaved) {
    		                request.setAttribute("message", "Admin details saved successfully!");
    		                request.getRequestDispatcher("success.jsp").forward(request, response);
    		            } else {
    		                request.setAttribute("error", "Failed to save admin details. Please try again.");
    		                request.getRequestDispatcher("error.jsp").forward(request, response);
    		            }
    		        } catch (Exception e) {
    		            e.printStackTrace();
    		            request.setAttribute("error", "Invalid input. Please try again.");
    		            request.getRequestDispatcher("error.jsp").forward(request, response);
    		        }
    		    }
    		
    	else if (mypath.equals("/admin/updateDetail")) {
    	
    	    String id = request.getParameter("id");
    	    String name = request.getParameter("name");
    	    String email = request.getParameter("email");
    	    String designation = request.getParameter("designation");
    	    String dobStr = request.getParameter("dob");
    	    String gender = request.getParameter("gender");
    	    String ageStr = request.getParameter("age");

    	   
    	    System.out.println("Updated details:");
    	    System.out.println("ID: " + id);
    	    System.out.println("Name: " + name);
    	    System.out.println("Email: " + email);
    	    System.out.println("Designation: " + designation);
    	    System.out.println("Dob: " + dobStr);
    	    System.out.println("Gender: " + gender);
    	    System.out.println("Age: " + ageStr);

    	  
    	    int age = Integer.parseInt(ageStr);  
    	    LocalDate dob = LocalDate.parse(dobStr);  

    	   
    	    AdminDetails admin = new AdminDetails();
    	    admin.setId(Long.parseLong(id));  
    	    admin.setName(name);
    	    admin.setEmail(email);
    	    admin.setDesignation(designation);
    	    admin.setDob(dob);
    	    admin.setGender(gender);
    	    admin.setAge(age);

    	   
    	    AdminDao adminDAO = new AdminDao();
    	    boolean isUpdated = adminDAO.updateAdminDetails(admin);

    	    
    	    if (isUpdated) {
    	        response.sendRedirect("success.jsp");  
    	    } else {
    	        response.sendRedirect("error.jsp");  
    	    }
    	}
    	else if (mypath.equals("/trainer/SubmitCredentialsServlet")) {
    	    HttpSession session = request.getSession(false);

    	    if (session == null || session.getAttribute("user") == null) {
    	        response.sendRedirect("errorlogin.jsp"); 
    	        return;
    	    }

    	    String loggedInUser = (String) session.getAttribute("user");
    	    String accountHolder = request.getParameter("accountHolder");
    	    String merchantId = request.getParameter("merchantId");
    	    String publicApiKey = request.getParameter("publicApiKey");
    	    String privateApiKey = request.getParameter("privateApiKey");

    	
    	    String userId = loggedInUser;  

    	   
    	    razorpaypojo rp = new razorpaypojo();
    	    rp.setAccountHolderName(accountHolder);
    	    rp.setMerchantId(merchantId);
    	    rp.setPublicApiKey(publicApiKey);
    	    rp.setPrivateApiKey(privateApiKey);
    	    rp.setUserId(userId);

    	   
    	    HomeDao hm = new HomeDao();

    	    try {
    	        if (hm.isExists(userId)) {
    	            System.out.println("User already exists.");
    	            request.setAttribute("error", "User ID already exists! You can't submit details more than once.");
    	            request.getRequestDispatcher("errorDetail.jsp").forward(request, response);
    	        } else {
    	           
    	            hm.saveCredentials(rp);
    	            request.setAttribute("message", "credentials submitted successfully!");
    	            response.sendRedirect("successpage.jsp");
    	        }
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	        request.setAttribute("error", "An error occurred while saving your details.");
    	        request.getRequestDispatcher("error.jsp").forward(request, response);
    	    }
    	}
    	else if(mypath.equals("/trainer/DeleteCredentialsServlet")) {
    		
    		 String userId = request.getParameter("userId");
    	        
    	     
    	        HomeDao homeDao = new HomeDao();
    	        
    	        try {
    	           
    	            boolean isDeleted = homeDao.deleteCredentials(userId);
    	            
    	            if (isDeleted) {
    	                response.sendRedirect("successpage.jsp"); 
    	            } else {
    	                request.setAttribute("error", "Failed to delete credentials.");
    	                request.getRequestDispatcher("error.jsp").forward(request, response);
    	            }
    	        } catch (Exception e) {
    	            e.printStackTrace();
    	            request.setAttribute("error", "An error occurred while deleting your credentials.");
    	            request.getRequestDispatcher("error.jsp").forward(request, response);
    	        }
    	    }
    	
    	else if (mypath.equals("/user/PaymentServlet")) {
    		  String userId = request.getParameter("userId");
    	        String videoId = request.getParameter("videoId");
    	        String paymentStatus = request.getParameter("paymentStatus");
    	        String paymentId = request.getParameter("paymentId");

    	        HomeDao paymentDao = new HomeDao();
    	        paymentDao.savePayment(userId, videoId, paymentStatus, paymentId);

    	        response.getWriter().write("Payment Recorded Successfully!");
    	    
    	}	
    	
    	else if (mypath.equals("/user/DeleteDetails")) {
        	
    		 String userEmail = request.getParameter("email");
    	        
    	        HomeDao homeDao = new HomeDao();
    	        try {
    	            
    	            boolean success = homeDao.deleteUser(userEmail);
    	            if (success) {
    	                response.sendRedirect("Successpage.jsp"); 
    	            } else {
    	                response.getWriter().println("Error deleting user.");
    	            }
    	        } catch (Exception e) {
    	            e.printStackTrace();
    	            response.getWriter().println("Error: " + e.getMessage());
    	        }
    	    }
        	
    	else if (mypath.equals("/user/productpayment")) {
    	
    		        String userId = request.getParameter("userId");
    		        String productName = request.getParameter("productName");
    		        String shopName = request.getParameter("shopName");
    		        double amount = Double.parseDouble(request.getParameter("amount"));
    		        int quantity = Integer.parseInt(request.getParameter("quantity"));
    		        String userEmail = request.getParameter("userEmail");
    		        String userAddress = request.getParameter("userAddress");
    		        String trainerId = request.getParameter("trainerid");

    		       
    		        ProductPayment payment = new ProductPayment();
    		        payment.setUserId(userId);
    		        payment.setProductName(productName);
    		        payment.setShopName(shopName);
    		        payment.setAmount(amount);
    		        payment.setQuantity(quantity);
    		        payment.setUserId(userId);
    		        payment.setUserAddress(userAddress);
    		        payment.setTrainerId(trainerId);

    		    
    		        HomeDao paymentDao = new HomeDao();
    		        paymentDao.saveProductPayment(payment);

    		        
    		        response.sendRedirect("Successpage.jsp");
    		    }
    		
    	else if (mypath.equals("/user/offerpayment")) {
        	
    		String userId = request.getParameter("userId");
            String trainerName = request.getParameter("TrainerName");
            String title = request.getParameter("title");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String offerSpecification = request.getParameter("offerSpecification");
            String trainerId = request.getParameter("trainerId");
           
            OfferPayment offerPayment = new OfferPayment();
            offerPayment.setUserId(userId);
            offerPayment.setTrainerName(trainerName);
            offerPayment.setTitle(title);
            offerPayment.setAmount(amount);
            offerPayment.setOfferSpecification(offerSpecification);
            offerPayment.setTrainerId(trainerId);
            HomeDao oh = new HomeDao();
            oh.saveOfferPayment(offerPayment);
            
            response.sendRedirect("Successpage.jsp");
    	}
	    	
    	else if (mypath.equals("/user/bookpayment")) {
        	
    		 String userId = request.getParameter("userId");
    	        String trainerName = request.getParameter("trainerName");
    	        String title = request.getParameter("title");
    	        double amount = Double.parseDouble(request.getParameter("amount"));
    	        String date = request.getParameter("date");
    	        String trainerId = request.getParameter("trainerId");
        	
    	        BookPayment booking = new BookPayment(userId, trainerName, title, amount, date, trainerId);
    	        
    	       
    	        HomeDao bookingDao = new HomeDao();
    	        boolean isSaved = bookingDao.saveBooking(booking);
    	        
    	        if (isSaved) {
    	            response.sendRedirect("Successpage.jsp"); 
    	        } else {
    	            response.sendRedirect("error.jsp"); 
    	        }
    	    }
        	
        	
    	
    	else if (mypath.equals("/user/deleteProductCartItem")) {
        	
    		 try {
    	            int id = Integer.parseInt(request.getParameter("id")); 
    	            HomeDao productCartDAO = new HomeDao();
    	            boolean deleted = productCartDAO.deleteProductCartItem(id);
    	            
    	            if (deleted) {
    	                response.sendRedirect("cart.jsp?success=deleted"); 
    	            } else {
    	                response.sendRedirect("error.jsp?error=notfound");
    	            }
    	        } catch (Exception e) {
    	            e.printStackTrace();
    	            response.sendRedirect("error.jsp?error=exception");
    	        }
    	    }
        	
    	else if (mypath.equals("/user/deleteOfferCartItem")) {
    		   try {
    	            long id = Long.parseLong(request.getParameter("id")); 
    	            HomeDao offerCartDAO = new HomeDao();
    	            boolean deleted = offerCartDAO.deleteOfferCartItem(id);
    	            
    	            if (deleted) {
    	                response.sendRedirect("cart.jsp?success=deleted");
    	            } else {
    	                response.sendRedirect("error.jsp?error=notfound");
    	            }
    	        } catch (Exception e) {
    	            e.printStackTrace();
    	            response.sendRedirect("error.jsp?error=exception");
    	        }
    	    }
    	
    	else if (mypath.equals("/user/deleteCartItem")) {
        	
            try {
                int id = Integer.parseInt(request.getParameter("id")); 
                HomeDao cartDAO = new  HomeDao();
                boolean deleted = cartDAO.deleteCartItem(id);
                
                if (deleted) {
                    response.sendRedirect("cart.jsp?success=deleted"); 
                } else {
                    response.sendRedirect("error.jsp?error=notfound");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp?error=exception");
            }
        
    	
        	
    	}
        	
    	else if (mypath.equals("/user/deleteBookPayment")) { 
    	    String bookingIdStr = request.getParameter("bookingId");

    	    if (bookingIdStr != null && !bookingIdStr.isEmpty()) {
    	        try {
    	            Long bookingId = Long.parseLong(bookingIdStr);

    	            HomeDao bookPaymentDao = new HomeDao();
    	            boolean success = bookPaymentDao.deleteBookPayment(bookingId);

    	            if (success) {
    	                response.sendRedirect("library.jsp?success=true");
    	            } else {
    	                response.sendRedirect("error.jsp?error=true");
    	            }
    	        } catch (NumberFormatException e) {
    	            e.printStackTrace();
    	            response.sendRedirect("error.jsp?error=invalid");
    	        }
    	    } else {
    	        response.sendRedirect("error.jsp?error=invalid");
    	    }
    	}
    	else if (mypath.equals("/user/deleteOfferPayment")) { 
    	    String idStr = request.getParameter("offerId"); 

    	    if (idStr != null && !idStr.isEmpty()) {
    	        int id = Integer.parseInt(idStr);
    	        System.out.println("Deleting OfferPayment with ID: " + id); 

    	        HomeDao homeDao = new HomeDao();
    	        boolean success = homeDao.deleteOfferPayment(id);

    	        if (success) {
    	            response.sendRedirect("library.jsp?success=true");
    	        } else {
    	            response.sendRedirect("error.jsp?error=true");
    	        }
    	    } else {
    	        response.sendRedirect("error.jsp?error=invalid");
    	    }
    	}

    	else if (mypath.equals("/user/deleteProductPayment")) { 
    		  
            String paymentIdStr = request.getParameter("paymentId");

            if (paymentIdStr != null && !paymentIdStr.isEmpty()) {
                int paymentId = Integer.parseInt(paymentIdStr);
                
                HomeDao homeDao = new HomeDao();
                boolean success = homeDao.deleteProductPayment(paymentId);

                if (success) {
                    response.sendRedirect("library.jsp?success=true");
                } else {
                    response.sendRedirect("error.jsp?error=true");
                }
            } else {
                response.sendRedirect("error.jsp?error=invalid");
            }
        }
    	
      else {
                System.out.println("Invalid path or missing parameters for update.");
                response.sendRedirect("error.jsp?error=Invalid path or missing parameters for update.");
            }
      }
    }
    /**
     * Parses a string parameter to an integer. Returns the provided default value if the parameter is null, empty, or invalid.
     *
     * @param parameter   The string parameter to parse.
     * @param defaultValue The default value to return in case of invalid or missing input.
     * @return The parsed integer value, or the default value if parsing fails.
     */
    private int parseIntParameter(String parameter, int defaultValue) {
        try {
            if (parameter != null && !parameter.trim().isEmpty()) {
                return Integer.parseInt(parameter.trim());
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid integer parameter: " + parameter);
        }
        return defaultValue;
    }

    /**
     * Parses a string parameter to a double. Returns 0.0 if the parameter is null, empty, or invalid.
     *
     * @param parameter The string parameter to parse.
     * @return The parsed double value, or 0.0 if parsing fails.
     */
    private double parseDoubleParameter(String parameter) {
        try {
            if (parameter != null && !parameter.trim().isEmpty()) {
                return Double.parseDouble(parameter.trim());
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid double parameter: " + parameter);
        }
        return 0.0;
    }

	/**
     * Handles GET requests
     */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				System.out.println("inside get"); 
		        String mypath = request.getServletPath();
		       
		        if (mypath.equals("/trainer/add")) {
					           
					            String loggedInUser = (String) request.getSession().getAttribute("user");
					            if (loggedInUser == null) {
					              
					                response.sendRedirect("errorlogin.jsp");
					                return;
					            }
			
					            HomeDao homedao = new HomeDao();
					            List<BookschedulePojo> bookscheduleList = homedao.getSchedulesByUserId(loggedInUser);
			
					            if (bookscheduleList != null && !bookscheduleList.isEmpty()) {
					                request.setAttribute("bookscheduleList", bookscheduleList);
					            } else {
					                System.out.println("No schedules found for the logged-in user.");
					                request.setAttribute("message", "No schedules found.");
					            }
			
					            RequestDispatcher dispatcher = request.getRequestDispatcher("schedule.jsp");
					            dispatcher.forward(request, response);
		        }


	        else if (mypath.equals("/trainer/update")) {
					            String id = request.getParameter("id");
					    
					            if (id != null && !id.isEmpty()) {
					                try {
					                    int userId = Integer.parseInt(id); 
					                    HomeDao bsDao = new HomeDao();
					                    BookschedulePojo user = bsDao.getUserById(userId);
				
					                    if (user != null) {
					                        request.setAttribute("user", user);
					                        RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
					                        rd.forward(request, response);
					                    } else {
					                        System.out.println("User with ID: " + userId + " not found.");
					                        response.sendRedirect("error.jsp");
					                    }
					                } catch (NumberFormatException e) {
					                    System.out.println("Invalid ID format: " + e.getMessage());
					                    response.sendRedirect("error.jsp");
					                } catch (Exception e) {
					                    System.out.println("An unexpected error occurred: " + e.getMessage());
					                    e.printStackTrace();
					                    response.sendRedirect("error.jsp");
					                }
					            }
	        }
		    else if (mypath.equals("/trainer/upload")) {
			    	
							    	 HttpSession session = request.getSession();
					
							         String loggedInUser = (String) session.getAttribute("user");
					
							         if (loggedInUser == null) {
							            
							             response.sendRedirect("errorlogin.jsp");
							             return;
							         }
							         HomeDao homedao = new HomeDao();
							         
							         List<VideoPojo> videoList = homedao.getAllVideos();
					
							         request.setAttribute("videos", videoList);
					
							         request.getRequestDispatcher("Uploaded.jsp").forward(request, response);
							     }
		    else if (mypath.equals("/trainer/updateVideo")) {
							        try {
							            
							            String id = request.getParameter("uid");
							            
							            if (id == null || id.isEmpty()) {
							                System.out.println("ID parameter is missing or empty.");
							                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing or empty.");
							                return;
							            }
					
							            int userId = Integer.parseInt(id);
							          
							            
							            HomeDao vpDao = new HomeDao();
							            VideoPojo uservp = vpDao.getVideoById(userId);
							           
							         
							            if (uservp != null) {
							                request.setAttribute("uservp", uservp);
							                RequestDispatcher rd = request.getRequestDispatcher("updatevideo.jsp");
							                rd.forward(request, response);
							            } else {
							                System.out.println("User with ID: " + userId + " not found.");
							                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
							            }
							        } catch (NumberFormatException e) {
								            System.out.println("Invalid ID format: " + e.getMessage());
								            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
								        } catch (Exception e) {
								            System.out.println("An unexpected error occurred: " + e.getMessage());
								            e.printStackTrace();
								            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
								        }
		    }
		    else if (mypath.equals("/trainer/EditDetailsServlet")) {
							    	String email = (String) request.getSession().getAttribute("user");  
							    	HomeDao homeDao = new HomeDao();
							    	AddDetailsPojo userDetails = homeDao.getDetailsByEmail(email);
					                System.out.println(userDetails);
							    	
							    	if (userDetails != null) {
							    	
							    	    request.setAttribute("userDetails", userDetails);
							    	    RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateDetails.jsp");
							    	    dispatcher.forward(request, response);
							    	} else {
							    	    
							    	    response.sendRedirect("error.jsp?error=User not found.");
							    	}
							    }
		    else if (mypath.equals("/trainer/Logout")) {
		    	 HttpSession session = request.getSession(false);
		    	 System.out.println("inside logout");
		         if (session != null) {
		          
		             String outTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		             System.out.println("inside logout");
		             session.setAttribute("outTime", outTime);

		           
		             session.invalidate();
		             System.out.println("inside logout");

		            
		             response.sendRedirect("logout.jsp");
		         } else {
		            
		             response.sendRedirect("index.jsp");
		         }
		     }
		    else if (mypath.equals("/user/Logout")) {
		    	 HttpSession session = request.getSession(false);
		    	 System.out.println("inside logout");
		         if (session != null) {
		             
		             String outTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		             System.out.println("inside logout");
		             session.setAttribute("outTime", outTime);

		            
		             session.invalidate();
		             System.out.println("inside logout");

		       
		             response.sendRedirect("Logout.jsp");
		         } else {
		            
		             response.sendRedirect("error.jsp");
		         }
		     }
		    else if (mypath.equals("/user/userhome")) {
		        Udao udao = new Udao();
		        System.out.println("DAO Initialized: " + udao);

		        List<VideoPojo> videos = null;
		        try {
		            System.out.println("inside try");
		            videos = udao.getAllVideoUploaded();

		           
		            if (videos != null) {
		                for (VideoPojo video : videos) {
		                    String thumbnailPath = video.getThumbnail();
		                    if (thumbnailPath != null) {
		                      
		                        String thumbnailFileName = thumbnailPath.substring(thumbnailPath.lastIndexOf("\\") + 1);
		                        System.out.println(thumbnailFileName); 

		                       
		                        video.setThumbnail(thumbnailFileName);
		                    }
		                }
		            }

		        } catch (Exception e) {
		            e.printStackTrace();
		            request.setAttribute("errorMessage", "Error fetching videos: " + e.getMessage());
		        }

		        
		        request.setAttribute("videos", videos);

		  
		        RequestDispatcher dispatcher = request.getRequestDispatcher("homepage.jsp");
		        dispatcher.forward(request, response);
		    }
		    else if(mypath.equals("/trainer/viewingprofile")) {
		    	System.out.println("inside servlet");
		    	HomeDao homeDao = new HomeDao();
		        List<ViewProfilePojo> profiles = homeDao.getAllProfile();
		      
		        request.setAttribute("profiles", profiles);
		       
		        request.getRequestDispatcher("ViewLoad.jsp").forward(request, response);
		    }
		    else if (mypath.equals("/trainer/uploadUpdates")) {
		        System.out.println("inside uploadUpdates");
		        HttpSession session = request.getSession();

		        String loggedInUser = (String) session.getAttribute("user");

		        if (loggedInUser == null) {
		           
		            response.sendRedirect("errorlogin.jsp");
		            return; 
		        }

		        try {
		            HomeDao homedao = new HomeDao();

		          
		            List<NewUpdatePojo> updatesList = homedao.getAllUpdates();

		            
		            request.setAttribute("updates", updatesList);

		            
		            request.getRequestDispatcher("ViewNewUpdates.jsp").forward(request, response);

		        } catch (Exception e) {
		            System.out.println("Error while fetching updates: " + e.getMessage());
		            e.printStackTrace();
		          
		            response.sendRedirect("error.jsp");
		        }
		    }

		    else if (mypath.equals("/trainer/updateNew")) {
		        try {
		           
		            String id = request.getParameter("classId");

		           
		            if (id == null || id.trim().isEmpty()) {
		                System.out.println("ID parameter is missing or empty.");
		                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing or empty.");
		                return;
		            }

		            int userId;
		            try {
		               
		                userId = Integer.parseInt(id);
		            } catch (NumberFormatException e) {
		                System.out.println("Invalid ID format: " + e.getMessage());
		                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
		                return;
		            }

		            
		            HomeDao uDao = new HomeDao();
		            NewUpdatePojo usernew = uDao.getUpdateById(userId);

		         
		            if (usernew != null) {
		               
		                request.setAttribute("uservp", usernew); 

		                
		                RequestDispatcher rd = request.getRequestDispatcher("UpdatingUpdates.jsp");
		                rd.forward(request, response);
		            } else {
		                
		                System.out.println("User with ID: " + userId + " not found.");
		                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
		            }
		        } catch (Exception e) {
		           
		            System.out.println("An unexpected error occurred: " + e.getMessage());
		            e.printStackTrace();
		            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
		        }
		    }
		        
		    else if (mypath.equals("/trainer/uploadHealth")) {
		        
		        HttpSession session = request.getSession();

		        String loggedInUser = (String) session.getAttribute("user");

		        if (loggedInUser == null) {
		         
		            response.sendRedirect("errorlogin.jsp");
		            return; 
		        }

		        try {
		            HomeDao homedao = new HomeDao();

		           
		            List<HealthPojo> healthList = homedao.getAllHealth();

		          
		            request.setAttribute("health", healthList);

		         
		            request.getRequestDispatcher("ViewHealth.jsp").forward(request, response);

		        } catch (Exception e) {
		            System.out.println("Error while fetching updates: " + e.getMessage());
		            e.printStackTrace();
		         
		            response.sendRedirect("error.jsp");
		        }
		    }
		    else if (mypath.equals("/trainer/updatehealth")) {
		        try {
		            
		            String id = request.getParameter("id");

		            System.out.println(id);
		            if (id == null || id.trim().isEmpty()) {
		                System.out.println("ID parameter is missing or empty.");
		                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing or empty.");
		                return;
		            }

		            int userId;
		            try {
		               
		                userId = Integer.parseInt(id);
		            } catch (NumberFormatException e) {
		                System.out.println("Invalid ID format: " + e.getMessage());
		                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
		                return;
		            }

		           
		            HomeDao uDao = new HomeDao();
		            HealthPojo userhealth = uDao.getHealthById(userId);
		            System.out.println(userhealth);
		           
		            if (userhealth != null) {
		               
		                request.setAttribute("uservp", userhealth); 

		               
		                RequestDispatcher rd = request.getRequestDispatcher("/trainer/UpdatingHealth.jsp");
		                rd.forward(request, response);
		            } else {
		             
		                System.out.println("User with ID: " + userId + " not found.");
		                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
		            }
		        } catch (Exception e) {
		            
		            System.out.println("An unexpected error occurred: " + e.getMessage());
		            e.printStackTrace();
		            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
		        }
		    }
    else if (mypath.equals("/trainer/uploadProduct")) {
		        
		        HttpSession session = request.getSession();

		        String loggedInUser = (String) session.getAttribute("user");

		        if (loggedInUser == null) {
		          
		            response.sendRedirect("errorlogin.jsp");
		            return; 
		        }

		        try {
		            HomeDao homedao = new HomeDao();

		            
		            List<ProductPojo> pList = homedao.getAllHealth();

		            
		            request.setAttribute("product", pList);

		           
		            request.getRequestDispatcher("ViewProduct.jsp").forward(request, response);

		        } catch (Exception e) {
		            System.out.println("Error while fetching updates: " + e.getMessage());
		            e.printStackTrace();
		            
		            response.sendRedirect("error.jsp");
		        }
		    }

    else if (mypath.equals("/trainer/updatePdt")) {
    	 try {
	            
	            String id = request.getParameter("id");

	            System.out.println(id);
	            if (id == null || id.trim().isEmpty()) {
	                System.out.println("ID parameter is missing or empty.");
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing or empty.");
	                return;
	            }

	            int userId;
	            try {
	             
	                userId = Integer.parseInt(id);
	            } catch (NumberFormatException e) {
	                System.out.println("Invalid ID format: " + e.getMessage());
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
	                return;
	            }

	        
	            HomeDao pDao = new HomeDao();
	            ProductPojo userproduct = pDao.getProductById(userId);
	           
	          
	            if (userproduct != null) {
	               
	                request.setAttribute("uservp", userproduct); 

	               
	                RequestDispatcher rd = request.getRequestDispatcher("/trainer/UpdatingProduct.jsp");
	                rd.forward(request, response);
	            } else {
	               
	                System.out.println("User with ID: " + userId + " not found.");
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
	            }
	        } catch (Exception e) {
	           
	            System.out.println("An unexpected error occurred: " + e.getMessage());
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
	        }
	    }
		        
		        
    else if (mypath.equals("/trainer/uploadLiveClass")) {
        
        HttpSession session = request.getSession();

        String loggedInUser = (String) session.getAttribute("user");

        if (loggedInUser == null) {
           
            response.sendRedirect("errorlogin.jsp");
            return;  
        }

        try {
            HomeDao homedao = new HomeDao();

       
            List<FreeClassPojo> fList = homedao.getAllFreeClass();

           
            request.setAttribute("freeclass", fList);

           
            request.getRequestDispatcher("ViewFreeClass.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error while fetching updates: " + e.getMessage());
            e.printStackTrace();
          
            response.sendRedirect("error.jsp");
        }
    }
		        
		        
    else if (mypath.equals("/trainer/updateFreeClass")) {
   	 try {
	            
	            String id = request.getParameter("id");

	            System.out.println(id);
	            if (id == null || id.trim().isEmpty()) {
	                System.out.println("ID parameter is missing or empty.");
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing or empty.");
	                return;
	            }

	            int userId;
	            try {
	             
	                userId = Integer.parseInt(id);
	            } catch (NumberFormatException e) {
	                System.out.println("Invalid ID format: " + e.getMessage());
	                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
	                return;
	            }

	          
	            HomeDao fDao = new HomeDao();
	            FreeClassPojo freeclass = fDao.getFreeClassById(userId);
	           
	            
	            if (freeclass != null) {
	                
	                request.setAttribute("classDetails", freeclass); 

	            
	                RequestDispatcher rd = request.getRequestDispatcher("/trainer/UpdatingClass.jsp"); 
	                rd.forward(request, response);
	            } else {
	               
	                System.out.println("User with ID: " + userId + " not found.");
	                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
	            }
	        } catch (Exception e) {
	           
	            System.out.println("An unexpected error occurred: " + e.getMessage());
	            e.printStackTrace();
	            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
	        }
	    }
		        
		                
    else if (mypath.equals("/user/viewDetails")) {
        
        HttpSession session = request.getSession();

        
        String loggedInUser = (String) session.getAttribute("user");

        
        if (loggedInUser == null) {
            
            response.sendRedirect("errorlogin.jsp");
            return; 
        }

        try {
            
            HomeDao homedao = new HomeDao();

            
            List<UserDetails> uList = homedao.getAllDetails1();

            
            request.setAttribute("details", uList);

           
            request.getRequestDispatcher("ViewDetail.jsp").forward(request, response);

        } catch (Exception e) {
            
            System.err.println("Error while fetching user details: " + e.getMessage());
            e.printStackTrace();

            
            response.sendRedirect("error.jsp");
        }
    }

		            
		        
	    else if (mypath.equals("/user/updateDetails")) {
	   	 try {
		            
		            String id = request.getParameter("id");

		            System.out.println(id);
		            if (id == null || id.trim().isEmpty()) {
		                System.out.println("ID parameter is missing or empty.");
		                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing or empty.");
		                return;
		            }

		            int userId;
		            try {
		            
		                userId = Integer.parseInt(id);
		            } catch (NumberFormatException e) {
		                System.out.println("Invalid ID format: " + e.getMessage());
		                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format.");
		                return;
		            }

		        
		            HomeDao dDao = new HomeDao();
		            UserDetails details = dDao.getDetailsById(userId);
		           
		            
		            if (details != null) {
		            
		                request.setAttribute("Details", details); 

		             
		                RequestDispatcher rd = request.getRequestDispatcher("/user/UpdateDet.jsp");
		                rd.forward(request, response);
		            } else {
		               
		                System.out.println("User with ID: " + userId + " not found.");
		                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found.");
		            }
		        } catch (Exception e) {
		        
		            System.out.println("An unexpected error occurred: " + e.getMessage());
		            e.printStackTrace();
		            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
		        }
		    }
	    else if (mypath.equals("/admin/uploadadmin")) {
	    	try {
	    	    AdminDao homedao = new AdminDao();

	    	  
	    	    List<AdminPojo> updatesList = homedao.getAdminUpdates();

	    	    if (updatesList != null && !updatesList.isEmpty()) {
	    	        
	    	        request.setAttribute("updates", updatesList);

	    	        
	    	        request.getRequestDispatcher("AdminUpdates.jsp").forward(request, response);
	    	    } else {
	    	     
	    	        response.sendRedirect("noUpdates.jsp");
	    	    }

	    	} catch (Exception e) {
	    	    System.out.println("Error while fetching updates: " + e.getMessage());
	    	    e.printStackTrace();
	    	  
	    	    response.sendRedirect("error.jsp");
	    	} finally {
	    	   
	    	}
	    }
	    else if (mypath.equals("/admin/updateAdmin")) {
	    	System.out.println("admin");
	    	  String id = request.getParameter("id");

	          if (id == null || id.trim().isEmpty()) {
	              response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID parameter is missing.");
	              return;
	          }

	          int updateId = Integer.parseInt(id); 

	          AdminDao adminDao = new AdminDao();
	          AdminPojo adminPojo = adminDao.getAdminUpdateById(updateId);
              System.out.println(adminPojo);
	          
	          if (adminPojo != null) {
	              request.setAttribute("updateDetails", adminPojo);
	              RequestDispatcher rd = request.getRequestDispatcher("UpdatingAdmin.jsp");
	              rd.forward(request, response);
	          } else {
	              response.sendError(HttpServletResponse.SC_NOT_FOUND, "Update not found.");
	          }
	      }
		        
	    else if (mypath.equals("/admin/adminView")) {
	        try {
	            
	            AdminDao adminDao = new AdminDao();

	           
	            List<AdminDetails> detailsList = adminDao.getAdminDetails();

	            if (detailsList != null && !detailsList.isEmpty()) {
	              
	                request.setAttribute("detailsList", detailsList);

	              
	                request.getRequestDispatcher("AdminDetails.jsp").forward(request, response);
	            } else {
	               
	                request.setAttribute("message", "No admin details available.");
	                request.getRequestDispatcher("noUpdates.jsp").forward(request, response);
	            }

	        } catch (Exception e) {
	            
	            System.err.println("Error while fetching admin details: " + e.getMessage());
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        } 
	    }

    
    else if (mypath.equals("/trainer/ViewCredentialsServlet")) {
        HttpSession session = request.getSession(false);

      
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("errorlogin.jsp"); 
            return;
        }

 
        String userId = (String) session.getAttribute("user");

        if (userId == null || userId.trim().isEmpty()) {
            request.setAttribute("error", "Invalid user session. Please log in again.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

      
        HomeDao homeDao = new HomeDao();
        razorpaypojo rp = homeDao.getCredentialsByUserId(userId);

        if (rp != null) {
            request.setAttribute("razorpayDetails", rp);
            request.getRequestDispatcher("credentials.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "No credentials found for this user.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
		        
		        
    else if (mypath.equals("/admin/SubmitCredentialsServlet")) {
	    HttpSession session = request.getSession(false);

	   

	    String loggedInUser = (String) session.getAttribute("user");
	    String accountHolder = request.getParameter("accountHolder");
	    String merchantId = request.getParameter("merchantId");
	    String publicApiKey = request.getParameter("publicApiKey");
	    String privateApiKey = request.getParameter("privateApiKey");

	   
	    String userId = loggedInUser;  

	   
	    razorpaypojo rp = new razorpaypojo();
	    rp.setAccountHolderName(accountHolder);
	    rp.setMerchantId(merchantId);
	    rp.setPublicApiKey(publicApiKey);
	    rp.setPrivateApiKey(privateApiKey);
	    rp.setUserId(userId);

	 
	    HomeDao hm = new HomeDao();

	    try {
	        if (hm.isExists(userId)) {
	            System.out.println("User already exists.");
	            request.setAttribute("error", "User ID already exists! You can't submit details more than once.");
	            request.getRequestDispatcher("errorDetail.jsp").forward(request, response);
	        } else {
	            
	            hm.saveCredentials(rp);
	            request.setAttribute("message", "credentials submitted successfully!");
	            response.sendRedirect("success.jsp");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("error", "An error occurred while saving your details.");
	        request.getRequestDispatcher("error.jsp").forward(request, response);
	    }
	}

    
		    
    }
}

    




