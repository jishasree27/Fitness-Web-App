package training.pack.Tdao;

import org.hibernate.SessionFactory;


import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.hibernate.usertype.UserType;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import com.fsession.SessionProvider;
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
import User.pack.Pojo.BookPayment;
import  User.pack.Pojo.Bookings;
import User.pack.Pojo.CartPojo;
import User.pack.Pojo.ContactUser;
import User.pack.Pojo.OfferCart;
import User.pack.Pojo.OfferPayment;
import User.pack.Pojo.Paymentpojo;
import User.pack.Pojo.ProductCart;
import User.pack.Pojo.ProductPayment;
import User.pack.Pojo.SaveProfilePojo;
import User.pack.Pojo.UserDetails;



public class HomeDao<Trainer> {
	 public void insertDetails(AddDetailsPojo details) throws Exception {
				        Transaction transaction = null;
			
				        try (Session session = new Configuration().configure().buildSessionFactory().openSession()) {
				            transaction = session.beginTransaction();
				            session.save(details); 
				            transaction.commit();
				        } catch (Exception e) {
				            if (transaction != null) {
				                transaction.rollback();
				            }
				            throw e; 
				        }
				    }


	 public void insertSchedule(BookschedulePojo bs) {
					   
					    Transaction transaction = null;
			
				        try (Session session = new Configuration().configure().buildSessionFactory().openSession()) {
				            transaction = session.beginTransaction();
				            session.save(bs); 
				            transaction.commit();
				        } catch (Exception e) {
				            if (transaction != null) {
				                transaction.rollback();
				            }
				            throw e; 
				        }
					}

	 public List<BookschedulePojo> getAllschedule() {
						    
						    SessionFactory factory = SessionProvider.provideSessionFactory();
						    Session session = null;
						    List<BookschedulePojo> bookscheduleList = new ArrayList<>();
				
						    try {
						        session = factory.openSession();
						        NativeQuery<BookschedulePojo> query = session.createNativeQuery("SELECT * FROM bookschedule", BookschedulePojo.class);
						        bookscheduleList = query.getResultList(); 
						       
						    } catch (Exception e) {
						        e.printStackTrace();
						       
						    } finally {
						        if (session != null) {
						            session.close(); 
						        }
						    }
						    return bookscheduleList;
						}
					
