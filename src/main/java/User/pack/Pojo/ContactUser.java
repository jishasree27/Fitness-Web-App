package User.pack.Pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ContactUser")
public class ContactUser {
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
    public ContactUser(int id, String name, String email, String message, String userId) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.message = message;
		this.userId = userId;
	}

	public int getId() {
		return id;
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

	// Default constructor
    public ContactUser() {}



    // Getter and setter methods

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

    @Override
	public String toString() {
		return "ContactUser [id=" + id + ", name=" + name + ", email=" + email + ", message=" + message + ", userId="
				+ userId + "]";
	}
}
