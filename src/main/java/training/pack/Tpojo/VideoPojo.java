package training.pack.Tpojo;

import java.util.Arrays;
import javax.persistence.*;

@Entity
@Table(name = "VideoTbl")
public class VideoPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "thumbnail", nullable = false)
    private String thumbnail;

    @Column(name = "video")
    private String video;

    @Column(name = "user_id") // Column to store the user's ID
    private String userId;

    @Column(name = "trainerName")
    private String name;

    @Column(name = "specification")
    private String specification;

    @Column(name = "message")
    private String message;

    @Lob
    @Column(name = "trainer_detail", columnDefinition = "TEXT")
    private String details;


    @Column(name = "schedule_date")
    private String date;

    @Column(name = "schedule_fromtime")
    private String ftime;

    @Column(name = "schedule_totime")
    private String ttime; // Renamed variable to match camelCase

    @Column(name = "payment_details")
    private String paymentDetails;

    @Column(name = "offer", nullable = true, length = 255) // New column for Offer
    private String offer;

    @Column(name = "offer_Name", nullable = true, length = 255) // New column for Offer
    private String offerName;

    @Column(name = "offer_valid", nullable = true, length = 255) // New column for Offer
    private String offerValid;

    @Column(name = "classLink")
    private String classLink;


    // Default Constructor
    public VideoPojo() {
    }

    // Constructor with all fields
    public VideoPojo(int id, byte[] image, String title, String thumbnail, String video, String userId, String name,
                     String specification, String message, String details, String date, String ftime, String ttime,
                     String paymentDetails, String offer, String offerName, String offerValid, String classLink
                  ) {
        this.id = id;
        this.image = image;
        this.title = title;
        this.thumbnail = thumbnail;
        this.video = video;
        this.userId = userId;
        this.name = name;
        this.specification = specification;
        this.message = message;
        this.details = details;
        this.date = date;
        this.ftime = ftime;
        this.ttime = ttime; // Fixed variable name to match
        this.paymentDetails = paymentDetails;
        this.offer = offer;
        this.offerName = offerName;
        this.offerValid = offerValid;
        this.classLink = classLink;
      
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

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
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
        return ttime; // Renamed variable to match
    }

    public void setTtime(String ttime) {
        this.ttime = ttime; // Renamed variable to match
    }

    public String getPaymentDetails() {
        return paymentDetails;
    }

    public void setPaymentDetails(String paymentDetails) {
        this.paymentDetails = paymentDetails;
    }

    public String getOffer() {
        return offer;
    }

    public void setOffer(String offer) {
        this.offer = offer;
    }

    public String getOfferName() {
        return offerName;
    }

    public void setOfferName(String offerName) {
        this.offerName = offerName;
    }

    public String getOfferValid() {
        return offerValid;
    }

    public void setOfferValid(String offerValid) {
        this.offerValid = offerValid;
    }

    public String getClassLink() {
        return classLink;
    }

    public void setClassLink(String classLink) {
        this.classLink = classLink;
    }

   

    @Override
    public String toString() {
        return "VideoPojo [id=" + id + ", image=" + Arrays.toString(image) + ", title=" + title + ", thumbnail="
                + thumbnail + ", video=" + video + ", userId=" + userId + ", name=" + name + ", specification="
                + specification + ", message=" + message + ", details=" + details + ", date=" + date + ", ftime="
                + ftime + ", ttime=" + ttime + ", paymentDetails=" + paymentDetails + ", offer=" + offer
                + ", offerName=" + offerName + ", offerValid=" + offerValid + ", classLink=" + classLink + ", publickey="
                + "]";
    }
}
