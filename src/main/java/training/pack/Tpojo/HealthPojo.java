package training.pack.Tpojo;

import java.util.Arrays;

import javax.persistence.*;

@Entity
@Table(name = "health")
public class HealthPojo {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id")
	    private Long id;

	    @Column(name = "userId", nullable = false)
	    private String userId;

	    @Lob
	    @Column(name = "image")
	    private byte[] image;

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

		@Column(name = "trainer_name", nullable = false)
	    private String trainerName;

	    @Column(name = "food_control_ideas", nullable = false, length = 1000)
	    private String foodControlIdeas;

	    @Column(name = "days_to_follow", nullable = false)
	    private Integer daysToFollow;

	    @Column(name = "daily_routine", nullable = false, length = 1000)
	    private String dailyRoutine;

	    // Getters and Setters
	    public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getTrainerName() {
	        return trainerName;
	    }

	    public void setTrainerName(String trainerName) {
	        this.trainerName = trainerName;
	    }

	    public String getFoodControlIdeas() {
	        return foodControlIdeas;
	    }

	    public void setFoodControlIdeas(String foodControlIdeas) {
	        this.foodControlIdeas = foodControlIdeas;
	    }

	    public Integer getDaysToFollow() {
	        return daysToFollow;
	    }

	    public void setDaysToFollow(Integer daysToFollow) {
	        this.daysToFollow = daysToFollow;
	    }

	    public String getDailyRoutine() {
	        return dailyRoutine;
	    }

	    public void setDailyRoutine(String dailyRoutine) {
	        this.dailyRoutine = dailyRoutine;
	    }

		@Override
		public String toString() {
			return "HealthPojo [id=" + id + ", userId=" + userId + ", image=" + Arrays.toString(image)
					+ ", trainerName=" + trainerName + ", foodControlIdeas=" + foodControlIdeas + ", daysToFollow="
					+ daysToFollow + ", dailyRoutine=" + dailyRoutine + "]";
		}



		public HealthPojo(Long id, String userId, byte[] image, String trainerName, String foodControlIdeas,
				Integer daysToFollow, String dailyRoutine) {
			super();
			this.id = id;
			this.userId = userId;
			this.image = image;
			this.trainerName = trainerName;
			this.foodControlIdeas = foodControlIdeas;
			this.daysToFollow = daysToFollow;
			this.dailyRoutine = dailyRoutine;
		}

		public HealthPojo() {
			// TODO Auto-generated constructor stub
		}
	}

