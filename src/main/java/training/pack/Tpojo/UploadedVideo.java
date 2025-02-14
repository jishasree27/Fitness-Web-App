package training.pack.Tpojo;
import javax.persistence.*;
@Entity
@Table(name = "videouploaded")
public class UploadedVideo {
      
	    @Id
	    private int id;
	    private String title;
	    private String thumbnail;
	    private int views;
	    private int likes;
	    private int comments;
	    private int subscribers;
	    private String userId;
        
	    public UploadedVideo(int id, String title, String thumbnail, int views, int likes, int comments,
				int subscribers, String userId) {
			super();
			this.id = id;
			this.title = title;
			this.thumbnail = thumbnail;
			this.views = views;
			this.likes = likes;
			this.comments = comments;
			this.subscribers = subscribers;
			this.userId = userId;
		}

		// Getters and Setters
	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
	    }

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title;
	    }

	    public String getThumbnail() {
	        return thumbnail;
	    }

	    public void setThumbnail(String thumbnail) {
	        this.thumbnail = thumbnail;
	    }

	    public int getViews() {
	        return views;
	    }

	    public void setViews(int views) {
	        this.views = views;
	    }

	    public int getLikes() {
	        return likes;
	    }

	    public void setLikes(int likes) {
	        this.likes = likes;
	    }

	    public int getComments() {
	        return comments;
	    }

	    public void setComments(int comments) {
	        this.comments = comments;
	    }

	    public int getSubscribers() {
	        return subscribers;
	    }

	    public void setSubscribers(int subscribers) {
	        this.subscribers = subscribers;
	    }

	    public String getUserId() {
	        return userId;
	    }

	    public void setUserId(String userId) {
	        this.userId = userId;
	    }
	    public UploadedVideo() {
	        // No-argument constructor for Hibernate
	    }
	}


