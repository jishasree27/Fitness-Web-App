package com.fsession;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionProvider {
	private static SessionFactory sessionFactory;
	public static SessionFactory provideSessionFactory() 
	{ 
		
		if (sessionFactory == null) {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        }
        return sessionFactory;
		   

	}

} 

