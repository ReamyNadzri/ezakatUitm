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
public class ZakatMusibah extends ZakatCategory {
    private String reason;
    private double totalCost;
    private String costDoc;
    private String reasonDoc;

    // Constructor
    public ZakatMusibah(String zakatID, String zakatName, String description, String applyID,
                        String reason, double totalCost, String costDoc, String reasonDoc) {
        super(zakatID, zakatName, description, applyID);
        this.reason = reason;
        this.totalCost = totalCost;
        this.costDoc = costDoc;
        this.reasonDoc = reasonDoc;
    }

    // Getters and Setters
    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getCostDoc() {
        return costDoc;
    }

    public void setCostDoc(String costDoc) {
        this.costDoc = costDoc;
    }

    public String getReasonDoc() {
        return reasonDoc;
    }

    public void setReasonDoc(String reasonDoc) {
        this.reasonDoc = reasonDoc;
    }

}
