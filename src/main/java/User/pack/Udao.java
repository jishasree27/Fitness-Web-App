package User.pack;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import com.fsession.SessionProvider;
import training.pack.Tpojo.VideoPojo;

public class Udao {
	
	public List<VideoPojo> getAllVideoUploaded() {
	    System.out.println("INSIDE GETALLVIDEOUPLOADED");
	    List<VideoPojo> videos = new ArrayList<>();

	    try (Session session = SessionProvider.provideSessionFactory().openSession()) {
	        // Begin a session and execute the query
	        videos = session.createQuery("FROM VideoPojo", VideoPojo.class).list();
	        System.out.println("Query executed successfully, fetched videos: " + videos.size());
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.err.println("Error fetching videos: " + e.getMessage());
	    }

	    return videos;
	}


}
