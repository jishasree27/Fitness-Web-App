package training.pack.Tdao;
import training.pack.Tpojo.*;
import java.util.List;
import User.pack.Pojo.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.fsession.SessionProvider;

import Admin.pack.AdminDetails;
import Admin.pack.AdminPojo;
import com.fpojo.*;
public class AdminDao {
    public List<BookschedulePojo> getAllschedule() {
    	 Transaction transaction = null;
         List<BookschedulePojo> fList2 = null;

         try (Session session = SessionProvider.provideSessionFactory().openSession()) {
             transaction = session.beginTransaction();

             // Query to fetch all emails from the table
             fList2 = session.createQuery("FROM BookschedulePojo").list();

             transaction.commit();
         } catch (Exception e) {
             if (transaction != null) {
                 transaction.rollback();
             }
             e.printStackTrace();
         }

         return fList2;
     }
    public List<Bookings> getAllbookings() {
   	 Transaction transaction = null;
        List<Bookings> fList3 = null;
        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Query to fetch all emails from the table
            fList3 = session.createQuery("FROM Bookings").list();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        return fList3;
    }
    public List<OfferCart> getAlloffer() {
      	 Transaction transaction = null;
           List<OfferCart> fList4 = null;

           try (Session session = SessionProvider.provideSessionFactory().openSession()) {
               transaction = session.beginTransaction();

               // Query to fetch all emails from the table
               fList4 = session.createQuery("FROM OfferCart").list();

               transaction.commit();
           } catch (Exception e) {
               if (transaction != null) {
                   transaction.rollback();
               }
               e.printStackTrace();
           }

           return fList4;
       }
    public List<VideoPojo> getAllvideo() {
      	 Transaction transaction = null;
           List<VideoPojo> fList5 = null;

           try (Session session = SessionProvider.provideSessionFactory().openSession()) {
               transaction = session.beginTransaction();

               // Query to fetch all emails from the table
               fList5 = session.createQuery("FROM VideoPojo").list();

               transaction.commit();
           } catch (Exception e) {
               if (transaction != null) {
                   transaction.rollback();
               }
               e.printStackTrace();
           }

           return fList5;
       }

    public List<ProductPojo> getAllproduct() {
     	 Transaction transaction = null;
          List<ProductPojo> fList6 = null;

          try (Session session = SessionProvider.provideSessionFactory().openSession()) {
              transaction = session.beginTransaction();

              // Query to fetch all emails from the table
              fList6 = session.createQuery("FROM ProductPojo").list();

              transaction.commit();
          } catch (Exception e) {
              if (transaction != null) {
                  transaction.rollback();
              }
              e.printStackTrace();
          }

          return fList6;
      }
    
    
    public List<FreeClassPojo> getAllfree() {
    	 Transaction transaction = null;
         List<FreeClassPojo> fList7 = null;

         try (Session session = SessionProvider.provideSessionFactory().openSession()) {
             transaction = session.beginTransaction();

             // Query to fetch all emails from the table
             fList7 = session.createQuery("FROM FreeClassPojo").list();

             transaction.commit();
         } catch (Exception e) {
             if (transaction != null) {
                 transaction.rollback();
             }
             e.printStackTrace();
         }

         return fList7;
     }
    
    public List<OfferCart> ggetAllOfferCart() {
   	 Transaction transaction = null;
        List<OfferCart> fList8 = null;

        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Query to fetch all emails from the table
            fList8 = session.createQuery("FROM OfferCart").list();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        return fList8;
    }
    public List<CartPojo> getAllCart() {
   	 Transaction transaction = null;
        List<CartPojo> fList9 = null;

        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            // Query to fetch all emails from the table
            fList9 = session.createQuery("FROM CartPojo").list();

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }

