/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.model;

/**
 *
 * @author user
 */
public class Donator {
    private String donatorID;
    private String username;
    private String password;
    private String email;
    private String phoneNum;
    private String state;
    private String city;
    private String noic;  // National ID
    private String adminID;  // FK

    public Donator(String donatorID, String username, String password, String email, String phoneNum, 
                   String state, String city, String noic, String adminID) {
        this.donatorID = donatorID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNum = phoneNum;
        this.state = state;
        this.city = city;
        this.noic = noic;
        this.adminID = adminID;
    }

    // Getters and Setters
    public String getDonatorID() { return donatorID; }
    public void setDonatorID(String donatorID) { this.donatorID = donatorID; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhoneNum() { return phoneNum; }
    public void setPhoneNum(String phoneNum) { this.phoneNum = phoneNum; }

    public String getState() { return state; }
    public void setState(String state) { this.state = state; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getNoic() { return noic; }
    public void setNoic(String noic) { this.noic = noic; }

    public String getAdminID() { return adminID; }
    public void setAdminID(String adminID) { this.adminID = adminID; }
}
