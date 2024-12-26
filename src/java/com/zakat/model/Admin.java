/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author user
 */
public class Admin {
    private String adminID;
    private String adminName;
    private String adminPassword;
    private String adminEmail;
    private String adminPhoneNum;

    public Admin(String adminID, String adminName, String adminPassword, 
                 String adminEmail, String adminPhoneNum) {
        this.adminID = adminID;
        this.adminName = adminName;
        this.adminPassword = adminPassword;
        this.adminEmail = adminEmail;
        this.adminPhoneNum = adminPhoneNum;
    }

    // Getters and Setters
    public String getAdminID() { return adminID; }
    public void setAdminID(String adminID) { this.adminID = adminID; }

    public String getAdminName() { return adminName; }
    public void setAdminName(String adminName) { this.adminName = adminName; }

    public String getAdminPassword() { return adminPassword; }
    public void setAdminPassword(String adminPassword) { this.adminPassword = adminPassword; }

    public String getAdminEmail() { return adminEmail; }
    public void setAdminEmail(String adminEmail) { this.adminEmail = adminEmail; }

    public String getAdminPhoneNum() { return adminPhoneNum; }
    public void setAdminPhoneNum(String adminPhoneNum) { this.adminPhoneNum = adminPhoneNum; }
}
