package com.fpojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="fitness_tbl")
public class Fpojo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id")
    private int id;
    @Column(name="email")
    private String email;
    @Column(name="password")
    private String password;
    @Column(name="userType")
    private String userType;
    @Column(name="termsAccepted")
    private String termsAccepted;

   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String isTermsAccepted() {
        return termsAccepted;
    }

    public void setTermsAccepted(String terms) {
        this.termsAccepted = terms;
    }
}
