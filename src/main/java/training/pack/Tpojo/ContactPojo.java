package training.pack.Tpojo;

import javax.persistence.*;

@Entity
@Table(name = "ContactUs")
public class ContactPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "email")
    private String email;

    @Column(name = "message")
    private String message;

    @Column(name = "user_id") // Hidden column to store the user's ID
    private String userId;

    // Default constructor (required by JPA)
    public ContactPojo() {
    }

    // Parameterized constructor for convenience
    public ContactPojo(String name, String email, String message, String userId) {
        this.name = name;
        this.email = email;
        this.message = message;
        this.userId = userId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    // toString Method (providing a meaningful representation of the object)
    @Override
    public String toString() {
        return "ContactPojo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", message='" + message + '\'' +
                ", userId='" + userId + '\'' +
                '}';
    }
}
