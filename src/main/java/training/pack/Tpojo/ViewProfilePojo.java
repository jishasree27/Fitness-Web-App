package training.pack.Tpojo;

import javax.persistence.*;

@Entity
@Table(name = "ViewProfile")
public class ViewProfilePojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "trainer_id")
    private int id;

    @Lob // Specifies that the image will be stored as a BLOB
    @Column(name = "profile_image")
    private byte[] image;

    @Column(name = "trainer_name", nullable = false, length = 100)
    private String name;

    @Column(name = "trainer_details", columnDefinition = "TEXT")
    private String details;

    @Column(name = "schedule_date")
    private String date;

    @Column(name = "schedule_fromtime")
    private String ftime;

    @Column(name = "schedule_totime")
    private String Ttime;

    @Column(name = "payment_details")
    private String paymentDetails;

    @Column(name = "user_id") // Column to store the user's ID
    private String userId;

    @Column(name = "offer", nullable = true, length = 255) // New column for Offer
    private String offer;

    // Constructor
    public ViewProfilePojo(int id, byte[] image, String name, String details, String date, String ftime, String Ttime,
            String paymentDetails, String userId, String offer) {
        this.id = id;
        this.image = image;
        this.name = name;
        this.details = details;
        this.date = date;
        this.ftime = ftime;
        this.Ttime = Ttime;
        this.paymentDetails = paymentDetails;
        this.userId = userId;
        this.offer = offer;
    }

    // Default Constructor
    public ViewProfilePojo() {
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFtime() {
        return ftime;
    }

    public void setFtime(String ftime) {
        this.ftime = ftime;
    }

    public String getTtime() {
        return Ttime;
    }

    public void setTtime(String Ttime) {
        this.Ttime = Ttime;
    }

    public String getPaymentDetails() {
        return paymentDetails;
    }

    public void setPaymentDetails(String paymentDetails) {
        this.paymentDetails = paymentDetails;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getOffer() {
        return offer;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }

    @Override
    public String toString() {
        return "ViewProfilePojo [id=" + id + ", image=" + (image != null ? "[BLOB]" : "null") + ", name=" + name
                + ", details=" + details + ", date=" + date + ", ftime=" + ftime + ", Ttime=" + Ttime
                + ", paymentDetails=" + paymentDetails + ", userId='" + userId + "', offer=" + offer + "]";
    }

	
}
