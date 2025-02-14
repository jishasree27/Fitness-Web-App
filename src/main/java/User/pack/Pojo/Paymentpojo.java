package User.pack.Pojo;

import javax.persistence.*;

@Entity
@Table(name = "payment_details")
public class Paymentpojo {


	    
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private int id;
	    
	    @Column(name = "user_id")
	    private String userId;

	    @Column(name = "video_id")
	    private String videoId;

	    @Column(name = "payment_status")
	    private String paymentStatus;

	    @Column(name = "payment_id")
	    private String paymentId;

	    public Paymentpojo() {}

	    public Paymentpojo(String userId, String videoId, String paymentStatus, String paymentId) {
	        this.userId = userId;
	        this.videoId = videoId;
	        this.paymentStatus = paymentStatus;
	        this.paymentId = paymentId;
	    }

	    // Getters and Setters
	    public int getId() { return id; }
	    public void setId(int id) { this.id = id; }

	    public String getUserId() { return userId; }
	    public void setUserId(String userId) { this.userId = userId; }

	    public String getVideoId() { return videoId; }
	    public void setVideoId(String videoId) { this.videoId = videoId; }

	    public String getPaymentStatus() { return paymentStatus; }
	    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

	    public String getPaymentId() { return paymentId; }
	    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

		@Override
		public String toString() {
			return "Paymentpojo [id=" + id + ", userId=" + userId + ", videoId=" + videoId + ", paymentStatus="
					+ paymentStatus + ", paymentId=" + paymentId + "]";
		}
	}


