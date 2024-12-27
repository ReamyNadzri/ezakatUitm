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
public class ZakatYuran extends ZakatCategory {
    private double totalYuranAmount;
    private String yuranDoc;
    private String entrySession;

    // Constructor
    public ZakatYuran(String zakatID, String zakatName, String description, String applyID,
                      double totalYuranAmount, String yuranDoc, String entrySession) {
        super(zakatID, zakatName, description, applyID);
        this.totalYuranAmount = totalYuranAmount;
        this.yuranDoc = yuranDoc;
        this.entrySession = entrySession;
    }

    // Getters and Setters
    public double getTotalYuranAmount() {
        return totalYuranAmount;
    }

    public void setTotalYuranAmount(double totalYuranAmount) {
        this.totalYuranAmount = totalYuranAmount;
    }

    public String getYuranDoc() {
        return yuranDoc;
    }

    public void setYuranDoc(String yuranDoc) {
        this.yuranDoc = yuranDoc;
    }

    public String getEntrySession() {
        return entrySession;
    }

    public void setEntrySession(String entrySession) {
        this.entrySession = entrySession;
    }
}
