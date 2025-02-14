package User.pack.Pojo;
import javax.persistence.*;

@Entity
@Table(name = "booking_details") // Table name
public class BookPayment {

	

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment ID
	    @Column(name = "booking_id")
	    private Long bookingId;

	    @Column(name = "user_id", nullable = false)
	    private String userId;

	    @Column(name = "trainer_name", nullable = false)
	    private String trainerName;

	    @Column(name = "title", nullable = false)
	    private String title;

	    @Column(name = "amount", nullable = false)
	    private double amount;

	    @Column(name = "date", nullable = false)
	    private String date;

	    @Column(name = "trainer_id", nullable = false)
	    private String trainerId;

	    // Default Constructor
	    public BookPayment() {
	    }

	    // Parameterized Constructor (Without ID, assuming ID is auto-generated)
	    public BookPayment(String userId, String trainerName, String title, double amount, String date, String trainerId) {
	        this.userId = userId;
	        this.trainerName = trainerName;
	        this.title = title;
	        this.amount = amount;
	        this.date = date;
	        this.trainerId = trainerId;
	    }

	    // Parameterized Constructor (With ID)
	    public BookPayment(Long bookingId, String userId, String trainerName, String title, double amount, String date, String trainerId) {
	        this.bookingId = bookingId;
	        this.userId = userId;
	        this.trainerName = trainerName;
	        this.title = title;
	        this.amount = amount;
	        this.date = date;
	        this.trainerId = trainerId;
	    }

	    // Getters and Setters
	    public Long getBookingId() {
	        return bookingId;
	    }

	    public void setBookingId(Long bookingId) {
	        this.bookingId = bookingId;
	    }

	    public String getUserId() {
	        return userId;
	    }

	    public void setUserId(String userId) {
	        this.userId = userId;
	    }

	    public String getTrainerName() {
	        return trainerName;
	    }

	    public void setTrainerName(String trainerName) {
	        this.trainerName = trainerName;
	    }

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title;
	    }

	    public double getAmount() {
	        return amount;
	    }

	    public void setAmount(double amount) {
	        this.amount = amount;
	    }

	    public String getDate() {
	        return date;
	    }

	    public void setDate(String date) {
	        this.date = date;
	    }

	    public String getTrainerId() {
	        return trainerId;
	    }

	    public void setTrainerId(String trainerId) {
	        this.trainerId = trainerId;
	    }

	    // toString() Method
	    @Override
	    public String toString() {
	        return "BookingPojo{" +
	                "bookingId=" + bookingId +
	                ", userId='" + userId + '\'' +
	                ", trainerName='" + trainerName + '\'' +
	                ", title='" + title + '\'' +
	                ", amount=" + amount +
	                ", date='" + date + '\'' +
	                ", trainerId='" + trainerId + '\'' +
	                '}';
	    }
	}