        return fList9;
    }
    public static void saveupdate(AdminPojo pd) {
        Transaction transaction = null;
        try (Session session = new Configuration()
                .configure("hibernate.cfg.xml") // Load Hibernate configuration
                .addAnnotatedClass(AdminPojo.class) // Add annotated class
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
    public List<AdminPojo> getAdminUpdates() {
        // Get the current session and begin transaction
        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
            // Start a transaction
            Transaction transaction = null;
            try {
                transaction = session.beginTransaction();

                // Create a query to fetch all updates
                Query<AdminPojo> query = session.createQuery("from AdminPojo", AdminPojo.class);

                // Execute the query and get the list of updates
                List<AdminPojo> pList = query.getResultList();

                // Commit the transaction
                transaction.commit();

                // Debugging: Check the fetched list size
                System.out.println("Fetched updatesList size: " + (pList != null ? pList.size() : 0));

                return pList;
            } catch (Exception e) {
                // Rollback transaction in case of error
                if (transaction != null && transaction.isActive()) {
                    transaction.rollback();
                }
                // Log the error
                System.err.println("Error fetching updates: " + e.getMessage());
                e.printStackTrace();
                throw e;  // Optionally, rethrow the exception to propagate the error
            }
        } catch (Exception e) {
            // Handle session or other errors that might occur outside the transaction scope
            System.err.println("Error opening session: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    public AdminPojo getAdminUpdateById(long updateId) {
        Session session = SessionProvider.provideSessionFactory().openSession();
        try {
            System.out.println("Attempting to fetch AdminPojo with id: " + updateId);
            String hql = "FROM AdminPojo WHERE id = :updateId";
            Query query = session.createQuery(hql);
            query.setParameter("updateId", updateId);
            AdminPojo result = (AdminPojo) query.uniqueResult();
            if (result == null) {
                System.out.println("No AdminPojo found for id: " + updateId);
            } else {
                System.out.println("Found AdminPojo: " + result);
            }
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            session.close();
        }
    }
    public boolean updateExistingAdmin(AdminPojo updatePojo) {
        Session session = SessionProvider.provideSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            
            // Fetch the existing object based on ID
            AdminPojo existingUpdate = session.get(AdminPojo.class, updatePojo.getId());
            
            if (existingUpdate != null) {
                // Update details
                existingUpdate.setTitle(updatePojo.getTitle());
                existingUpdate.setUpdate(updatePojo.getUpdate());
                existingUpdate.setImage(updatePojo.getImage()); // Update image
                
                // Commit the transaction
                session.update(existingUpdate);
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
        } finally {
            session.close();
        }
    }

    public boolean deleteExistingAdmin(AdminPojo up) {
        Transaction transaction = null;
        Session session = null;

        try {
            // Open session and begin transaction
            session = SessionProvider.provideSessionFactory().openSession();
            transaction = session.beginTransaction();

            // HQL query to find the entity by id (assuming 'id' is the primary key)
            String hql = "FROM AdminPojo WHERE id = :id";
            AdminPojo existingEntity = (AdminPojo) session.createQuery(hql)
                .setParameter("id", up.getId())  // Use up.getId() to match the parameter
                .uniqueResult();

            // Check if entity exists
            if (existingEntity == null) {
                System.out.println("No entity found with the provided id.");
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
    public boolean saveAdminDetails(AdminDetails adminDetails) {
        Transaction transaction = null;

        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
            // Start transaction
            transaction = session.beginTransaction();

            // Save the AdminDetails object
            session.save(adminDetails);

            // Commit the transaction
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

    public List<AdminDetails> getAdminDetails() {
        // Get the current session and begin transaction
        try (Session session = SessionProvider.provideSessionFactory().openSession()) {
            // Start a transaction
            Transaction transaction = null;
            try {
                transaction = session.beginTransaction();

                // Create a query to fetch all updates
                Query<AdminDetails> query = session.createQuery("from AdminDetails", AdminDetails.class);

                // Execute the query and get the list of updates
                List<AdminDetails> pList = query.getResultList();

                // Commit the transaction
                transaction.commit();

                // Debugging: Check the fetched list size
                System.out.println("Fetched updatesList size: " + (pList != null ? pList.size() : 0));

                return pList;
            } catch (Exception e) {
                // Rollback transaction in case of error
                if (transaction != null && transaction.isActive()) {
                    transaction.rollback();
                }
                // Log the error
                System.err.println("Error fetching updates: " + e.getMessage());
                e.printStackTrace();
                throw e;  // Optionally, rethrow the exception to propagate the error
            }
        } catch (Exception e) {
            // Handle session or other errors that might occur outside the transaction scope
            System.err.println("Error opening session: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    public boolean updateAdminDetails(AdminDetails updatePojo) {
        Session session = SessionProvider.provideSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();

            // Fetch the existing object based on ID
            AdminDetails existingUpdate = session.get(AdminDetails.class, updatePojo.getId());

            if (existingUpdate != null) {
                // Update details based on the new values passed in the updatePojo
                existingUpdate.setName(updatePojo.getName());  // Update name
                existingUpdate.setEmail(updatePojo.getEmail());  // Update email
                existingUpdate.setDesignation(updatePojo.getDesignation());  // Update designation
                existingUpdate.setDob(updatePojo.getDob());  // Update dob
                existingUpdate.setGender(updatePojo.getGender());  // Update gender
                existingUpdate.setAge(updatePojo.getAge());  // Update age

                // Commit the transaction
                session.update(existingUpdate);
                transaction.commit();
                return true;
            } else {
                return false;  // Admin not found
            }
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;  // Update failed due to exception
        } finally {
            session.close();
        }
    }
    
    
        public List<ContactUser> AlluserContact() {
            Transaction transaction = null;
            List<ContactUser> contactList = null;

            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
                transaction = session.beginTransaction();

                // Fetch all records from ContactUser table
                Query<ContactUser> query = session.createQuery("FROM ContactUser", ContactUser.class);
                contactList = query.getResultList();

                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                e.printStackTrace();
            }
            return contactList;
        }
        
        public List<ContactPojo> AlltrainerContact() {
            Transaction transaction = null;
            List<ContactPojo> trainerList = null;

            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
                transaction = session.beginTransaction();

                // Fetch all records from TrainerContact table
                Query<ContactPojo> query = session.createQuery("FROM ContactPojo", ContactPojo.class);
                trainerList = query.getResultList();

                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                e.printStackTrace();
            }
            return trainerList;
        }
    
        public List<ContactUsPojo> AllcommonContact() {
            Transaction transaction = null;
            List<ContactUsPojo> contactList = null;

            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
                transaction = session.beginTransaction();

                // Fetch all records from ContactUsPojo table
                Query<ContactUsPojo> query = session.createQuery("FROM ContactUsPojo", ContactUsPojo.class);
                contactList = query.getResultList();

                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                e.printStackTrace();
            }
            return contactList;
        }
        
        
        
        
        
        
        
    }

    
    
    
    
    
    
    
    
    
    


    
    

