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
public class Result {
    private String resultID;
    private String resultDate;
    private String resultStatus;
    private double total;
    private String zakatID;  // FK
    private String staffID;  // FK
    private String adminID;  // FK

    public Result(String resultID, String resultDate, String resultStatus, double total, 
                  String zakatID, String staffID, String adminID) {
        this.resultID = resultID;
        this.resultDate = resultDate;
        this.resultStatus = resultStatus;
        this.total = total;
        this.zakatID = zakatID;
        this.staffID = staffID;
        this.adminID = adminID;
    }

    // Getters and Setters
    public String getResultID() { return resultID; }
    public void setResultID(String resultID) { this.resultID = resultID; }

    public String getResultDate() { return resultDate; }
    public void setResultDate(String resultDate) { this.resultDate = resultDate; }

    public String getResultStatus() { return resultStatus; }
    public void setResultStatus(String resultStatus) { this.resultStatus = resultStatus; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public String getZakatID() { return zakatID; }
    public void setZakatID(String zakatID) { this.zakatID = zakatID; }

    public String getStaffID() { return staffID; }
    public void setStaffID(String staffID) { this.staffID = staffID; }

    public String getAdminID() { return adminID; }
    public void setAdminID(String adminID) { this.adminID = adminID; }
}