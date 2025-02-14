package User.pack.Pojo;

import java.io.Serializable;
import java.util.Arrays;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "ProfileCart")
public class CartPojo implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TrainerId", nullable = false, unique = true)
    private Integer trainerId;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @Column(name = "TrainerName")
    private String trainerName;

    @Column(name = "Title")
    private String title;

    @Column(name = "Date")
    private String date;

    @Column(name = "Payment")
    private String payment;

    public CartPojo(Integer trainerId, byte[] image, String trainerName, String title, String date, String payment,
			String trainersession, String usersession) {
		super();
		this.trainerId = trainerId;
		this.image = image;
		this.trainerName = trainerName;
		this.title = title;
		this.date = date;
		this.payment = payment;
		this.trainersession = trainersession;
		this.usersession = usersession;
	}

	@Column(name = "TrainerUserId")
    private String trainersession;

    @Column(name = "UserId")
    private String usersession;

    // No-argument constructor (required by Hibernate)
    public CartPojo() {
    }

    public Integer getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(Integer trainerId) {
        this.trainerId = trainerId;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
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

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public String getTrainersession() {
        return trainersession;
    }

    public void setTrainersession(String trainersession) {
        this.trainersession = trainersession;
    }

    public String getUsersession() {
        return usersession;
    }

    public void setUsersession(String usersession) {
        this.usersession = usersession;
    }

    @Override
    public String toString() {
        return "CartPojo [trainerId=" + trainerId + ", image=" + Arrays.toString(image) + ", trainerName="
                + trainerName + ", title=" + title + ", date=" + date + ", payment=" + payment + ", trainersession="
                + trainersession + ", usersession=" + usersession + "]";
    }
}
