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
public class ZakatKolej extends ZakatCategory {
    private String studentID;
    private double requestedAmount;
    private double approvedAmount;
    private String justification;
    private String approvalStatus;

    // Constructor
    public ZakatKolej(String zakatID, String zakatName, String description, String applyID,
                      String studentID, double requestedAmount, double approvedAmount,
                      String justification, String approvalStatus) {
        super(zakatID, zakatName, description, applyID);
        this.studentID = studentID;
        this.requestedAmount = requestedAmount;
        this.approvedAmount = approvedAmount;
        this.justification = justification;
        this.approvalStatus = approvalStatus;
    }

    // Getters and Setters
    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public double getRequestedAmount() {
        return requestedAmount;
    }

    public void setRequestedAmount(double requestedAmount) {
        this.requestedAmount = requestedAmount;
    }

    public double getApprovedAmount() {
        return approvedAmount;
    }

    public void setApprovedAmount(double approvedAmount) {
        this.approvedAmount = approvedAmount;
    }

    public String getJustification() {
        return justification;
    }

    public void setJustification(String justification) {
        this.justification = justification;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }
}