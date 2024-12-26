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
public class Staff {
    private String staffID;
    private String staffName;
    private String staffPassword;
    private String staffEmail;
    private String staffPhoneNum;
    private String staffPosition;

    public Staff(String staffID, String staffName, String staffPassword, String staffEmail, 
                 String staffPhoneNum, String staffPosition) {
        this.staffID = staffID;
        this.staffName = staffName;
        this.staffPassword = staffPassword;
        this.staffEmail = staffEmail;
        this.staffPhoneNum = staffPhoneNum;
        this.staffPosition = staffPosition;
    }

    // Getters and Setters
    public String getStaffID() { return staffID; }
    public void setStaffID(String staffID) { this.staffID = staffID; }

    public String getStaffName() { return staffName; }
    public void setStaffName(String staffName) { this.staffName = staffName; }

    public String getStaffPassword() { return staffPassword; }
    public void setStaffPassword(String staffPassword) { this.staffPassword = staffPassword; }

    public String getStaffEmail() { return staffEmail; }
    public void setStaffEmail(String staffEmail) { this.staffEmail = staffEmail; }

    public String getStaffPhoneNum() { return staffPhoneNum; }
    public void setStaffPhoneNum(String staffPhoneNum) { this.staffPhoneNum = staffPhoneNum; }

    public String getStaffPosition() { return staffPosition; }
    public void setStaffPosition(String staffPosition) { this.staffPosition = staffPosition; }
}