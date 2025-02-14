package User.pack.Pojo;

import java.io.Serializable;
import java.util.Arrays;

import javax.persistence.*;

@Entity
@Table(name = "Offercart")
public class OfferCart implements Serializable {


	    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		public OfferCart(Long id, String offerValid, String offer, String paymentDetails, String offerSpecification,
				String offerName, String name, String title, byte[] image, String trainerSession, String userSession) {
			super();
			this.id = id;
			this.offerValid = offerValid;
			this.offer = offer;
			this.paymentDetails = paymentDetails;
			this.offerSpecification = offerSpecification;
			this.offerName = offerName;
			this.name = name;
			this.title = title;
			this.image = image;
			this.trainerSession = trainerSession;
			this.userSession = userSession;
		}

		public OfferCart() {
			// TODO Auto-generated constructor stub
		}

		@Override
	public String toString() {
		return "OfferCart [id=" + id + ", offerValid=" + offerValid + ", offer=" + offer + ", paymentDetails="
				+ paymentDetails + ", offerSpecification=" + offerSpecification + ", offerName=" + offerName + ", name="
				+ name + ", title=" + title + ", image=" + image + ", trainerSession=" + trainerSession
				+ ", userSession=" + userSession + "]";
	}

		@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)   
	    @Column(name = "id")
	    private Long id;

	    @Column(name = "offer_valid")
	    private String offerValid;

	    @Column(name = "offer")
	    private String offer;

	    @Column(name = "payment")
	    private String paymentDetails;

	    @Column(name = "offer_specification")
	    private String offerSpecification;

	    @Column(name = "offer_name")
	    private String offerName;

	    @Column(name = "name")
	    private String name;

	    @Column(name = "title")
	    private String title;

	    @Lob
	    @Column(name = "image")
	    private byte[] image;

	    @Column(name = "trainer_session")
	    private String trainerSession;

	    @Column(name = "user_session")
	    private String userSession;

	    // Getters and Setters
	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getOfferValid() {
	        return offerValid;
	    }

	    public void setOfferValid(String offerValid) {
	        this.offerValid = offerValid;
	    }

	    public String getOffer() {
	        return offer;
	    }

	    public void setOffer(String offer) {
	        this.offer = offer;
	    }

	    public String getPaymentDetails() {
	        return paymentDetails;
	    }

	    public void setPaymentDetails(String paymentDetails) {
	        this.paymentDetails = paymentDetails;
	    }

	    public String getOfferSpecification() {
	        return offerSpecification;
	    }

	    public void setOfferSpecification(String offerSpecification) {
	        this.offerSpecification = offerSpecification;
	    }

	    public String getOfferName() {
	        return offerName;
	    }

	    public void setOfferName(String offerName) {
	        this.offerName = offerName;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getTitle() {
	        return title;
	    }

	    public void setTitle(String title) {
	        this.title = title;
	    }

	    public byte[] getImage() {
	        return image;
	    }

	    public void setImage(byte[] image) {
	        this.image = image;
	    }

	    public String getTrainerSession() {
	        return trainerSession;
	    }

	    public void setTrainerSession(String trainerSession) {
	        this.trainerSession = trainerSession;
	    }

	    public String getUserSession() {
	        return userSession;
	    }

	    public void setUserSession(String userSession) {
	        this.userSession = userSession;
	    }
	}
