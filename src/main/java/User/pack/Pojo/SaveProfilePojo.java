package User.pack.Pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;

@Entity
@Table(name = "saveProfile")
public class SaveProfilePojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-generated ID
    @Column(name = "id")
    private Long trainerId; // Changed to Long for auto-increment behavior

    @Column(name = "trainerName", nullable = false)
    private String trainerName;

    @Column(name = "title", nullable = false)
    private String title;

    @Column(name = "trainer_user_id")
    private String trainerUserId;
    
    @Column(name = "customer_user_id")
    private String customerUserId;
    public SaveProfilePojo( String trainerName, String title, String trainerUserId,
			String customerUserId) {
		super();	
		this.trainerName = trainerName;
		this.title = title;
		this.trainerUserId = trainerUserId;
		this.customerUserId = customerUserId;
	}

	public String getTrainerUserId() {
		return trainerUserId;
	}

	public void setTrainerUserId(String trainerUserId) {
		this.trainerUserId = trainerUserId;
	}

	public String getCustomerUserId() {
		return customerUserId;
	}

	public void setCustomerUserId(String customerUserId) {
		this.customerUserId = customerUserId;
	}

	// Default constructor
    public SaveProfilePojo() {}

    

    // Getter and Setter for trainerId
    public Long getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(Long trainerId) {
        this.trainerId = trainerId;
    }

    // Getter and Setter for trainerName
    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    // Getter and Setter for title
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Override
	public String toString() {
		return "SaveProfilePojo [trainerId=" + trainerId + ", trainerName=" + trainerName + ", title=" + title
				+ ", trainerUserId=" + trainerUserId + ", customerUserId=" + customerUserId + "]";
	}
}
