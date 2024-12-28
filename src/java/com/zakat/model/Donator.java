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

    public Donator() {
    }

    public Donator(String donatorID, String username, String password, String email, String phoneNum, String state, String city, String noic) {
        this.donatorID = donatorID;
        this.username = username;
        this.password = password;
        this.email = email;
        this.phoneNum = phoneNum;
        this.state = state;
        this.city = city;
        this.noic = noic;
    }

    public String getDonatorID() {
        return this.donatorID;
    }

    public void setDonatorID(String donatorID) {
        this.donatorID = donatorID;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNum() {
        return this.phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNoic() {
        return this.noic;
    }

    public void setNoic(String noic) {
        this.noic = noic;
    }

    @Override
    public String toString() {
        return "{" +
            " donatorID='" + getDonatorID() + "'" +
            ", username='" + getUsername() + "'" +
            ", password='" + getPassword() + "'" +
            ", email='" + getEmail() + "'" +
            ", phoneNum='" + getPhoneNum() + "'" +
            ", state='" + getState() + "'" +
            ", city='" + getCity() + "'" +
            ", noic='" + getNoic() + "'" +
            "}";
    }


}
