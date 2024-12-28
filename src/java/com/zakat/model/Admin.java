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
public class Admin {
    private String adminID;
    private String username;
    private String adminPassword;
    private String adminPhoneNum;

    public Admin() {
    }

    public Admin(String adminID, String username, String adminPassword, String adminPhoneNum) {
        this.adminID = adminID;
        this.username = username;
        this.adminPassword = adminPassword;
        this.adminPhoneNum = adminPhoneNum;
    }


    public String getAdminID() {
        return this.adminID;
    }

    public void setAdminID(String adminID) {
        this.adminID = adminID;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAdminPassword() {
        return this.adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getAdminPhoneNum() {
        return this.adminPhoneNum;
    }

    public void setAdminPhoneNum(String adminPhoneNum) {
        this.adminPhoneNum = adminPhoneNum;
    }
    @Override
    public String toString() {
        return "{" +
            " adminID='" + getAdminID() + "'" +
            ", username='" + getUsername() + "'" +
            ", adminPassword='" + getAdminPassword() + "'" +
            ", adminPhoneNum='" + getAdminPhoneNum() + "'" +
            "}";
    }
}
   