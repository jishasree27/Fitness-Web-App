package training.pack.Tpojo;
import javax.persistence.*;

@Entity
@Table(name = "FreeLiveClass")
public class FreeClassPojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name="trainer_Name")
	    private String trainerName;
    @Column(name="Title")
	    private String classTitle;
    @Column(name="Link")
	    private String videoLink;
    @Column(name="Description")
	    private String classDescription;
    @Column(name = "userId", nullable = false)
    private String userId;

    
    
    
    public FreeClassPojo(Long id, String trainerName, String classTitle, String videoLink, String classDescription,
			String userId) {
		super();
		this.id = id;
		this.trainerName = trainerName;
		this.classTitle = classTitle;
		this.videoLink = videoLink;
		this.classDescription = classDescription;
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}


	    // Getters and Setters
	    public String getTrainerName() {
	        return trainerName;
	    }

	    public void setTrainerName(String trainerName) {
	        this.trainerName = trainerName;
	    }

	    public String getClassTitle() {
	        return classTitle;
	    }

	    public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public void setClassTitle(String classTitle) {
	        this.classTitle = classTitle;
	    }

	    public String getVideoLink() {
	        return videoLink;
	    }

	    public void setVideoLink(String videoLink) {
	        this.videoLink = videoLink;
	    }

	    public String getClassDescription() {
	        return classDescription;
	    }

	    public void setClassDescription(String classDescription) {
	        this.classDescription = classDescription;
	    }
	    
	    public FreeClassPojo() {}

	    @Override
		public String toString() {
			return "FreeClassPojo [id=" + id + ", trainerName=" + trainerName + ", classTitle=" + classTitle
					+ ", videoLink=" + videoLink + ", classDescription=" + classDescription + ", userId=" + userId
					+ "]";
		}
	}


