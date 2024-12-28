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
public class Staff {
    private String staffId;
    private String staffNo;
    private String staffName;
    private String staffPassword;
    private String staffEmail;
    private String staffPhoneNum;
    private String staffCampus;

    public Staff() {
    }


    public Staff(String staffId, String staffNo, String staffName, String staffPassword, String staffEmail, String staffPhoneNum, String staffCampus) {
        this.staffId = staffId;
        this.staffNo = staffNo;
        this.staffName = staffName;
        this.staffPassword = staffPassword;
        this.staffEmail = staffEmail;
        this.staffPhoneNum = staffPhoneNum;
        this.staffCampus = staffCampus;
    }
    public String getStaffId() {
        return this.staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getStaffNo() {
        return this.staffNo;
    }

    public void setStaffNo(String staffNo) {
        this.staffNo = staffNo;
    }

    public String getStaffName() {
        return this.staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffPassword() {
        return this.staffPassword;
    }

    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }

    public String getStaffEmail() {
        return this.staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getStaffPhoneNum() {
        return this.staffPhoneNum;
    }

    public void setStaffPhoneNum(String staffPhoneNum) {
        this.staffPhoneNum = staffPhoneNum;
    }

    public String getStaffCampus() {
        return this.staffCampus;
    }

    public void setStaffCampus(String staffCampus) {
        this.staffCampus = staffCampus;
    }

    

    @Override
    public String toString() {
        return "{" +
            " staffId='" + getStaffId() + "'" +
            ", staffNo='" + getStaffNo() + "'" +
            ", staffName='" + getStaffName() + "'" +
            ", staffPassword='" + getStaffPassword() + "'" +
            ", staffEmail='" + getStaffEmail() + "'" +
            ", staffPhoneNum='" + getStaffPhoneNum() + "'" +
            ", staffCampus='" + getStaffCampus() + "'" +
            "}";
    }
}