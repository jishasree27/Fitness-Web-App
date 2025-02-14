package User.pack;
import javax.persistence.*;


@Entity
@Table(name = "user_video_status")

public class UserVideoStatus {
	
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @Column(name = "video_id")
	    private String videoId;

	    @Column(name = "user_id")
	    private String userId;

	    @Column(name = "like_status")
	    private int likeStatus;

	    @Column(name = "save_status")
	    private int saveStatus;

	    @Column(name = "share_status")
	    private int shareStatus;

	    @Column(name = "cart_status")
	    private int cartStatus;

	    // Getters and setters
	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getVideoId() {
	        return videoId;
	    }

	    public void setVideoId(String videoId) {
	        this.videoId = videoId;
	    }

	    public String getUserId() {
	        return userId;
	    }

	    public void setUserId(String userId) {
	        this.userId = userId;
	    }

	    public int getLikeStatus() {
	        return likeStatus;
	    }

	    public void setLikeStatus(int likeStatus) {
	        this.likeStatus = likeStatus;
	    }

	    public int getSaveStatus() {
	        return saveStatus;
	    }

	    public void setSaveStatus(int saveStatus) {
	        this.saveStatus = saveStatus;
	    }

	    public int getShareStatus() {
	        return shareStatus;
	    }

	    public void setShareStatus(int shareStatus) {
	        this.shareStatus = shareStatus;
	    }

	    public int getCartStatus() {
	        return cartStatus;
	    }

	    public void setCartStatus(int cartStatus) {
	        this.cartStatus = cartStatus;
	    }
	}


