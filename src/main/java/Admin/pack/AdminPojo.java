package Admin.pack;

import java.util.Arrays;
import javax.persistence.*;

@Entity
@Table(name = "adminupdates")
public class AdminPojo {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id") // Column name for the ID
    private long id;
	
    @Lob
    @Column(name = "image") // Column for the image
    private byte[] image;
	
    @Column(name = "user_id") // Column for the user ID
    private String userId;
	
    @Column(name = "title", nullable = false) // Corrected column name for title
    private String title;
	
    @Column(name = "update_text", nullable = false) // Renamed column name to avoid conflict with SQL keyword
    private String update;

    // Default constructor
    public AdminPojo() {
    }

    // Parameterized constructor
    public AdminPojo(long id, byte[] image, String userId, String title, String update) {
        this.id = id;
        this.image = image;
        this.userId = userId;
        this.title = title;
        this.update = update;
    }

    // Getter and Setter methods
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUpdate() {
        return update;
    }

    public void setUpdate(String update) {
        this.update = update;
    }

    // toString method
    @Override
    public String toString() {
        return "AdminPojo [id=" + id + ", image=" + Arrays.toString(image) + ", userId=" + userId + ", title=" + title
                + ", update=" + update + "]";
    }
}
