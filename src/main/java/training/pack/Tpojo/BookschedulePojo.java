package training.pack.Tpojo;

import javax.persistence.*;

@Entity
@Table(name = "bookschedule")
public class BookschedulePojo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "date")
    private String date;

    @Column(name = "from_time")
    private String fromTime;

    @Column(name = "to_time")
    private String toTime;

    @Column(name = "amount")
    private String amount;

    @Column(name = "user_id") // Hidden column to store the user's ID
    private String userId;

    // Default constructor
    public BookschedulePojo() {
    }

    // Parameterized constructor
    public BookschedulePojo(String date, String fromTime, String toTime, String amount, String userId) {
        this.date = date;
        this.fromTime = fromTime;
        this.toTime = toTime;
        this.amount = amount;
        this.userId = userId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getFromTime() {
        return fromTime;
    }

    public void setFromTime(String fromTime) {
        this.fromTime = fromTime;
    }

    public String getToTime() {
        return toTime;
    }

    public void setToTime(String toTime) {
        this.toTime = toTime;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
   
}
