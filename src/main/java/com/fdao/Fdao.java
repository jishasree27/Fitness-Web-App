package com.fdao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.fpojo.ContactUsPojo;
import com.fpojo.Fpojo;
import com.fsession.SessionProvider;



public class Fdao {
  
        public void insert(Fpojo pj) {
    		System.out.println("insert");
    		System.out.println(pj);
    		SessionFactory factory=SessionProvider.provideSessionFactory();
    		Transaction transaction = null;
            Session session = null;

            try {
                session = factory.openSession();
                transaction = session.beginTransaction();
                session.save(pj);
                transaction.commit();
                
                System.out.println("Record inserted successfully.");
            } 
            catch (Exception e) 
            {
            	System.out.println("inside catch");
                if (transaction != null) {
                    transaction.rollback(); 
                }
                e.printStackTrace();
                System.out.println("Failed to insert record.");
            };
            
    	}
        public boolean validateUser(String email, String password) {
            System.out.println("Validating user with email: " + email);
            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
                String hql = "SELECT 1 FROM Fpojo WHERE email = :email AND password = :password";
                Query<Integer> query = session.createQuery(hql, Integer.class);
                query.setParameter("email", email);
                query.setParameter("password", password);

                return query.uniqueResult() != null; 
            } catch (Exception e) {
                e.printStackTrace();
                return false; 
            }
        }
        public Fpojo getUser(String email, String userType) {
            Fpojo user = null;

            // Get SessionFactory
            SessionFactory sessionFactory = SessionProvider.provideSessionFactory();
            if (sessionFactory == null) {
                System.err.println("Error: SessionFactory is not initialized.");
                return null;
            }

            try (Session session = sessionFactory.openSession()) {
                String hql = "FROM Fpojo WHERE email = :email AND userType = :userType";
                Query<Fpojo> query = session.createQuery(hql, Fpojo.class);
                query.setParameter("email", email);
                query.setParameter("userType", userType);

                // Fetch a single result or return null
                List<Fpojo> resultList = query.getResultList();
                if (resultList.size() == 1) {
                    user = resultList.get(0);
                } else if (resultList.size() > 1) {
                    throw new IllegalStateException("Multiple users found with the same email and userType.");
                } else {
                    System.out.println("No user found with the given email and userType.");
                }
            } catch (Exception e) {
                System.err.println("Error fetching user: " + e.getMessage());
                e.printStackTrace();
            }

            return user;
        }


        public void insert(ContactUsPojo contact) {
            Transaction transaction = null;
            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
                transaction = session.beginTransaction();
                session.save(contact);
                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                e.printStackTrace();
            }
        }
        public List<Fpojo> getAllFitnessData() {
            Transaction transaction = null;
            List<Fpojo> fitnessList = null;

            try (Session session = SessionProvider.provideSessionFactory().openSession()) {
                transaction = session.beginTransaction();

                // Query to fetch all emails from the table
                fitnessList = session.createQuery("FROM Fpojo").list();

                transaction.commit();
            } catch (Exception e) {
                if (transaction != null) {
                    transaction.rollback();
                }
                e.printStackTrace();
            }

            return fitnessList;
        }


    }

    