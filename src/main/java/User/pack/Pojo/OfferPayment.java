package User.pack.Pojo;

import javax.persistence.*;

@Entity
@Table(name = "offer_payments") // Table name
public class OfferPayment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-increment ID
    @Column(name = "id")
    private int id;

    @Column(name = "user_id")
    private String userId;

    @Column(name = "trainer_name")
    private String trainerName;

    @Column(name = "title")
    private String title;

    @Column(name = "amount")
    private double amount;

    @Column(name = "offer_specification")
    private String offerSpecification;

    @Column(name = "trainer_Id")
    private String trainerId;


    public String getTrainerId() {
		return trainerId;
	}

	public void setTrainerId(String trainerId) {
		this.trainerId = trainerId;
	}

	// Default Constructor
    public OfferPayment() {}

    // Parameterized Constructor
  

    // Getters and Setters
    public int getId() {
        return id;
    }

    public OfferPayment(int id, String userId, String trainerName, String title, double amount,
			String offerSpecification, String trainerId) {
		super();
		this.id = id;
		this.userId = userId;
		this.trainerName = trainerName;
		this.title = title;
		this.amount = amount;
		this.offerSpecification = offerSpecification;
		this.trainerId = trainerId;
	}

	public void setId(int id) {
        this.id = id;
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

    public String getOfferSpecification() {
        return offerSpecification;
    }

    public void setOfferSpecification(String offerSpecification) {
        this.offerSpecification = offerSpecification;
    }

 

    @Override
	public String toString() {
		return "OfferPayment [id=" + id + ", userId=" + userId + ", trainerName=" + trainerName + ", title=" + title
				+ ", amount=" + amount + ", offerSpecification=" + offerSpecification + ", trainerId=" + trainerId
				+ "]";
	}
}
