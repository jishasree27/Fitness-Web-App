package User.pack;

import javax.persistence.*;

@Entity
@Table(name = "bookings")
public class Bookings {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Ensure auto-increment for booking_id
    @Column(name = "booking_id")
    private int bookingId;  // Primary key for the booking
    
    @Column(name = "title")
    private String title;

    @Column(name = "trainer_user_id")
    private String trainerUserId;

    @Column(name = "trainer_name")
    private String trainer;

    @Column(name = "booking_date")
    private String date;

    @Column(name = "from_time")
    private String Ftime;

    @Column(name = "to_time")
    private String Ttime;

    @Column(name = "customer_user_id")
    private String customerUserId;

    @Column(name = "customer_name")
    private String customerName;

    @Column(name = "customer_email")
    private String customerEmail;

    // Default constructor
    public Bookings() {}

 
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	// Constructor without bookingId (auto-generated)
    public Bookings(String title,String trainerUserId, String trainer, String date, String ftime, String ttime,
                    String customerUserId, String customerName, String customerEmail) {
    	this.title = title;
        this.trainerUserId = trainerUserId;
        this.trainer = trainer;
        this.date = date;
        this.Ftime = ftime;
        this.Ttime = ttime;
        this.customerUserId = customerUserId;
        this.customerName = customerName;
        this.customerEmail = customerEmail;
    }

    // Getters and Setters for each field
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getTrainerUserId() {
        return trainerUserId;
    }

    public void setTrainerUserId(String trainerUserId) {
        this.trainerUserId = trainerUserId;
    }

    public String getTrainer() {
        return trainer;
    }

    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFtime() {
        return Ftime;
    }

    public void setFtime(String Ftime) {
        this.Ftime = Ftime;
    }

    public String getTtime() {
        return Ttime;
    }

    public void setTtime(String Ttime) {
        this.Ttime = Ttime;
    }

    public String getCustomerUserId() {
        return customerUserId;
    }

    public void setCustomerUserId(String customerUserId) {
        this.customerUserId = customerUserId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    @Override
	public String toString() {
		return "Bookings [bookingId=" + bookingId + ", title=" + title + ", trainerUserId=" + trainerUserId
				+ ", trainer=" + trainer + ", date=" + date + ", Ftime=" + Ftime + ", Ttime=" + Ttime
				+ ", customerUserId=" + customerUserId + ", customerName=" + customerName + ", customerEmail="
				+ customerEmail + "]";
	}

	}
