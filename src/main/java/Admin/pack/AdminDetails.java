package Admin.pack;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;
import java.util.List;

@Entity
@Table(name = "admin_details")
public class AdminDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id") 
    private Long id;
    @Column(name = "name") 
    private String name;
    @Column(name = "age") 
    private int age;
    @Column(name = "dob") 
    private LocalDate dob;
    @Column(name = "designation") 
    private String designation;
    @Column(name = "email") 
    private String email;
    @Column(name = "gender") 
    private String gender;
    @Column(name = "phone") 
    private String phone;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public LocalDate getDob() {
        return dob;
    }

    public void setDob(LocalDate dob) {
        this.dob = dob;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "AdminDetails{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", dob=" + dob +
                ", designation='" + designation + '\'' +
                ", email='" + email + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }




}

