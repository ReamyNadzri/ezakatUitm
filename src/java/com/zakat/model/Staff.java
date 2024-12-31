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
    private String Name;
    private String Password;
    private String Email;
    private String PhoneNum;
    private String Campus;

    public Staff() {
    }


    public Staff(String staffId, String staffNo, String Name, String Password, String Email, String PhoneNum, String Campus) {
        this.staffId = staffId;
        this.staffNo = staffNo;
        this.Name = Name;
        this.Password = Password;
        this.Email = Email;
        this.PhoneNum = PhoneNum;
        this.Campus = Campus;
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

    public String getName() {
        return this.Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getPassword() {
        return this.Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return this.Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhoneNum() {
        return this.PhoneNum;
    }

    public void setPhoneNum(String PhoneNum) {
        this.PhoneNum = PhoneNum;
    }

    public String getCampus() {
        return this.Campus;
    }

    public void setCampus(String Campus) {
        this.Campus = Campus;
    }

    

    @Override
    public String toString() {
        return "{" +
            " staffId='" + getStaffId() + "'" +
            ", staffNo='" + getStaffNo() + "'" +
            ", staffName='" + getName() + "'" +
            ", staffPassword='" + getPassword() + "'" +
            ", staffEmail='" + getEmail() + "'" +
            ", staffPhoneNum='" + getPhoneNum() + "'" +
            ", staffCampus='" + getCampus() + "'" +
            "}";
    }
}