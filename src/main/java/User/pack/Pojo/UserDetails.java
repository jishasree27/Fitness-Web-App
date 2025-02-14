package User.pack.Pojo;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.*;

@Entity
@Table(name = "user_details")
public class UserDetails {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "id", nullable = false, unique = true)
	    private Long id;
	    @Column(name="name")
	    private String name;
	    public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		@Column(name="email")
		private String email;
	    @Column(name="phone")
	    private String phone;
	    @Column(name="gender")
	    private String gender;
	    @Column(name="dob")
	    private String dob;
	    @Column(name="location")
	    private String location;

	    @Column(name="fitnessLevel")
	    private String fitnessLevel;
	    @Column(name="goal")
	    private String goal;
	    @Column(name="healthConditions")
	    private String healthConditions;
	    @Column(name="weight")
	    private double weight;
	    @Column(name="height")
	    private double height;
	    @Column(name="activityLevel")
	    private String activityLevel;

	    @Column(name="dietPreferences")
	    private String dietPreferences;
	    @Column(name="exercisePreferences")
	    private String exercisePreferences;
	    @Column(name="workoutSchedule")
	    private int workoutSchedule;
	    @Column(name="sleep")
	    private int sleep;

	    @Column(name="motivation")
	    private String motivation;
	    @Column(name="communication")
	    private String communication;
	    
	    @Column(name = "userId", nullable = false)
	    private String userId;
	    
	    
	    
	    public UserDetails(String userId,String name, String email, String phone, String gender, String dob, String location,
	    		String fitnessLevel, String goal, String healthConditions, double weight, double height, String activityLevel,
	    		String dietPreferences, String exercisePreferences, int workoutSchedule, int sleep, String motivation,
	    		String communication) {
	    	super();
	    	this.name = name;
	    	this.email = email;
	    	this.phone = phone;
	    	this.gender = gender;
	    	this.dob = dob;
	    	this.location = location;
	    	this.fitnessLevel = fitnessLevel;
	    	this.goal = goal;
	    	this.healthConditions = healthConditions;
	    	this.weight = weight;
	    	this.height = height;
	    	this.activityLevel = activityLevel;
	    	this.dietPreferences = dietPreferences;
	    	this.exercisePreferences = exercisePreferences;
	    	this.workoutSchedule = workoutSchedule;
	    	this.sleep = sleep;
	    	this.motivation = motivation;
	    	this.communication = communication;
	    	this.userId = userId;
	    }

	    public UserDetails() {
			// TODO Auto-generated constructor stub
		}

		// Getters and Setters
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

	    public String getPhone() {
	        return phone;
	    }

	    public void setPhone(String phone) {
	        this.phone = phone;
	    }

	    public String getGender() {
	        return gender;
	    }

	    public void setGender(String gender) {
	        this.gender = gender;
	    }

	    public  String getDob() {
	        return dob;
	    }

	    public void setDob( String dob) {
	        this.dob = dob;
	    }

	    public String getLocation() {
	        return location;
	    }

	    public void setLocation(String location) {
	        this.location = location;
	    }

	    public String getFitnessLevel() {
	        return fitnessLevel;
	    }

	    public void setFitnessLevel(String fitnessLevel) {
	        this.fitnessLevel = fitnessLevel;
	    }

	    public String getGoal() {
	        return goal;
	    }

	    public void setGoal(String goal) {
	        this.goal = goal;
	    }

	    public String getHealthConditions() {
	        return healthConditions;
	    }

	    public void setHealthConditions(String healthConditions) {
	        this.healthConditions = healthConditions;
	    }

	    public double getWeight() {
	        return weight;
	    }

	    public void setWeight(double weight) {
	        this.weight = weight;
	    }

	    public double getHeight() {
	        return height;
	    }

	    public void setHeight(double height) {
	        this.height = height;
	    }

	    public String getActivityLevel() {
	        return activityLevel;
	    }

	    public void setActivityLevel(String activityLevel) {
	        this.activityLevel = activityLevel;
	    }

	    public String getDietPreferences() {
	        return dietPreferences;
	    }

	    public void setDietPreferences(String dietPreferences) {
	        this.dietPreferences = dietPreferences;
	    }

	    public String getExercisePreferences() {
	        return exercisePreferences;
	    }

	    public void setExercisePreferences(String exercisePreferences) {
	        this.exercisePreferences = exercisePreferences;
	    }

	    public int getWorkoutSchedule() {
	        return workoutSchedule;
	    }

	    public void setWorkoutSchedule(int workoutSchedule) {
	        this.workoutSchedule = workoutSchedule;
	    }

	    public int getSleep() {
	        return sleep;
	    }

	    public void setSleep(int sleep) {
	        this.sleep = sleep;
	    }

	    public String getMotivation() {
	        return motivation;
	    }

	    public void setMotivation(String motivation) {
	        this.motivation = motivation;
	    }

	    public String getCommunication() {
	        return communication;
	    }

	    public void setCommunication(String communication) {
	        this.communication = communication;
	    }
	    
	    public String getUserId() {
			return userId;
		}

		public void setUserId(String userId) {
			this.userId = userId;
		}

	    @Override
		public String toString() {
			return "UserDetails [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", gender="
					+ gender + ", dob=" + dob + ", location=" + location + ", fitnessLevel=" + fitnessLevel + ", goal="
					+ goal + ", healthConditions=" + healthConditions + ", weight=" + weight + ", height=" + height
					+ ", activityLevel=" + activityLevel + ", dietPreferences=" + dietPreferences
					+ ", exercisePreferences=" + exercisePreferences + ", workoutSchedule=" + workoutSchedule
					+ ", sleep=" + sleep + ", motivation=" + motivation + ", communication=" + communication
					+ ", userId=" + userId + "]";
		}
	}


