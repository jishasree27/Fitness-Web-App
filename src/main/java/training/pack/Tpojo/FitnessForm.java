package training.pack.Tpojo;

import javax.persistence.*;

@Entity
@Table(name = "overview")
public class FitnessForm {
	

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "otherGoal")
	private String otherGoal;
    @Column(name = "workoutFrequency")
    private String workoutFrequency;
    @Column(name = "exerciseTypes")
    private String exerciseTypes;
    @Column(name = "otherExercise")
    private String otherExercise;
    @Column(name = "flexibilityLevel")
    private String flexibilityLevel;
    @Column(name = "fitnessChallenges")
    private String fitnessChallenges;
    @Column(name = " otherChallenge")
    private String otherChallenge;
    @Column(name = "dietApproach")
    private String dietApproach;
    @Column(name = "otherDiet")
    private String otherDiet;
    @Column(name = "motivation")
    private String motivation;
    @Column(name = "otherMotivation")
    private String otherMotivation;
    @Column(name = "fitnessInjuries")
    private String fitnessInjuries;
    @Column(name = "fitnessEquipment")
    private String fitnessEquipment;
    @Column(name = "otherEquipment")
    private String otherEquipment;
    
    @Column(name = "fitness_challenges_ideas")
    private String fitnessChallengesIdeas;
    
    @Column(name = "user_id") // Column to store the user's ID
    private String userId;
    
    private String fitnessGoal;
    public FitnessForm(int id, String fitnessGoal, String otherGoal, String workoutFrequency, String exerciseTypes, String otherExercise, String flexibilityLevel, String otherChallenge, String fitnessChallenges, String dietApproach, String otherDiet, String motivation, String otherMotivation, String fitnessInjuries, String fitnessEquipment, String fitnessChallengesIdeas, String otherEquipment, String userId) {
		super();
		this.id = id;
		this.fitnessGoal = fitnessGoal;
		this.otherGoal = otherGoal;
		this.workoutFrequency = workoutFrequency;
		this.exerciseTypes = exerciseTypes;
		this.otherExercise = otherExercise;
		this.flexibilityLevel = flexibilityLevel;
		this.fitnessChallenges = fitnessChallenges;
		this.otherChallenge = otherChallenge;
		this.dietApproach = dietApproach;
		this.otherDiet = otherDiet;
		this.motivation = motivation;
		this.otherMotivation = otherMotivation;
		this.fitnessInjuries = fitnessInjuries;
		this.fitnessEquipment = fitnessEquipment;
		this.otherEquipment = otherEquipment;
		this.fitnessChallengesIdeas = fitnessChallengesIdeas;
		this.userId = userId;
	}

	public FitnessForm() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFitnessGoal() {
		return fitnessGoal;
	}

	public void setFitnessGoal(String fitnessGoal) {
		this.fitnessGoal = fitnessGoal;
	}

	public String getOtherGoal() {
		return otherGoal;
	}

	public void setOtherGoal(String otherGoal) {
		this.otherGoal = otherGoal;
	}

	public String getWorkoutFrequency() {
		return workoutFrequency;
	}

	public void setWorkoutFrequency(String workoutFrequency) {
		this.workoutFrequency = workoutFrequency;
	}

	public String getExerciseTypes() {
		return exerciseTypes;
	}

	public void setExerciseTypes(String exerciseTypes) {
		this.exerciseTypes = exerciseTypes;
	}

	public String getOtherExercise() {
		return otherExercise;
	}

	public void setOtherExercise(String otherExercise) {
		this.otherExercise = otherExercise;
	}

	public String getFlexibilityLevel() {
		return flexibilityLevel;
	}

	public void setFlexibilityLevel(String flexibilityLevel) {
		this.flexibilityLevel = flexibilityLevel;
	}

	public String getFitnessChallenges() {
		return fitnessChallenges;
	}

	public void setFitnessChallenges(String fitnessChallenges) {
		this.fitnessChallenges = fitnessChallenges;
	}

	public String getOtherChallenge() {
		return otherChallenge;
	}

	public void setOtherChallenge(String otherChallenge) {
		this.otherChallenge = otherChallenge;
	}

	public String getDietApproach() {
		return dietApproach;
	}

	public void setDietApproach(String dietApproach) {
		this.dietApproach = dietApproach;
	}

	public String getOtherDiet() {
		return otherDiet;
	}

	public void setOtherDiet(String otherDiet) {
		this.otherDiet = otherDiet;
	}

	public String getMotivation() {
		return motivation;
	}

	public void setMotivation(String motivation) {
		this.motivation = motivation;
	}

	public String getOtherMotivation() {
		return otherMotivation;
	}

	public void setOtherMotivation(String otherMotivation) {
		this.otherMotivation = otherMotivation;
	}

	public String getFitnessInjuries() {
		return fitnessInjuries;
	}

	public void setFitnessInjuries(String fitnessInjuries) {
		this.fitnessInjuries = fitnessInjuries;
	}

	public String getFitnessEquipment() {
		return fitnessEquipment;
	}

	public void setFitnessEquipment(String fitnessEquipment) {
		this.fitnessEquipment = fitnessEquipment;
	}

	public String getOtherEquipment() {
		return otherEquipment;
	}

	public void setOtherEquipment(String otherEquipment) {
		this.otherEquipment = otherEquipment;
	}

	public String getFitnessChallengesIdeas() {
		return fitnessChallengesIdeas;
	}

	public void setFitnessChallengesIdeas(String fitnessChallengesIdeas) {
		this.fitnessChallengesIdeas = fitnessChallengesIdeas;
	}
	  public String getUserId() {
	        return userId;
	    }

	    public void setUserId(String userId) {
	        this.userId = userId;
	    }



}