	   public List<BookschedulePojo> getSchedulesByUserId(String userId) {
					        List<BookschedulePojo> schedules = null;
					        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
					            Query<BookschedulePojo> query = session.createQuery(
					                "FROM BookschedulePojo WHERE userId = :userId", BookschedulePojo.class);
					            query.setParameter("userId", userId);
					            schedules = query.getResultList();
					        } catch (Exception e) {
					            e.printStackTrace();
					        }
					        return schedules;
					    }

		 public void scheduleupdate(BookschedulePojo updatedbs) {
			   
						    Transaction transaction = null;
						    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						        transaction = session.beginTransaction();
						        BookschedulePojo existingbs = session.get(BookschedulePojo.class, updatedbs.getId());
						        if (existingbs != null) {
						            existingbs.setDate(updatedbs.getDate());
						            existingbs.setFromTime(updatedbs.getFromTime());
						            existingbs.setToTime(updatedbs.getToTime());
						            existingbs.setAmount(updatedbs.getAmount());
						            session.update(existingbs);
						            transaction.commit();
						            
						        } else {
						            System.out.println("User with ID: " + updatedbs.getId() + " not found.");
						        }
						    } catch (Exception e) {
						        if (transaction != null) {
						            transaction.rollback();
						        }
						        e.printStackTrace();
						        System.out.println("Failed to update user.");
						    }
						}
			
					
		 public void scheduledelete(int id) {
						    Transaction transaction = null;
			
						    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						        transaction = session.beginTransaction();
			
						        // Correct usage of class type
						        BookschedulePojo bs = session.get(BookschedulePojo.class, id);
			
						        if (bs != null) {
						            session.delete(bs);
						            transaction.commit();
						            System.out.println("User with ID " + id + " deleted successfully.");
						        } else {
						            System.out.println("User with ID " + id + " not found.");
						        }
						    } catch (Exception e) {
						        if (transaction != null) {
						            transaction.rollback();
						        }
						        e.printStackTrace();
						        System.out.println("Failed to delete user with ID " + id + " due to an error: " + e.getMessage());
						    }
						}
		 BookschedulePojo bs=new BookschedulePojo();
		 public BookschedulePojo getUserById(int userId) {
						        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						            bs = session.get(BookschedulePojo.class, userId);
						        } catch (Exception e) {
						            e.printStackTrace();
						        }
						        return bs;
						    }
		 public boolean saveVideoDetails(VideoPojo videoPojo) {
							    Transaction transaction = null;
							    try (Session session = new Configuration().configure().buildSessionFactory().openSession()) {
							        transaction = session.beginTransaction();
							        session.save(videoPojo);
							        transaction.commit();
							        return true;
							    } catch (Exception e) {
							        if (transaction != null) {
							            try {
							                transaction.rollback(); // Rollback transaction on error
							            } catch (Exception rollbackEx) {
							                rollbackEx.printStackTrace();
							            }
							        }
							        e.printStackTrace();
							        return false;
							    }
							}
		 public List<VideoPojo> getAllVideos() {
						        // Get the current session and begin transaction
						        try (Session session = SessionProvider.provideSessionFactory().getCurrentSession()) {
				
						            // Start a transaction (optional if using getCurrentSession())
						            session.beginTransaction();
				
						            // Create a query to fetch all videos
						            Query<VideoPojo> query = session.createQuery("from VideoPojo", VideoPojo.class);
				
						            // Execute the query and get the list of videos
						            List<VideoPojo> videoList = query.getResultList();
				
						            // Commit the transaction
						            session.getTransaction().commit();
				
						            return videoList;
						        } catch (Exception e) {
						            e.printStackTrace();
						            return null;
						        }
						    }


		 public boolean videoupdate(VideoPojo vp) {
						     Transaction transaction = null;
						     try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						         // Start the transaction
						         transaction = session.beginTransaction();
				
						         // Fetch the existing video record
						         VideoPojo existingvp = session.get(VideoPojo.class, vp.getId());
						         
						         if (existingvp != null) {
						             // Update the fields
						             existingvp.setTitle(vp.getTitle());
						             existingvp.setThumbnail(vp.getThumbnail());
						             existingvp.setVideo(vp.getVideo());
						             existingvp.setName(vp.getName());
						             existingvp.setSpecification(vp.getSpecification());
						             existingvp.setMessage(vp.getMessage());
						             existingvp.setDetails(vp.getDetails());
						             existingvp.setDate(vp.getDate());
						             existingvp.setFtime(vp.getFtime());
						             existingvp.setTtime(vp.getTtime());
						             existingvp.setPaymentDetails(vp.getPaymentDetails());
						             existingvp.setOffer(vp.getOffer());
						             existingvp.setOfferName(vp.getOfferName());
						             existingvp.setOfferValid(vp.getOfferValid());
						             // Save the updated entity
						             session.update(existingvp);
						             transaction.commit(); // Commit the transaction
						             System.out.println("Video with ID: " + vp.getId() + " updated successfully.");
						             return true; // Indicate successful update
						         } else {
						             System.out.println("Video with ID: " + vp.getId() + " not found.");
						             return false; // Indicate that video was not found
						         }
						     } catch (Exception e) {
						         // Roll back the transaction in case of failure
						         if (transaction != null) {
						             transaction.rollback();
						         }
						         e.printStackTrace();
						         System.out.println("Failed to update video with ID: " + vp.getId());
						         return false; // Indicate failure
						     }
						 }

			    public VideoPojo getUserId(int userId) {
					        VideoPojo vp = null; 
					        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
					            // Fetch VideoPojo by its ID, assuming it's VideoPojo you want
					            vp = session.get(VideoPojo.class, userId);
					        } catch (Exception e) {
					            e.printStackTrace();
					        }
					        return vp;
					    }

			
			    public VideoPojo getVideoById(int videoId) {
					        VideoPojo video = null;
					        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
					            
					            Query<VideoPojo> query = session.createQuery("FROM VideoPojo WHERE id = :videoId", VideoPojo.class);
					            query.setParameter("videoId", videoId);
					            List<VideoPojo> videoList = query.getResultList();
					            
					            if (videoList != null && !videoList.isEmpty()) {
					                video = videoList.get(0);
					            }
					        } catch (Exception e) {
					            e.printStackTrace();
					        }
					        return video; 
					    }
					
		 public void videodelete(int id) {
					    Transaction transaction = null;
		
					    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
					        transaction = session.beginTransaction();
		
					        // Correct usage of class type
					        VideoPojo vp = session.get(VideoPojo.class, id);
		
					        if (vp != null) {
					            session.delete(vp);
					            transaction.commit();
					            System.out.println("User with ID " + id + " deleted successfully.");
					        } else {
					            System.out.println("User with ID " + id + " not found.");
					        }
					    } catch (Exception e) {
					        if (transaction != null) {
					            transaction.rollback();
					        }
					        e.printStackTrace();
					        System.out.println("Failed to delete user with ID " + id + " due to an error: " + e.getMessage());
					    }
					}
		
		 public void contactInsert(ContactPojo contact) throws Exception {
		        Transaction transaction = null;
	
		        try (Session session = new Configuration().configure().buildSessionFactory().openSession()) {
		            transaction = session.beginTransaction();
		            session.save(contact); 
		            transaction.commit();
		        } catch (Exception e) {
		            if (transaction != null) {
		                transaction.rollback();
		            }
		            throw e; 
		        }
		    }  
		 public AddDetailsPojo getDetailsByEmail(String email) {
		        AddDetailsPojo userDetails = null;
		        
		        // Start a Hibernate session
		        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
		            // Create the query to fetch user details based on email
		            Query<AddDetailsPojo> query = session.createQuery(
		                    "FROM AddDetailsPojo WHERE email = :email", AddDetailsPojo.class);
		            query.setParameter("email", email);  // Bind the email parameter
		            
		            // Fetch the user details (returns a single result)
		            userDetails = query.uniqueResult();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        
		        return userDetails;
		    }
		 public boolean updateUserDetails(AddDetailsPojo details) {
			    Transaction transaction = null;
			    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
			        // Start a new transaction
			        transaction = session.beginTransaction();

			        // HQL query to find the entity by email
			        String hql = "FROM AddDetailsPojo WHERE email = :email";
			        AddDetailsPojo existingDetails = (AddDetailsPojo) session.createQuery(hql)
			                                                                 .setParameter("email", details.getEmail())
			                                                                 .uniqueResult();

			        // If no user is found with the provided email
			        if (existingDetails == null) {
			            System.out.println("No entity found with the provided email.");
			            return false;
			        }

			        // Updating the fields from the provided details
			        existingDetails.setName(details.getName());              // Set name
			        existingDetails.setEmail(details.getEmail());            // Set email
			        existingDetails.setContact(details.getContact());        // Set contact
			        existingDetails.setType(details.getType());              // Set user type
			        existingDetails.setQualification(details.getQualification()); // Set qualification
			        existingDetails.setExpertise(details.getExpertise());    // Set expertise
			        existingDetails.setSpecification(details.getSpecification()); // Set specification
			        existingDetails.setPhoto(details.getPhone()); 
			        existingDetails.setPhoto(details.getAddress()); 
			        existingDetails.setPhoto(details.getJoinedOn()); 
			        existingDetails.setPhoto(details.getPhoto());            // Set photo URL or data
			        existingDetails.setMessage(details.getMessage());        // Set message

			        // Perform the update
			        session.update(existingDetails);
			        transaction.commit();
			        return true;
			    } catch (Exception e) {
			        // Rollback the transaction if there is any error
			        if (transaction != null) {
			            transaction.rollback();
			        }
			        e.printStackTrace();
			        return false;  // Return false if there was an exception
			    }
			}


		 public List<AddDetailsPojo> getAllDetails() {
		        List<AddDetailsPojo> userDetailsList = null;
		        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
		            Query<AddDetailsPojo> query = session.createQuery("FROM AddDetailsPojo", AddDetailsPojo.class);
		            userDetailsList = query.getResultList();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return userDetailsList;
		    }
		 public boolean isDetailExists(String userId) {
			    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
			        
			        // Use CriteriaBuilder and CriteriaQuery for a more flexible query
			        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			        CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
			        Root<AddDetailsPojo> root = criteriaQuery.from(AddDetailsPojo.class);  // Use AddDetailsPojo as the entity class
			        
			        // Create a predicate for the condition
			        Predicate predicate = criteriaBuilder.equal(root.get("userId"), userId);  // Reference the field name userId
			        criteriaQuery.select(criteriaBuilder.count(root)).where(predicate);
			        
			        // Execute the query and get the count
			        Long count = session.createQuery(criteriaQuery).getSingleResult();
			        
			        return count > 0; // Return true if a record exists with the same userId
			    } catch (Exception e) {
			        e.printStackTrace();
			        return false; // Handle exception and return false if any error occurs
			    }
			}
		 public void saveTrainerProfile(ViewProfilePojo profile) throws Exception {
			    Transaction transaction = null;
			    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
			        transaction = session.beginTransaction();
			        session.save(profile); // Save the profile object to the database
			        transaction.commit();
			        System.out.println("Profile saved successfully: " + profile);
			    } catch (Exception e) {
			        if (transaction != null) {
			            transaction.rollback(); // Rollback in case of an error
			        }
			        // Log the exception with a detailed message
			        System.err.println("Error saving profile: " + e.getMessage());
			        e.printStackTrace(); // Print the stack trace for better debugging
			        throw e; // Rethrow the exception to propagate it up
			    }
			}

		 public List<ViewProfilePojo> getAllProfile() {
			    Session session = null;
			    Transaction transaction = null;
			    List<ViewProfilePojo> profiles = new ArrayList<>();
			    try {
			        session = SessionProvider.provideSessionFactory().openSession();
			        transaction = session.beginTransaction();
			        profiles = session.createQuery("FROM ViewProfilePojo", ViewProfilePojo.class).list();
			        transaction.commit();
			    } catch (Exception e) {
			        if (transaction != null) {
			            transaction.rollback();
			        }
			        e.printStackTrace();
			    } finally {
			        if (session != null) {
			            session.close();
			        }
			    }
			    return profiles;
			}

		 public boolean isProfileExists(String userId) {
			    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
			        
			        // Use CriteriaBuilder and CriteriaQuery for a more flexible query
			        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
			        CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
			        Root<ViewProfilePojo> root = criteriaQuery.from(ViewProfilePojo.class);  // Use AddDetailsPojo as the entity class
			        
			        // Create a predicate for the condition
			        Predicate predicate = criteriaBuilder.equal(root.get("userId"), userId);  // Reference the field name userId
			        criteriaQuery.select(criteriaBuilder.count(root)).where(predicate);
			        
			        // Execute the query and get the count
			        Long count = session.createQuery(criteriaQuery).getSingleResult();
			        
			        return count > 0; // Return true if a record exists with the same userId
			    } catch (Exception e) {
			        e.printStackTrace();
			        return false; // Handle exception and return false if any error occurs
			    }
			}


		 public boolean updateTrainerProfile(ViewProfilePojo profile) {
			    boolean isUpdated = false;
			    Session session = SessionProvider.provideSessionFactory().openSession();
			    Transaction transaction = null;
			    try {
			        transaction = session.beginTransaction();
			        
			        // Fix the parameter name to match the field in the entity
			        String hql = "FROM ViewProfilePojo WHERE userId = :userId";  // Corrected here
			        ViewProfilePojo existingProfile = (ViewProfilePojo) session.createQuery(hql)
			                .setParameter("userId", profile.getUserId())  // Fixed parameter name here
			                .uniqueResult();
			        
			        System.out.println(existingProfile); // Check if existing profile is found
			        
			        if (existingProfile != null) {
			            existingProfile.setName(profile.getName());
			            existingProfile.setDetails(profile.getDetails());
			            existingProfile.setDate(profile.getDate());
			            existingProfile.setFtime(profile.getFtime());
			            existingProfile.setTtime(profile.getTtime());
			            existingProfile.setPaymentDetails(profile.getPaymentDetails());
			            existingProfile.setOffer(profile.getOffer());

			            // Update image if new one is provided
			            if (profile.getImage() != null && profile.getImage().length > 0) {
			                existingProfile.setImage(profile.getImage());
			            }

			            session.update(existingProfile);  // Update the existing profile in the database
			            transaction.commit();
			            isUpdated = true;
			        } else {
			            System.out.println("No profile found with userId: " + profile.getUserId());  // Debugging line
			        }

			    } catch (Exception e) {
			        if (transaction != null) {
			            transaction.rollback();
			        }
			        e.printStackTrace();
			    } finally {
			        session.close();
			    }
			    return isUpdated;
			}
 
		 public boolean deleteProfileByUserId(String userId) {
		        Transaction transaction = null;
		        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
		            transaction = session.beginTransaction();

		            String hql = "DELETE FROM ViewProfilePojo WHERE userId = :userId";
		            int result = session.createQuery(hql)
		                    .setParameter("userId", userId)
		                    .executeUpdate();

		            if (result > 0) {
		                transaction.commit();
		                return true;
		            } else {
		                if (transaction != null) transaction.rollback();
		                return false;
		            }
		        } catch (Exception e) {
		            if (transaction != null) transaction.rollback();
		            e.printStackTrace();
		            return false;
		        }
		 }
		 public List<ViewProfilePojo> getProfilesWithVideos(String userId) {
			    Session session = SessionProvider.provideSessionFactory().openSession();
			    Transaction transaction = null;
			    List<ViewProfilePojo> profileList = null;

			    try {
			        transaction = session.beginTransaction();

			        // Updated HQL query to ensure the userId from both tables matches
			        String hql = "SELECT DISTINCT vp " +
			                     "FROM ViewProfile vp " +
			                     "LEFT JOIN FETCH vp.videos v " +
			                     "WHERE vp.userId = :userId AND v.userId = :userId";

			        Query<ViewProfilePojo> query = session.createQuery(hql, ViewProfilePojo.class);
			        query.setParameter("userId", userId);

			        profileList = query.getResultList();

			        transaction.commit();
			    } catch (Exception e) {
			        if (transaction != null) transaction.rollback();
			        e.printStackTrace();
			    } finally {
			        session.close();
			    }

			    return profileList;
			}

		    public ViewProfilePojo getProfileDetails(int userId) {
		        ViewProfilePojo profile = null;
		        try (Session session =  SessionProvider.provideSessionFactory().openSession()) {
		            Transaction transaction = session.beginTransaction();

		            // Fetch the profile from the database
		            profile = session.get(ViewProfilePojo.class, userId);

		            transaction.commit();
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        return profile;
		    }
		    public boolean saveFitnessForm(FitnessForm form) {
		        Transaction transaction = null;
		        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
		            transaction = session.beginTransaction();
		            session.save(form);
		            transaction.commit();
		            return true;
		        } catch (Exception e) {
		            if (transaction != null) {
		                transaction.rollback();
		            }
		            e.printStackTrace();
		            return false;
		        }
		    }
		    
		    public boolean saveBookings(Bookings book) {
		        Transaction transaction = null;
		        Session session = null;
		        
		        try {
		            session = SessionProvider.provideSessionFactory().openSession(); // Open a new session
		            transaction = session.beginTransaction(); // Start the transaction
		            
		            System.out.println("Inside DAO: Saving Booking...");
		            
		            session.save(book); // Save booking object
		            transaction.commit(); // Commit transaction only if successful
		            
		            return true;
		        } catch (Exception e) {
		            if (transaction != null && transaction.getStatus().canRollback()) {
		                transaction.rollback(); // Rollback if transaction is active
		            }
		            System.err.println("Error saving booking: " + e.getMessage());
		            e.printStackTrace();
		            return false;
		        } finally {
		            if (session != null && session.isOpen()) {
		                session.close(); // Ensure session is closed properly
		            }
		        }
		    }

 	
			 public List<Bookings> getAllBookings() {
				    
				    SessionFactory factory = SessionProvider.provideSessionFactory();
				    Session session = null;
				    List<Bookings> bookList = new ArrayList<>();
		
				    try {
				        session = factory.openSession();
				        NativeQuery<Bookings> query = session.createNativeQuery("SELECT * FROM bookings", Bookings.class);
				        bookList = query.getResultList(); 
				       
				    } catch (Exception e) {
				        e.printStackTrace();
				       
				    } finally {
				        if (session != null) {
				            session.close(); 
				        }
				    }
				    return bookList;
				}


			     // Method to update like status
			     public void updateLikeStatus(String videoId, String userId) {
			         Session session = SessionProvider.provideSessionFactory().openSession();
			         Transaction transaction = null;
			         try {
			             transaction = session.beginTransaction();
			             String hql = "UPDATE UserVideoStatus u SET u.likeStatus = 1 WHERE u.videoId = :videoId AND u.userId = :userId";
			             Query query = session.createQuery(hql);
			             query.setParameter("videoId", videoId);
			             query.setParameter("userId", userId);
			             int result = query.executeUpdate();
			             transaction.commit();
			         } catch (Exception e) {
			             if (transaction != null) {
			                 transaction.rollback();
			             }
			             e.printStackTrace();
			         } finally {
			             session.close();
			         }
			     }

			     // Method to update save status
			     public void updateSaveStatus(String videoId, String userId) {
			         Session session = SessionProvider.provideSessionFactory().openSession();
			         Transaction transaction = null;
			         try {
			             transaction = session.beginTransaction();
			             String hql = "UPDATE UserVideoStatus u SET u.saveStatus = 1 WHERE u.videoId = :videoId AND u.userId = :userId";
			             Query query = session.createQuery(hql);
			             query.setParameter("videoId", videoId);
			             query.setParameter("userId", userId);
			             int result = query.executeUpdate();
			             transaction.commit();
			         } catch (Exception e) {
			             if (transaction != null) {
			                 transaction.rollback();
			             }
			             e.printStackTrace();
			         } finally {
			             session.close();
			         }
			     }

			     // Method to update share status
			     public void updateShareStatus(String videoId, String userId) {
			         Session session = SessionProvider.provideSessionFactory().openSession();
			         Transaction transaction = null;
			         try {
			             transaction = session.beginTransaction();
			             String hql = "UPDATE UserVideoStatus u SET u.shareStatus = 1 WHERE u.videoId = :videoId AND u.userId = :userId";
			             Query query = session.createQuery(hql);
			             query.setParameter("videoId", videoId);
			             query.setParameter("userId", userId);
			             int result = query.executeUpdate();
			             transaction.commit();
			         } catch (Exception e) {
			             if (transaction != null) {
			                 transaction.rollback();
			             }
			             e.printStackTrace();
			         } finally {
			             session.close();
			         }
			     }

			     // Method to update cart status
			     public void updateCartStatus(String videoId, String userId) {
			         Session session = SessionProvider.provideSessionFactory().openSession();
			         Transaction transaction = null;
			         try {
			             transaction = session.beginTransaction();
			             String hql = "UPDATE UserVideoStatus u SET u.cartStatus = 1 WHERE u.videoId = :videoId AND u.userId = :userId";
			             Query query = session.createQuery(hql);
			             query.setParameter("videoId", videoId);
			             query.setParameter("userId", userId);
			             int result = query.executeUpdate();
			             transaction.commit();
			         } catch (Exception e) {
			             if (transaction != null) {
			                 transaction.rollback();
			             }
			             e.printStackTrace();
			         } finally {
			             session.close();
			         }
			     }
			     
			     public void saveProfile(SaveProfilePojo profile) {
			    	    Transaction transaction = null;
			    	    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
			    	        // Begin a transaction
			    	        transaction = session.beginTransaction();

			    	        // Save the profile object
			    	        session.save(profile);

			    	        // Commit the transaction
			    	        transaction.commit();
			    	    } catch (Exception e) {
			    	        if (transaction != null) {
			    	            transaction.rollback(); // Rollback transaction in case of an exception
			    	        }
			    	        e.printStackTrace(); // Log the exception for debugging
			    	        throw new RuntimeException("Error while saving profile", e); // Rethrow the exception
			    	    }
			    	}
			     
				 public List<SaveProfilePojo> getAllSaved() {
					    
					    SessionFactory factory = SessionProvider.provideSessionFactory();
					    Session session = null;
					    List<SaveProfilePojo> bookList = new ArrayList<>();
			
					    try {
					        session = factory.openSession();
					        NativeQuery<SaveProfilePojo> query = session.createNativeQuery("SELECT * FROM saveProfile", SaveProfilePojo.class);
					        bookList = query.getResultList(); 
					       
					    } catch (Exception e) {
					        e.printStackTrace();
					       
					    } finally {
					        if (session != null) {
					            session.close(); 
					        }
					    }
					    return bookList;
					}
				 
				
				  public boolean deletesaved(Long id) {
				        Session session = SessionProvider.provideSessionFactory().openSession();
				        Transaction tx = null;
				        boolean isDeleted = false;
				        try {
				            tx = session.beginTransaction();
				            
				            // Retrieve the entity by ID
				            SaveProfilePojo sp = session.get(SaveProfilePojo.class, id);

				            if (sp != null) {
				                // Delete the entity
				                session.delete(sp);
				                tx.commit();
				                isDeleted = true;
				            }
				        } catch (Exception e) {
				            if (tx != null) tx.rollback(); // Rollback in case of error
				            e.printStackTrace();
				        } finally {
				            session.close(); // Always close the session
				        }
				        return isDeleted;
				    }
				  
				   public void saveTocart(CartPojo cp) {
			    	    Transaction transaction = null;
			    	    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
			    	
			    	        transaction = session.beginTransaction();

			    	        session.save(cp);

			    	        transaction.commit();
			    	    } catch (Exception e) {
			    	        if (transaction != null) {
			    	            transaction.rollback(); // Rollback transaction in case of an exception
			    	        }
			    	        e.printStackTrace(); // Log the exception for debugging
			    	        throw new RuntimeException("Error while saving profile", e); // Rethrow the exception
			    	    }
			    	}
				   
				   
				   public void saveoffercart(OfferCart offercart) {
					    Session session = SessionProvider.provideSessionFactory().openSession();
					    Transaction tx = null;
					    try {
					        tx = session.beginTransaction();
					        session.save(offercart);
					        session.flush();  // Ensure data is written to DB
					        tx.commit();
					    } catch (Exception e) {
					        if (tx != null) tx.rollback();
					        e.printStackTrace();
					    } finally {
					        session.close();
					    }
					}

				   public List<CartPojo> getAllCartProfile() {
				        SessionFactory factory = SessionProvider.provideSessionFactory();
				        Session session = null;
				        List<CartPojo> profileList = new ArrayList<>();

				        try {
				            // Open session
				            session = factory.openSession();

				            // Execute query
				            NativeQuery<CartPojo> query = session.createNativeQuery("SELECT * FROM ProfileCart", CartPojo.class);

				            // Get results
				            profileList = query.getResultList();

				        } catch (Exception e) {
				            e.printStackTrace();  // You might want to replace this with a logger for better error handling
				        } finally {
				            // Ensure session is closed properly
				            if (session != null && session.isOpen()) {
				                session.close();
				            }
				        }

				        return profileList;
				    }
				   
				   // Renamed method to fetch cart offers
				    public List<OfferCart> fetchAllCartOffers() {
				        SessionFactory factory = SessionProvider.provideSessionFactory();
				        Session session = null;
				        List<OfferCart> offerList = new ArrayList<>();

				        try {
				            // Open session
				            session = factory.openSession();

				            // Execute native SQL query
				            NativeQuery<OfferCart> query = session.createNativeQuery("SELECT * FROM offercart", OfferCart.class);

				            // Fetch result list
				            offerList = query.getResultList();

				            // Check if the result is null
				            if (offerList == null) {
				            	offerList = new ArrayList<>();  // Avoid returning null
				            }

				        } catch (Exception e) {
				            e.printStackTrace();  // Consider using a logger for better logging
				        } finally {
				            // Ensure session is closed properly
				            if (session != null && session.isOpen()) {
				                session.close();
				            }
				        }

				        return offerList;
				    }
				    
				    public void saveClassDetails(NewUpdatePojo classD) {
				        Session session = null;
				        Transaction tx = null;

				        try {
				            // Open session
				            session = SessionProvider.provideSessionFactory().openSession();
				            tx = session.beginTransaction();

				            // Save class details object
				            session.save(classD);

				            // Commit transaction if everything goes well
				            tx.commit();
				        } catch (Exception e) {
				            // Rollback transaction in case of an exception
				            if (tx != null) {
				                tx.rollback();
				            }

				            // Log the error (use a logging framework in production)
				            System.err.println("Error saving class details: " + e.getMessage());
				            e.printStackTrace();  // Log the error stack trace

				            // Throw a runtime exception with additional context
				            throw new RuntimeException("Failed to save class details", e);
				        } finally {
				            // Close session
				            if (session != null) {
				                session.close();
				            }
				        }
				    }

				    
				  
				    public void saveProduct(ProductPojo product) {
				        Session session = SessionProvider.provideSessionFactory().getCurrentSession();
				        Transaction transaction = null;
				        try {
				            // Begin a transaction
				            transaction = session.beginTransaction();
				            
				            // Save the product
				            session.save(product);

				            // Commit the transaction
				            transaction.commit();
				        } catch (Exception e) {
				            // If an error occurs, roll back the transaction
				            if (transaction != null) {
				                transaction.rollback();
				            }
				            e.printStackTrace();
				        } finally {
				            session.close();
				        }     

				        
				    }
				    
				    
				    public void saveHealth(HealthPojo health) {
				        // Open a session using HibernateUtil (you'll need to configure HibernateUtil to handle sessions)
				        Session session = SessionProvider.provideSessionFactory().openSession();
				        Transaction transaction = null;

				        try {
				            transaction = session.beginTransaction();
				            session.save(health);  // Save the HealthPojo object to the database
				            transaction.commit();  // Commit the transaction
				        } catch (Exception e) {
				            if (transaction != null) {
				                transaction.rollback();  // Rollback if there's an error
				            }
				            e.printStackTrace();
				        } finally {
				            session.close();  // Close the session
				        }
				    }
				    
				    
				    
				    public void saveClassDetails(FreeClassPojo classPojo) {
				        // Get the Hibernate session
				        Session session = SessionProvider.provideSessionFactory().openSession();
				        Transaction transaction = null;

				        try {
				            transaction = session.beginTransaction();

				            // Save the ClassPojo object to the database
				            session.save(classPojo);

				            // Commit the transaction
				            transaction.commit();
				        } catch (Exception e) {
				            if (transaction != null) {
				                transaction.rollback(); // Rollback if an error occurs
				            }
				            e.printStackTrace();
				        } finally {
				            session.close(); // Close the session
				        }
				    }
				    public List<NewUpdatePojo> getAllUpdates() {
				        // Get the current session and begin transaction
				        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
				            // Start a transaction
				            Transaction transaction = session.beginTransaction();

				            // Create a query to fetch all updates
				            Query<NewUpdatePojo> query = session.createQuery("from NewUpdatePojo", NewUpdatePojo.class);

				            // Execute the query and get the list of updates
				            List<NewUpdatePojo> updatesList = query.getResultList();

				            // Commit the transaction
				            transaction.commit();

				            // Debugging: Check the fetched list size
				            System.out.println("Fetched updatesList size: " + (updatesList != null ? updatesList.size() : 0));

				            return updatesList;
				        } catch (Exception e) {
				            // Log the error
				            System.err.println("Error fetching updates: " + e.getMessage());
				            e.printStackTrace();
				            return null;
				        }
				    }
				    public NewUpdatePojo getUpdateById(int classId) {
				        NewUpdatePojo update = null;
				        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
				            // Corrected query to use the entity class name
				            Query<NewUpdatePojo> query = session.createQuery("FROM NewUpdatePojo WHERE classId = :classId", NewUpdatePojo.class);
				            query.setParameter("classId", classId);

				            // Fetch the list of results
				            List<NewUpdatePojo> updList = query.getResultList();

				            // Check if the list is not empty and assign the first result
				            if (updList != null && !updList.isEmpty()) {
				                update = updList.get(0);
				            }
				        } catch (Exception e) {
				            // Log and print the stack trace for debugging
				            System.err.println("Error in getUpdateById: " + e.getMessage());
				            e.printStackTrace();
				        }
				        return update;
				    }
				    
				    public boolean updateExistingDetails(NewUpdatePojo up) {
				        Transaction transaction = null;
				        Session session = null;
				        
				        try {
				            // Open session and begin transaction
				            session = SessionProvider.provideSessionFactory().openSession();
				            transaction = session.beginTransaction();

				            // HQL query to find the entity by userId
				            String hql = "FROM NewUpdatePojo WHERE userId = :userId";
				            NewUpdatePojo existingEntity = (NewUpdatePojo) session.createQuery(hql)
				                .setParameter("userId", up.getUserId())
				                .uniqueResult();

				            // Check if entity exists
				            if (existingEntity == null) {
				                System.out.println("No entity found with the provided userId.");
				                return false;  // Return false if no entity is found
				            }

				            // Update the fields of the existing entity
				            existingEntity.setClassName(up.getClassName());
				            existingEntity.setTrainerName(up.getTrainerName());
				            existingEntity.setExpertise(up.getExpertise());
				            existingEntity.setDescription(up.getDescription());
				            existingEntity.setFeedback(up.getFeedback());

				            // Perform the update
				            session.update(existingEntity);

				            // Commit the transaction
				            transaction.commit();
				            return true;

				        } catch (Exception e) {
				            // Rollback the transaction if there is any error
				            if (transaction != null) {
				                transaction.rollback();
				            }
				            e.printStackTrace();
				            return false;  // Return false if there was an exception

				        } finally {
				            // Ensure the session is closed to release resources
				            if (session != null) {
				                session.close();
				            }
				        }
				    }

	

				        public boolean deleteExistingDetails(NewUpdatePojo up) {
				            Transaction transaction = null;
				            Session session = null;

				            try {
				                // Open session and begin transaction
				                session = SessionProvider.provideSessionFactory().openSession();
				                transaction = session.beginTransaction();

				                // HQL query to find the entity by userId
				                String hql = "FROM NewUpdatePojo WHERE userId = :userId";
				                NewUpdatePojo existingEntity = (NewUpdatePojo) session.createQuery(hql)
				                    .setParameter("userId", up.getUserId())
				                    .uniqueResult();

				                // Check if entity exists
				                if (existingEntity == null) {
				                    System.out.println("No entity found with the provided userId.");
				                    return false;  // Return false if no entity is found
				                }

				                // Delete the entity
				                session.delete(existingEntity);

				                // Commit the transaction
				                transaction.commit();
				                return true;

				            } catch (Exception e) {
				                // Rollback the transaction if there is any error
				                if (transaction != null) {
				                    transaction.rollback();
				                }
				                e.printStackTrace();
				                return false;  // Return false if there was an exception

				            } finally {
				                // Ensure the session is closed to release resources
				                if (session != null) {
				                    session.close();
				                }
				            }
				        }
				    
				        public List<HealthPojo> getAllHealth() {
					        // Get the current session and begin transaction
					        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
					            // Start a transaction
					            Transaction transaction = session.beginTransaction();

					            // Create a query to fetch all updates
					            Query<HealthPojo> query = session.createQuery("from HealthPojo", HealthPojo.class);

					            // Execute the query and get the list of updates
					            List<HealthPojo> healthList = query.getResultList();

					            // Commit the transaction
					            transaction.commit();

					            // Debugging: Check the fetched list size
					            System.out.println("Fetched updatesList size: " + (healthList != null ? healthList.size() : 0));

					            return healthList;
					        } catch (Exception e) {
					            // Log the error
					            System.err.println("Error fetching updates: " + e.getMessage());
					            e.printStackTrace();
					            return null;
					        }
					    }
				    
				    
				    
				        public HealthPojo getHealthById(int id) {
				            HealthPojo health = null;
				            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
				                // Corrected query to use the entity class name and cast the id to Long
				                Query<HealthPojo> query = session.createQuery("FROM HealthPojo WHERE id = :id", HealthPojo.class);
				                query.setParameter("id", (long) id); // Cast to Long

				                // Fetch the single result
				                health = query.uniqueResult();

				            } catch (HibernateException e) {
				                // Log specific Hibernate exception for better debugging
				                System.err.println("Hibernate error in getHealthById: " + e.getMessage());
				                e.printStackTrace();
				            } catch (Exception e) {
				                // Handle other exceptions
				                System.err.println("Error in getHealthById: " + e.getMessage());
				                e.printStackTrace();
				            }
				            return health;
				        }

					    
				        
				        public boolean updateExistinghealth(HealthPojo up) {
				            Transaction transaction = null;
				            Session session = null;

				            try {
				                // Open session and begin transaction
				                session = SessionProvider.provideSessionFactory().openSession();
				                transaction = session.beginTransaction();

				                // HQL query to find the entity by userId or id
				                String hql = "FROM HealthPojo WHERE userId = :userId"; // Querying by userId
				                HealthPojo existingEntity = (HealthPojo) session.createQuery(hql)
				                    .setParameter("userId", up.getUserId())  // Set the userId parameter
				                    .uniqueResult();

				                // Check if entity exists
				                if (existingEntity == null) {
				                    System.out.println("No entity found with the provided userId.");
				                    return false;  // Return false if no entity is found
				                }

				                // Set the new values
				                existingEntity.setTrainerName(up.getTrainerName());
				                existingEntity.setFoodControlIdeas(up.getFoodControlIdeas());
				                existingEntity.setDaysToFollow(up.getDaysToFollow());
				                existingEntity.setDailyRoutine(up.getDailyRoutine());

				                // Perform the update
				                session.update(existingEntity);

				                // Commit the transaction
				                transaction.commit();
				                return true;

				            } catch (Exception e) {
				                // Rollback the transaction if there is any error
				                if (transaction != null) {
				                    transaction.rollback();
				                }
				                e.printStackTrace();
				                return false;  // Return false if there was an exception

				            } finally {
				                // Ensure the session is closed to release resources
				                if (session != null) {
				                    session.close();
				                }
				            }
				        }

				    
				        public boolean deleteExistinghealth(HealthPojo up) {
				            Transaction transaction = null;
				            Session session = null;

				            try {
				                // Open session and begin transaction
				                session = SessionProvider.provideSessionFactory().openSession();
				                transaction = session.beginTransaction();

				                // HQL query to find the entity by id or userId
				                String hql = "FROM HealthPojo WHERE userId = :userId";  // Use userId to find the entity
				                HealthPojo existingEntity = (HealthPojo) session.createQuery(hql)
				                    .setParameter("userId", up.getUserId())  // Set the userId parameter
				                    .uniqueResult();

				                // Check if entity exists
				                if (existingEntity == null) {
				                    System.out.println("No entity found with the provided userId.");
				                    return false;  // Return false if no entity is found
				                }

				                // Delete the entity
				                session.delete(existingEntity);

				                // Commit the transaction
				                transaction.commit();
				                return true;

				            } catch (Exception e) {
				                // Rollback the transaction if there is any error
				                if (transaction != null) {
				                    transaction.rollback();
				                }
				                e.printStackTrace();
				                return false;  // Return false if there was an exception

				            } finally {
				                // Ensure the session is closed to release resources
				                if (session != null) {
				                    session.close();
				                }
				            }
				        }
				        public List<ProductPojo> getAllProduct() {
					        // Get the current session and begin transaction
					        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
					            // Start a transaction
					            Transaction transaction = session.beginTransaction();

					            // Create a query to fetch all updates
					            Query<ProductPojo> query = session.createQuery("from ProductPojo", ProductPojo.class);

					            // Execute the query and get the list of updates
					            List<ProductPojo> pList = query.getResultList();

					            // Commit the transaction
					            transaction.commit();

					            // Debugging: Check the fetched list size
					            System.out.println("Fetched updatesList size: " + (pList != null ? pList.size() : 0));

					            return pList;
					        } catch (Exception e) {
					            // Log the error
					            System.err.println("Error fetching updates: " + e.getMessage());
					            e.printStackTrace();
					            return null;
					        }
					    }
				    
				        public ProductPojo getProductById(int id) {
				        	ProductPojo product = null;
				            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
				                // Corrected query to use the entity class name and cast the id to Long
				                Query<ProductPojo> query = session.createQuery("FROM ProductPojo WHERE id = :id", ProductPojo.class);
				                query.setParameter("id", (long) id); // Cast to Long

				                // Fetch the single result
				                product = query.uniqueResult();

				            } catch (HibernateException e) {
				                // Log specific Hibernate exception for better debugging
				                System.err.println("Hibernate error in getProductById: " + e.getMessage());
				                e.printStackTrace();
				            } catch (Exception e) {
				                // Handle other exceptions
				                System.err.println("Error in getProductById: " + e.getMessage());
				                e.printStackTrace();
				            }
				            return product;
				        }


				    
				        public boolean updateProductDetails(ProductPojo product) {
				            Transaction transaction = null;
				            Session session = null;  // Declare session outside the try block

				            try {
				                // Open session manually to avoid automatic closing at the end of the try-with-resources
				                session = SessionProvider.provideSessionFactory().openSession();
				                transaction = session.beginTransaction();

				                // Load existing product
				                String hql = "FROM ProductPojo WHERE userId = :userId"; // Querying by userId
				                ProductPojo existingProduct = (ProductPojo) session.createQuery(hql)
				                    .setParameter("userId", product.getUserId())  // Set the userId parameter
				                    .uniqueResult();
				                if (existingProduct == null) {
				                    System.out.println("No product found with the given userId: " + product.getUserId());
				                    return false; // No entity to update
				                }

				                // Update the product details
				                existingProduct.setTrainerName(product.getTrainerName());
				                existingProduct.setProductName(product.getProductName());
				                existingProduct.setProductDescription(product.getProductDescription());
				                existingProduct.setProductUse(product.getProductUse());
				                existingProduct.setShopName(product.getShopName());
				                existingProduct.setProductPrice(product.getProductPrice());
				                existingProduct.setProductDiscount(product.getProductDiscount());

				                session.update(existingProduct); // Update operation
				                transaction.commit(); // Commit transaction
				                return true;

				            } catch (Exception e) {
				                if (transaction != null) {
				                    transaction.rollback(); // Rollback transaction in case of error
				                }
				                e.printStackTrace();
				                return false;

				            } finally {
				                if (session != null) {
				                    session.close(); // Ensure session is closed in the finally block
				                }
				            }
				            
				            }  
				            public boolean deleteExistingProduct(ProductPojo up) {
					            Transaction transaction = null;
					            Session session = null;

					            try {
					                // Open session and begin transaction
					                session = SessionProvider.provideSessionFactory().openSession();
					                transaction = session.beginTransaction();

					                // HQL query to find the entity by id or userId
					                String hql = "FROM ProductPojo WHERE userId = :userId";  // Use userId to find the entity
					                ProductPojo existingEntity = (ProductPojo) session.createQuery(hql)
					                    .setParameter("userId", up.getUserId())  // Set the userId parameter
					                    .uniqueResult();

					                // Check if entity exists
					                if (existingEntity == null) {
					                    System.out.println("No entity found with the provided userId.");
					                    return false;  // Return false if no entity is found
					                }

					                // Delete the entity
					                session.delete(existingEntity);

					                // Commit the transaction
					                transaction.commit();
					                return true;

					            } catch (Exception e) {
					                // Rollback the transaction if there is any error
					                if (transaction != null) {
					                    transaction.rollback();
					                }
					                e.printStackTrace();
					                return false;  // Return false if there was an exception

					            } finally {
					                // Ensure the session is closed to release resources
					                if (session != null) {
					                    session.close();
					                }
					            }
					                 
				            }     
				            public List<FreeClassPojo> getAllFreeClass() {
				                // Get the current session and begin transaction
				                try (Session session = SessionProvider.provideSessionFactory().openSession()) {
				                    // Start a transaction
				                    Transaction transaction = session.beginTransaction();

				                    // Create a query to fetch all FreeClassPojo objects
				                    Query<FreeClassPojo> query = session.createQuery("from FreeClassPojo", FreeClassPojo.class);

				                    // Execute the query and get the list of FreeClassPojo
				                    List<FreeClassPojo> fList = query.getResultList();

				                    // Commit the transaction
				                    transaction.commit();

				                    // Debugging: Check the fetched list size
				                    System.out.println("Fetched FreeClassPojo list size: " + (fList != null ? fList.size() : 0));

				                    // Return the result list
				                    return fList;
				                } catch (Exception e) {
				                    // Log the error
				                    System.err.println("Error fetching FreeClassPojo list: " + e.getMessage());
				                    e.printStackTrace();
				                    return null;
				                }
				            }
				            
				            
				            public FreeClassPojo getFreeClassById(int id) {
				            	FreeClassPojo free = null;
					            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
					                // Corrected query to use the entity class name and cast the id to Long
					                Query<FreeClassPojo> query = session.createQuery("FROM FreeClassPojo WHERE id = :id", FreeClassPojo.class);
					                query.setParameter("id", (long) id); // Cast to Long

					                // Fetch the single result
					                free = query.uniqueResult();

					            } catch (HibernateException e) {
					                // Log specific Hibernate exception for better debugging
					                System.err.println("Hibernate error in getProductById: " + e.getMessage());
					                e.printStackTrace();
					            } catch (Exception e) {
					                // Handle other exceptions
					                System.err.println("Error in getProductById: " + e.getMessage());
					                e.printStackTrace();
					            }
					            return free;
					        }
				            


				                public boolean updateFreeClassDetails(FreeClassPojo freeClass) {
				                    Transaction transaction = null;
				                    Session session = null;

				                    try {
				                        // Open session and start transaction
				                        session = SessionProvider.provideSessionFactory().openSession();
				                        transaction = session.beginTransaction();

				                        // Check if the record exists in the database
				                        String hql = "FROM FreeClassPojo WHERE id = :id";
				                        Query<FreeClassPojo> query = session.createQuery(hql, FreeClassPojo.class);
				                        query.setParameter("id", freeClass.getId());
				                        FreeClassPojo existingClass = query.uniqueResult();

				                        if (existingClass == null) {
				                            System.out.println("No class found with the given ID: " + freeClass.getId());
				                            return false;
				                        }

				                        // Update the existing record with new values
				                        existingClass.setTrainerName(freeClass.getTrainerName());
				                        existingClass.setClassTitle(freeClass.getClassTitle());
				                        existingClass.setVideoLink(freeClass.getVideoLink());
				                        existingClass.setClassDescription(freeClass.getClassDescription());

				                        session.update(existingClass); // Save the updated record
				                        transaction.commit(); // Commit the changes

				                        return true;
				                    } catch (Exception e) {
				                        // Rollback transaction in case of an error
				                        if (transaction != null) {
				                            transaction.rollback();
				                        }
				                        e.printStackTrace(); // Log the exception
				                        return false;
				                    } finally {
				                        // Close the session in the finally block
				                        if (session != null) {
				                            session.close();
				                        }
				                    }
				                }
				                
				                public boolean deleteExistingClass(FreeClassPojo up) {
				                    Transaction transaction = null;
				                    Session session = null;

				                    try {
				                        // Open session and begin transaction
				                        session = SessionProvider.provideSessionFactory().openSession();
				                        transaction = session.beginTransaction();

				                        // HQL query to find the entity by userId
				                        String hql = "FROM FreeClassPojo WHERE userId = :userId";  // Use userId to find the entity
				                        FreeClassPojo existingEntity = (FreeClassPojo) session.createQuery(hql)
				                            .setParameter("userId", up.getUserId())  // Set the userId parameter
				                            .uniqueResult();

				                        // Check if entity exists
				                        if (existingEntity == null) {
				                            System.out.println("No entity found with the provided userId: " + up.getUserId());
				                            return false;  // Return false if no entity is found
				                        }

				                        // Delete the entity
				                        session.delete(existingEntity);

				                        // Commit the transaction
				                        transaction.commit();
				                        System.out.println("Entity deleted successfully for userId: " + up.getUserId());
				                        return true;

				                    } catch (Exception e) {
				                        // Rollback the transaction if there is any error
				                        if (transaction != null) {
				                            transaction.rollback();
				                        }
				                        e.printStackTrace();
				                        return false;  // Return false if there was an exception

				                    } finally {
				                        // Ensure the session is closed to release resources
				                        if (session != null && session.isOpen()) {
				                            session.close();
				                        }
				                    }
				                }
				                
				   

				                    public static void saveUser(UserDetails user) {
				                        Transaction transaction = null;
				                        try (Session session = new Configuration()
				                                .configure("hibernate.cfg.xml") // Load Hibernate configuration
				                                .addAnnotatedClass(UserDetails.class) // Add annotated class
				                                .buildSessionFactory()
				                                .openSession()) {

				                            // Start a transaction
				                            transaction = session.beginTransaction();

				                            // Save the user object
				                            session.save(user);

				                            // Commit the transaction
				                            transaction.commit();
				                        } catch (Exception e) {
				                            if (transaction != null) {
				                                transaction.rollback();
				                            }
				                            e.printStackTrace();
				                        }
				                    }
				                
				                    public List<UserDetails> getAllDetails1() {
				                        // Get the current session and begin transaction
				                        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
				                            // Debugging: Log session opening
				                            System.out.println("Session opened successfully.");

				                            // Optional: Start a transaction if necessary (read-only transactions may not be needed)
				                            Transaction transaction = session.beginTransaction();

				                            // Create a query to fetch all UserDetails objects
				                            Query<UserDetails> query = session.createQuery("from UserDetails", UserDetails.class);

				                            // Execute the query and get the list of UserDetails
				                            List<UserDetails> userList = query.getResultList();

				                            // Debugging: Log the fetched list size
				                            System.out.println("Fetched UserDetails list size: " + (userList != null ? userList.size() : 0));

				                            // Commit the transaction (if applicable)
				                            transaction.commit();

				                            // Return the result list
				                            return userList;

				                        } catch (Exception e) {
				                            // Log the error with appropriate details
				                            System.err.println("Error fetching UserDetails list: " + e.getMessage());
				                            e.printStackTrace();

				                            // Return null or an empty list to indicate failure
				                            return null;
				                        }
				                    
				                    
				                    }              
				               	 public boolean isDetailsExists(String userId) {
				     			    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
				     			        
				     			        // Use CriteriaBuilder and CriteriaQuery for a more flexible query
				     			        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
				     			        CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
				     			        Root<UserDetails> root = criteriaQuery.from(UserDetails.class);  // Use AddDetailsPojo as the entity class
				     			        
				     			        // Create a predicate for the condition
				     			        Predicate predicate = criteriaBuilder.equal(root.get("userId"), userId);  // Reference the field name userId
				     			        criteriaQuery.select(criteriaBuilder.count(root)).where(predicate);
				     			        
				     			        // Execute the query and get the count
				     			        Long count = session.createQuery(criteriaQuery).getSingleResult();
				     			        
				     			        return count > 0; // Return true if a record exists with the same userId
				     			    } catch (Exception e) {
				     			        e.printStackTrace();
				     			        return false; // Handle exception and return false if any error occurs
				     			    }
				     			}
				                    
				                 
						            public UserDetails getDetailsById(int id) {
						            	UserDetails free = null;
							            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
							                // Corrected query to use the entity class name and cast the id to Long
							                Query<UserDetails> query = session.createQuery("FROM UserDetails WHERE id = :id",UserDetails.class);
							                query.setParameter("id", (long) id); // Cast to Long

							                // Fetch the single result
							                free = query.uniqueResult();

							            } catch (HibernateException e) {
							                // Log specific Hibernate exception for better debugging
							                System.err.println("Hibernate error in getdetailsProductById: " + e.getMessage());
							                e.printStackTrace();
							            } catch (Exception e) {
							                // Handle other exceptions
							                System.err.println("Error in getdetailsById: " + e.getMessage());
							                e.printStackTrace();
							            }
							            return free;
							        }
						            
     
						            public boolean updateDetails(UserDetails details) {
						                Transaction transaction = null;
						                Session session = null;

						                try {
						                    // Ensure that the ID is not null or invalid
						                    if (details.getId() == null || details.getId() <= 0) {
						                        System.out.println("Invalid ID: " + details.getId());
						                        return false; // Return false if ID is invalid
						                    }

						                    // Open session and start transaction
						                    session = SessionProvider.provideSessionFactory().openSession();
						                    transaction = session.beginTransaction();

						                    // Check if the record exists in the database
						                    String hql = "FROM UserDetails WHERE id = :id";
						                    Query<UserDetails> query = session.createQuery(hql, UserDetails.class);
						                    query.setParameter("id", details.getId());
						                    UserDetails existingdet = query.uniqueResult();

						                    // If no record is found, return false
						                    if (existingdet == null) {
						                        System.out.println("No user found with the given ID: " + details.getId());
						                        return false;
						                    }

						                    // Update the existing record with new values
						                    existingdet.setName(details.getName());
						                    existingdet.setEmail(details.getEmail());
						                    existingdet.setPhone(details.getPhone());
						                    existingdet.setGender(details.getGender());
						                    existingdet.setDob(details.getDob());
						                    existingdet.setLocation(details.getLocation());
						                    existingdet.setFitnessLevel(details.getFitnessLevel());
						                    existingdet.setGoal(details.getGoal());
						                    existingdet.setHealthConditions(details.getHealthConditions());
						                    existingdet.setWeight(details.getWeight());
						                    existingdet.setHeight(details.getHeight());
						                    existingdet.setActivityLevel(details.getActivityLevel());
						                    existingdet.setDietPreferences(details.getDietPreferences());
						                    existingdet.setExercisePreferences(details.getExercisePreferences());
						                    existingdet.setWorkoutSchedule(details.getWorkoutSchedule());
						                    existingdet.setSleep(details.getSleep());
						                    existingdet.setMotivation(details.getMotivation());
						                    existingdet.setCommunication(details.getCommunication());

						                    // Save or update the record
						                    session.update(existingdet);

						                    // Commit the transaction
						                    transaction.commit();
						                    System.out.println("User details updated successfully");

						                    return true; // Return true if the update was successful
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback();
						                    }
						                    e.printStackTrace(); // Print the error stack trace for debugging
						                    return false;
						                } finally {
						                    if (session != null) {
						                        session.close(); // Ensure the session is closed
						                    }
						                }
						            }

						            public boolean deleteExistingdetails(UserDetails up) {
						                Session session = null;

						                try {
						                    // Open session and get the current session
						                    session = SessionProvider.provideSessionFactory().getCurrentSession();

						                    // Begin transaction
						                    session.beginTransaction();

						                    // HQL query to delete the entity directly based on userId
						                    String hql = "DELETE FROM UserDetails WHERE userId = :userId";
						                    int result = session.createQuery(hql)
						                            .setParameter("userId", up.getUserId())
						                            .executeUpdate();

						                    // Check if any record was deleted
						                    if (result == 0) {
						                        System.out.println("No entity found with the provided userId: " + up.getUserId());
						                        return false; // Return false if no rows were affected
						                    }

						                    // Commit the transaction
						                    session.getTransaction().commit();
						                    System.out.println("Entity deleted successfully for userId: " + up.getUserId());
						                    return true;

						                } catch (Exception e) {
						                    // Handle exception, roll back if needed
						                    if (session != null) {
						                        session.getTransaction().rollback();
						                    }
						                    System.err.println("Error while deleting entity: " + e.getMessage());
						                    e.printStackTrace();
						                    return false; // Return false if there was an exception

						                } finally {
						                    // Ensure session is closed if using session management without getCurrentSession()
						                    if (session != null && session.isOpen()) {
						                        session.close();
						                    }
						                }
						            }
						            
						            public UserDetails getDetailByEmail(String email) {
						            	UserDetails userDetails = null;
								        
								        // Start a Hibernate session
								        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
								            // Create the query to fetch user details based on email
								            Query<UserDetails> query = session.createQuery(
								                    "FROM UserDetails WHERE userId = :userId", UserDetails.class);
								            query.setParameter("userId", email);  // Bind the email parameter
								            
								            // Fetch the user details (returns a single result)
								            userDetails = query.uniqueResult();
								        } catch (Exception e) {
								            e.printStackTrace();
								        }
								        
								        return userDetails;
								    }

						            public void insertuser(ContactUser details) throws Exception {
						                Transaction transaction = null;
						                
						                // Use try-with-resources to automatically close the session
						                try (Session session = new Configuration().configure().buildSessionFactory().openSession()) {
						                    transaction = session.beginTransaction();
						                    session.save(details);  // Save the ContactUser object to the database
						                    transaction.commit();
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback(); // Rollback in case of an error
						                    }
						                    throw e;  // Rethrow the exception to be handled by the servlet
						                }
						            }
						            
						            public static void saveproductcart(ProductCart pd) {
				                        Transaction transaction = null;
				                        try (Session session = new Configuration()
				                                .configure("hibernate.cfg.xml") // Load Hibernate configuration
				                                .addAnnotatedClass(ProductCart.class) // Add annotated class
				                                .buildSessionFactory()
				                                .openSession()) {

				                            // Start a transaction
				                            transaction = session.beginTransaction();

				                            // Save the user object
				                            session.save(pd);

				                            // Commit the transaction
				                            transaction.commit();
				                        } catch (Exception e) {
				                            if (transaction != null) {
				                                transaction.rollback();
				                            }
				                            e.printStackTrace();
				                        }
				                    }
						            
						            public List<ProductCart> fetchAllProduct() {
								        SessionFactory factory = SessionProvider.provideSessionFactory();
								        Session session = null;
								        List<ProductCart> pdList = new ArrayList<>();

								        try {
								            // Open session
								            session = factory.openSession();

								            // Execute native SQL query
								            NativeQuery<ProductCart> query = session.createNativeQuery("SELECT * FROM productCart", ProductCart.class);

								            // Fetch result list
								           pdList = query.getResultList();

								            // Check if the result is null
								            if (pdList == null) {
								            	pdList = new ArrayList<>();  // Avoid returning null
								            }

								        } catch (Exception e) {
								            e.printStackTrace();  // Consider using a logger for better logging
								        } finally {
								            // Ensure session is closed properly
								            if (session != null && session.isOpen()) {
								                session.close();
								            }
								        }

								        return pdList;
								    }     
				                
						            public void saveCredentials(razorpaypojo rp) {
						                Transaction transaction = null;
						                try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                    transaction = session.beginTransaction();
						                    session.save(rp); // Saving the object to the database
						                    transaction.commit();
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback();
						                    }
						                    e.printStackTrace();
						                }
						            }
						            public boolean isExists(String userId) {
									    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
									        
									        // Use CriteriaBuilder and CriteriaQuery for a more flexible query
									        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
									        CriteriaQuery<Long> criteriaQuery = criteriaBuilder.createQuery(Long.class);
									        Root<razorpaypojo> root = criteriaQuery.from(razorpaypojo.class);  // Use AddDetailsPojo as the entity class
									        
									        // Create a predicate for the condition
									        Predicate predicate = criteriaBuilder.equal(root.get("userId"), userId);  // Reference the field name userId
									        criteriaQuery.select(criteriaBuilder.count(root)).where(predicate);
									        
									        // Execute the query and get the count
									        Long count = session.createQuery(criteriaQuery).getSingleResult();
									        
									        return count > 0; // Return true if a record exists with the same userId
									    } catch (Exception e) {
									        e.printStackTrace();
									        return false; // Handle exception and return false if any error occurs
									    }
									}
						            public razorpaypojo getCredentialsByUserId(String userId) {
						                Transaction transaction = null;
						                razorpaypojo rp = null;

						                try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                    transaction = session.beginTransaction();

						                    Query<razorpaypojo> query = session.createQuery(
						                        "FROM razorpaypojo WHERE userId = :userId", razorpaypojo.class);
						                    query.setParameter("userId", userId);

						                    rp = query.uniqueResult(); // Fetch single result
						                    transaction.commit();
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback();
						                    }
						                    e.printStackTrace();
						                }
						                return rp;
						            }
						            public boolean deleteCredentials(String userId) {
						                // Create the Hibernate session and transaction for deletion
						                Session session = SessionProvider.provideSessionFactory().openSession();
						                Transaction transaction = null;
						                
						                try {
						                    transaction = session.beginTransaction();
						                    
						                    // Query to delete credentials for the user
						                    String hql = "DELETE FROM razorpaypojo WHERE userId = :userId";
						                    Query query = session.createQuery(hql);
						                    query.setParameter("userId", userId);
						                    
						                    int result = query.executeUpdate();
						                    
						                    if (result > 0) {
						                        transaction.commit(); // Commit transaction if deletion is successful
						                        return true;
						                    } else {
						                        return false; // No matching credentials found
						                    }
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback(); // Rollback transaction in case of error
						                    }
						                    e.printStackTrace();
						                    return false;
						                } finally {
						                    session.close(); // Close session
						                }
						            }
						            public List<razorpaypojo> getAllCredentials() {
						                Transaction transaction = null;
						                List<razorpaypojo> razorpayList = null;
						                try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                    transaction = session.beginTransaction();
						                    razorpayList = session.createQuery("FROM razorpaypojo", razorpaypojo.class).list();
						                    transaction.commit(); // commit the transaction
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback(); // rollback on error
						                    }
						                    e.printStackTrace();
						                }
						                return razorpayList;
						            }
			     

						            public void savePayment(String userId, String videoId, String paymentStatus, String paymentId) {
						                SessionFactory factory = SessionProvider.provideSessionFactory();
						                Session session = factory.openSession();
						                Transaction tx = session.beginTransaction();

						                Paymentpojo payment = new Paymentpojo(userId, videoId, paymentStatus, paymentId);
						                session.save(payment);
						                
						                tx.commit();
						                session.close();
						            }
						            public boolean deleteUser(String userId) {
						                // Create the Hibernate session and transaction for deletion
						                Session session = SessionProvider.provideSessionFactory().openSession();
						                Transaction transaction = null;
						                
						                try {
						                    transaction = session.beginTransaction();
						                    
						                    // Query to delete credentials for the user
						                    String hql = "DELETE FROM UserDetails WHERE userId = :userId";
						                    Query query = session.createQuery(hql);
						                    query.setParameter("userId", userId);
						                    
						                    int result = query.executeUpdate();
						                    
						                    if (result > 0) {
						                        transaction.commit(); // Commit transaction if deletion is successful
						                        return true;
						                    } else {
						                        return false; // No matching credentials found
						                    }
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback(); // Rollback transaction in case of error
						                    }
						                    e.printStackTrace();
						                    return false;
						                } finally {
						                    session.close(); // Close session
						                }
						            }
						            
						            public void saveProductPayment(ProductPayment productPayment) {
						            	Session session = null;
						            	Transaction transaction = null;
						            	try {
						            	    session = SessionProvider.provideSessionFactory().openSession();
						            	    transaction = session.beginTransaction();
						            	    
						            	    // Your database operations here
						            	    session.save(productPayment);
						            	    
						            	    transaction.commit();
						            	} catch (Exception e) {
						            	    if (transaction != null) {
						            	        transaction.rollback();
						            	    }
						            	    e.printStackTrace();
						            	} finally {
						            	    if (session != null) {
						            	        session.close();
						            	    }
						            	}

						            
						            }
						            
						            
						            public void saveOfferPayment(OfferPayment offerPayment) {
						                Transaction transaction = null;
						                Session session = null;
						                try {
						                    session = SessionProvider.provideSessionFactory().openSession();
						                    transaction = session.beginTransaction();

						                    session.save(offerPayment);
						                    transaction.commit();
						                    
						                } catch (Exception e) {
						                    if (transaction != null && transaction.isActive()) {
						                        transaction.rollback(); // Rollback only if active
						                    }
						                    e.printStackTrace();
						                } finally {
						                    if (session != null && session.isOpen()) {
						                        session.close(); // Ensure session is closed
						                    }
						                }
						            }
						            
						            
						            public boolean saveBooking(BookPayment booking) {
						                Transaction transaction = null;
						                try (Session session = new Configuration().configure("hibernate.cfg.xml")
						                        .addAnnotatedClass(BookPayment.class)
						                        .buildSessionFactory().openSession()) {

						                    transaction = session.beginTransaction();
						                    session.save(booking);
						                    transaction.commit();
						                    
						                    return true; // Successfully saved
						                } catch (Exception e) {
						                    if (transaction != null) {
						                        transaction.rollback();
						                    }
						                    e.printStackTrace();
						                    return false; // Save failed
						                }
						            }
						            
						      


						                public List<BookPayment> getBookingsByTrainerId(String trainerId) {
						                    List<BookPayment> bookings = null;
						                    
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        Transaction transaction = session.beginTransaction();

						                        // HQL Query
						                        Query<BookPayment> query = session.createQuery("FROM BookPayment WHERE trainerId = :trainerId", BookPayment.class);
						                        query.setParameter("trainerId", trainerId);
						                        
						                        bookings = query.getResultList();
						                        
						                        transaction.commit();
						                    } catch (Exception e) {
						                        e.printStackTrace();
						                    }
						                    
						                    return bookings;
						                }
						            

						                public List<OfferPayment> getOfferPaymentsByTrainerId(String trainerId) {
						                    List<OfferPayment> offerPayments = null;

						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        Transaction transaction = session.beginTransaction();

						                        // HQL Query
						                        Query<OfferPayment> query = session.createQuery("FROM OfferPayment WHERE trainerId = :trainerId", OfferPayment.class);
						                        query.setParameter("trainerId", trainerId);

						                        offerPayments = query.getResultList();

						                        transaction.commit();
						                    } catch (Exception e) {
						                        e.printStackTrace();
						                    }

						                    return offerPayments;
						                }
						            
						                
						                public List<ProductPayment> getProductPaymentsByTrainerId(String trainerId) {
						                    List<ProductPayment> productPayments = null;
						                    Transaction transaction = null;

						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        transaction = session.beginTransaction();
						                        String hql = "FROM ProductPayment WHERE trainerId = :trainerId";
						                        Query<ProductPayment> query = session.createQuery(hql, ProductPayment.class);
						                        query.setParameter("trainerId", trainerId);
						                        productPayments = query.getResultList();
						                        transaction.commit();
						                    } catch (Exception e) {
						                        if (transaction != null) {
						                            transaction.rollback();
						                        }
						                        e.printStackTrace();
						                    }
						                    return productPayments;
						                }
						            
						                public boolean deleteProductCartItem(int id) {
						                    Transaction transaction = null;
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        transaction = session.beginTransaction();
						                        ProductCart productCart = session.get(ProductCart.class, id);

						                        if (productCart != null) {
						                            session.delete(productCart);
						                            transaction.commit();
						                            return true;
						                        } else {
						                            return false; // No record found
						                        }
						                    } catch (Exception e) {
						                        if (transaction != null) transaction.rollback();
						                        e.printStackTrace();
						                        return false;
						                    }
						                }
						            
						                
						                public boolean deleteOfferCartItem(long id) {
						                    Transaction transaction = null;
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        transaction = session.beginTransaction();
						                        OfferCart offerCart = session.get(OfferCart.class, id);

						                        if (offerCart != null) {
						                            session.delete(offerCart);
						                            transaction.commit();
						                            return true;
						                        } else {
						                            return false; // No record found
						                        }
						                    } catch (Exception e) {
						                        if (transaction != null) transaction.rollback();
						                        e.printStackTrace();
						                        return false;
						                    }
						                }
						                
						                public boolean deleteCartItem(int id) {
						                    Transaction transaction = null;
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        transaction = session.beginTransaction();
						                        CartPojo cartItem = session.get(CartPojo.class, id);

						                        if (cartItem != null) {
						                            session.delete(cartItem);
						                            transaction.commit();
						                            return true;
						                        } else {
						                            return false; // No record found
						                        }
						                    } catch (Exception e) {
						                        if (transaction != null) transaction.rollback();
						                        e.printStackTrace();
						                        return false;
						                    }
						                }
						                public List<BookPayment> getBookingsByUserId(String userId) {
						                    List<BookPayment> bookings = new ArrayList<>();
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        Query<BookPayment> query = session.createQuery("FROM BookPayment WHERE userId = :userId", BookPayment.class);
						                        query.setParameter("userId", userId); // Now passing String
						                        bookings = query.getResultList();
						                    } catch (Exception e) {
						                        e.printStackTrace();
						                    }
						                    return bookings;
						                }

						                public List<OfferPayment> getOfferPaymentsByUserId(String userId) {
						                    List<OfferPayment> offerPayments = new ArrayList<>();
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        Query<OfferPayment> query = session.createQuery("FROM OfferPayment WHERE userId = :userId", OfferPayment.class);
						                        query.setParameter("userId", userId); // Ensure correct type
						                        offerPayments = query.getResultList();
						                    } catch (Exception e) {
						                        e.printStackTrace();
						                    }
						                    return offerPayments;
						                }
						                
						                
						                public List<ProductPayment> getProductPaymentsByUserId(String userId) {
						                    List<ProductPayment> payments = new ArrayList<>();
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        Query<ProductPayment> query = session.createQuery("FROM ProductPayment WHERE userId = :userId", ProductPayment.class);
						                        query.setParameter("userId", userId);
						                        payments = query.getResultList();
						                    } catch (Exception e) {
						                        e.printStackTrace();
						                    }
						                    return payments;
						                }


						                public boolean deleteBookPayment(Long bookingId) {
						                    Transaction transaction = null;
						                    boolean isDeleted = false;

						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        transaction = session.beginTransaction();

						                        // Fetch the entity
						                        BookPayment bookPayment = session.get(BookPayment.class, bookingId);
						                        if (bookPayment != null) {
						                            session.delete(bookPayment);
						                            isDeleted = true;
						                        }

						                        transaction.commit();
						                    } catch (Exception e) {
						                        if (transaction != null) transaction.rollback();
						                        e.printStackTrace();
						                    }
						                    return isDeleted;
						                } 

						                
						                public boolean deleteOfferPayment(int id) {
						                    Transaction transaction = null;
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        transaction = session.beginTransaction();
						                        
						                        OfferPayment offerPayment = session.get(OfferPayment.class, id); // Fetch entity
						                        if (offerPayment != null) {
						                            session.delete(offerPayment); // Delete entity
						                            transaction.commit();
						                            return true;
						                        } else {
						                            return false;
						                        }
						                    } catch (Exception e) {
						                        if (transaction != null) {
						                            transaction.rollback();
						                        }
						                        e.printStackTrace();
						                        return false;
						                    }
						                }

						                public boolean deleteProductPayment(int paymentId) {
						                    Transaction transaction = null;
						                    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
						                        transaction = session.beginTransaction();

						                        Query<?> query = session.createQuery("DELETE FROM ProductPayment WHERE paymentId = :paymentId");
						                        query.setParameter("paymentId", paymentId);
						                        int result = query.executeUpdate();

						                        transaction.commit();
						                        return result > 0; // Return true if deletion was successful
						                    } catch (Exception e) {
						                        if (transaction != null) {
						                            transaction.rollback();
						                        }
						                        e.printStackTrace();
						                        return false;
						                    }
						                
						                }
						                
						                
						                
						                
						                
						                
						                
}
						            

			     
			     
			     
			 


		    
		    
				
				// TODO Auto-generated method stub

