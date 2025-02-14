package training.pack.Tpojo;

import javax.persistence.*;
import java.util.Arrays;

@Entity
@Table(name = "newupdate")
public class NewUpdatePojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "class_id")
    private int classId;

    @Column(name = "userId", nullable = false)
    private String userId;

    @Lob
    @Column(name = "image")
    private byte[] image;

    @Column(name = "class_name")
    private String className;

    @Column(name = "trainer_name")
    private String trainerName;

    @Column(name = "expertise")
    private String expertise;

    @Column(name = "feedback")
    private String feedback;

    @Column(name = "description")
    private String description;

    // Default constructor
    public NewUpdatePojo() {}

    // Parameterized constructor
    public NewUpdatePojo(int classId, byte[] image, String userId, String className, String trainerName, String expertise, String feedback, String description) {
        this.classId = classId;
        this.image = image;
        this.userId = userId;
        this.className = className;
        this.trainerName = trainerName;
        this.expertise = expertise;
        this.feedback = feedback;
        this.description = description;
    }

    // Getters and setters
    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getTrainerName() {
        return trainerName;
    }

    public void setTrainerName(String trainerName) {
        this.trainerName = trainerName;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "NewUpdatePojo{" +
                "classId=" + classId +
                ", userId='" + userId + '\'' +
                ", image=" + Arrays.toString(image) +
                ", className='" + className + '\'' +
                ", trainerName='" + trainerName + '\'' +
                ", expertise='" + expertise + '\'' +
                ", feedback='" + feedback + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
