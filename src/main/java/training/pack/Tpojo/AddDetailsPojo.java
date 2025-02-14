package training.pack.Tpojo;

import javax.persistence.*;



@Entity
@Table(name = "AddDetails")
public class AddDetailsPojo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
    
    @Column(name = "name", nullable = false)
    private String name;
    
    @Column(name = "email", unique = true, nullable = false)
    private String email;
    
    @Column(name = "contact")
    private String contact;
    
    @Column(name = "type")
    private String type;
    
    @Column(name = "qualification")
    private String qualification;
    
    @Column(name = "expertise")
    private String expertise;
    
    @Column(name = "specification")
    private String specification;

    @Column(name = "phone")
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "joinedOn")
    private String joinedOn;

    @Column(name = "photo")
    private String photo;

    @Column(name = "message")
    private String message;
    
    @Column(name = "user_id") // Hidden column to store the user's ID
    private String userId;

    // Default constructor
    public AddDetailsPojo() {
    }

    // Parameterized constructor
    public AddDetailsPojo(int id, String name, String email, String contact, String type, String qualification,
                          String expertise, String specification, String phone, String address, String joinedOn,
                          String photo, String message ,String userId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.type = type;
        this.qualification = qualification;
        this.expertise = expertise;
        this.specification = specification;
        this.phone = phone;
        this.address = address;
        this.joinedOn = joinedOn;
        this.photo = photo;
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getExpertise() {
        return expertise;
    }

    public void setExpertise(String expertise) {
        this.expertise = expertise;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getJoinedOn() {
        return joinedOn;
    }

    public void setJoinedOn(String joinedOn) {
        this.joinedOn = joinedOn;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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
  
}
