/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.model;

import java.io.Serializable;
/**
 *
 * @author asyraf
 */
public class registerStaff implements Serializable {

    private String staffNo;
    private String staffName;
    private String staffIc;
    private String staffCampus;
    private String staffPhoneNumber;
    private String staffEmail;
    private String staffPassword;
   
    public registerStaff( String staffNo, String staffName, String staffIc, String staffCampus, String staffPhoneNumber, String staffEmail, String staffPassword) {
         this.staffNo = staffNo;
        this.staffName = staffName;
        this.staffIc = staffIc;
        this.staffCampus = staffCampus;
        this.staffPhoneNumber = staffPhoneNumber;
        this.staffEmail = staffEmail;
        this.staffPassword = staffPassword;
    }

    // Getter methods for each property
     public String getStaffNo() {
        return staffNo;
    }
     
    public String getStaffName() {
        return staffName;
    }


    public String getStaffIc() {
        return staffIc;
    }
    
     public String getStaffCampus() {
        return staffCampus;
    }
     
     public String getStaffPhoneNumber() {
        return staffPhoneNumber;
    }
    
     public String getStaffEmail() {
        return staffEmail;
    }
     
     public String getStaffPassword() {
        return staffPassword;
    }
}
