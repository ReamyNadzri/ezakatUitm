/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.zakat.model;

/**
 *
 * @author user
 */public class Application {
    private String applicationID;
    private String applicationDate;
    private String applicationStatus;
    private String studentID;  // FK
    private String zakatID;    // FK
    private String staffID;    // FK
    
    //super
    ZakatCategory zakatCategory;
    
    public Application() {
        this.applicationID = "";
        this.applicationDate = "";
        this.applicationStatus = "";
        this.studentID = "";
        this.zakatID = "";
        this.staffID = "";
        
        zakatCategory = new ZakatCategory();
    }

    public Application(String applicationID, String applicationDate, String applicationStatus, 
                       String studentID, String zakatID, String staffID, ZakatCategory zakatcategory) {
        
        this.applicationID = applicationID;
        this.applicationDate = applicationDate;
        this.applicationStatus = applicationStatus;
        this.studentID = studentID;
        this.zakatID = zakatID;
        this.staffID = staffID;
        this.zakatCategory = zakatcategory;
    }

    // Getters and Setters
    public String getApplicationID() { return applicationID; }
    public void setApplicationID(String applicationID) { this.applicationID = applicationID; }

    public String getApplicationDate() { return applicationDate; }
    public void setApplicationDate(String applicationDate) { this.applicationDate = applicationDate; }

    public String getApplicationStatus() { return applicationStatus; }
    public void setApplicationStatus(String applicationStatus) { this.applicationStatus = applicationStatus; }

    public String getStudentID() { return studentID; }
    public void setStudentID(String studentID) { this.studentID = studentID; }

    public String getZakatID() { return zakatID; }
    public void setZakatID(String zakatID) { this.zakatID = zakatID; }

    public String getStaffID() { return staffID; }
    public void setStaffID(String staffID) { this.staffID = staffID; }
}
