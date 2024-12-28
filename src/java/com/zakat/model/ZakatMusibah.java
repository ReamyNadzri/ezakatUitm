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
public class ZakatMusibah extends ZakatCategory {
    private String reason;
    private String musibahDate;
    private double totalCost;
    private String costDoc;
    private String reasonDoc;

    public ZakatMusibah() {
    }

    public ZakatMusibah(String zakatID, String zakatName, String description, String reason, String musibahDate, double totalCost, String costDoc, String reasonDoc) {
        super(zakatID, zakatName, description);
        this.reason = reason;
        this.musibahDate = musibahDate;
        this.totalCost = totalCost;
        this.costDoc = costDoc;
        this.reasonDoc = reasonDoc;
    }

    public String getReason() {
        return this.reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getMusibahDate() {
        return this.musibahDate;
    }

    public void setMusibahDate(String musibahDate) {
        this.musibahDate = musibahDate;
    }

    public double getTotalCost() {
        return this.totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public String getCostDoc() {
        return this.costDoc;
    }

    public void setCostDoc(String costDoc) {
        this.costDoc = costDoc;
    }

    public String getReasonDoc() {
        return this.reasonDoc;
    }

    public void setReasonDoc(String reasonDoc) {
        this.reasonDoc = reasonDoc;
    }

    @Override
    public String toString() {
        return "{" +
            " reason='" + getReason() + "'" +
            ", musibahDate='" + getMusibahDate() + "'" +
            ", totalCost='" + getTotalCost() + "'" +
            ", costDoc='" + getCostDoc() + "'" +
            ", reasonDoc='" + getReasonDoc() + "'" +
            "}";
    }




}

